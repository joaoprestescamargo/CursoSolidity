// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;


contract LeilaoDeCreditoDeCarbono {

    struct Ofertante {
        string nome;
        address payable enderecoCarteira;
        uint oferta;
        bool jaFoiReembolsado;
    }
    
    string public leiDoContrato;
    
    uint public cotacaoAtualDoCreditoDeCarbonoEmEuro;

    address payable public contaBovespa;
    uint public prazoFinalLeilao;

    address public maiorOfertante;
    uint public maiorLance;

    mapping(address => Ofertante) public listaOfertantes;
    Ofertante[] public ofertantes;

    bool public encerrado;

    event novoMaiorLance(address ofertante, uint valor);
    event fimDoLeilao(address arrematante, uint valor);

    modifier somenteBovespa {
        require(msg.sender == contaBovespa, "Somente Bovespa pode realizar essa operacao");
        _;
    }

    constructor(
        uint _duracaoLeilao,
        address payable _contaBovespa,
        uint quantidadeEmToneladasDoLote,
        string memory leiBrasileira
        
    ) public {
        contaBovespa = _contaBovespa;
        prazoFinalLeilao = now + _duracaoLeilao;
        quantidadeEmToneladasDoLote = 500;
        leiDoContrato = leiBrasileira;
        cotacaoAtualDoCreditoDeCarbonoEmEuro = 16;
        
    }


    function lance(string memory nomeOfertante, address payable enderecoCarteiraOfertante) public payable {
        require(now <= prazoFinalLeilao, "Leilao encerrado.");
        require(msg.value > maiorLance, "Ja foram apresentados lances maiores.");
        
        maiorOfertante = msg.sender;
        maiorLance = msg.value;

        
        for (uint i=0; i<ofertantes.length; i++) {
            Ofertante storage ofertantePerdedor = ofertantes[i];
            if (!ofertantePerdedor.jaFoiReembolsado) {
                ofertantePerdedor.enderecoCarteira.transfer(ofertantePerdedor.oferta);
                ofertantePerdedor.jaFoiReembolsado = true;
            }
        }
        
        //Crio o ofertante
        Ofertante memory ofertanteVencedorTemporario = Ofertante(nomeOfertante, enderecoCarteiraOfertante, msg.value, false);
        
        //Adiciono o novo concorrente vencedor temporario no array de ofertantes
        ofertantes.push(ofertanteVencedorTemporario);
        
        //Adiciono o novo concorrente vencedor temporario na lista (mapa) de ofertantes
        listaOfertantes[ofertanteVencedorTemporario.enderecoCarteira] = ofertanteVencedorTemporario;
    
        emit novoMaiorLance (msg.sender, msg.value);
    }

    function finalizaLeilao() public somenteBovespa {
       
        require(now >= prazoFinalLeilao, "Leilao ainda nao encerrado.");
        require(!encerrado, "Leilao encerrado.");

        encerrado = true;
        emit fimDoLeilao(maiorOfertante, maiorLance);

        contaBovespa.transfer(address(this).balance);
    }
         function store(string memory editalLeilaoBovespa) public {
         
    }
}

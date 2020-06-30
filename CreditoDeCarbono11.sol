// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract CompraDeCreditoDeCarbono
{
    string public comprador;
    string public vendedor;
    string public leiDoContrato;
    uint256 public valor;
    uint256 private valorDaCotacao;
    
   
    
    constructor (
        string memory nomeComprador,
        string memory nomeVendedor,
        string memory leiBrasileira,
        uint256 valorDoCreditoAtual
        
        )
    public
    {
        comprador = nomeComprador;
        vendedor = nomeVendedor;
        leiDoContrato = leiBrasileira;
        valorDaCotacao = valorDoCreditoAtual/250;
        
    }

    function simulaMulta ( uint256 diasAtrasoNaTransferencia)   
    public
    view
    returns(uint256 valorMulta){
            
        valorMulta = ((valorDaCotacao/2)*diasAtrasoNaTransferencia);
    }
        
     function store(string memory codigoCivil) public {
        leiDoContrato = codigoCivil;
    }
    
    function dataDeEntregaDoCredito () public view returns (uint256) {
        return 2021;
    }
} 

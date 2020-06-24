// SPDX-Licence-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract Aluguel {
    
    string public locador;
    string public locatario;
    uint256 private valor;
    uint256 constant numeroMaximoLegaldeAlugueisParamulta = 3;
    
    constructor (
        string memory nomeLocador,
        string memory nomeLocatario,
        uint256 valordoAluguel
        )
    public
    {
        locador = nomeLocador;
        locatario = nomeLocatario;
        valor = valordoAluguel;
    }
}

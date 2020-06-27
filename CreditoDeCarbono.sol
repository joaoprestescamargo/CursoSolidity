// SPDX-Licence-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract CreditoDeCarbono {
    
    string public comprador;
    string public vendedor;
    uint256 private valor;
    
    constructor (
        string memory nomeComprador,
        string memory nomeVendedor,
        uint256 valorDoCreditoDeCarbono
        )
    public
    {
        comprador = nomeComprador;
        vendedor = nomeVendedor;
        valor = valorDoCreditoDeCarbono;
    }
    
    function valorAtualDoCreditoDeCarbono () public view returns (uint256) {
        return valor;
        
    }
    
    function simulaMulta ( uint256 mesesDeInadimplencia,
                     uint256 totalMesesDeInadimplencia)   
    public
    view
    returns (uint256 valorMulta) {
        
        valorMulta = valor*totalMesesDeInadimplencia;
        valorMulta = valorMulta/totalMesesDeInadimplencia;
        valorMulta = valorMulta*mesesDeInadimplencia;
    }
    
    function reajustaDoValorDoCreditoDeCarbono (uint256 percentualReajuste) public
    {
        if (percentualReajuste > 5)
        {
            percentualReajuste = 20;
        }
        uint256 valorDoAcrescimo = 0;
        valorDoAcrescimo = ((valor*percentualReajuste)/100);
        valor = valor + valorDoAcrescimo;
    }
}

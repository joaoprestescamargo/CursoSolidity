// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract CompraDeCreditoDeCarbono
{
    string public comprador;
    string public vendedor;
    uint256 public valor;
    uint256 private valorDaCotacao;
   
    
    constructor (
        string memory nomeComprador,
        string memory nomeVendedor,
        uint256 valorDoCreditoAtual
        
        )
    public
    {
        comprador = nomeComprador;
        vendedor = nomeVendedor;
        valorDaCotacao = valorDoCreditoAtual/250;
        
    }

    function simulaMulta ( uint256 diasAtrasoNaTransferencia)   
    public
    view
    returns(uint256 valorMulta){
            
        valorMulta = ((valorDaCotacao/2)*diasAtrasoNaTransferencia);
        }
        
     function store(uint256 valorDaUltimaCompra) public {
        valorDaUltimaCompra = valor;
    }
    
    function dataDeEntregaDoCredito () public view returns (uint256) {
        return 2021;
    }
} 

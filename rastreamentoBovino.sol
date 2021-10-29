# Aprendizados-Smart-Contracts
Aulas PUC SP
// SPDX-license-Identifier: MIT
pragma solidity 0.8.9;

contract RastreamentoBovino {
    
    // dados dos integrantes da cadeia // como replicar isso pra uma fazenda inteira?
    address fazendaCriacao;
    uint cnpjFazendaCriacao;
    address fazendaEngorda;
    uint cnpjFazendaEngorda;
    address frigorifico;
    uint cnpjFrigorifico;
    address supermercado;
    uint cnpjSupermercado;
    
    // DÚVIDA: garantia de que o preço vai ser estabelecido por quem tem a posse do produto?
    bool public ofertaDeVendaBoiMagro = false;
    bool public vendidoBoiMagro = false; //???
    
    // preços do boi ao longo da cadeia
    uint precoDoBoiMagroEmWei;
    uint precoDoBoiGordoEmWei;
    uint precoDeVendaCortes;
    
    // dados do produto
    uint codigoDeIdentificacaoBoi;
    uint dataDeNascimentoBoi;
    string veterinarioResponsavel;
    bool vacinaDaAftosa = false; //DÚVIDA: colocar função booleana para vacinas? onde vou poder comprovas a vacinação?
    bool vacinaRaiva = false;
    
    //inicio do contrato
    constructor(
        
        uint _cnpjFazendaCriacao,
        uint _codigoDeIdentificacaoBoi,
        uint _dataDeNascimentoBoi,
        string memory _veterinarioResponsavel
        )
    {
        cnpjFazendaCriacao = _cnpjFazendaCriacao;
        codigoDeIdentificacaoBoi = _codigoDeIdentificacaoBoi;
        dataDeNascimentoBoi = _dataDeNascimentoBoi;
        veterinarioResponsavel= _veterinarioResponsavel;
        fazendaCriacao = msg.sender;
    }

    //Funções para vender o boi magro / antes disponibilizado, depois comprado
    function disponibilizarParaVendaBoiMagro (uint _precoDoBoiMagro) public returns (uint, string memory){
        require(fazendaCriacao == msg.sender, "Somente o Criador pode vender o produto para Engorda");
        precoDoBoiMagroEmWei = (_precoDoBoiMagro) + (_precoDoBoiMagro*3/100); //sugerindo imposto alíquota 3%
        ofertaDeVendaBoiMagro = true; //tem que ser antes?
        return (precoDoBoiMagroEmWei, "Preco de Venda do Boi Magro, incluido imposto aliquota 3%");
    }
    
    function compraDoBoiMagro(uint _cnpjDaFazendaDeEngorda) public payable returns(bool){
        require(vendidoBoiMagro == true && precoDoBoiMagroEmWei > 0);
        require(precoDoBoiMagroEmWei == msg.value);
        payable(fazendaCriacao).transfer(msg.value);
        fazendaEngorda = msg.sender;
        return vendidoBoiMagro = true;
        
    }
        
    }

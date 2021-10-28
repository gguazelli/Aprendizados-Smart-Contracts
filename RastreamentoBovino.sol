# Aprendizados-Smart-Contracts
Aulas PUC SP
pragma solidity 0.8.9;pragma solidity 0.8.9;

contract RastreamentoBovino {
    
    // dados dos integrantes da cadeia // como replicar isso pra uma fazenda inteira?
    address fazendaCriacao;
    uint cnpjFazendaCriacao;
    address fazendaEngorda;
    uint cnpjFazendaEngorda;
    address frigorifico;
    uint cnpjFrigorifico;
    address supermercado;
    uint cnpjFrigorifico;
    
    // DÚVIDA: garantia de que o preço vai ser estabelecido por quem tem a posse do produto?
    bool public ofertaDeVendaBoiMagro = false;
    bool public vendidoBoiMagro = false; //???
    
    // preços do boi ao longo da cadeia
    uint precoDoBoiMagroEmEther; // DÚVIDA: coloco em ether?
    uint precoDoBoiGordoEmEther;
    uint precoDeVendaCortes;
    
    // dados do produto
    uint codigoDeIdentificacaoBoi;
    uint dataDeNascimentoBoi;
    string veterinarioResponsavel;
    bool vacinaDaAftosa = false; //DÚVIDA: colocar função booleana para vacinas? onde vou poder comprovas a vacinação?
    
    //inicio do contrato
    constructor(
        uint _cnpjFazendaCriacao,
        string _identificadorDoBoi,
        uint _dataDeNascimentoBoi,
        string _veterinarioResponsavel
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
        require(fazendaCriacao = msg.sender, "Somente o Criador pode vender o produto para Engorda");
        precoDoBoiMagroEmEther = _precoDoBoiMagro;
        return (_precoDoBoiMagro, "Preco de Venda do Boi Magro");
        ofertaDeVendaBoiMagro = true; //tem que ser antes?
    }
    
    function compraDoBoiMagro(uint _cnpjDaFazendaDeEngorda) public returns(bool){
        require(vendidoBoiMagro == true && precoDoBoiMagroEmEther > 0);
        require(precoDoBoiMagroEmEther == msg.value);
        fazendaEngorda = msg.sender;
        vendidoBoiMagro = true; //isso tá certo? não...
        //como faço pro valor ir para a carteira do criador?
        
    function disponibilizarParaVendaBoiGordo (uint _precoDoBoiGordo) public view return (preco)
        
      
        
    }
    address fazendaEngorda;
    uint cnpjFazendaEngorda;
    address frigorifico;
    uint cnpjFrigorifico;
    address supermercado;
    uint cnpjFrigorifico;
    
    // DÚVIDA: garantia de que o preço vai ser estabelecido por quem tem a posse do produto?
    bool public vendidoBoiMagro = false;
    bool public contrato_finalizado = false; //???
    
    // preços do boi ao longo da cadeia
    uint precoDoBoiMagroEmEther; // DÚVIDA: coloco em ether?
    uint precoDoBoiGordoEmEther;
    uint precoDeVendaCortes;
    
    // dados do produto
    uint codigoDeIdentificacaoBoi;
    uint dataDeNascimentoBoi;
    string veterinarioResponsavel;
    bool vacinaDaAftosa = false; //DÚVIDA: colocar função booleana para vacinas?
    
    //inicio do contrato
    constructor(
        uint _cnpjFazendaCriacao;
        string _identificadorDoBoi;
        uint _dataDeNascimentoBoi,
        string _veterinarioResponsavel,
        )
{
        cnpjFazendaCriacao = _cnpjFazendaCriacao;
        codigoDeIdentificacaoBoi = _codigoDeIdentificacaoBoi;
        dataDeNascimentoBoi = _dataDeNascimentoBoi;
        veterinarioResponsavel= _veterinarioResponsavel;
        fazendaCriacao = msg.sender;
}

    //Funções para vender o boi magro / antes disponibilizado, depois comprado
    function disponibilizarParaVendaBoiMagro (uint _precoDoBoiMagro) public view return (uint, string memory){
        require(fazendaCriacao = msg.sender, "Obrigado, somente o Criador pode vender o produto para Engorda");
        precoDoBoiMagroEmEther = _precoDoBoiMagro
        
        return (_precoDoBoiMagro, "Preço de Venda do Boi Magro"); //posso identificar o vendedor também
    }
    
    function compraDoBoiMagro(uint _cnpjDaFazendaDeEngorda) public return (){
        require(precoDoBoiMagroEmEther > 0);
        require(msg.value == precoDoBoiMagroEmEther)
        fazendaEngorda = msg.sender;
        vendidoBoiMagro = true; //isso tá certo? não...
          //como faço pro valor ir para a carteira do criador?
        
    function disponibilizarParaVendaBoiGordo (uint _precoDoBoiGordo) public view return (preco)
        
      
        
    }
    

// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract tokenizacaoimobiliaria {
    
        string nomecartorio;
        string nomecondominio;
        address incorporador;
        address estado;
        
        
        struct lote {
            
            uint numeromatricula;
            uint numerocasa;
            uint valordolote;
            uint areaprivativa;
            address proprietario;
            bool disponivel;
            bool negociavel;
        }
        
        mapping (uint => lote) public loteamento; // mapea uma lista chamado loetamento com número como chave e lote como valor
        mapping (uint => bool) public numerodacasa; // mapea uma lista chamado numerdacasa com número como chave e bool como valor

        
        constructor 
        (
            string memory _nomecartorio, // obrigado preencher no deploy
            string memory _nomecondominio, // obrigado preencher no deploy
            address _estado // obrigado preencher no deploy
        )
        {
               nomecartorio = _nomecartorio;
               nomecondominio = _nomecondominio;
               estado = _estado;
               incorporador = msg.sender; // atribui a carteira do deployer ao incorporador
        }

                
        
        function criarlote (
            uint _numeromatricula,
            uint _numerocasa,
            uint _valordolote,
            uint _areaprivativa,
            address _primeiroproprietario,
            bool _disponivel,
            bool _negociavel
            
        ) public {
            
            require(msg.sender == incorporador, "somente o incorporador pode criar lotes");
            require(loteamento[_numeromatricula].numeromatricula == 0, "matricula ja registrada"); // se o número da matricula for zero significa que ainda não há dados na memória
            require(numerodacasa[_numerocasa] == false, "casa ja existe");
            require(_valordolote > 0, "favor inserir um valor diferente de zero");
            
            loteamento[_numeromatricula] = lote( // cria um objeto lote chamado de "loteamento" em que recebe as entradas chamadas pela da função
                _numeromatricula,
                _numerocasa,
                _valordolote,
                _areaprivativa,
                _primeiroproprietario,
                _disponivel,
                _negociavel); 

        }
        
               
        function ComprarLote(
            uint _numeromatricula
            
        ) public payable returns (address , string memory) {
            
            require(loteamento[_numeromatricula].disponivel == true, "O imovel deve estar disponivel ");
            require(loteamento[_numeromatricula].negociavel == true, "O imovel deve estar negociavel");
            require (msg.sender != loteamento[_numeromatricula].proprietario, "o atual dono nao pode comprar o imovel");
            payable(loteamento[_numeromatricula].proprietario).transfer(msg.value); // valor da tx é transferido para o vendedor
            loteamento[_numeromatricula].proprietario = msg.sender; // proprietário passa a ser o comprador
            loteamento[_numeromatricula].negociavel = false; // lote ficará inegociável após
            return(loteamento[_numeromatricula].proprietario, "O Novo proprietrio e a carteira");
        }



        function  TransferirLote(
            uint _numeromatricula,
            address _novoproprietario
           

        ) public {
        
            require(loteamento[_numeromatricula].proprietario == msg.sender); // só o atual propretário pode vender            
            require(loteamento[_numeromatricula].disponivel == true, "O imovel deve estar disponivel ");
            require(loteamento[_numeromatricula].negociavel == true, "O imovel deve estar negociavel");
            loteamento[_numeromatricula].negociavel = false; // lote ficará inegociável após                  
            loteamento[_numeromatricula].proprietario = _novoproprietario;

        
        }

        modifier onlyOwner { // modifier serve para criar uma condição que se repete muito, assim ela pode ser chamado como um modificador
            require(msg.sender == incorporador || msg.sender == estado, "esse operacao so e permitida se voce for estado u proprietario");
            _;
        }
        
        function AlteraDisponibilidadeLote(
            bool _disponivel,
            bool _negociavel,
            uint _numeromatricula

        ) onlyOwner public { //exemplo de onde o midifier "onlyOwner" pode ser inserido

            loteamento[_numeromatricula].disponivel = _disponivel;
            loteamento[_numeromatricula].negociavel = _negociavel;

        }

        function AlteraValorDoLote(

            uint _numeromatricula,
            uint _valordolote

        ) public {
            require(msg.sender == loteamento[_numeromatricula].proprietario, "somente o proprietario pode alterar o valor para venda");
            loteamento[_numeromatricula].disponivel = true;
            loteamento[_numeromatricula].negociavel = true;
            loteamento[_numeromatricula].valordolote = _valordolote; // atribui o _valordolote ao objeto loteamento indexado pela matricula....


        }

}

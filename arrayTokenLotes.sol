// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract tokenizacaoimobiliaria {
    
        string nomecartorio;
        string nomecondominio;
        address incorporador;
        address estado;
        
        
        struct lote {
            uint index;
            uint numeromatricula;
            uint numerocasa;
            uint valordolote;
            uint areaprivativa;
            address proprietario;
            bool disponivel;
            bool negociavel;
        }

        lote[] public listaLotes;
               
        
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
            require(_valordolote > 0, "favor inserir um valor diferente de zero");
            
            listaLotes.push(lote(
                listaLotes.length,
                _numeromatricula,
                _numerocasa,
                _valordolote,
                _areaprivativa,
                _primeiroproprietario,
                _disponivel,
                _negociavel)
            );
            
        }
        
       
             
        function ComprarLote(
            uint _index,
            address _novoproprietario
            
        ) public payable returns (address , string memory) {            
            
            require(listaLotes[_index].disponivel == true);
            require(listaLotes[_index].negociavel == true);
            listaLotes[_index].proprietario = _novoproprietario;
            payable(listaLotes[_index].proprietario).transfer(msg.value); // valor da tx é transferido para o vendedor
            listaLotes[_index].proprietario = msg.sender; // proprietário passa a ser o comprador
            listaLotes[_index].negociavel = false; // lote ficará inegociável após
            return(listaLotes[_index].proprietario, "O Novo proprietrio e a carteira");
        }



        
}

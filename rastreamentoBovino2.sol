// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.9;

contract RastreamentoBovino {

    address proprietario;
    uint cnpjFazendaCriacao;
    address fazendaEngorda;
    uint cnpjFazendaEngorda;
    address frigorifico;
    uint cnpjFrigorifico;
    uint precoDoBoiMagroEmWei;
    uint precoDoBoiGordoEmWei;
    uint precoDeVendaCortes;

    struct gado {

        address proprietario;    
        uint codigoDeIdentificacaoBoi;
        uint dataDeNascimentoBoi;
        uint precoDoBoiMagroEmWei;
        bool vacinaDaAftosa; 
        bool vacinaRaiva;
        bool disponivel;
    }

    mapping (uint => gado) public rebanho;

    constructor (uint _cnpjFazendaCriacao){

               cnpjFazendaCriacao = _cnpjFazendaCriacao;
               proprietario = msg.sender; // atribui a carteira do deployer ao incorporador
        }

        function cadastrarBoi (

            address _proprietario,
            uint _codigoDeIdentificacaoBoi,
            uint _dataDeNascimentoBoi,
            uint _precoDoBoiGordoEmWei,            
            bool _vacinaDaAftosa,
            bool _vacinaRaiva,
            bool _disponivel
            
        ) public {
            
            require(msg.sender == _proprietario, "somente o incorporador pode criar lotes");
            require(rebanho[_codigoDeIdentificacaoBoi].codigoDeIdentificacaoBoi == 0, "Boi jah cadastrado");            
            
            rebanho[_codigoDeIdentificacaoBoi] = gado(
                _proprietario,
                _codigoDeIdentificacaoBoi,
                _dataDeNascimentoBoi,
                _precoDoBoiGordoEmWei,                
                _vacinaDaAftosa,
                _vacinaRaiva,
                _disponivel                
                );
        }

        function VenderGado(
            uint _codigoDeIdentificacaoBoi
            //address _fazendaDeEngorda
            
        ) public payable returns(address, string memory) {
            
            require(rebanho[_codigoDeIdentificacaoBoi].disponivel == true, "O Gado deve estar disponivel ");
            require(rebanho[_codigoDeIdentificacaoBoi].vacinaDaAftosa == true, "O Gado deve estar vacinado ");
            require(rebanho[_codigoDeIdentificacaoBoi].vacinaRaiva == true, "O Gado deve estar vacinado ");            
            payable(rebanho[_codigoDeIdentificacaoBoi].proprietario).transfer(msg.value); // valor da tx é transferido para o vendedor
            rebanho[_codigoDeIdentificacaoBoi].proprietario = msg.sender;
            fazendaEngorda = rebanho[_codigoDeIdentificacaoBoi].proprietario;
            return(rebanho[_codigoDeIdentificacaoBoi].proprietario, "novo proprietario");

        }
    



}

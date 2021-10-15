# Aprendizados-Smart-Contracts
Aulas PUC SP
pragma solidity 0.8.9;

//estudando as funções = function nomeDaFunction {...}//

contract CompraEVendaDeTerreno {
    string comprador;
    string vendedor;
    string matriculaImoveleCartorio;
    uint valorTotalDoImovel;
    uint valorDaEntrada;
    uint quantidadedeParcelas;
    uint valordeCadaParcela;
    string dataDeVencimento;
    bool quitado = false;
    uint valorPago;
    uint valorEmAberto;
    uint porcentagemMulta;
    
    // function nomeDaFunction(tipo nomeParametro)//
    /* posso usar mais de um parametro e eles devem ser separados por vírgula. Exemplo:
    function MinhaFuncao (uint numero, bool booleano, address wallet) */
    /* visibilidade da função pode ser: 
    public ( por qualquer um), 
    external (somente fora do contrato), 
    internal (somente dentro do contrato) e 
    private (somente contratos autorizados)*/
    
    function pagarEntrada(uint _valorPagamento) public returns(uint, string memory) {
        valorDaEntrada = valorPagamento;
        valorEmAberto = valorTotalDoImovel - _valorPagamento
        return (valorEmAberto, "valor em aberto")
        
    }

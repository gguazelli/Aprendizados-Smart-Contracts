# Aprendizados-Smart-Contracts
Aulas PUC SP
pragma solidity 0.8.9;

contract CompraVenda {
    
    address public comprador;
    address public vendedor; 
    
    string public matricula; 
    string public cartorio;
    
    uint public dataDeVencimento;
    
    bool quitado = false;
    
    uint public valorTotal;
    uint public valorDaEntrada;
    uint public quantidadeDeParcelas;
    uint public porcentagemDaMulta; 
    uint public valorDaParcela;
    uint public valorEmAberto;
    
    //contructor é uma função que serve para inicializar as variáveis com um valor fixo, para soliscitar o preenchimento manual na hora do deploy ou para tribuir funções à uma variavel...
    constructor(
        uint _valorTotal,
        uint _valorDaEntrada,
        uint _quantidadeDeParcelas,
        string memory _matricula,
        string memory _cartorio,
        address _vendedor
        ) 
    {
        vendedor = _vendedor;
        valorTotal = _valorTotal;
        valorDaEntrada = _valorDaEntrada;
        quantidadeDeParcelas = _quantidadeDeParcelas;
        matricula = _matricula;
        cartorio = _cartorio;
        valorEmAberto = valorTotal;
        valorDaParcela = funcaoValorParcela(); // aqui atribui uma função à var valorDaParcela
    }
    
    
    // *** a função tem o objetivo de executar qualquer tarefa que esteja no escopo dela, pode receber valores imediatos (solicitados em tempo de execução) e pode ou não retornar algo para a superfície ***
    function pagarEntrada(uint _valorPagamento) public returns (uint, string memory) {
        require(_valorPagamento == valorDaEntrada, "Valor da entrada incorreto."); //Requer, para continuar executando a função, que o valor do pgto eja igual ao da entrada
        require(valorEmAberto == valorTotal, "Entrada ja foi paga."); //Requer, para continuar executando a função, que o valor em aberto seja igual ao valor total
        comprador = msg.sender; // Atribui o endereço da carteira para o comprador
        valorEmAberto = valorTotal - _valorPagamento; // atribui à valorEmAberto o valor restante depois do pagamento da entrada (neste escopo)
        dataDeVencimento = block.timestamp + 31 * 86400; // passa a data do próximo vencimento para 31dd do pagamento atual
        return(valorEmAberto, "valor em aberto"); // Retorna o valor restante
    }
    
    function pagarParcela(uint _valorPagamento) public returns (uint, string memory) {
        require(_valorPagamento == valorDaParcela, "Valor da parcela incorreto"); //Requer, para continuar executando a função, que o valor do pagamento seja igua ao da parcela
        require(valorEmAberto <= valorTotal-valorDaEntrada, "Entrada nao foi foi paga."); //Requer, para continuar executando a função, que o valor em aberto seja menor-ou-igual que o valor total menos o valor da entrada
        require(comprador == msg.sender, "Obrigado, somente o comprador pode executar essa funcao"); //Requer, para continuar executando a função, que o comprador seja o dono da carteira que está executando a função
        require(block.timestamp <= dataDeVencimento, "Parcela com data de vencimento vencida"); //Requer, para continuar executando a função, que a data seja menor-ou-igual à data já estipulada para vencimento antes
        dataDeVencimento = dataDeVencimento + 31 * 86400;// passa novament a data do próximo vencimento para 31dd do pagamento atual
        valorEmAberto = valorEmAberto - _valorPagamento; // atribui à valor de pagamento, ele mesmo menos o valor pago chamado pela função (neste escopo)
        return(valorEmAberto, "valor em aberto"); // Retorna o valor restante novamente
    }
    
    function funcaoValorParcela() public view returns (uint){
        uint calculoValorParcela = (valorTotal-valorDaEntrada)/quantidadeDeParcelas; // atribui o cálculo da parcela à variavel destino calculoValorParcela
        return(calculoValorParcela); // Retorna a variavel calculoValorParcela já com a atribuição acima
    }
    
    // *** Aqui a função tem uma novidade da aula de ontem! Operadores lógicos***
    /* 
        Temos o  OU ( || ) que retorna True se ou um ou outro valor comparado for verdadeiro
        Temos o  AND ( && ) que retorna True se os dois valores forem verdadeiros
        Temos o  NOT (!) que é unário, retorna True quando um valor não é confirmado
                                                                                                */
    function valorDaMulta(uint _porcentagemDaMulta) public view returns(uint, string memory) {
        require(comprador == msg.sender || vendedor == msg.sender, "Apenas o comprador ou vendedor podem executar"); // Requer, para continuar executando a função, que ou o comprador ou o vendedor sejam donos da carteira em usondo
        uint multa = _porcentagemDaMulta*valorTotal/100; // atribui à var multa o cálculo proposto
        return(multa, "valor da multa"); // retorna o valor da multa e o string
    }

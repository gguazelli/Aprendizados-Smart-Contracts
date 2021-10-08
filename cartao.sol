pragma solidity 0.8.9;

contract CursoDeSmartContracts {
    //autora: GabiGabi
    //comando ignora linha
    /* ignora tudo até o próximo asterisco+barra */
    
    // Estudando variáveis
    string nomeDoPaciente; //"string" só recebe nome do paciente - qualquer texto - + letras maiúsculas para separar as palavras
    uint lote; //"uint" só aceita número
    bool imunizado; //"bool" vai aceitar sim ou não, se a pessoa está imunizada ou não
    //se a pessoa estiver imunizada, o retorno da viariável será true, caso contrário será false
    address wallet; //recebe endereço de carteira//
 
    // Estudando o público e privado
    string public nomeDaCrianca;
    uint idade; //sem nada, é privado//
    bool public alergia;
    address private wallet2;
    
    // Estudando criação de variável + atribuição de valor com exceção do address
    string public nomeApelido = "Gabi"; //string sempre entre aspas
    uint private posicao = 2;
    bool public aprovacao = true;
    address public wallet3 = 0xEdadFE14fcB5aF91153C39d73cB7f66ea00f08E4;
    
    // Estudando constante = não pode ser modificada, mantém seu valor para sempre
    string constant private cpf = "000.123.456-78";
    uint constant public juros = 1;
    bool constant private desconto = true;
    
    // Exercicio da carteira de vacinação
    string constant nomeCompleto = "Mona Guazelli";
    bool firstDose = true;
    string unidadeDeVacinacao;
    uint numeroCNES;
    uint datadevacinacao; //poderia ser um string? modo americano?
    uint private numeroDoLoteDaVacina;
    string constant private nomeDoFabricante = "PfizerNaro";
    string nomeDoVacinador;
    
}

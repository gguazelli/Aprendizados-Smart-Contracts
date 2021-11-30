// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract CadastroClientes {
  
  struct Clientes {
    uint index;
    string nome;
    string PFOuPJ;
    uint cpfOucnpj;
    uint data;
  }
  
  Clientes[] public listaDeClientes; // o array salva dados e objetos em sequencia. o index comeca no zero: array[0], array[1], array[2]...
  
  function adicionarCliente(string memory _nome, string memory _PFOuPJ, uint _cpfOucnpj) public {
    listaDeClientes.push(Clientes(listaDeClientes.length, _nome, _PFOuPJ, _cpfOucnpj, block.timestamp)); // array.push = adiciona um membro ao array
  }
  
  function numeroDeClientes() public view returns(uint) {
     return (listaDeClientes.length); // array.length = retorna a quantidade de membros do array
  }
  
  function quantidadeDePFouPJ(string memory _PFOuPJ) public view returns(uint){
      uint quantidade;
      // for loop: o codigo e executado em loop passando por cada um dos membros do array for (inicializador; condicao; finalizador)
      uint i;
      for(i = 0; i < listaDeClientes.length; i ++) {
          // o solidity nao consegue comparar strings. para isso é necessario gerar um hash com a funcao criptografica keccak256 
          // e traduzir a string com o abi.encodePacked
          if (keccak256(abi.encodePacked(listaDeClientes[i].PFOuPJ)) == keccak256(abi.encodePacked(_PFOuPJ))) {
              quantidade++;
          }
      }
      return(quantidade);
  }

}

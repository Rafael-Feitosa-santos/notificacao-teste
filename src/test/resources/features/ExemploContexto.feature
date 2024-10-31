# language: pt
@regressivo
Funcionalidade: Deletar uma ocorrencia
  Como usuário da API
  Quero conseguir deletar uma ocorrencia
  Para que o registro seja apagado corretamente no sistema

  Contexto: Cadastro bem-sucedido de ocorrencia
    Dado que eu tenha os seguintes dados da ocorrencia:
      | campo          | valor           |
      | ocorrenciaId   | 1               |
      | dataOcorrencia | 2024-10-28      |
      | gravidade      | Leve            |
      | endereco       | Rua direita, 25 |
      | vitima         | Sim             |
      | status         | EM_ANDAMENTO    |
    Quando eu enviar a requisição para o endpoint "/ocorrencia/ocorrencia" de cadastro de ocorrencia
    Então o status code da resposta deve ser 201

  Cenário: Deve ser possível deletar uma ocorrencia
    Dado que eu recupere o ID da ocorrencia criada no contexto
    Quando eu enviar a requisição com o ID para o endpoint "/ocorrencia/ocorrencia" de deleção de ocorrencia
    Então o status code da resposta deve ser 204
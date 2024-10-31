# language: pt
@regressivo
Funcionalidade: Cadastro de nova ocorrencia
  Como usuário da API
  Quero cadastrar uma nova ocorrencia
  Para que o registro seja salvo corretamente no sistema

  Cenário: Cadastro bem-sucedido de ocorrencia
    Dado que eu tenha os seguintes dados da ocorrencia:
      | campo          | valor           |
      | dataOcorrencia | 2024-10-30      |
      | gravidade      | leve            |
      | endereco       | Rua direita, 25 |
      | vitima         | Sim             |
      | status         | EM_ANDAMENTO    |


    Quando eu enviar a requisição para o endpoint "/ocorrencia/ocorrencia" de cadastro de ocorrencia
    Então o status code da resposta deve ser 201

  @padrão
  Cenário: Cadastro de ocorrencia sem sucesso ao passar o campo status inválido
    Dado que eu tenha os seguintes dados da ocorrencia:
      | campo          | valor           |
      | ocorrenciaId   | 1               |
      | dataOcorrencia | 2024-10-30      |
      | gravidade      | leve            |
      | endereco       | Rua direita, 25 |
      | vitima         | Sim             |
      | status         | EM_ATENDIMENTO  |


    Quando eu enviar a requisição para o endpoint "/ocorrencia/ocorrencia" de cadastro de ocorrencia
    Então o status code da resposta deve ser 400
    E o corpo de resposta de erro da api deve retornar a mensagem "Dados fornecidos estão em formato inválido."
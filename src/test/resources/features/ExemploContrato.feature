# language: pt
@regressivo
Funcionalidade: Validar o contrato ao realizar um cadastro bem-sucedido de ocorrencia
  Como usuário da API
  Quero cadastrar uma nova ocorrencia bem-sucedido
  Para que eu consiga validar se o contrato esta conforme o esperado

  Cenario: Validar contrato do cadastro bem-sucedido de ocorrencia
    Dado que eu tenha os seguintes dados da ocorrencia:
      | campo          | valor           |
      | dataOcorrencia | 2024-10-28      |
      | gravidade      | leve            |
      | endereco       | Rua direita, 25 |
      | vitima         | Sim             |
      | status         | EM_ANDAMENTO    |

    Quando eu enviar a requisição para o endpoint "/ocorrencia/ocorrencia" de cadastro de ocorrencia
    Então o status code da resposta deve ser 201
    E que o arquivo de contrato esperado é o "Cadastro bem-sucedido de ocorrencia"
    Então a resposta da requisição deve estar em conformidade com o contrato selecionado


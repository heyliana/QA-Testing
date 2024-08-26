#language:pt

Funcionalidade: Checkout

    ¹ Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos
    ² Não deve permitir campo e-mail com formato inválido, Sistema deve inserir uma mensagem de erro
    ³ Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta

    Contexto: Página de Cadastro
    Dado o usuário está na página de checkout

    Cenario: Cadastro com todos os dados obrigatórios
    Quando o usuário preenche todos os campos obrigatórios marcados com asteriscos
    E o usuário clica no botão "Finalizar Compra"
    Então o sistema deve cadastrar o usuário com sucesso

    Esquema do Cenario: Cadastro com e-mail inválido
    Quando o usuário preencher o campo "E-mail" com "<email_invalido>" e clicar no botão "Finalizar Compra"
    Então o sistema deve exibir uma mensagem de erro informando que o e-mail é inválido
    E o sistema não deve permitir o cadastro do usuário

    Exemplos:
    |   email_invalido  |
    | "emailerrado.com" |
    |    "email@.com"   |
    |    "email@algo"   |


    Esquema do Cenario: Campos obrigatórios vazios
    Quando o usuário deixe o campo "<campo_vazio>" vazios e clicar no botão "Finalizar Compra"
    Então o sistema deve exibir uma mensagem de alerta informando que todos os campos obrigatórios devem ser preenchidos
    E o sistema não deve permirtir o cadastro do usuário

    Exemplos:
    | campo_vazio |
    |    "Nome"   |
    | "Sobrenome" |
    |    "País"   |
    |  "Endereço" |
    |   "Cidade"  |
    |    "CEP"    |
    |  "Telefone" |
    |   "E-mail"  |


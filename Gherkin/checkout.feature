Feature: Checkout

    ¹ Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos
    ² Não deve permitir campo e-mail com formato inválido, Sistema deve inserir uma mensagem de erro
    ³ Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta

    Background: Página de Cadastro
    Given o usuário está na página de checkout

    Scenario: Cadastro com todos os dados obrigatórios
    When o usuário preenche todos os campos obrigatórios marcados com asteriscos
    And o usuário clica no botão "Finalizar Compra"
    Then o sistema deve cadastrar o usuário com sucesso

    Scenario Outline: Cadastro com e-mail inválido
    When o usuário preenche o campo "E-mail" com "<email_invalido>"
    And o usuário preenche todos os outros campos obrigatórios
    And o usuário clica no botão "Finalizar Compra"
    Then o sistema deve exibir uma mensagem de erro informando que o e-mail é inválido
    And o sistema não deve permitir o cadastro do usuário

    Examples:
    |   email_invalido  |
    | "emailerrado.com" |
    |    "email@.com"   |
    |    "email@algo"   |


    Scenario Outline: Campos obrigatórios vazios
    When o usuário deixe o campo "<campo_vazio>" vazios
    And o usuário preenche os outros campos obrigatórios
    And o usuário clica no botão "Finalizar Compra"
    Then o sistema deve exibir uma mensagem de alerta informando que todos os campos obrigatórios devem ser preenchidos
    And o sistema não deve permirtir o cadastro do usuário

    Examples:
    | campo_vazio |
    |    "Nome"   |
    | "Sobrenome" |
    |    "País"   |
    |  "Endereço" |
    |   "Cidade"  |
    |    "CEP"    |
    |  "Telefone" |
    |   "E-mail"  |


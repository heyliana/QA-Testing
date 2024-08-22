
Feature: Login Screen

    ¹ Ao inserir dados válidos deve ser direcionado para a tela de checkout
    ² Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta - Usuário ou senha inválidos - 

    Background: Ação cliente
    Given que acesse a página de login da EBAC-Shop

    Scenario: Autenticação Válida
    When o usuário digitar o usuário "usuario@ebac.com.br"
    And a senha "senha#246"
    Then deve direcionar o usuário para a página de checkout

    Scenario Outline: Usuário e Senha inválida
    When o usuário insere "<usuario>" no campo "Usuário"
    And o usuário insere "<senha>" no campo "Senha"
    And o usuário clica no botão "Login"
    Then o sistema deve exibir uma mensagem de alerta "Usuário ou Senha inválida"
    And o sistema não deve permirtit acesso

    Examples:
        |      usuario      |      senha      |
        | "usuario_errado"  | "senha_correta" |
        | "usuario_correto" | "senha_errada"  |
        | "usuario_errado"  | "senha_errada"  |
        |        ""         | "senha_correta" |
        | "usuario_correto" |        ""       |
        |        ""         |        ""       |
         
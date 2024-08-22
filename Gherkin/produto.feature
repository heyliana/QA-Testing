
Feature: Configurar Produto

    ¹ Seleção de cor, tamanho e quantidade devem ser obrigatorios;
    ² devem permitir apenas 10 produtos por venda;
    ³ quando clicar no botão limpar deve voltar ao estado original

    Background: Ação Usuário
    Given que o usuário está na página de produto

    Scenario Outline: Seleção Obrigatoria cor, tamaho e quantidade
    When o usuário seleciona a cor "<cor>"
    And o usuário seleciona o tamanho "<tamanho>"
    And o usuário seleciona a qunatidade "<quantidade>"
    And o usuário tenta adicionar o produto no carrinho
    Then o sistema deve <resultado>

    Examples:
        |   cor  | tamanho | quantidade |resultado
        |   ""   |    ""   |    ""      | exibir uma mensagem de erro informando que cor, tamanho e quantidade são obrigatórias |
        | "azul" |    ""   |    ""      | exibir uma mensagem de erro informando que tamanho e quantidade são obrigatórias      |
        |   ""   | "médio" |    ""      | exibir uma mensagem de erro informando que cor e quantidade são obrigatórias          |
        |   ""   |    ""   |    "5"     | exibir uma mensagem de erro informando que cor e tamanho são obrigatórias             |
        | "azul" | "médio" |    ""      | exibir uma mensagem de erro informando que quantidade é obrigatória                   |
        | "azul" |    ""   |    "5"     | exibir uma mensagem de erro informando que tamanho é obrigatória                      |
        |   ""   | "médio  |    "5"     | exibir uma mensagem de erro informando que cor é obrigatória                          |
        | "azul" | "médio" |    "5"     | adicionar o produto ao carrinho com a cor, tamanho e quantidade selecionados          |
 

  Scenario Outline: Verificação do limite máximo de 10 produtos por venda
    When o usuário seleciona a quantidade "<quantidade>"
    And o usuário tenta adicionar o produto ao carrinho
    Then o sistema deve <resultado>

  Examples:
    | quantidade | resultado                                                                                 |
    |     "1"    | adicionar o produto ao carrinho                                                           |
    |     "5"    | adicionar o produto ao carrinho                                                           |
    |    "10"    | adicionar o produto ao carrinho                                                           |
    |    "11"    | exibir uma mensagem de erro informando que a quantidade máxima permitida é 10 unidades    |
    |    "15"    | exibir uma mensagem de erro informando que a quantidade máxima permitida é 10 unidades    |


    Scenario: Botão limpar
    When o usuário selecionou todas as opçãos do produto
    And o usuário clique no botão "limpar"
    Then o sistema deve limpar todas as escolhas já selecionadas

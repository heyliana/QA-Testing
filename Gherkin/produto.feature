#language:pt

Funcionalidade: Configurar Produto

    ¹ Seleção de cor, tamanho e quantidade devem ser obrigatorios;
    ² devem permitir apenas 10 produtos por venda;
    ³ quando clicar no botão limpar deve voltar ao estado original

    Contexto: Ação Usuário
    Dado que o usuário está na página de produto

    Cenario: Seleção Obrigatoria cor, tamaho e quantidade
    Quando o usuário selecionar "<cor>", "<tamanho>", "<quantidade>"
    Então o sistema deve adicionar produto no carrinho
    E se o usuário não selecionar um dos campos obrigatorios o sistema deve mostrar a mensagem "Selecione todos os campos obrigatórios"

  Esquema do Cenario: Verificação do limite máximo de 10 produtos por venda
    Quando o usuário seleciona a quantidade "<quantidade>"
    E o usuário tenta adicionar o produto ao carrinho
    Então o sistema deve <resultado>

  Exemplos:
    | quantidade | resultado                                                                                 |
    |     "9"    | adicionar o produto ao carrinho                                                           |
    |    "11"    | exibir uma mensagem de erro informando que a quantidade máxima permitida é 10 unidades    |

    Cenario: Botão limpar
    Quando o usuário selecionou todas as opçãos do produto
    E o usuário clique no botão "limpar"
    Então o sistema deve limpar todas as escolhas já selecionadas

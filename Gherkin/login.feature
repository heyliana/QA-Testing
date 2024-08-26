#language:pt

Funcionalidade: Login Screen

    ¹ Ao inserir dados válidos deve ser direcionado para a tela de checkout
    ² Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta - Usuário ou senha inválidos - 

    Contexto: Ação cliente
    Dado que acesse a página de login da EBAC-Shop

    Cenario: Autenticação Válida
    Quando o usuário digitar o usuário "usuario@ebac.com.br" e a senha "senha#246"
    Então deve direcionar o usuário para a página de checkout

    Esquema do Cenario: Usuário e Senha inválida
    Quando o usuário insere "<usuario>" no campo "Usuário" e "<senha>" no campo "Senha"
    E o usuário clica no botão "Login"
    Então o sistema deve exibir uma mensagem de alerta "Usuário ou Senha inválida"
    E o sistema não deve permirtit acesso

    Examples:
        |      usuario       |      senha      |
        | "ysurio@ebac.com"  |   "senha#246"   |
        | "usuario@ebac.com" |   "senha@123"   |
        | "usario@ebac.com"  |   "senha@456"   |
        |        ""          |   "senha@246"   |
        | "usuario@ebac.com" |        ""       |
        |        ""          |        ""       |
         
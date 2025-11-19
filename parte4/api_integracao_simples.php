<?php
    // Define o CEP que será consultado.
    // Aqui estamos usando um CEP fixo apenas para teste.
    $cep = "01001000";

    // Monta a URL da API ViaCEP usando o CEP fornecido.
    // A resposta será retornada no formato JSON.
    $url = "https://viacep.com.br/ws/$cep/json/";

    // Realiza a requisição HTTP para a API.
    // O '@' é usado para evitar warnings caso o CEP seja inválido ou a API falhe.
    $resposta = @file_get_contents($url);

    // Converte a resposta JSON em array associativo.
    // Caso a resposta seja inválida, $dados será null.
    $dados = json_decode($resposta, true);

    // Verifica se ocorreu algum erro na consulta.
    // Se a chave "cep" não existir, significa que a API retornou erro.
    $erro = !isset($dados["cep"]) ? true : false;
    
    // Monta o bloco HTML que será exibido ao usuário.
    // Se houver erro, mostra uma mensagem vermelha.
    // Caso contrário, exibe as informações completas do endereço consultado.
    $html_personalizado = $erro 
        ? '<p style="color:red;">CEP inválido! Tente outro.</p>' 
        : "<p><strong>Logradouro:</strong> {$dados['logradouro']}</p>
           <p><strong>Bairro:</strong> {$dados['bairro']}</p>
           <p><strong>Cidade:</strong> {$dados['localidade']}</p>
           <p><strong>UF:</strong> {$dados['uf']}</p>";
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Consulta CEP</title>

    <style>
        /* Estilo básico da página */
        body {
            font-family: Arial, sans-serif; /* Define a fonte principal */
            background: #f3f3f3;            /* Cor de fundo suave */
            padding: 30px;                 /* Espaçamento interno */
            display: flex;                 /* Centraliza o card */
            justify-content: center;       /* Alinha horizontalmente */
        }

        /* Caixa visual onde o resultado da consulta será exibido */
        .card {
            background: white;             /* Fundo branco */
            padding: 20px 25px;            /* Espaço interno */
            border-radius: 10px;           /* Bordas arredondadas */
            width: 350px;                  /* Largura fixa */
            box-shadow: 0 4px 10px rgba(0,0,0,0.15); /* Sombra suave */
        }

        /* Título principal do card */
        h1 {
            text-align: center;            /* Centraliza o texto */
            margin-bottom: 20px;           /* Espaço abaixo */
        }

        /* Estilo padrão para parágrafos dentro do card */
        p {
            font-size: 16px;               /* Tamanho do texto */
            margin: 6px 0;                 /* Espaçamento vertical */
        }
    </style>
</head>
<body>

    <!-- Card onde o resultado será exibido -->
    <div class="card">
        <h1>Resultado da Consulta</h1>

        <!-- Injeta o conteúdo gerado no PHP (erro ou dados do endereço) -->
        <?= $html_personalizado ?>
    </div>

</body>
</html>

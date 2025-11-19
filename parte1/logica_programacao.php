<?php
    // Lista de entregas e suas durações em horas
// Chave = código da entrega (ex: "A"), Valor = duração em horas (ex: 3)
$entregas = [
    "A" => 3,
    "B" => 5,
    "C" => 2,
    "D" => 4,
    "E" => 1,
    "F" => 6,
    "G" => 3,
    "H" => 5,
    "I" => 2,
    "J" => 7,
];

// Lista de caminhões (cada caminhão será um array com entregas e total de horas)
// A cada novo caminhão, criamos um array com duas chaves:
// - "entregas": array com os códigos das entregas alocadas nele
// - "total_horas": soma das durações das entregas daquele caminhão
$caminhoes = [];

// Limite de horas que cada caminhão pode trabalhar por dia
$limite_horas = 8;

// Percorre cada entrega do array '$entregas'
foreach ($entregas as $entrega => $duracao) {

    // Controla se a entrega foi alocada em algum caminhão existente
    // Inicia como false e passa a true quando conseguimos encaixar a entrega em algum caminhão
    $alocado = false;

    // Tenta colocar essa entrega nos caminhões já existentes (se houver)
    foreach ($caminhoes as &$caminhao) { // Uso do '&' para modificar o array $caminhao original

        // Verifica se ainda cabe essa entrega no caminhão (sem passar do limite de 8h)
        // $caminhao["total_horas"] é o total já alocado anteriormente naquele caminhão
        if ($caminhao["total_horas"] + $duracao <= $limite_horas) {
            // Adiciona a entrega (código) na lista de entregas do caminhão
            $caminhao["entregas"][] = $entrega;

            // Atualiza o total de horas do caminhão somando a nova duração
            $caminhao["total_horas"] += $duracao;

            // Marca que a entrega foi alocada — não precisa criar novo caminhão
            $alocado = true;

            // Como a entrega foi alocada, sai do loop de caminhões (não testa os demais)
            break;
        }
    }

    // Se não coube em nenhum caminhão existente ($alocado ainda é false)
    if (!$alocado) {
        // Cria um novo caminhão com essa entrega sendo a primeira
        // - "entregas": array iniciado com a entrega atual
        // - "total_horas": começa com a duração desta entrega
        $caminhoes[] = [
            "entregas" => [$entrega],    // Começa com a entrega atual
            "total_horas" => $duracao,   // Total de horas do caminhão começa com essa entrega
        ];
    }
}

print_r($caminhoes)
?>
# lista com entrega e suas horas
# chave = código da entrega (ex: "A"), valor = duração em horas (ex: 3)
entregas = {
    "A": 3,
    "B": 5,
    "C": 2,
    "D": 4,
    "E": 1,
    "F": 6,
    "G": 3,
    "H": 5,
    "I": 2,
    "J": 7,
}

# lista de caminhões (cada caminhão será um dicionário com entregas e total de horas)
# a cada novo caminhão criamos um dicionário com duas chaves:
# - "entregas": lista com os códigos das entregas alocadas nele
# - "total_horas": soma das durações das entregas daquele caminhão
caminhoes = []

# limite de horas que cada caminhão pode trabalhar por dia
limite_horas = 8

# percorre cada entrega do dicionário 'entregas'
for entrega in entregas:

    # pega a duração correspondente à entrega atual (valor do dicionário)
    duracao = entregas[entrega]

    # controla se a entrega foi alocada em algum caminhão existente
    # inicia como False e passa a True quando conseguimos encaixar a entrega em algum caminhão
    alocado = False

    # tenta colocar essa entrega nos caminhões já existentes (se houver)
    for caminhao in caminhoes:

        # verifica se ainda cabe essa entrega no caminhão (sem passar do limite de 8h)
        # caminhao["total_horas"] é o total já alocado anteriormente naquele caminhão
        if caminhao["total_horas"] + duracao <= limite_horas:
            # adiciona a entrega (código) na lista de entregas do caminhão
            caminhao["entregas"].append(entrega)

            # atualiza o total de horas do caminhão somando a nova duração
            caminhao["total_horas"] += duracao

            # marca que a entrega foi alocada — não precisa criar novo caminhão
            alocado = True

            # como a entrega foi alocada, sai do loop de caminhões (não testa os demais)
            break

    # se não coube em nenhum caminhão existente (alocado ainda é False)
    if not alocado:
        # cria um novo caminhão com essa entrega sendo a primeira
        # - "entregas": lista iniciada com a entrega atual
        # - "total_horas": começa com a duração desta entrega
        caminhoes.append(
            {
                "entregas": [entrega],  # começa com a entrega atual
                "total_horas": duracao,  # total de horas do caminhão começa com essa entrega
            }
        )

# exibe a lista de caminhões com suas entregas e totais de horas
print(caminhoes)

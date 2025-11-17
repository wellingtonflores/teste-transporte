# Distância em km de cada entrega a ser realizada
# Cada chave representa a entrega (ex.: "A"), e o valor representa a distância dessa entrega em quilômetros.
entregas = {"A": 20, "B": 50, "C": 32, "D": 12, "E": 80}

# Consumo do veículo: o caminhão percorre 4 km com 1 litro de combustível.
km_por_litro = 4

# Quantidade inicial de combustível disponível no tanque (em litros).
combustivel_inicial = 25

# Lista que armazenará apenas as entregas que podem ser feitas com os 25 litros iniciais.
entregas_sem_reabastecer = []

# Variável que acumula o combustível total necessário
# caso o caminhão precise realizar TODAS as entregas.
combustivel_total_necessario = 0

# Percorre cada entrega existente no dicionário 'entregas'.
for entrega in entregas:

    # Obtém a distância (em km) da entrega atual.
    km = entregas[entrega]

    # Calcula quantos litros seriam necessários para realizar essa entrega.
    litros_necessarios = km / km_por_litro

    # Verifica se é possível fazer essa entrega apenas com os 25 litros iniciais.
    if litros_necessarios <= combustivel_inicial:
        # Se sim, registra essa entrega na lista.
        entregas_sem_reabastecer.append(entrega)

    # Soma os litros necessários dessa entrega ao total,
    # contabilizando o combustível necessário para fazer TODAS as entregas.
    combustivel_total_necessario += litros_necessarios

# Cálculo de quantos litros extras seriam necessários,
litros_adicionais_necessarios = combustivel_total_necessario - combustivel_inicial

# ------------------ RESULTADOS ------------------

# Pergunta 1:
# Exibe a lista de entregas que podem ser feitas sem reabastecer.
print("1) Entregas que podem ser realizadas sem reabastecer:", entregas_sem_reabastecer)

# Pergunta 2:
# Exibe quantos litros a mais seriam necessários para completar TODAS as entregas.
print(
    "2) Litros adicionais necessários para completar todas as entregas:",
    litros_adicionais_necessarios,
)

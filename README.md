# teste-transporte

**Candidato:** Wellington Luis Cardoso Flores

**Estrutura do Projeto**

```
teste-transporte/
│
├── parte1/        # Lógica de Programação (Entregas x Caminhões)
├── parte2/        # Lógica Aplicada (Combustível)
├── parte3/        # Banco de Dados (MySQL)
├── parte4/        # API ViaCEP + HTML
└── README.md      # Instruções e explicações
```

---

## Parte 1 - Lógica de Programação em PHP

Implementa um algoritmo para distribuir entregas entre caminhões respeitando o limite de 8 horas diárias por caminhão, utilizando o menor número possível de caminhões.

### **Como executar**

php parte1/entregas_caminhoes.php

---

## Parte 2 - Lógica Aplicada em PHP

Lê uma lista de entregas com distâncias e calcula:

1. Quais entregas podem ser feitas com 25 litros sem reabastecer
2. Quantos litros adicionais seriam necessários para realizar todas

### **Como Executar**

php parte2/combustivel.php

---

## Parte 3 - Banco de dados relacional

Criação das tabelas

motoristas

clientes

entregas

Chaves primárias e estrangeiras

Inserção de 3 registros por tabela

Consultas simples ao final

### **Como Executar no MySQL**

Opção 1 — Usando OneCompiler (online):

Acesse:
https://onecompiler.com/mysql

Cole o conteúdo do arquivo .sql e execute.

Opção 2 - Via MySQL Workbench:

1. Abra o Workbench

2. Vá em File > Open SQL Script

3. Selecione o arquivo

4. Caso ainda não existe, crie o banco antes

```
CREATE DATABASE transporte;
USE transporte;
```

5. Clique em Execute

---

## Parte 4 - Consome a API pública ViaCEP e retorna:

Logradouro

Bairro

Cidade

UF

Inclui bônus:

HTML com estilo simples

Tratamento de CEP inválido

Mensagens personalizadas

### **Como executar via servidor embutido do PHP**

cd parte4
php -S localhost:8000

Acessar no navegador:
http://localhost:8000/api_integracao_simples.php

## Resumo do que aprendi no teste técnico

Estruturar lógica em PHP

Uso do operador & para alterar arrays por referência

Consumo de APIs com file_get_contents()

Tratamento de erro com @ e validação de resposta JSON

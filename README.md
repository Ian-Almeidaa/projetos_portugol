# Calculadora de féria e salário a ser recebido nas férias

A ideia desse código seria para realizar o cálculo do tempo de férias na qual um funcionário poderia retirar e o desconto salarial caso um funcionário tenha faltado no mês que ele deseja retirar as férias.

Nome: Férias.com

Objetivo: Facilitar o cálculo de férias dos funcionários de uma empresa.

Mecânica: Quando o programa é inicializado, é realizado pelo sistema a função "ver_cpf" na qual é realizado uma espécie de "Login" através de uma validação de CPF.
O usuário insere os dígitos (apenas os números) e depois é realizado o processo de validação.
Para a validação desse dado inserido são realizadas 2 etapas.
O 1° passo é a coleta dos dados que partem do usuário.
O 2° passo é a leitura dos dados e a conversão de tipos, visto que no desenvolvimento em Portugol, não se pode fazer a utilização de operações matemáticas com dados do tipo "cadeia" e "caracter", que foram os tipos utilizados para a leitura do CPF inserido pelo usuário.
Para a validação dos dígitos validadores, é realizado a validação apenas com o segundo dígito, para esse teste é feito a leitura do 1° até o 10° dígito.
Após esse processo é coletado esses números separadamente e multiplicar eles de forma regressiva do 11 ao 2.
Depois da multiplicação é feita a soma de todos os resultados e dividir esse valor por 11, nesta divisão é utilizado apenas o resto da divisão.
Existem duas possíveis validações, sendo uma com o valor do resto menor do que 2, e maior ou igual a 2.
Caso o resto seja menor do que o valor 2 é feito um teste comparativo entre o valor obtido e o último dígito do CPF inserido pelo usuário.
Assim, se o valor do dígito inserido seja "0", o sistema retorna como acesso permitido, senão, o sistema se encerra e mostra que o acesso foi negado.
Porém, caso o valor seja maior ou igual a 2, é realizado outra validação, na qual é obtido esse resto da divisão e é feito uma alteração do dado.
fazendo ele se tornar o resultado da operação (11 - resto), para assim realizar o novo teste de validação.
Se seja um valor válido, irá liberar o acesso para o sistema de férias.
Senão, o programa se encerra e aparece uma mensagem de acesso negado.
//
Para a realização do sistema de férias, foram separados 5 parâmetros iniciais sendo eles: 
0-5 faltas (ano) = férias integral.
6-14 faltas (ano) = 24 dias de férias.
15-23 faltas (ano) = 18 dias de férias.
24-32 faltas (ano) = 12 dias de férias.
33 ou + faltas (ano) = sem direito as férias. 
Tendo esses parâmetros, é necessário que seja coletado os dias de falta de cada mês, neste caso, os dados são inseridos pelo próprio usuário.
Também é necessário saber qual o mês desejado das férias.
Logo após coletar as faltas dos 12 meses e a o mês desejado das férias, é necessário que seja informado o número de faltas justificadas ao ano.
Depois desse dado informados, caso as faltas justificadas seja maior do que 0, é feita uma nova coleta das faltas justificadas no mês desejado de férias.
Após essa coleta as faltas justificadas são descontadas do mês das férias, e o número de faltas totais no ano.
Caso o usuário tenha direito as férias, é feito o desconto salarial das férias remuneradas.
para realizar esse cálculo, é necessário primeiramente coletar o valor do salário do funcionário.
Após a coleta, o valor será dividido por 30 e o resultado é multiplicado pelo número de faltas do mês desejado de férias.
Com isso, fica disponível o salário que o funcionário tem direito a receber e os dias de férias na qual ele tem direito.

Botões: Os botões utilizados são os números e a tecla "Enter" para confirmar os dados.

Público: O público alvo para esse código seria os funcionários responsáveis pelo RH de uma empresa.

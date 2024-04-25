programa {
  inclua biblioteca Matematica --> mat
  inclua biblioteca Texto --> txt
  inclua biblioteca Tipos --> type

  funcao vazio linha_codigo(){
		escreva("=============================================================")
		} 

  funcao ferias(){
    inteiro num_faltas = 0, faltas [12], mFerias, faltas_jus_ano, faltas_jus
    real salar, desconto
    linha_codigo()
    escreva("\nVamos calcular o seu tempo de férias e o desconto das férias\n")
    linha_codigo()
    escreva("\n\nQual o mês desejado de férias: ")
    leia(mFerias)
    limpa()

    // Conta o numero total de faltas durante o ano e do mes que o usuario diz que tem
    para(inteiro x = 0; x < 12; x++){
      escreva("\nQuantas faltas você teve durante o ",x+1,"° mês? ")
      leia(faltas[x])
      num_faltas += faltas[x]
      limpa()
    }

    // Pede que o usuario digite quantas faltas do ano foram justifivadas
    escreva("\nDigite quantas faltas foram justificadas durante o ano: ")
    leia(faltas_jus_ano)
    limpa()

    // Pede que o usuario digite quantas faltas no mês foram justifivadas
    se(faltas_jus_ano != 0){
      escreva("\nDigite quantas faltas foram justificadas no mês desejado para retirar férias: ")
      leia(faltas_jus)
    } senao{
      faltas_jus = 0
    }
    limpa()

    // Desconta as faltas justificadas das faltas totais no mes das ferias
    faltas[mFerias-1] -= faltas_jus

    // Desconta as faltas justificadas dos faltas totais do ano
    num_faltas -= faltas_jus_ano

    // Verifica se tem direito a ferias, se sim, ira calcular o salario
    // Se não, vai falar que não tem direito as ferias
    limpa()
    se(num_faltas < 32){

      // Pergunta o salario
      escreva("\nMuito bem, agora precisamos saber do seu salário: ")
      leia(salar)
      
      limpa()
      // Mostra quantos dias de ferias tera e o numero de faltas
      se(num_faltas > 23){
        escreva("\nVocê tem direito a 12 dias de férias (faltas = ",num_faltas,")")
      }senao se(num_faltas > 14){
        escreva("\nVocê tem direito a 18 dias de férias (faltas = ",num_faltas,")")
      }senao se(num_faltas > 5){
        escreva("\nVocê tem direito a 24 dias de férias (faltas = ",num_faltas,")")
      }senao{
        escreva("\nVocê pode tirar férias integral (faltas = ",num_faltas,")")
      }

      // Arredonda o salario e mostra quanto o usuario ira receber
			// Calcula quanto vai receber no periodo de ferias
      desconto = (salar/30)*faltas[mFerias-1]
			salar -= desconto      
			salar = mat.arredondar(salar,2)
     	escreva("\nO seu salário nas férias é ",salar)

    }senao{
      escreva("\nVocê não tem direito as férias (faltas = ", num_faltas,")")
    }
  }

  funcao ver_cpf(){
        inteiro cpf[11], nWCpf[11], somat = 0, procuraVetor = 0, resto = 0
    caracter digito
    cadeia cpfCompleto

    linha_codigo()
    escreva("\nDigite o seu CPF (apenas números): ")
    leia(cpfCompleto)
      //leitura de cada dígito do CPF
      para (inteiro cont = 0; cont <= 10; cont++){
        digito = txt.obter_caracter(cpfCompleto,cont)
        cpf[cont] = type.caracter_para_inteiro(digito)
      }

          //Início da validação do CPF
          para (inteiro multiplica = 11; multiplica >=2; multiplica--){
            cpf[procuraVetor] = cpf[procuraVetor] * multiplica
            somat += cpf[procuraVetor]
            procuraVetor++
          }

          resto = somat%11
          limpa()
          linha_codigo()
          
          se (resto < 2){
 		        se (cpf[10] == 0){
              //segundo teste validador POSITIVO
 			        escreva("\nSeja Bem Vindo(a) a ferias.com\n")
              retorne verdadeiro
            
 		        }  
            senao {
              //segundo teste validador NEGATIVO
 			        escreva("\nCPF inválido, acesso negado\n")
              retorne falso
 		              }                  
    	    } 
          senao {
    		    resto = 11 - resto
    		    se (resto == cpf[10]){
              //segundo teste validador POSITIVO
    		      escreva("\nSeja Bem Vindo(a) a ferias.com\n")	
              retorne verdadeiro
    	      } 
            senao{
              //segundo teste validador NEGATIVO
    		      escreva("\nCPF inválido, acesso negado\n")
              retorne falso
    		      }
    	      }
          linha_codigo()
  }

  funcao inicio() {
    linha_codigo()
    escreva("\nVamos verificar se você é uma pessoa existente.\n")
    se (ver_cpf()){
      ferias()
    }
  }
}

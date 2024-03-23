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
    escreva("\nVamos calcular o seu tempo de f�rias e o desconto das f�rias\n")
    linha_codigo()
    escreva("\n\nQual o m�s desejado de f�rias: ")
    leia(mFerias)
    limpa()

    // Conta o numero total de faltas durante o ano e do mes que o usuario diz que tem
    para(inteiro x = 0; x < 12; x++){
      escreva("\nQuantas faltas voc� teve durante o ",x+1,"� m�s? ")
      leia(faltas[x])
      num_faltas += faltas[x]
      limpa()
    }

    // Pede que o usuario digite quantas faltas do ano foram justifivadas
    escreva("\nDigite quantas faltas foram justificadas durante o ano: ")
    leia(faltas_jus_ano)
    limpa()

    // Pede que o usuario digite quantas faltas no m�s foram justifivadas
    se(faltas_jus_ano != 0){
      escreva("\nDigite quantas faltas foram justificadas no m�s desejado para retirar f�rias: ")
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
    // Se n�o, vai falar que n�o tem direito as ferias
    limpa()
    se(num_faltas < 32){

      // Pergunta o salario
      escreva("\nMuito bem, agora precisamos saber do seu sal�rio: ")
      leia(salar)

      // Calcula quanto vai receber no periodo de ferias
      desconto = (salar/30)*faltas[mFerias-1]
      se(desconto != 0){
        salar -= desconto
      }

      limpa()
      // Mostra quantos dias de ferias tera e o numero de faltas
      se(num_faltas > 23){
        escreva("\nVoc� tem direito a 12 dias de f�rias (faltas = ",num_faltas,")")
      }senao se(num_faltas > 14){
        escreva("\nVoc� tem direito a 18 dias de f�rias (faltas = ",num_faltas,")")
      }senao se(num_faltas > 5){
        escreva("\nVoc� tem direito a 24 dias de f�rias (faltas = ",num_faltas,")")
      }senao{
        escreva("\nVoc� pode tirar f�rias integral (faltas = ",num_faltas,")")
      }

      // Arredonda o salario e mostra quanto o usuario ira receber
      salar = mat.arredondar(salar,2)
      escreva("\nO seu sal�rio nas f�rias � ",salar)

    }senao{
      escreva("\nVoc� n�o tem direito as f�rias (faltas = ", num_faltas,")")
    }
  }

  funcao ver_cpf(){
        inteiro cpf[11], nWCpf[11], somat = 0, procuraVetor = 0, resto = 0
    caracter digito
    cadeia cpfCompleto

    linha_codigo()
    escreva("\nDigite o seu CPF (apenas n�meros): ")
    leia(cpfCompleto)
      //leitura de cada d�gito do CPF
      para (inteiro cont = 0; cont <= 10; cont++){
        digito = txt.obter_caracter(cpfCompleto,cont)
        cpf[cont] = type.caracter_para_inteiro(digito)
      }

      //In�cio da valida��o do CPF (1� d�gito)
        para (inteiro cont = 0; cont <= 8; cont++){
            nWCpf[cont] = cpf[cont]              
        }

      //Multiplica��o para valida��o
        para (inteiro multiplicaV1 = 10; multiplicaV1 >=2; multiplicaV1--){
          nWCpf[procuraVetor] = nWCpf[procuraVetor] * multiplicaV1
          somat += nWCpf[procuraVetor]
          procuraVetor++
        }

        resto = somat%11

        //primeiro teste validador POSITIVO
        se (resto < 2 e cpf[9] != 0){
          resto = 11 - resto
    	  }
          //reset das vari�veis
          procuraVetor = 0
          somat = 0

          //ler o n�mero
          para (inteiro cont2 = 0; cont2 <= 9; cont2++){
            nWCpf[cont2] = cpf[cont2]              
          }

          //In�cio da valida��o do CPF (2� d�gito)
          para (inteiro multiplicaV2 = 11; multiplicaV2 >=2; multiplicaV2--){
            nWCpf[procuraVetor] = nWCpf[procuraVetor] * multiplicaV2
            somat += nWCpf[procuraVetor]
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
 			        escreva("\nCPF inv�lido, acesso negado\n")
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
    		      escreva("\nCPF inv�lido, acesso negado\n")
              retorne falso
    		      }
    	      }
          linha_codigo()
  }

  funcao inicio() {
    linha_codigo()
    escreva("\nVamos verificar se voc� � uma pessoa existente.\n")
    se (ver_cpf()){
      ferias()
    }
  }
}

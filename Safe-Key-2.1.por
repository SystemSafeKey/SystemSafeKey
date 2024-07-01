programa
{
    // Bibliotecas usadas
    inclua biblioteca Teclado --> t 
    inclua biblioteca Mouse --> m
    inclua biblioteca Graficos --> g
    inclua biblioteca Util --> u
    inclua biblioteca Calendario --> c
    inclua biblioteca Arquivos --> a

    //Variáveis globais usadas
    inteiro respostaPergunta = 0 //Número de caracteres da senha.
    //Variáveis para armazenar a data e hora atuais.
    inteiro ano = c.ano_atual(), mes = c.mes_atual(), dia = c.dia_mes_atual(), hora = c.hora_atual(falso),// falso retorno no formato 24h, verdadeiro no formato 12h,  
    minuto = c.minuto_atual(), segundos = c.segundo_atual()
    //Armazena a senha gerada
    cadeia senha = "" 
    //Array com 74 caracteres que podem ser usados para gerar a senha.
    cadeia caracteres[74] = { 
        "0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h",
        "A","B","C","D","E","F","G","H","I","J","K","L",
        "a","e","i","o","u","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
        "i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
        "!","@","#","$","%","*","?"
    }
    //Carregam imagens que serão exibidas na interface gráfica.
    inteiro logo = g.carregar_imagem("logo.png")
    inteiro logo02 = g.carregar_imagem("logo02.png")
    //Indica se a senha foi salva ou não.
    logico senhaSalva = falso
    //A função inicio() chama a função entrar(), que inicia a interface gráfica.
    funcao inicio()
    {
        entrar()
    } // final funcao inicio

    funcao entrar()
    {  
    	   //Inicia o modo gráfico e define a dimensão da janela para 800x600 pixels.
        g.iniciar_modo_grafico(verdadeiro)
        g.definir_dimensoes_janela(800, 600)
        
        /*Loop infinito para manter a interface gráfica ativa. 
        Desenha a interface inicial com o botão "Entrar" e uma imagem.*/
        enquanto (verdadeiro)
        {
            g.definir_cor(g.COR_BRANCO)
            g.limpar()
            g.definir_cor(g.COR_PRETO)
            g.definir_fonte_texto("Arial")
            g.definir_tamanho_texto(25.0)
            g.desenhar_texto(370, 280, "Entrar")
            g.desenhar_retangulo(340, 270, 120, 45, verdadeiro, falso)
            g.desenhar_imagem(320, 0, logo)
		  
		  //Obtém a posição atual do mouse.
            inteiro mouseX = m.posicao_x()
            inteiro mouseY = m.posicao_y()
            
            /*Verifica se o botão "Entrar" foi clicado (verifica se o mouse está sobre o botão e se o botão esquerdo foi pressionado). 
            Se sim, chama a função opcoes(). Atualiza a tela com g.renderizar().*/
            se (mouseX >= 340 e mouseX <= 340 + 120 e mouseY >= 270 e mouseY <= 270 + 45)
            {
                se (m.botao_pressionado(0))
                {
                    opcoes()
                    
                }
            } // final se
            g.renderizar()
        } // final enquanto
    } // final funcao entrar
    
    /*Gera uma senha aleatória com o número de caracteres especificado em [respostaPergunta]. 
    Escolhe aleatoriamente caracteres do array caracteres. Reseta senhaSalva para falso.*/	
    funcao criarsenha()
    {
        // Criar Senha 
        senha = ""
            para (inteiro i = 0; i < respostaPergunta; i++)
            {
                inteiro random = u.sorteia(0, 73)
                cadeia valor = caracteres[random]
                senha = senha + valor
            } // final para
        senhaSalva = falso // resetar o estado de senhaSalva
    } // final funcao criarsenha

    funcao opcoes()
    { 
    	   //Inicia o modo gráfico e define a dimensão da janela para 800x600 pixels
        g.iniciar_modo_grafico(verdadeiro)
        g.definir_dimensoes_janela(800, 600)
        
        /*Loop infinito para manter a interface gráfica ativa. 
        Desenha a interface de opções.*/
        enquanto (verdadeiro)
        {
            //Desenha os textos de cada opção
            g.definir_cor(g.COR_BRANCO)
            g.limpar()
            g.definir_cor(g.COR_PRETO)
            g.definir_fonte_texto("Arial")
            g.definir_tamanho_texto(20.0)
            g.desenhar_texto(315, 210, "Escolha um Valor")
            g.desenhar_texto(270, 290, "8")
            g.desenhar_texto(310, 290, "12")
            g.desenhar_texto(355, 290, "16")
            g.desenhar_texto(400, 290, "20")
            g.desenhar_texto(445, 290, "25")
            g.desenhar_texto(490, 290, "30")
            g.desenhar_texto(265, 420, "Sair")
            g.desenhar_texto(325, 410,"Salvar")
            g.desenhar_texto(325, 430,"Senha")
           
            //Desenha os retângulos (botões) correspondentes às opções
            g.desenhar_retangulo(255, 280, 40, 40, verdadeiro, falso) //8
            g.desenhar_retangulo(300, 280, 40, 40, verdadeiro, falso) //12
            g.desenhar_retangulo(345, 280, 40, 40, verdadeiro, falso) //16
            g.desenhar_retangulo(390, 280, 40, 40, verdadeiro, falso) //20
            g.desenhar_retangulo(435, 280, 40, 40, verdadeiro, falso) //25
            g.desenhar_retangulo(480, 280, 40, 40, verdadeiro, falso) //30
            g.desenhar_retangulo(250, 410, 60, 40, verdadeiro, falso) //Sair
            g.desenhar_retangulo(320, 410, 65, 40, verdadeiro, falso) //Salvar senha
          
            //Desenha a imagem(logo) na posição especificada.
            g.desenhar_imagem(320, 0, logo)
		  
		  //Obtém a posição atual do mouse.
            inteiro mouseX = m.posicao_x()
            inteiro mouseY = m.posicao_y()

            /*Verifica se o botão correspondente a "8" foi clicado. 
            Se sim, define respostaPergunta para 8 e chama [criarsenha()] para gerar a senha.*/
		 //As próximas seções fazem a mesma verificação para os outros botões de tamanho de senha (12, 16, 20, 25, 30).
		 //8
		 se (mouseX >= 255 e mouseX <= 255 + 40 e mouseY >= 280 e mouseY <= 280 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	//efeito click 
                	g.definir_cor(g.COR_BRANCO)
            		g.desenhar_retangulo(255, 280, 40, 40, verdadeiro, verdadeiro) //8
                    //tamanho caracteres
                    respostaPergunta = 8 // número de caracteres da senha
                    //funcao para criar a senha
                    criarsenha()
                    
            	}
            } // final se
		//12	
            se (mouseX >= 300 e mouseX <= 300 + 40 e mouseY >= 280 e mouseY <= 280 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	//efeito click 
                	g.definir_cor(g.COR_BRANCO)
                	g.desenhar_retangulo(300, 280, 40, 40, verdadeiro, falso) //12
                	//tamanho caracteres
                    respostaPergunta = 12 // número de caracteres da senha
                    //funcao para criar a senha
                    criarsenha()
            	}
            } // final se
            //16
            senao se (mouseX >= 345 e mouseX <= 345 + 40 e mouseY >= 280 e mouseY <= 280 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	//efeito click 
                	g.definir_cor(g.COR_BRANCO)
                	g.desenhar_retangulo(345, 280, 40, 40, verdadeiro, falso)
                	//tamanho caracteres
                    respostaPergunta = 16 // número de caracteres da senha
                    //funcao para criar a senha
                    criarsenha()
                    
                }
            } // final se
            //20
            senao se (mouseX >= 390 e mouseX <= 390 + 40 e mouseY >= 280 e mouseY <= 280 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	//efeito click 
                	g.definir_cor(g.COR_BRANCO)
                	g.desenhar_retangulo(390, 280, 40, 40, verdadeiro, falso) //20
                	//tamanho caracteres
                    respostaPergunta = 20 // número de caracteres da senha
                    //funcao para criar a senha
                    criarsenha()
                    
                }
            } // final se
            //25
            senao se (mouseX >= 435 e mouseX <= 435 + 40 e mouseY >= 280 e mouseY <= 280 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	//efeito click 
                	g.definir_cor(g.COR_BRANCO)
                	//tamanho caracteres
                	g.desenhar_retangulo(435, 280, 40, 40, verdadeiro, falso) //25
                    respostaPergunta = 25 // número de caracteres da senha
                    //funcao para criar a senha
                    criarsenha()
                    
                }
            } // final se
            //30
             senao se (mouseX >= 480 e mouseX <= 480 + 40 e mouseY >= 280 e mouseY <= 280 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	//efeito click 
                	g.definir_cor(g.COR_BRANCO)
                	g.desenhar_retangulo(480, 280, 40, 40, verdadeiro, falso) //30
                	//tamanho caracteres
                    respostaPergunta = 30 // número de caracteres da senha
                    //funcao para criar a senha
                    criarsenha()
                    
                }
            } // final se

            //Verifica se o botão "Sair" foi clicado. Se sim, fecha a janela.
            //Sair
            se (mouseX >= 250 e mouseX <= 250 + 60 e mouseY >= 410 e mouseY <= 410 + 40)
            {
                se (m.botao_pressionado(0))
                {
                    g.fechar_janela()
                }
            } // final se

            /*Verifica se o botão "Salvar senha" foi clicado. Se sim, e se senha não for uma string vazia e [senhaSalva] for falso, 
            adiciona a data/hora e a senha no arquivo, e define senhaSalva como verdadeiro.*/
           //Arquivo
           se (mouseX >= 320 e mouseX <= 320 + 65 e mouseY >= 410 e mouseY <= 410 + 40)
            {
                se (m.botao_pressionado(0) e senhaSalva == falso)
                {
                	inteiro arquivo = a.abrir_arquivo("c:\\Safe-Key\\Senha.txt", a.MODO_ACRESCENTAR)
        			 a.fechar_arquivo(arquivo) 

        			 arquivo = a.abrir_arquivo("c:\\Safe-Key\\Senha.txt", a.MODO_ACRESCENTAR)
                	 a.escrever_linha(senha, arquivo)
                	 a.fechar_arquivo(arquivo)

                	 // Adicionar Data e Hora no arquivo criado 
           		 arquivo = a.abrir_arquivo("c:\\Safe-Key\\Senha.txt", a.MODO_ACRESCENTAR)
            		 a.escrever_linha("\n" + dia + "/" + mes + "/" + ano, arquivo)
            		 a.escrever_linha(hora + ":" + minuto + ":" + segundos, arquivo)
            		 a.escrever_linha("\n##############################################", arquivo)
            		 a.fechar_arquivo(arquivo)
            
                     senhaSalva = verdadeiro // atualizar o estado de senhaSalva
                  }
            } // final se

            //Arquivo aviso
           se (mouseX >= 320 e mouseX <= 320 + 65 e mouseY >= 410 e mouseY <= 410 + 40)
            {
                se (m.botao_pressionado(0))
                {
                	 g.desenhar_texto(320, 470,"Senha Salva em: c:\\Safe-Key\\Senha.txt")
                	 g.desenhar_retangulo(320, 460, 350, 40, verdadeiro, falso) //Arquivo
			 }
            } // final se

		
            
            g.definir_cor(g.COR_PRETO)
            g.definir_fonte_texto("Arial")
            g.definir_tamanho_texto(20.0)
            g.desenhar_texto(120, 360, "Senha criada:")
            g.desenhar_retangulo(250, 350, 390, 40, verdadeiro, falso)
            g.desenhar_texto(255, 360, senha)
            g.renderizar()
        } // final enquanto
        
                    
    } // final funcao opcoes
    
  
                	
            		
                    
                    
                   
                    
            
    	
     	   
     
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 356; 
 * @DOBRAMENTO-CODIGO = [31, 36, 75, 88];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
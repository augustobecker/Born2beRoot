<h1 align="center"> Born2beRoot - @42sp</h1>
<p align="center">:information_source: Setup de um servidor Debian GNU/Linux em uma VM e mais alguns scripts úteis.</p>

<p align="center"><a href="https://www.42sp.org.br/" target="_blank"><img src="https://img.shields.io/static/v1?label=&message=SP&color=000&style=for-the-badge&logo=42""></a></p>
<p align="center"><a href="https://github.com/augustobecker/Born2beRoot/blob/main/README.md"><img src="https://img.shields.io/badge/available%20in-EN-blue"></a></p>

## Índice
* [O que é Born2beRoot?](#o-que-e-born2beroot)
* [Como funciona?](#como-funciona)
	* [As Regras](#as-regras)
* [Autor?](#autor)

<h2 align="center" id="o-que-e-born2beroot" > O que é Born2beRoot?</h2>
O quarto projeto no Instituto 42. Consiste em configurar o seu primeiro servidor seguindo algumas regras específicas.

<h3 align="center" id="as-regras">:bookmark_tabs: As Regras: </h3>

:small_blue_diamond: Crie pelo menos 2 partições encriptadas usando LVM.

:small_blue_diamond: O hostname da sua máquina virtual deve ser acesar-l42 e você deve modificar esse hostname durante uma avaliação por pares.

:small_blue_diamond: Além do usuário root, um usuário com nome acesar-l deve estar presente e pertencer aos grupos user42 e sudo.

:small_blue_diamond: Implemente uma dura política de senhas, que consiste em:

	A senha deve expirar a cada 30 dias.
	
	O mínimo de dias permitidos antes da mudança de uma senha deve ser configurado para 2.
	
	O usuário deve receber uma mensagem de alerta 7 dias antes da sua senha expirar.
	
	A senha deve ter pelo menos 10 caracteres. Deve conter uma letra maiúscula e um número.
	Também, não deve conter mais que 3 caracteres idênticos repetidos.
	
	A senha não deve conter o nome do usuário.
	
	A regra a seguir não se aplica a senha do root: A senha deve conter pelo menos 7 caracteres que não
	são parte da senha atual.
	
	Obviamente, sua senha do root deve cumprir com essa política.
	
:small_blue_diamond: Instale e configure o sudo seguindo regras rígidas:

	Autenticação usando o sudo deve ser limitada a 3 tentativas na ocorrência de uma senha incorreta.
	
	Uma mensagem customizada, de sua escolha, deve ser exibida no caso de um erro de
	senha quando usando sudo.
	
	Cada comando usando o sudo deve ser arquivado, tanto input quanto output. O arquivo log
	deve ser salvo na pasta /var/log/sudo/.
	
	Por razões de segurança o modo TTY deve estar ativado.
	
	Por razões de segurança também, os caminhos que podem ser usados pelo sudo devem ser restritos.
  
<h2 align="center" id="como-funciona"> Como funciona? </h2>

<h2 align="center" id="autor"> Autor </h2>
<div>
<img height="180em" src="https://user-images.githubusercontent.com/81205527/152089472-0aa06bd9-d882-4c83-adfc-8230d1e958c1.png">
    
<strong> Augusto Becker | acesar-l | 🇧🇷👨‍🚀</strong>
    
:wave: Fale comigo: 
    
  <a href = "mailto:augustobecker.dev@gmail.com"><img src="https://img.shields.io/badge/augustobecker.dev@gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white"> </a>
  <a href="https://www.linkedin.com/in/augusto-becker/" target="_blank"><img src="https://img.shields.io/badge/-Augusto Becker-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank"></a>
  <a href="https://www.instagram.com/augusto.becker/" target="_blank"><img src="https://img.shields.io/badge/-augusto.becker-%23E4405F?style=for-the-badge&logo=instagram&logoColor=white" target="_blank"></a>
</div>

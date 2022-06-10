<h1 align="center"> Born2beRoot - @42sp</h1>
<p align="center">:information_source: Setup de um servidor Debian GNU/Linux em uma VM e mais alguns scripts úteis.</p>

<p align="center"><a href="https://www.42sp.org.br/" target="_blank"><img src="https://img.shields.io/static/v1?label=&message=SP&color=000&style=for-the-badge&logo=42""></a></p>
<p align="center"><img src="https://user-images.githubusercontent.com/81205527/172609635-7e885150-0014-4f7b-815d-45ab7bfc2b47.png"> </p>
<p align="center"> <strong>110/100</strong> ✔️ </p>
<p align="center"><a href="https://github.com/augustobecker/Born2beRoot/blob/main/README.md"><img src="https://img.shields.io/badge/available%20in-EN-blue"></a></p>

## Índice
* [O que é Born2beRoot?](#o-que-e-born2beroot)
	* [As Regras](#as-regras)
* [Como funciona?](#como-funciona)
	* [The Scripts](#scripts)
		* [Setup](#setup-scripts)
		* [Useful Scripts](#useful-scripts)
		* [monitoring.sh](#monitoring-sh)
		* [Evaluation](#scripts-aval)
* [42 Cursus](#42-cursus)
* [Autor?](#autor)

<h2 align="center" id="o-que-e-born2beroot" > O que é Born2beRoot?</h2>
O quarto projeto no Instituto 42. Consiste em configurar o seu primeiro servidor seguindo algumas regras específicas, desenvolver um script que mostra informações
relevantes do sistema e submeter no repositório git da 42 somente um arquivo signature.txt contendo a assinatura do Disco Virtual (vdi) da VM.

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

Para o momento de fazer o setup do servidor (Após a instalação da VM e do servidor Debian nela), fiz questão de criar alguns scripts
para facilitar bastante o processo - sinta-se livre para alterar segundo sua necessidade.

<h3 align="center" id="scripts"> Scripts </h3>
	
Os dividi em 4 categorias: 
	
**Setup Scripts** - Feitos para ser usados apenas uma vez, durante a configuração (do firewall ou
servidor ssh, por exemplo). Eles trocam algumas configurações padrão por outras definidas no script, então se
tentar utilizar novamente eles podem simplesmente não fazer nada, adicionar um texto extra desnecessário
ou trocar uma configuração que não era a pretendida.
	
**Useful Scripts** - Scripts que podem ser reutilizados e usados no dia a dia de um servidor. Coisas
como mudar o hostname ou mostrar como se conectar com a máquina via SSH.
	
**monitoring.sh** - Script pedido pelo subject, deve mostrar algumas informações relevantes do sistema a cada 10 minutos
em todos os terminais.
	
**Evaluation Scripts** - Scripts que facilitam o trabalho do avaliador do projeto na 42, mostrando algumas configurações do servidor e
os requisitos do sujetct. 
	
<h4 align="center" id="setup-scripts"> Scripts de Setup </h2>

• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/setup_scripts/install_packages.sh">install_packages.sh</a> - Instala todos os pacotes necessários para
os outros scripts e para as outras ações requeridas pelo subject.
	
• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/setup_scripts/set_firewall.sh">set_firewall.sh</a> - Configura o firewall UFW (uncomplicated firewall),
libera a porta 4242(requerido pelo subject) e mostra seu status.
	
• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/setup_scripts/set_loginuser.sh">set_loginuser.sh</a> - Cria, caso necessário, o usuário com o login
da intra e o adiciona aos grupos sudo e user42(caso não esteja presente é criado) e ainda aplica parte da política de senhas ao usuário.
	
• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/setup_scripts/set_passwdpolicy.sh">set_passwdpolicy.sh</a> - Aplica a política de senhas requerida pelo subject, mas parte dela apenas para novos usuários.
Para atualizar um usuário criado antes para também estar sob essa política basta rodar o comando:
	
	sudo passwd -n 2 -x 30 -w 7 ${OLD_USER}
	
• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/setup_scripts/set_sshserver.sh">set_sshserver.sh</a> - Configura o servidor SSH e mostra como conectar via outra máquina.

• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/setup_scripts/complete_setup.sh">complete_setup.sh</a> - Roda todos os scripts necessários para o setup(acima).

<h4 align="center" id="useful-scripts"> Useful Scripts </h2>
	
• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/useful_scripts/set_newuser.sh">set_newuser.sh</a> - Cria um novo usuário, o coloca no grupo escolhido (caso não esteja presente é criado) e ainda aplica parte da política de senhas ao usuário. O script deve ser executado seguido do nome do novo usuário e do grupo. 
	Por exemplo:
	
	./set_newuser.sh becker familia_becker
	Em que becker é o novo usuário e familia_becker o grupo a qual ele vai ser adicionado.

Faz algumas verificações para checar se o grupo ou o usuário já existem. Funciona também apenas com o argumento do usuário.

• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/useful_scripts/hostname.sh">hostname.sh</a> - Redefine o hostname do servidor. Deve ser rodado seguido do novo hostname
	
	./hostname.sh becker
	
• <a href="https://github.com/augustobecker/Born2beRoot/blob/main/useful_scripts/ssh_connect.sh">ssh_connect.sh</a> - Mostra o comando necessário para uma conexão SSH com seu servidor

<h4 align="center" id="monitoring-sh"> monitoring.sh </h2>	

<h2 align="center" id="42-cursus"> 42 Cursus </h2>
	
A 42 é uma iniciativa educacional global que propõe uma nova forma de aprender tecnologia: sem professores, sem salas de aula,
estudantes aprendendo com seus colegas estudantes (Aprendizado peer to peer),
com uma metodologia que desenvolve habilidades de computação e da vida.
Sem mencionar que é completamente gratuita e aberta para todos, sem pré-requisitos. 
    
As admissões na 42 são diferentes de outras escolas. Usamos um processo de admissão baseado em mérito.
O passo final no processo é a Piscina - parte parte do processo seletivo que requer 4 semanas de código intenso e imersivo.
Não é necessário experiência anterior em programação.
    
Você pode conferir mais sobre o processo de admissão no site da 42sp: https://www.42sp.org.br
    
ou no meu repositório do github: <a href="https://github.com/augustobecker/42sp_Piscine">42 Piscine</a>

Para ver outros projetos da 42 desenvolvidos por mim, clique aqui: <a href="https://github.com/augustobecker/42cursus">42 Cursus </a>
	
<h2 align="center" id="autor"> Autor </h2>
<div>
    <img height="180em" src="https://user-images.githubusercontent.com/81205527/152089472-0aa06bd9-d882-4c83-adfc-8230d1e958c1.png">
    
<strong> Augusto Becker | acesar-l | 🇧🇷👨‍🚀</strong>
    
:wave: Fale comigo: 
    
  <a href="https://www.linkedin.com/in/augusto-becker/" target="_blank"><img align="center" alt="LinkedIn" height="60" src="https://user-images.githubusercontent.com/81205527/157161849-01a9df02-bf32-45be-add4-122bc40b48cf.png"></a>
<a href="https://www.instagram.com/augusto.becker/" target="_blank"><img align="center" alt="Instagram" height="60" src="https://user-images.githubusercontent.com/81205527/157161841-19ec3ab2-2c8f-4ec0-8b9d-3cd885256098.png"></a>
<a href = "mailto:augustobecker.dev@gmail.com"> <img align="center" alt="Gmail - augustobecker.dev@gmail.com" height="60" src="https://user-images.githubusercontent.com/81205527/157161831-eb9dffee-404b-4ffe-b0af-34671219f7fb.png"></a>
<a href="https://discord.gg/3kxYkBRxUy" target="_blank"><img align="center" alt="Discord - beckerzz#3614" height="60" src="https://user-images.githubusercontent.com/81205527/157161820-de88dc63-61a3-4c9f-9445-07ac98bf0bc2.png"></a>
</div>

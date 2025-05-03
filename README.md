## Usando o programa para executar no meu Neo Vim e calcular tempo para resolver problemas

O intuito é deixar ele o mais leve e rapido possivel apenas para fazer a contagem certa de tempo de execução onde eu fico muito tempo que é no terminal

E com isso para executar eu fiz um alias no meu ~/.zshrc para executa-lo:

primeiro eu criei o arquivo timer.lua dentro da pasta Desktop/pessoal/estudos/lua/timer e depois de criar a logica do programa, cedi o chmod +x ao aquivo cronometro.lua, para ele ter permissão de execução

com isso, eu pude criar um alias no meu zshrc:

alias timer = 'cd Desktop/pessoal/estudos/lua/timer/ && ./cronometro.lua'

nisso, no meu terminal, eu consigo chama-lo com o comando timer e passando o parametro de quanto tempo eu quero que ele conte.



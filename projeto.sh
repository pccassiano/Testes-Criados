#!/bin/bash
menu() {
while [ "$sair" -eq 0 ]; do 
  clear
  echo "  "
  echo "             Script N3 com NMON e Script de rede N2    " 
  echo " " 
  echo "                 FATEC SÃO CAETANO DO SUL                    "

  echo -e " \nQual tarefa deseja realizar?"
  echo    " 1. Verificar CPU."
  echo    " 2. Verificar Memoria."
  echo    " 3. Verificar Disco."
  echo    " 4. Informações sobre o Computador."
  echo    " 5. Verificar informações sobre o Kernel."
  echo    " 6. Verificar informações sobre o FileSystem."
  echo    " 7. Verificar os Processos em Execução."
  echo    " 8. Verificar Network."
  echo    " 9. Ajuda."
  echo    " 10. REDE n2. "
  echo    " 0. Sair do script."
  echo    " Para sair da tarefa que está sendo executada digitar 'q'"
   read -p " >> " OPT
 case $OPT in
	1) export NMON=c; nmon;; 
	2) export NMON=m; nmon;; 
	3) export NMON=d; nmon;; 
        4) export NMON=r; nmon;; 
        5) export NMON=k; nmon;; 
        6) export NMON=j; nmon;; 
        7) export NMON=t; nmon;; 
        8) export NMON=n; nmon;;
	9) ajuda;;
        10) rede ;;
	0) sair;;
	*) echo -e "Opcao Inválida!" ;sleep 3;
  esac
done
}
function ajuda() {
clear
 
  echo "MENU DE AJUDA"
 
  echo -e "1- Ao selecionar a opção Verificar CPU você irá visualizar dados referentes ao uso da sua CPU, informações como os processos que estão sendo executados, taxa de uso, entre outros. 

2- Ao selecionar a opção Visualisar Memória, você irá visualizar dados referentes ao uso de Memória em seu computador. 

3- Ao selecionar a opção Visualisar Disco, você irá visualizar dados referentes ao uso do Disco do computador. 

4- Ao selecionar a opção Visualisar Informações sobre o Computador, você irá obter diversos dados a respeito da máquina, como a arquitetura utilizada, o processador, tamanho de memória ram, entre outros. 

5- Ao selecionar a opção visualisar informações sobre o Kernel, você irá visualizar diversas informações ao respeito do Kernel do Sistema Operacional. 

6- Ao selecionar a opção Visualisar informações sobre o FileSystem, você irá obter diversas informações a respeito do Sistema de Arquivos utilizado em seu Sistema Operacional.

7- Ao selecionar a opção Visualisar os Processos em Execução, você irá visualizar todos os processos que estão sendo executados no momento. 

8- Ao selecionar a opção Visualisar o Network, você pode monitorar o tráfego de dados da sua rede.

0- Encerra o script." 

read -p "Digite enter para voltar ao menu iniciar: " OPCAO

}
sair=0
function sair(){
 sair=1;
   echo "Script Encerrado!";
   echo " "
 exit;

}

function rede(){
while [ "$sair" -eq 0 ]; do 
  clear
  echo "  "
  echo "                      Script N2     " 
  echo " " 
  echo "                 FATEC SÃO CAETANO DO SUL                    "

  echo -e " \nQual tarefa deseja realizar?"
  echo    " 1. VERIFICA AS CONFIGURACOES APRESENTADAS."
  echo    " 2. Modificar configuracoes"
  echo    " 3. encerrar o script"
  echo    " 0. voltar ao menu anterior."

   read -p " >> " option
 case $option in
	1) config_atual;; 
	2) teste_user;; 
        3) exit;;
	0) menu;;
	*) echo -e "Opcao Inválida!" ;sleep 3;
  esac
done
}

function config_atual(){
echo " verficiando as configurações de rede ativa"
/sbin/ifconfig
read -p "Digite enter para voltar ao menu script N2: " OPCAO
rede
}

function teste_user(){

grep $USER /etc/passwd | cut -d: -f1 
if [ $USER == root ]; then 
echo "usuario encontrado"
config_rede
else
echo "usuario root nao encontrado"
echo "por favor entrar como usuario root"
sleep 5;
rede
fi
}

function config_rede(){
while [ "$sair" -eq 0 ]; do 
  clear
  echo "  "
  echo "                      Configuracao de rede     " 
  echo " " 
  echo "                 FATEC SÃO CAETANO DO SUL                    "

  echo -e " \nQual tarefa deseja realizar?"
  echo    " 1. Configurar rede."
  echo    " 2. configuração do dhcp automatico"
  echo    " 3. configuração do ip estatico."
  echo    " 4. Voce quer adicionar uma configuração dhcp sem apagar a configuração atual da pasta interface"
  echo    " 5. Voce que adcionar uma configuração estatica sem apagar a comfiguração atual da pasta interface"
  echo    " 0. Sair da configuração."
  
   read -p " >> " option1
 case $option1 in
	1) modificar;; 
	2) dhcp_auto;; 
        3) ip_estatico;;
        4) dhcp_auto2;;
        5) ip_estatico2;;
	0) rede;;
	*) echo -e "Opcao Inválida!" ;sleep 3;
  esac
done
}

function modificar(){
clear
echo "Digite o nome da Interface que deseja configurar? (Ex.: eth0)"
read INTERFACE
echo "Digite o IP Desejado (Ex.: 192.168.1.1):"
read IP
echo "Digite a Mascara (Ex.: 255.255.255.0):"
read MASCARA
echo " Digite o endereço do Broadcast (Ex.: 192.168.1.255)"
read BROADCAST
echo "Digite o Gateway (Caso não tenha deixe em branco):"
read GW
echo "Digite os Servidor de DNS Primario:"
read DNS1
echo "Digite os Servidor de DNS Secundario:"
read DNS2
echo "Digite o Nome do Atalho (Ex.:"rede1". Vai ser criado um shell-script executavel na pasta /bin. Bastando apenas todas as vezes que desejar iniciar essa rede digitar o comando $rede1)"
read ATALHO
#---------------------------------------------------------------------
#              VERIFICA AS CONFIGURACOES APRESENTADAS
#---------------------------------------------------------------------
echo $INTERFACE
echo $IP
echo $MASCARA
echo $GW
echo $BROADCAST
echo $DNS1
echo $DNS2
echo /bin/$ATALHO

#Iniciando Scripts

ifconfig $INTERFACE down
ifconfig $INTERFACE $IP netmask $MASCARA up
ifconfig $INTERFACE broadcast $BROACAST up
route add default gw $GW
echo "nameserver $DNS1" > /etc/resolv.conf
echo "nameserver $DNS2" >> /etc/resolv.conf

#Criando o Script

echo "ifconfig $INTERFACE down" > /bin/$ATALHO
echo "ifconfig $INTERFACE $IP netmask $MASCARA up" >> /bin/$ATALHO
echo "ifconfig $INTERFACE broadcast $BROACAST up" >> /bin/$ATALHO
echo "route add default gw $GW" >> /bin/$ATALHO
echo "echo nameserver $DNS1 > /etc/resolv.conf" >> /bin/$ATALHO
echo "echo nameserver $DNS2 >> /etc/resolv.conf" >> /bin/$ATALHO
chmod 777 /bin/$ATALHO
rede
}

function dhcp_auto(){
echo "Digite o nome da Interface que deseja configurar? (Ex.: eth0)"
read INTERFACE
echo "# This file describes the network interfaces available on your system" > /etc/network/interfaces
echo "# and how to activate them. For more information, see interfaces(5)." >> /etc/network/interfaces
echo "#" >> /etc/network/interfaces
echo "source /etc/network/interfaces.d/*" >> /etc/network/interfaces
echo "#" >> /etc/network/interfaces
echo "# The loopback network interface" >> /etc/network/interfaces
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "#####################################################" >> /etc/network/interfaces
echo "auto $INTERFACE" >> /etc/network/interfaces
echo "allow-hotplug $INTERFACE" >> /etc/network/interfaces
echo "iface $INTERFACE inet dhcp" >> /etc/network/interfaces
rede
}
function ip_estatico(){
clear
echo "Digite o nome da Interface que deseja configurar? (Ex.: eth0)"
read INTERFACE
echo "Digite o IP Desejado (Ex.: 192.168.1.2):"
read IP
echo "Digite a Mascara (Ex.: 255.255.255.0):"
read MASCARA
echo "Digite o endereço de rede (Ex.: 192.168.1.0):"
read REDE
echo "Digite o endereço de Broadcast (Ex.: 192.168.1.255)"
read BROADCAST
echo "Digite o Gateway (digite o endereço de gateway 192.168.1.1):"
read GW
echo "Digite o Servidor de DNS Primario:"
read DNS1
echo "Digite o Servidor de DNS Secundario:"
read DNS2

#---------------------------------------------------------------------
#              VERIFICA AS CONFIGURACOES APRESENTADAS
#---------------------------------------------------------------------
echo $INTERFACE
echo $IP
echo $MASCARA
echo $REDE
echo $GW
echo $BROADCAST
echo $DNS1
echo $DNS2


#Iniciando Scripts

echo "# This file describes the network interfaces available on your system" > /etc/network/interfaces
echo "# and how to activate them. For more information, see interfaces(5)." >> /etc/network/interfaces
echo "#" >> /etc/network/interfaces
echo "source /etc/network/interfaces.d/*" >> /etc/network/interfaces
echo "#" >> /etc/network/interfaces
echo "# The loopback network interface" >> /etc/network/interfaces
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "#####################################################" >> /etc/network/interfaces
echo "auto $INTERFACE" >> /etc/network/interfaces
echo "allow-hotplug $INTERFACE" >> /etc/network/interfaces
echo "iface $INTERFACE inet static" >> /etc/network/interfaces
echo "    address $IP" >> /etc/network/interfaces
echo "    netmask $MASCARA" >> /etc/network/interfaces
echo "    network $REDE" >> /etc/network/interfaces
echo "    broadcast $BROADCAST" >> /etc/network/interfaces
echo "    gateway $GW" >> /etc/network/interfaces
echo "nameserver $DNS1" >> /etc/resolv.conf
echo "nameserver $DNS2" >> /etc/resolv.conf
rede
}
function dhcp_auto2(){
echo "Digite o nome da Interface que deseja configurar? (Ex.: eth0)"
read INTERFACE
echo "auto $INTERFACE" >> /etc/network/interfaces
echo "allow-hotplug $INTERFACE" >> /etc/network/interfaces
echo "iface $INTERFACE inet dhcp" >> /etc/network/interfaces
rede
}
function ip_estatico2(){
clear
echo "Digite o nome da Interface que deseja configurar? (Ex.: eth0)"
read INTERFACE
echo "Digite o IP Desejado (Ex.: 192.168.1.2):"
read IP
echo "Digite a Mascara (Ex.: 255.255.255.0):"
read MASCARA
echo "Digite o endereço de rede (Ex.: 192.168.1.0):"
read REDE
echo "Digite o endereço de Broadcast (Ex.: 192.168.1.255)"
read BROADCAST
echo "Digite o Gateway (digite o endereço de gateway 192.168.1.1):"
read GW
echo "Digite os Servidor de DNS Primario:"
read DNS1
echo "Digite os Servidor de DNS Secundario:"
read DNS2

#---------------------------------------------------------------------
#              VERIFICA AS CONFIGURACOES APRESENTADAS
#---------------------------------------------------------------------
echo $INTERFACE
echo $IP
echo $MASCARA
echo $REDE
echo $GW
echo $BROADCAST
echo $DNS1
echo $DNS2


#Iniciando Scripts

echo "#####################################################" >> /etc/network/interfaces
echo "auto $INTERFACE" >> /etc/network/interfaces
echo "allow-hotplug $INTERFACE" >> /etc/network/interfaces
echo "iface $INTERFACE inet static" >> /etc/network/interfaces
echo "    address $IP" >> /etc/network/interfaces
echo "    netmask $MASCARA" >> /etc/network/interfaces
echo "    network $REDE" >> /etc/network/interfaces
echo "    broadcast $BROADCAST" >> /etc/network/interfaces
echo "    gateway $GW" >> /etc/network/interfaces
echo "nameserver $DNS1" > /etc/resolv.conf
echo "nameserver $DNS2" >> /etc/resolv.conf
rede
}

menu 


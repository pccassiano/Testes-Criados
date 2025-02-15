#! /bin/bash
#**************************************************************************
#Autor: Eduardo dos Santos Monteiro
#Data: 22/04/2005
#Versão:1.0
#Cidade: Goiânia
#Estado: GO
#**************************************************************************
clear
echo "Digite o nome da Interface que deseja configurar? (Ex.: eth0)"
read INTERFACE
echo "Digite o IP Desejado (Ex.: 192.168.1.1):"
read IP
echo "Digite a Mascara (Ex.: 255.255.255.0):"
read MASCARA
echo "Digite o Gateway (Caso não tenha deixe em branco):"
read GW
echo "Digite os Servidor de DNS Primário:"
read DNS1
echo "Digite os Servidor de DNS Secundário:"
read DNS2
echo "Digite o Nome do Atalho (Ex.:"rede1". Vai ser criado um shell-script executavel na pasta /bin. Bastando apenas todas as vezes que desejar iniciar essa rede digitar o comando $rede1)"
read ATALHO
#---------------------------------------------------------------------
#              VERIFICA AS CONFIGURAÇÕES APRESENTADAS
#---------------------------------------------------------------------
echo $INTERFACE
echo $IP
echo $MASCARA
echo $GW
echo $DNS1
echo $DNS2
echo /bin/$ATALHO

#Iniciando Scripts

ifconfig $INTERFACE down
ifconfig $INTERFACE $IP netmask $MASCARA up
route add default gw $GW
echo "nameserver $DNS1" > /etc/resolv.conf
echo "nameserver $DNS2" >> /etc/resolv.conf

#Criando o Script

echo "ifconfig $INTERFACE down" > /bin/$ATALHO
echo "ifconfig $INTERFACE $IP netmask $MASCARA up" >> /bin/$ATALHO
echo "route add default gw $GW" >> /bin/$ATALHO
echo "echo nameserver $DNS1 > /etc/resolv.conf" >> /bin/$ATALHO
echo "echo nameserver $DNS2 >> /etc/resolv.conf" >> /bin/$ATALHO
chmod +x /bin/$ATALHO

#---------------------------------------------------------------------
#              FIM DO SCRIPT
#---------------------------------------------------------------------
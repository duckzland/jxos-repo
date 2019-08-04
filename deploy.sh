#!/bin/bash

echo "Deploying Scripts"
scp *.deb duckz@192.168.1.191:~/packages
scp *.deb duckz@192.168.1.192:~/packages
scp *.deb duckz@192.168.1.193:~/packages
scp *.deb duckz@192.168.1.194:~/packages
scp *.deb duckz@192.168.1.195:~/packages

#echo "Deploying to JXOS builder"
#scp *.deb duckz@192.168.0.115:~/packages

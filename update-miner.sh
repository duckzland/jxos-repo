#!/bin/bash

echo "Updating Miner"

ssh -t duckz@192.168.1.191 'sudo dpkg -i /home/duckz/packages/python-jxminer_0.3.21_all.deb'
ssh -t duckz@192.168.1.192 'sudo dpkg -i /home/duckz/packages/python-jxminer_0.3.21_all.deb'
ssh -t duckz@192.168.1.193 'sudo dpkg -i /home/duckz/packages/python-jxminer_0.3.21_all.deb'
ssh -t duckz@192.168.1.194 'sudo dpkg -i /home/duckz/packages/python-jxminer_0.3.21_all.deb'
ssh -t duckz@192.168.1.195 'sudo dpkg -i /home/duckz/packages/python-jxminer_0.3.21_all.deb'

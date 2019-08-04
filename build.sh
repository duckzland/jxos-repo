#!/usr/bin/env bash

if ! which fpm > /dev/null; then
   echo -e "Command not found! Install? (y/n) \c"
   read
   if "$REPLY" = "y"; then
        echo "[+] Installing FPM"
        echo ""
        sudo apt-get -y install ruby-dev build-essential
        sudo gem install fpm
        echo ""
   fi
fi

RootPath="/home/duckz/Desktop/Projects"

echo "Removing old debs...."
rm -f *.deb

echo "[+] Building packages"
echo "[-] Packing Server"
echo " "
fpm -s python --no-python-dependencies --no-python-fix-dependencies --deb-systemd $RootPath/jxminer/debian/jxminer.service -t deb $RootPath/jxminer/setup.py
echo " "

#echo "[-] Updating server requirements.txt"
#pipreqs --force $RootPath/jxminer
#echo " "

echo "[-] Packing Client"
echo " "
fpm -s python --no-python-dependencies --no-python-fix-dependencies --deb-no-default-config-files -t deb $RootPath/jxclient/setup.py
echo " "

#echo "[-] Updating client requirements.txt"
#pipreqs --force $RootPath/jxclient
#echo " "

echo "[-] Packing Monitor"
echo " "
fpm -s python --no-python-dependencies --no-python-fix-dependencies --deb-no-default-config-files -t deb $RootPath/jxmonitor/setup.py
echo " "

#echo "[-] Updating monitor requirements.txt"
#pipreqs --force $RootPath/jxmonitor
#echo " "

#echo "[-] Packing Watchdog"
#echo " "
#fpm -s python --no-python-dependencies --no-python-fix-dependencies --deb-systemd $RootPath/jxwatchdog/debian/jxwatchdog.service -t deb $RootPath/jxwatchdog/setup.py
#echo " "

#echo "[-] Updating monitor requirements.txt"
#pipreqs --force $RootPath/jxwatchdog
#echo " "

#echo "[-] Packing Dashboard"
echo " "
rm $RootPath/jxdashboard/build/installers/*
pushd $RootPath/jxdashboard/
npm run deb64
popd
cp $RootPath/jxdashboard/build/installers/*.deb $RootPath/packages/
echo " "

echo "[-] Packing atiflash"
echo " "
fpm -n atiflash -t deb --deb-no-default-config-files -v 4.25 -s dir $RootPath/tools/build/atiflash=/usr/local/bin/atiflash
echo " "

echo "[-] Packing amdmeminfo"
echo " "
fpm -n amdmeminfo -t deb --deb-no-default-config-files -v 1.0 -s dir $RootPath/tools/build/amdmeminfo=/usr/local/bin/amdmeminfo
echo " "

echo "[-] Packing nvflash"
echo " "
fpm -n nvflash -t deb --deb-no-default-config-files -v 5.414.0 -s dir $RootPath/tools/build/nvflash=/usr/local/bin/nvflash
echo " "

echo "[-] Packing MSI Motherboard Led tools"
echo " "
fpm -n msi-mb-rgb -t deb --deb-no-default-config-files -v 1.0 -s dir $RootPath/tools/build/msi-mb-rgb=/usr/local/bin/msi-mb-rgb
echo " "

echo "[-] Packing ROCM SMI"
echo " "
fpm -n rocm-smi -t deb --deb-no-default-config-files -v 1.0 -s dir $RootPath/tools/build/rocm-smi=/usr/local/bin/rocm-smi
echo " "

echo "[-] Packing Claymore Eth"
echo " "
rm -f $RootPath/miners/build/claymore_eth/*.txt
fpm -n claymore-eth -t deb --deb-no-default-config-files -v 14.7 -s dir $RootPath/miners/build/claymore_eth=/usr/local/bin/
echo " "

echo "[-] Packing Claymore Zec"
echo " "
rm -f $RootPath/miners/build/claymore_zec/*.txt
fpm -n claymore-zec -t deb --deb-no-default-config-files -v 12.6 -s dir $RootPath/miners/build/claymore_zec=/usr/local/bin/
echo " "

echo "[-] Packing Claymore XMR"
echo " "
rm -f $RootPath/miners/build/claymore_xmr/*.txt
fpm -n claymore-xmr -t deb --deb-no-default-config-files -v 11.3 -s dir $RootPath/miners/build/claymore_xmr=/usr/local/bin/
echo " "

echo "[-] Packing EWBF"
echo " "
fpm -n ewbf -t deb --deb-no-default-config-files -v 0.6 -s dir $RootPath/miners/build/ewbf=/usr/local/bin/ewbf
echo " "

echo "[-] Packing Ethminer"
echo " "
fpm -n ethminer -t deb --deb-no-default-config-files -v 0.18.0-rc.0 -s dir $RootPath/miners/build/ethminer=/usr/local/bin/ethminer
echo " "

echo "[-] Packing ccminer"
echo " "
fpm -n ccminer -t deb --deb-no-default-config-files -v 2.3.1 -s dir $RootPath/miners/build/ccminer=/usr/local/bin/ccminer
echo " "

echo "[-] Packing ccminer suprminer"
echo " "
fpm -n ccminer-suprminer -t deb --deb-no-default-config-files -v 1.6 -s dir $RootPath/miners/build/ccminer-suprminer=/usr/local/bin/ccminer-suprminer
echo " "

echo "[-] Packing ccminer raven"
echo " "
fpm -n ccminer-raven -t deb --deb-no-default-config-files -v 2.6 -s dir $RootPath/miners/build/ccminer-raven=/usr/local/bin/ccminer-raven
echo " "

echo "[-] Packing ccminer nevermore"
echo " "
fpm -n ccminer-nevermore -t deb --deb-no-default-config-files -v 0.2.3 -s dir $RootPath/miners/build/ccminer-nevermore=/usr/local/bin/ccminer-nevermore
echo " "

echo "[-] Packing ccminer cryptonight"
echo " "
fpm -n ccminer-cryptonight -t deb --deb-no-default-config-files -v 3.06 -s dir $RootPath/miners/build/ccminer-cryptonight=/usr/local/bin/ccminer-cryptonight
echo " "

echo "[-] Packing cpuminer opt"
echo " "
fpm -n cpuminer -t deb --deb-no-default-config-files -v 3.9.5 -s dir $RootPath/miners/build/cpuminer=/usr/local/bin/cpuminer
echo " "

echo "[-] Packing xmrig cpu"
echo " "
fpm -n xmrig-cpu -t deb --deb-no-default-config-files -v 2.14.4 -s dir $RootPath/miners/build/xmrig-cpu=/usr/local/bin/xmrig-cpu
echo " "

echo "[-] Packing xmrig amd"
echo " "
fpm -n xmrig-amd -t deb --deb-no-default-config-files -v 2.14.4 -s dir $RootPath/miners/build/xmrig-amd=/usr/local/bin/xmrig-amd
echo " "

echo "[-] Packing xmrig nvidia"
echo " "
fpm -n xmrig-nvidia -t deb --deb-no-default-config-files -v 2.14.4 -s dir $RootPath/miners/build/xmrig-nvidia=/usr/local/bin/xmrig-nvidia
echo " "

echo "[-] Packing sgminer-gm-x16r"
echo " "
fpm -n sgminer -t deb --deb-no-default-config-files -v 5.5.5-gm-a -s dir $RootPath/miners/build/sgminer=/usr/local/bin
echo " "

echo "[-] Packing sgminer-phi2"
echo " "
fpm -n sgminer-phi2 -t deb --deb-no-default-config-files -v 6.0.0 -s dir $RootPath/miners/build/sgminer-phi2=/usr/local/bin
echo " "

echo "[-] Packing CastXMR"
echo " "
fpm -n cast_xmr-vega -t deb --deb-no-default-config-files -v 1.7.1 -s dir $RootPath/miners/build/cast_xmr-vega=/usr/local/bin/cast_xmr-vega
echo " "

echo "[-] Packing PhoenixMiner"
echo " "
fpm -n phoenixminer -t deb --deb-no-default-config-files -v 4.2c -s dir $RootPath/miners/build/PhoenixMiner=/usr/local/bin/PhoenixMiner
echo " "

echo "[-] Packing CryptoDredge"
echo " "
fpm -n cryptodredge -t deb --deb-no-default-config-files -v 0.20.1 -s dir $RootPath/miners/build/CryptoDredge=/usr/local/bin/CryptoDredge
echo " "

echo "[-] Packing T-Rex"
echo " "
fpm -n trex -t deb --deb-no-default-config-files -v 0.12.1 -s dir $RootPath/miners/build/t-rex=/usr/local/bin/t-rex
echo " "

echo "[-] Packing TeamRedMiner"
echo " "
fpm -n teamredminer -t deb --deb-no-default-config-files -v 0.5.2 -s dir $RootPath/miners/build/teamredminer=/usr/local/bin/teamredminer
echo " "

echo "[-] Packing Avermore"
echo " "
fpm -n avermore -t deb --deb-no-default-config-files -v 1.4.1 -s dir $RootPath/miners/build/avermore-miner=/usr/local/bin/avermore
echo " "

echo "[-] Packing WildRig Multi"
echo " "
fpm -n wildrig-multi -t deb --deb-no-default-config-files -v 0.17.9 -s dir $RootPath/miners/build/wildrig-multi=/usr/local/bin/wildrig-multi
echo " "

echo "[+] Cleaning build files"
echo "[-] Removing server build files"
rm -rf $RootPath/jxminer/build
rm -rf $RootPath/jxminer/jxminer.egg-info

echo "[-] Removing client build files"
rm -rf $RootPath/jxclient/build
rm -rf $RootPath/jxclient/jxclient.egg-info

echo "[-] Removing monitor build files"
rm -rf $RootPath/jxmonitor/build
rm -rf $RootPath/jxmonitor/jxmonitor.egg-info

echo "[-] Removing watchdog build files"
rm -rf $RootPath/jxwatchdog/build
rm -rf $RootPath/jxwatchdog/jxwatchdog.egg-info

echo "[-] Removing source tarballs"
rm -f $RootPath/packages/*.tar.gz



echo "[+] Copying packages"
echo "[-] Copying JXMiner and its dependencies"
rm -f $RootPath/jxminer/debian/*.deb
cp -f $RootPath/packages/python-jxminer*.deb $RootPath/jxminer/debian/

echo "[-] Copying JXMonitor and its dependencies"
rm -f $RootPath/jxmonitor/debian/*.deb
cp -f $RootPath/packages/python-jxmonitor*.deb $RootPath/jxmonitor/debian/

echo "[-] Copying JXClient and its dependencies"
rm -f $RootPath/jxclient/debian/*.deb
cp -f $RootPath/packages/python-jxclient*.deb $RootPath/jxclient/debian/

#echo "[-] Copying JXWatchdog and its dependencies"
#rm -f $RootPath/jxwatchdog/debian/*.deb
#cp -f $RootPath/packages/python-jxwatchdog*.deb $RootPath/jxwatchdog/debian/

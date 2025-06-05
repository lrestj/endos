#KLIENT NASTAVENÍ:
#!/bin/bash

#sudo apt install nfs-common

sudo systemctl enable --now nfs-client.target

sudo systemctl enable --now NetworkManager-wait-online.service


#Ověřit:

showmount -e 192.168.77.18



#mounts


sudo mkdir -p /data/nfs/FilmyNas /data/nfs/HudbaNas /data/nfs/Nas &&

sudo chmod -R ugo+rwx /data/nfs

sudo mount -t nfs 192.168.77.18:/volume1/Rodinas /data/nfs/Nas

sudo mount -t nfs 192.168.77.18:/volume1/Hudba /data/nfs/HudbaNas

sudo mount -t nfs 192.168.77.18:/volume1/Filmy /data/nfs/FilmyNas

#add to fstab:
sudo cp /etc/fstab /etc/fstab.bak

cat 3fstabnfs | sudo tee -a /etc/fstab

echo "Připojení Nas Synology proběhlo úspěšně"
















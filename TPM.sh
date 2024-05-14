#!/bin/bash

#set -e
#set -x

# Install des packages nécessaires
sudo apt-get -y install clevis clevis-tpm2 clevis-luks clevis-initramfs initramfs-tools tss2

# Demande du mot de passe de chiffrement
echo -n "Entrer le mot de passe de chiffrement : "
read -s LUKSKEY
echo ""

# Trouver le nom du périphérique LUKS
LUKS_DEVICE=$(sudo lsblk --fs | grep "crypto_LUKS" | awk '{print $1}' | tr -dc '[:alnum:]')

# Lier le périphérique LUKS avec Clevis et TPM2
sudo clevis luks bind -d /dev/$LUKS_DEVICE tpm2 '{"pcr_bank":"sha256"}' <<< "$LUKSKEY"

# Mettre à jour l'initramfs
sudo update-initramfs -u -k all

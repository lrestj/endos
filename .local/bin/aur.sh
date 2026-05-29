#!/usr/bin/env bash

# Ukončit skript při jakékoliv chybě
set -euo pipefail

# Kontrola, zda byl zadán název balíčku
if [ -z "${1:-}" ]; then
    echo "Chyba: Nebyl zadán žádný název AUR balíčku."
    echo "Použití: $0 <nazev-balicku>"
    exit 1
fi

PKG_NAME="$1"
BUILD_DIR="$HOME/.local/src"

# Krok 2: Vytvoření čistého adresáře pro sestavení
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Krok 3: Stažení repozitáře z AUR pomocí Git
if [ -d "$PKG_NAME" ]; then
    echo "==> Adresář $PKG_NAME již existuje. Aktualizuji repozitář..."
    cd "$PKG_NAME"
    git fetch origin
    LOCAL_HASH=$(git rev-parse HEAD)
    REMOTE_HASH=$(git rev-parse @{u}) # @{u} is shorthand for the upstream branch
    if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
        echo "##########################################"
        echo "#  Aktualizace k dispozici, provádím...  #"
        echo "##########################################"
        sleep 3
        git pull
        echo "==> Otevírám PKGBUILD ke kontrole..."
        sleep 2
        vim PKGBUILD

        echo
        echo "##############################"
        echo "#  Vše O.K - pokračovat...?  #"
        echo "##############################"
        while true; do
            read -r -n 1 -p "Vyberte (A/N): " answer
            case $answer in
                [Aa]* ) echo -e "\n Instaluji..."
                        sleep 1
                        break;;
                [Nn]* ) echo -e "\nPřerušeno uživatelem"
                        exit 1;;
                * ) echo -e "\nVyberte A nebo N.";;
            esac
        done
                makepkg -sir
        echo "################################"
        echo "#  Aktualizace kompletní.      #"
        echo "################################"
    else
        echo "#####################################"
        echo "#  Žádné dostupné aktualizace.      #"
        echo "#####################################"
        exit 0
    fi
else
    echo "==> Klonování repozitáře $PKG_NAME z AUR..."
git clone "https://aur.archlinux.org/${PKG_NAME}.git"
    cd "$PKG_NAME"
fi

echo "==> Otevírám PKGBUILD ke kontrole..."
sleep 2
vim PKGBUILD

echo
echo "##############################"
echo "#  Vše O.K - pokračovat...?  #"
echo "##############################"
while true; do
    read -r -n 1 -p "Vyberte (A/N): " answer
    case $answer in
        [Aa]* ) echo -e "\n Instaluji..."
                sleep 1
                break;;
        [Nn]* ) echo -e "\nPřerušeno uživatelem"
                exit 1;;
        * ) echo -e "\nVyberte A nebo N.";;
    esac
done
# Krok 5: Sestavení a instalace balíčku
# -s: automaticky nainstaluje chybějící závislosti přes pacman
# -i: nainstaluje výsledný balíček do systému
# -r: po úspěšném sestavení odstraní nepotřebné build závislosti
echo "==> Sestavuji a instaluji balíček pomocí makepkg..."
makepkg -sir


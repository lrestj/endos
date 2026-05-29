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

# Krok 1: Instalace potřebných závislostí pro sestavení
echo "==> Kontrola a instalace základních nástrojů (base-devel, git)..."
sudo pacman -S --needed --noconfirm base-devel git

# Krok 2: Vytvoření čistého adresáře pro sestavení
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Krok 3: Stažení repozitáře z AUR pomocí Git
if [ -d "$PKG_NAME" ]; then
    echo "==> Adresář $PKG_NAME již existuje. Aktualizuji repozitář..."
    cd "$PKG_NAME"
    git pull
else
    echo "==> Klonování repozitáře $PKG_NAME z AUR..."
git clone "https://aur.archlinux.org/${PKG_NAME}.git"
    cd "$PKG_NAME"
fi

# Krok 4: Kontrola PKGBUILD souboru (Bezpečnostní doporučení Arch Linuxu)
echo "==> Otevírám PKGBUILD ke kontrole. Pro ukončení prohlížení stiskněte 'q'..."
sleep 5
vim PKGBUILD

# Krok 5: Sestavení a instalace balíčku
# -s: automaticky nainstaluje chybějící závislosti přes pacman
# -i: nainstaluje výsledný balíček do systému
# -r: po úspěšném sestavení odstraní nepotřebné build závislosti
echo "==> Sestavuji a instaluji balíček pomocí makepkg..."
makepkg -sir


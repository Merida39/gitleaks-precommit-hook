#!/bin/bash

set -e

OS=$(uname -s)
GITLEAKS_VERSION="v8.27.2"

if [ "$OS" = "Linux" ]; then
    curl -sSL https://github.com/gitleaks/gitleaks/releases/download/$GITLEAKS_VERSION/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz | tar xz
    sudo mv gitleaks /usr/local/bin/
elif [ "$OS" = "Darwin" ]; then
    curl -sSL https://github.com/gitleaks/gitleaks/releases/download/$GITLEAKS_VERSION/gitleaks_${GITLEAKS_VERSION}_darwin_x64.tar.gz | tar xz
    sudo mv gitleaks /usr/local/bin/
elif [[ "$OS" == MINGW* || "$OS" == MSYS* ]]; then
    echo "Будь ласка, встанови gitleaks вручну для Windows: https://github.com/gitleaks/gitleaks/releases"
    exit 1
else
    echo "Невідома операційна система: $OS"
    exit 1
fi

echo "Gitleaks успішно встановлено."

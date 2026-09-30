#!/usr/bin/env bash
# Installe les outils de la formation dans le Codespace (lancé automatiquement à la création).
set -euo pipefail

# Versions épinglées : mettez-les à jour avant la formation (pages "Releases" de chaque projet).
GITLEAKS_VERSION="8.21.2"
COSIGN_VERSION="2.4.1"

BIN=/usr/local/bin
TMP=$(mktemp -d)

echo "==> Gitleaks ${GITLEAKS_VERSION}"
curl -sSfL "https://github.com/gitleaks/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz" -o "$TMP/gitleaks.tgz"
tar -xzf "$TMP/gitleaks.tgz" -C "$TMP" gitleaks
sudo install "$TMP/gitleaks" "$BIN/gitleaks"

echo "==> cosign ${COSIGN_VERSION}"
curl -sSfL "https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-linux-amd64" -o "$TMP/cosign"
sudo install "$TMP/cosign" "$BIN/cosign"

echo "==> Syft et Grype (scripts d'installation officiels d'Anchore)"
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b "$BIN"
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b "$BIN"

echo "==> pre-commit et dépendances de l'application"
# --break-system-packages : nécessaire si l'image de base marque Python comme "externally managed" (PEP 668).
python3 -m pip install --break-system-packages --quiet pre-commit -r requirements.txt

rm -rf "$TMP"
echo "Outils prêts : gitleaks, cosign, syft, grype, pre-commit"

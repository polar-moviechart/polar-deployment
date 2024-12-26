#!/bin/sh

set -euo pipefail

echo "\n📦 Installing ingress-nginx..."

kubectl apply -k resources
#kubectl apply -f resources/

echo "\n📦 Installation completed.\n"
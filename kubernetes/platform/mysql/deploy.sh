#!/bin/sh

set -euo pipefail

echo "\n📦 Installing mysql..."

kubectl apply -k resources
#kubectl apply -f resources/

echo "\n📦 Installation completed.\n"
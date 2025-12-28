#!/bin/sh
set -e
mkdir -p .git/hooks
cp scripts/pre-commit-identity-guard.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "Installed pre-commit identity guard."

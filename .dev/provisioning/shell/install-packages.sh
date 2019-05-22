#!/usr/bin/env bash

PROJECT_DIR=${1}
SHELL_SCRIPTS_DIR="${PROJECT_DIR}/${2}"

echo "Install commonly used packages"
apt update >/dev/null
apt install -y software-properties-common build-essential htop vim curl net-tools unzip >/dev/null

echo "Running install-terraform.sh"
${SHELL_SCRIPTS_DIR}/install-terraform.sh

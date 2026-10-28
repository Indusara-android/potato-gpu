#!/bin/bash

# Potato-GPU: An automatic DXVK-Sarek installer for older AMD GPUs
# Works offline by using the bundled DLLs in the dxvk-sarek folder.

# Colors for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🥔 Welcome to Potato-GPU!${NC}"
echo "This script will install DXVK-Sarek into your Wine prefix for older Vulkan 1.1/1.2 GPUs."

# 1. Check for AMD GPU
if ! lspci | grep -i "VGA" | grep -qi "AMD"; then
    echo -e "${RED}⚠️ No AMD GPU detected. This script is optimized for AMD A-series/Radeon.${NC}"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit 1; fi
fi

# 2. Check if the folders exist in the current directory
if [ ! -d "dxvk-sarek/x32" ] || [ ! -d "dxvk-sarek/x64" ]; then
    echo -e "${RED}❌ Error: Could not find dxvk-sarek/x32 and x64 folders.${NC}"
    echo "Please make sure you extracted the entire ZIP file before running this script!"
    exit 1
fi

# 3. Install dependencies (just in case Wine isn't installed)
echo -e "${BLUE}📦 Checking dependencies...${NC}"
sudo apt update
sudo apt install -y wine

# 4. Copy files to Wine
echo -e "${BLUE}🚀 Installing DXVK-Sarek into Wine prefix...${NC}"
mkdir -p ~/.wine/drive_c/windows/system32
mkdir -p ~/.wine/drive_c/windows/syswow64

cp dxvk-sarek/x64/*.dll ~/.wine/drive_c/windows/system32/
cp dxvk-sarek/x32/*.dll ~/.wine/drive_c/windows/syswow64/

# 5. Apply Wine Registry Overrides
echo -e "${BLUE}⚙️ Configuring Wine DLL overrides...${NC}"
wine reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d9 /t REG_SZ /d native /f > /dev/null 2>&1
wine reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d10core /t REG_SZ /d native /f > /dev/null 2>&1
wine reg add "HKCU\\Software\\Wine\\DllOverrides" /v d3d11 /t REG_SZ /d native /f > /dev/null 2>&1
wine reg add "HKCU\\Software\\Wine\\DllOverrides" /v dxgi /t REG_SZ /d native /f > /dev/null 2>&1

echo -e "${GREEN}✅ Success! DXVK-Sarek is installed permanently.${NC}"
echo "You can now run your old DirectX games on your AMD hardware!"

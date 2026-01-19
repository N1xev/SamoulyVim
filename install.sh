#!/bin/bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}"
cat <<'EOF'
 ██╗ ██╗     ██╗   ██╗██╗███╗   ███╗   
████████╗    ██║   ██║██║████╗ ████║   
╚██╔═██╔╝    ██║   ██║██║██╔████╔██║   
████████╗    ╚██╗ ██╔╝██║██║╚██╔╝██║   
╚██╔═██╔╝     ╚████╔╝ ██║██║ ╚═╝ ██║██╗
 ╚═╝ ╚═╝       ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝
EOF
echo -e "${NC}"

echo -e "${CYAN}[START] SamoulyVim Dependency Installer for Linux${NC}"
echo -e "${CYAN}===========================================${NC}"

trap 'echo -e "${RED}[ERROR] Installation failed!${NC}"; exit 1' ERR

if command -v paru &>/dev/null; then
  PM="paru -S --noconfirm"
  echo -e "${GREEN}[OK] Detected paru package manager${NC}"
elif command -v yay &>/dev/null; then
  PM="yay -S --noconfirm"
  echo -e "${GREEN}[OK] Detected yay package manager${NC}"
else
  echo -e "${RED}[ERROR] No AUR helper found. Please install paru or yay.${NC}"
  exit 1
fi

if ! command -v fzf &>/dev/null; then
  echo -e "${YELLOW}[PKG] Installing fzf for selection interface...${NC}"
  $PM fzf || {
    echo -e "${RED}[ERROR] Failed to install fzf${NC}"
    exit 1
  }
  echo -e "${GREEN}[OK] fzf installed${NC}"
fi

echo -e "${YELLOW}[PKG] Installing external tools: opencode, ripgrep, fd...${NC}"
$PM opencode ripgrep fd || {
  echo -e "${RED}[ERROR] Failed to install external tools${NC}"
  exit 1
}
echo -e "${GREEN}[OK] External tools installed${NC}"

languages=("Go:go" "Rust:rust" "Node.js:nodejs npm" "Python:python python-pip")

echo -e "${PURPLE}[TOOLS] Select languages to install (use TAB/Space to select, Enter to confirm):${NC}"
selected=$(printf '%s\n' "${languages[@]}" | fzf --multi --header "Supported Languages" --color=fg:#d0d0d0,bg:#121212,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf)

if [ -z "$selected" ]; then
  echo -e "${YELLOW}[WARN] No languages selected. Exiting.${NC}"
  exit 0
fi

echo -e "${YELLOW}[PKG] Installing selected languages...${NC}"
while IFS= read -r sel; do
  pkg=$(echo "$sel" | cut -d: -f2)
  echo -e "${BLUE}  Installing $pkg...${NC}"
  $PM $pkg || {
    echo -e "${RED}[ERROR] Failed to install $pkg${NC}"
    exit 1
  }
  echo -e "${GREEN}  [OK] $pkg installed${NC}"
done <<<"$selected"

echo -e "${GREEN}[DONE] Installation complete! Restart your terminal or source your profile.${NC}"


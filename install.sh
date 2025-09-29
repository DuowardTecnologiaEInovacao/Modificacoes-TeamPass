#!/bin/bash

# Encerra o script se qualquer comando falhar
set -e

# --- Variáveis de Configuração ---
TEAMPASS_PATH="/var/www/teampass"
REPO_URL="https://github.com/DuowardTecnologiaEInovacao/Modificacoes-TeamPass/archive/refs/heads/main.zip"
TMP_DIR="/tmp/teampass_update"
EXTRACTED_DIR_NAME="Modificacoes-TeamPass-main" # Nome padrão da pasta após descompactar o ZIP do GitHub

# --- Início da Execução ---
echo "====================================================="
echo "   Iniciando a customização (White Label) do Teampass  "
echo "====================================================="

# Verifica se está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
  echo "ERRO: Este script precisa ser executado com privilégios de root (sudo)."
  exit 1
fi

# Verifica se o diretório do Teampass existe
if [ ! -d "$TEAMPASS_PATH" ]; then
    echo "ERRO: O diretório de instalação do Teampass não foi encontrado em $TEAMPASS_PATH"
    exit 1
fi

echo "--> 1/6: Navegando para o diretório do Teampass..."
cd "$TEAMPASS_PATH"

# --- Backup ---
BACKUP_DIR="${TEAMPASS_PATH}/backups_custom/$(date +%Y-%m-%d_%H-%M-%S)"
echo "--> 2/6: Criando diretório de backup em $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR/includes/css"
mkdir -p "$BACKUP_DIR/includes/core"

echo "     Fazendo backup dos arquivos originais..."
cp index.php "$BACKUP_DIR/index.php.backup"
cp includes/core/login.php "$BACKUP_DIR/includes/core/login.php.backup"
cp includes/css/teampass.css "$BACKUP_DIR/includes/css/teampass.css.backup"
echo "     Backup concluído com sucesso."

# --- Download e Extração ---
echo "--> 3/6: Baixando os arquivos de customização do repositório..."
rm -rf "$TMP_DIR" # Limpa downloads anteriores
mkdir -p "$TMP_DIR"
wget -q -O "$TMP_DIR/main.zip" "$REPO_URL"
unzip -q "$TMP_DIR/main.zip" -d "$TMP_DIR"
echo "     Download e extração concluídos."

# --- Implantação dos Arquivos ---
SOURCE_DIR="$TMP_DIR/$EXTRACTED_DIR_NAME"

echo "--> 4/6: Criando diretório de ativos customizados..."
mkdir -p "${TEAMPASS_PATH}/includes/img/custom"

echo "--> 5/6: Copiando novos arquivos para o Teampass..."
# Arquivos de Layout e Estilo
cp "$SOURCE_DIR/index.php" "${TEAMPASS_PATH}/index.php"
cp "$SOURCE_DIR/login.php" "${TEAMPASS_PATH}/includes/core/login.php"
cp "$SOURCE_DIR/teampass.css" "${TEAMPASS_PATH}/includes/css/teampass.css"

# Ativos Visuais (Imagens) - AGORA PROCURANDO NA RAIZ
cp "$SOURCE_DIR/Logo-SentinelArk.png" "${TEAMPASS_PATH}/includes/img/custom/Logo-SentinelArk.png"
cp "$SOURCE_DIR/Logo-2-SentinelArk.png" "${TEAMPASS_PATH}/includes/img/custom/Logo-2-SentinelArk.png"
cp "$SOURCE_DIR/Logo-2-SentinelArk.ico" "${TEAMPASS_PATH}/includes/img/custom/Logo-2-SentinelArk.ico"
echo "     Arquivos implantados."

# --- Ajuste de Permissões ---
echo "--> 6/6: Ajustando permissões dos arquivos (proprietário www-data)..."
chown -R www-data:www-data "$TEAMPASS_PATH"
echo "     Permissões ajustadas."

# --- Limpeza ---
rm -rf "$TMP_DIR"
echo ""
echo "====================================================="
echo "  Processo concluído com sucesso! "
echo "  Lembre-se de limpar o cache do seu navegador."
echo "====================================================="

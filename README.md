# Tema de Branding "Sentinel Ark Vault" para Teampass

Este repositório contém os arquivos necessários para aplicar a identidade visual Sentinel Ark Vault a uma instância do gerenciador de senhas Teampass.

## Sumário
1. [Visão Geral](#1-visão-geral)
2. [Escopo da Customização](#2-escopo-da-customização)
3. [Pré-requisitos](#3-pré-requisitos)
4. [Procedimento de Instalação](#4-procedimento-de-instalação)
    - 4.1. [Backup dos Arquivos Originais](#41-backup-dos-arquivos-originais)
    - 4.2. [Implantação dos Arquivos Customizados](#42-implantação-dos-arquivos-customizados)
    - 4.3. [Ajuste de Permissões (Passo Crucial)](#43-ajuste-de-permissões-passo-crucial)
    - 4.4. [Verificação Pós-instalação](#44-verificação-pós-instalação)
5. [Manifesto de Arquivos](#5-manifesto-de-arquivos)
6. [Histórico de Versões](#6-histórico-de-versões)

---

## 1. Visão Geral

Este pacote de branding foi desenvolvido para prover uma solução de "white-labeling" para o Teampass, garantindo uma experiência de usuário coesa e alinhada à identidade visual da Sentinel Ark.

## 2. Escopo da Customização

As modificações afetam exclusivamente a camada de apresentação (frontend) da aplicação. A lógica de negócios, segurança e funcionalidades do Teampass permanecem inalteradas.

As áreas customizadas incluem:
* **Interface de Login:** Alteração completa do layout, logo e esquema de cores.
* **Interface Principal:** Alteração do logo no cabeçalho e esquema de cores.
* **Branding:** Substituição do ícone da aba do navegador (favicon).

## 3. Pré-requisitos

* Uma instância funcional do Teampass (versão 3.1.4.31).
* Acesso de superusuário (sudo) ao sistema de arquivos do servidor onde o Teampass está instalado.

## 4. Procedimento de Instalação

Siga os passos abaixo com atenção para garantir uma aplicação sem erros.

### 4.1. Backup dos Arquivos Originais

Antes de qualquer modificação, é mandatório realizar o backup dos arquivos que serão substituídos.

Execute os seguintes comandos no diretório raiz da sua instalação Teampass (ex: `/var/www/teampass`):

```bash
# Navegue até a pasta raiz do Teampass
cd /caminho/para/sua/instalacao/teampass

# Backup dos arquivos de layout, estilo e ícone
sudo cp index.php index.php.bak
sudo cp includes/core/login.php includes/core/login.php.bak
sudo cp includes/css/teampass.css includes/css/teampass.css.bak
sudo cp favicon.ico favicon.ico.bak
```

### 4.2. Implantação dos Arquivos Customizados

Com os backups em segurança, prossiga com a implantação dos novos arquivos.

#### 1. Crie o Diretório de Imagens Customizadas
Este diretório irá armazenar os logos, mantendo-os separados dos arquivos originais.

```bash
# Dentro da pasta raiz do Teampass
sudo mkdir -p includes/img/custom
```

#### 2. Copie os Ativos Visuais (Logos)
Copie todos os arquivos de imagem (`.png`, `.ico`, `.svg`) deste repositório para o diretório recém-criado.

- `Logo-SentinelArk.png` → `includes/img/custom/Logo-SentinelArk.png`
- `Logo-2-SentinelArk.png` → `includes/img/custom/Logo-2-SentinelArk.png`
- `Logo-2-SentinelArk.ico` → `includes/img/custom/Logo-2-SentinelArk.ico`

#### 3. Copie os Arquivos Modificados
Substitua os arquivos originais pelos arquivos customizados deste repositório.

- `index.php` (deste repo) → `/caminho/para/teampass/index.php`
- `login.php` (deste repo) → `/caminho/para/teampass/includes/core/login.php`
- `teampass.css` (deste repo) → `/caminho/para/teampass/includes/css/teampass.css`

#### 4. Copie o Favicon
O arquivo de ícone precisa ser copiado para a pasta raiz da aplicação.

```bash
sudo cp includes/img/custom/Logo-2-SentinelArk.ico favicon.ico
```

### 4.3. Ajuste de Permissões (Passo Crucial)

Para que o servidor web consiga ler os novos arquivos e evitar erros, é essencial ajustar as permissões.

```bash
# Define o usuário 'www-data' como dono de todos os arquivos
sudo chown -R www-data:www-data /caminho/para/sua/instalacao/teampass

# Ajusta as permissões de pastas para 755
sudo find /caminho/para/sua/instalacao/teampass -type d -exec chmod 755 {} \;

# Ajusta as permissões de arquivos para 644
sudo find /caminho/para/sua/instalacao/teampass -type f -exec chmod 644 {} \;
```

### 4.4. Verificação Pós-instalação

Após a cópia e o ajuste das permissões, limpe o cache do seu navegador (`Ctrl+Shift+R` ou `Cmd+Shift+R`) e verifique:

1. A tela de login exibe o novo logotipo e estilo.
2. O ícone (favicon) na aba do navegador foi atualizado.
3. Após o login, a interface principal exibe o logotipo e as cores corretas.

## 5. Manifesto de Arquivos

**index.php**
- **Destino:** `/` (raiz do Teampass)
- **Descrição:** Layout principal, modificado para carregar o logo e o favicon customizado.

**login.php**
- **Destino:** `includes/core/`
- **Descrição:** Layout de login, modificado para carregar a nova identidade visual.

**teampass.css**
- **Destino:** `includes/css/`
- **Descrição:** Folha de estilos customizada com o esquema de cores da Sentinel Ark.

**Logo-SentinelArk.png**
- **Destino:** `includes/img/custom/`
- **Descrição:** Arquivo de imagem do logotipo principal.

**Logo-2-SentinelArk.png**
- **Destino:** `includes/img/custom/`
- **Descrição:** Versão alternativa ou secundária do logotipo.

**Logo-2-SentinelArk.ico**
- **Destino:** `includes/img/custom/`
- **Descrição:** Ícone (favicon) para ser exibido na aba do navegador.

## 6. Histórico de Versões

* **v1.0 (29/09/2025):** Lançamento inicial. Customização de logos, cores e layouts.

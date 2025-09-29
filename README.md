# Tema de Branding "Sentinel Ark" para Teampass

## Sumário
1. [Visão Geral](#1-visão-geral)
2. [Escopo da Customização](#2-escopo-da-customização)
3. [Pré-requisitos](#3-pré-requisitos)
4. [Procedimento de Instalação](#4-procedimento-de-instalação)
    - 4.1. [Backup dos Arquivos Originais](#41-backup-dos-arquivos-originais)
    - 4.2. [Implantação dos Arquivos Customizados](#42-implantação-dos-arquivos-customizados)
    - 4.3. [Verificação Pós-instalação](#43-verificação-pós-instalação)
5. [Manifesto de Arquivos](#5-manifesto-de-arquivos)
6. [Suporte e Contribuição](#6-suporte-e-contribuição)
7. [Histórico de Versões](#7-histórico-de-versões)

---

### 1. Visão Geral

Este repositório contém um conjunto de arquivos de tema e branding desenvolvidos para aplicar a identidade visual da **Sentinel Ark** a uma instância padrão do gerenciador de senhas Teampass. O objetivo é prover uma solução de "white-labeling" que garanta uma experiência de usuário coesa e alinhada às diretrizes de marca da organização.

### 2. Escopo da Customização

As modificações contidas neste pacote de tema afetam exclusivamente a camada de apresentação (frontend) da aplicação. A lógica de negócios, segurança e funcionalidades do Teampass permanecem inalteradas.

As áreas customizadas incluem:
* **Interface de Login e Principal:** Alteração do logotipo e ajustes de estilo, carregando ativos de um diretório customizado para não interferir com os arquivos originais do Teampass.
* **Elementos de Branding:** Substituição do favicon do navegador.
* **Esquema de Cores e Estilos:** Modificações na folha de estilos `teampass.css` para refletir a paleta de cores da Sentinel Ark.

### 3. Pré-requisitos

Para a correta aplicação deste tema, os seguintes requisitos devem ser atendidos:
* Uma instância funcional do Teampass (testado na versão 3.1.4.31) instalada em um servidor.
* Acesso ao sistema de arquivos do servidor com permissões para ler, escrever e criar diretórios na pasta da aplicação Teampass.

### 4. Procedimento de Instalação

A aplicação do tema deve ser realizada com cautela, seguindo rigorosamente os passos abaixo.

#### 4.1. Backup dos Arquivos Originais

Antes de qualquer modificação, é mandatório realizar o backup dos arquivos que serão substituídos.

Execute os seguintes comandos no diretório raiz da sua instalação Teampass:

```bash
# Exemplo de caminho: /var/www/html/teampass
cd /caminho/para/sua/instalacao/teampass

# Backup dos arquivos de layout e estilo
cp index.php index.php.backup
cp login.php login.php.backup
cp includes/css/teampass.css includes/css/teampass.css.backup
```

#### 4.2. Implantação dos Arquivos Customizados

Com os backups em segurança, prossiga com a implantação dos novos arquivos.

**1. Crie o Diretório de Ativos Customizados (Passo Crucial)**
Este diretório irá armazenar os ativos visuais exclusivos da Sentinel Ark, mantendo-os separados dos arquivos originais do Teampass.
```bash
# Dentro da pasta raiz do Teampass
mkdir -p public/assets_custom
```

**2. Copie os Novos Ativos Visuais**
Copie os logotipos e o favicon deste repositório para o diretório recém-criado.
-   `Logo-SentinelArk.png` -> `/caminho/para/teampass/public/assets_custom/Logo-SentinelArk.png`
-   `Logo-2-SentinelArk.png` -> `/caminho/para/teampass/public/assets_custom/Logo-2-SentinelArk.png`
-   `Logo-2-SentinelArk.ico` -> `/caminho/para/teampass/public/assets_custom/Logo-2-SentinelArk.ico`

**3. Copie os Arquivos de Layout e Estilo**
Estes arquivos já estão modificados para buscar as imagens do novo diretório `public/assets_custom`.
-   `index.php` -> `/caminho/para/teampass/`
-   `login.php` -> `/caminho/para/teampass/`
-   `teampass.css` -> `/caminho/para/teampass/includes/css/`

#### 4.3. Verificação Pós-instalação

Após a cópia dos arquivos, limpe o cache do seu navegador (`Ctrl+Shift+R` ou `Cmd+Shift+R`) e verifique os seguintes pontos:
1.  A tela de login exibe o novo logotipo da Sentinel Ark.
2.  O ícone (favicon) na aba do navegador foi atualizado.
3.  Após o login, a interface principal exibe o logotipo correto.
4.  O esquema de cores geral da aplicação foi atualizado.

### 5. Manifesto de Arquivos

**index.php**
- **Destino:** `/` (raiz do Teampass)
- **Descrição:** Layout principal, modificado para carregar o logo de `public/assets_custom`.

**login.php**
- **Destino:** `/` (raiz do Teampass)
- **Descrição:** Layout de login, modificado para carregar o logo de `public/assets_custom`.

**teampass.css**
- **Destino:** `includes/css/`
- **Descrição:** Folha de estilos customizada com o esquema de cores da Sentinel Ark.

**Logo-SentinelArk.png**
- **Destino:** `public/assets_custom/`
- **Descrição:** Arquivo de imagem do logotipo principal, em formato PNG.

**Logo-2-SentinelArk.png**
- **Destino:** `public/assets_custom/`
- **Descrição:** Versão alternativa ou secundária do logotipo.

**Logo-2-SentinelArk.ico**
- **Destino:** `public/assets_custom/`
- **Descrição:** Ícone (favicon) para ser exibido na aba do navegador.

### 6. Suporte e Contribuição

Para reportar problemas ou sugerir melhorias, por favor, abra uma "Issue" neste repositório.

### 7. Histórico de Versões

* **v1.0 (29/09/2025):** Lançamento inicial. Customização de logos, cores e layouts.

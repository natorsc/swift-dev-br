---
title: Como hospedar um site criado com Saga no GitHub Pages
summary: Aprenda a publicar um site criado com Saga e Swift no GitHub Pages.
tags: Swift, Saga, GitHub
date: 2026-04-28
---

O [Saga](https://github.com/loopwerk/Saga) é um gerador de sites estáticos (SSG) criado em Swift.

Ele permite construir blogs, documentações e sites extremamente rápidos usando apenas Swift.

Neste tutorial você aprenderá:

- Como instalar o Saga.
- Como criar um projeto.
- Como publicar no GitHub Pages.
- Como configurar deploy automático com GitHub Actions.
- Como configurar domínio personalizado.
- Como configurar DNS corretamente.
- Como ativar HTTPS.
- Como evitar problemas e ataques de domínio no GitHub Pages.

## Configurando DNS do GitHub Pages

Antes mesmo de configurar o deploy, vale a pena já deixar o domínio preparado corretamente.

No provedor de DNS do seu domínio, configure os seguintes registros.

### A (domínio raiz)

Configure os registros A apontando para os IPs do GitHub Pages:

```text
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

### AAAA (IPv6)

Também é recomendado configurar IPv6:

```text
2606:50c0:8000::153
2606:50c0:8001::153
2606:50c0:8002::153
2606:50c0:8003::153
```

### CNAME (subdomínio www)

Configure o subdomínio `www`:

```text
www -> seu-usuario.github.io
```

### TXT (verificação de domínio)

Para aumentar a segurança e evitar problemas de takeover/hijacking de domínio, o GitHub recomenda adicionar o registro TXT de verificação.

No GitHub:

```text
Settings -> Pages -> Add a domain
```

Após adicionar o domínio, o GitHub exibirá um registro TXT semelhante a este:

```text
_hosted-pages-challenge-seuusuario
```

Valor:

```text
xxxxxxxxxxxxxxxxxxxx
```

Esse registro comprova que você é proprietário do domínio.

Mais informações na documentação oficial do GitHub Pages. ([docs.github.com](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages?utm_source=chatgpt.com))


## 1. Instalando o Saga

Você pode instalar o Saga via Homebrew ou Mint.

### 🍺 Homebrew

```bash
brew install loopwerk/tap/saga
```


### 🌱 Mint

```bash
mint install loopwerk/saga-cli
```

## 2. Criando o projeto

```bash
saga init nome-do-site
cd nome-do-site
saga dev
```

Isso inicia um servidor local para desenvolvimento.

### Estrutura do projeto

Um projeto Saga típico se parece com isso:

```bash
Package.swift
Sources/
content/
deploy/
```

- `Sources/` -> lógica do site em Swift.
- `content/` -> conteúdos do site.
- `deploy/` -> HTML final gerado pelo Saga.

## 3. Criando o repositório no GitHub

Crie um repositório no GitHub:

```bash
nome-do-site
```

Depois faça o push inicial:

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/seu-usuario/nome-do-site.git
git push -u origin main
```

## 4. Configurando o GitHub Pages

No repositório:

- Vá em **Settings**.
- Clique em **Pages**.
- Em **Source**, selecione:

```bash
GitHub Actions
```

## 5. Criando o deploy automático (CI/CD)

Crie o arquivo:

```bash
.github/workflows/deploy.yml
```

### Pipeline completo

```yaml

```

## 6. Desativando o Jekyll

Crie o arquivo:

```bash
deploy/.nojekyll
```

Isso garante que o GitHub Pages sirva os arquivos exatamente como foram gerados pelo Saga.

Sem isso, alguns diretórios e arquivos podem ser ignorados pelo processamento do Jekyll.

## 7. Configurando domínio personalizado

No GitHub:

```text
Settings -> Pages -> Custom domain
```

Digite seu domínio:

```text
seudominio.com.br
```

## 8. Ativando HTTPS

Depois que o DNS propagar corretamente:

```text
Settings -> Pages -> Enforce HTTPS
```

Ative a opção para forçar HTTPS no site inteiro.

## Segurança e boas práticas

Algumas boas práticas importantes:

- Sempre utilize HTTPS.
- Configure o TXT de verificação do GitHub.
- Nunca remova o domínio do GitHub sem remover o DNS antes.
- Utilize GitHub Actions ao invés do branch `gh-pages`.
- Evite apontar múltiplos serviços para o mesmo domínio.

## Fluxo final

```text
git push -> GitHub Actions -> Swift build ->Saga gera /deploy ->Deploy automático -> https://seudominio.com.br
```

Tudo isso utilizando o ecossistema do GitHub Pages, GitHub Actions e Swift.

## Conclusão

O Saga é uma excelente opção para quem deseja criar sites rápidos e modernos usando Swift.

Com GitHub Pages e GitHub Actions, você consegue montar um fluxo completo de hospedagem, deploy automático, HTTPS e domínio personalizado.

Além disso, configurando corretamente DNS e verificação TXT, seu projeto fica mais seguro e profissional.

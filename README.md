# 💸 Aplicação Desconto INSS

Aplicação desenvolvida com Ruby on Rails, com o objetivo de calcular descontos de INSS com base em faixas salariais. Permite o cadastro de proponentes e a visualização estatísticos.

## 🚀 Tecnologias Utilizadas

- **Ruby on Rails 7**+
- **PostgreSQL**
- **Bootstrap 5**
- **Chart.js**
- **Sidekiq + Redis**
- **Kaminari**
- **Rubocop**
- **RSpec**
- **Docker**

## 📦 Instalação e Execução

### ✅ Pré-requisitos

- Ruby 2.7+ ou 3.0+
- PostgreSQL
- Redis
- Node.js e Yarn (para assets)
- Docker (opcional)

### 📥 Clonando o Projeto

```bash
git clone git@github.com:seu-usuario/desconto-inss.git
cd desconto-inss
```

### ▶️ Rodando com Docker

```bash
docker-compose up --build
```

Acesse em: [http://localhost:3000](http://localhost:3000)

### ▶️ Rodando localmente (sem Docker)

```bash
bundle install
yarn install
rails db:create db:migrate db:seed
redis-server
bundle exec sidekiq
rails server
```

## 👥 Usuário Padrão

Após rodar os seeds, um usuário padrão é criado:

- **Email:** `teste@teste.com`  
- **Senha:** `123456`

## ⚙️ Funcionalidades

- ✅ Cadastro completo de proponentes (nome, CPF, endereço, telefone, salário etc.)
- 💰 Cálculo progressivo do INSS via AJAX ao preencher o salário
- 📊 Relatórios visuais e gráficos com Chart.js, agrupando funcionários por faixas salariais
- 🔁 Atualização assíncrona de salário via Sidekiq e Redis
- 📃 Paginação de resultados com Kaminari (5 registros por página)
- 🧪 Estrutura para testes automatizados com RSpec
- 🧹 Padronização de estilo com Rubocop Rails

## 📑 Licença

Este projeto está licenciado sob a [Creative Commons Legal Code](https://creativecommons.org/licenses/by/4.0/).

## 👤 Autor

**Igor Cardoso**  
📧 <iygorsilva@gmail.com>  
🔗 [linkedin.com/in/igorxcardoso/](https://www.linkedin.com/in/igorxcardoso/)

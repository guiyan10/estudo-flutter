# 🛒 E-commerce Mobile App

Aplicação mobile de e-commerce desenvolvida com **Flutter** (frontend) e **Laravel** (backend).

## 📁 Estrutura do Projeto

```
estudo-flutter/
├── front/          # Aplicação Flutter (Mobile)
├── back/           # API Laravel (Backend)
└── README.md       # Documentação principal
```

## 🚀 Tecnologias Utilizadas

### Frontend (Flutter)
- **Flutter** - Framework para desenvolvimento mobile
- **Dart** - Linguagem de programação
- **Provider/Bloc** - Gerenciamento de estado
- **HTTP** - Comunicação com API
- **Shared Preferences** - Armazenamento local
- **Image Picker** - Upload de imagens

### Backend (Laravel)
- **Laravel** - Framework PHP
- **MySQL** - Banco de dados
- **Laravel Sanctum** - Autenticação API
- **Eloquent ORM** - Mapeamento objeto-relacional
- **Laravel Storage** - Gerenciamento de arquivos

## 📱 Funcionalidades do App Mobile

- ✅ Autenticação de usuários (login/cadastro)
- ✅ Listagem de produtos em destaque
- ✅ Navegação por categorias
- ✅ Detalhes do produto
- ✅ Carrinho de compras
- ✅ Checkout e finalização de pedido
- ✅ Histórico de pedidos
- ✅ Design responsivo e moderno

## ⚙️ Funcionalidades da API

- ✅ Autenticação JWT/Sanctum
- ✅ CRUD de usuários, produtos, categorias
- ✅ Gerenciamento de pedidos e carrinho
- ✅ Upload de imagens
- ✅ Validações e respostas padronizadas
- ✅ Relacionamentos entre entidades

## 🗄️ Banco de Dados

### Tabelas Principais
- `users` - Usuários do sistema
- `products` - Produtos disponíveis
- `categories` - Categorias de produtos
- `orders` - Pedidos realizados
- `order_items` - Itens dos pedidos
- `cart_items` - Itens no carrinho

## 🛠️ Como Executar

### Backend (Laravel)
```bash
cd back
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan serve
```

### Frontend (Flutter)
```bash
cd front
flutter pub get
flutter run
```

## 📋 Pré-requisitos

- PHP 8.1+
- Composer
- MySQL 8.0+
- Flutter SDK
- Android Studio / VS Code

## 🔧 Configuração

1. Clone o repositório
2. Configure o banco de dados no arquivo `.env` do Laravel
3. Execute as migrações
4. Configure a URL da API no app Flutter
5. Execute ambos os projetos

## 📞 Suporte

Para dúvidas ou problemas, abra uma issue no repositório. 
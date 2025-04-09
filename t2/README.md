# Sistema de Gerenciamento de Biblioteca

Este é um sistema simples de gerenciamento de biblioteca usando ActiveRecord.

Este projeto implementa um sistema de gerenciamento de biblioteca com as seguintes relações:
- Um-para-um: Usuario -> CarteiraBiblioteca
- Um-para-muitos: Autor -> Livros
- Muitos-para-muitos: Livros <-> Categorias

## Para usar o sistema:
1. Crie a pasta t2 e coloque todos os arquivos na estrutura correta
2. Execute bundle install para instalar as dependências
3. Execute ruby db/migrate.rb para criar o banco de dados
4. Execute ruby db/seed.rb para popular o banco com dados iniciais
5. Execute ruby main.rb para iniciar o programa

O sistema suporta os comandos solicitados:
- insere
- altera
- exclui
- lista
E implementa as relações necessárias com delete cascade (quando um registro é apagado, seus relacionamentos são apagados automaticamente).

## Configuração

1. Instale as dependências: 
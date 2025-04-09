require_relative '../config/database'
require_relative '../models/autor'
require_relative '../models/livro'
require_relative '../models/categoria'
require_relative '../models/usuario'
require_relative '../models/carteira_biblioteca'
require_relative '../models/emprestimo'

# Criando autores
autor1 = Autor.create(nome: 'J.K. Rowling', nacionalidade: 'Britânica')
autor2 = Autor.create(nome: 'George R.R. Martin', nacionalidade: 'Americana')

# Criando categorias
fantasia = Categoria.create(nome: 'Fantasia')
aventura = Categoria.create(nome: 'Aventura')
ficcao = Categoria.create(nome: 'Ficção')

# Criando livros
livro1 = Livro.create(titulo: 'Harry Potter e a Pedra Filosofal', ano: 1997, autor: autor1)
livro2 = Livro.create(titulo: 'Game of Thrones', ano: 1996, autor: autor2)

# Associando categorias aos livros
livro1.categorias << [fantasia, aventura]
livro2.categorias << [fantasia, ficcao]

# Criando usuários
usuario1 = Usuario.create(nome: 'João Silva', email: 'joao@email.com')
usuario2 = Usuario.create(nome: 'Maria Santos', email: 'maria@email.com')

# Criando carteiras
CarteiraBiblioteca.create(
  numero: 'BIB001',
  validade: Date.today + 365,
  usuario: usuario1
)

CarteiraBiblioteca.create(
  numero: 'BIB002',
  validade: Date.today + 365,
  usuario: usuario2
)

# Criando empréstimos
Emprestimo.create(
  usuario: usuario1,
  livro: livro1,
  data_emprestimo: Date.today,
  data_devolucao: Date.today + 15
)

Emprestimo.create(
  usuario: usuario2,
  livro: livro2,
  data_emprestimo: Date.today,
  data_devolucao: Date.today + 15
) 
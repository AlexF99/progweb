require 'active_record'
require_relative '../config/database'

# Configuração da conexão
ActiveRecord::Base.establish_connection(
  YAML.load_file('config/database.yml')['development']
)

# Migrations
class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :autores do |t|
      t.string :nome
      t.string :nacionalidade
      t.timestamps
    end

    create_table :livros do |t|
      t.string :titulo
      t.integer :ano
      t.belongs_to :autor
      t.timestamps
    end

    create_table :categorias do |t|
      t.string :nome
      t.timestamps
    end

    create_table :categorias_livros do |t|
      t.belongs_to :categoria
      t.belongs_to :livro
    end

    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.timestamps
    end

    create_table :carteira_bibliotecas do |t|
      t.string :numero
      t.date :validade
      t.belongs_to :usuario
      t.timestamps
    end

    create_table :emprestimos do |t|
      t.belongs_to :usuario
      t.belongs_to :livro
      t.date :data_emprestimo
      t.date :data_devolucao
      t.timestamps
    end
  end
end

CreateTables.new.change 
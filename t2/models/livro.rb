class Livro < ActiveRecord::Base
  belongs_to :autor
  has_and_belongs_to_many :categorias
  has_many :emprestimos
  has_many :usuarios, through: :emprestimos
end 
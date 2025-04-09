class Usuario < ActiveRecord::Base
  has_one :carteira_biblioteca, dependent: :destroy
  has_many :emprestimos
  has_many :livros, through: :emprestimos
end 
class Emprestimo < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :livro
end 
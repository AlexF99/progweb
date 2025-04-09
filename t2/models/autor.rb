class Autor < ActiveRecord::Base
  has_many :livros, dependent: :destroy
end 
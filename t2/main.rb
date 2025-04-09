require 'active_record'
require_relative 'config/database'
require_relative 'models/autor'
require_relative 'models/livro'
require_relative 'models/categoria'
require_relative 'models/usuario'
require_relative 'models/carteira_biblioteca'
require_relative 'models/emprestimo'

# Configuração da conexão
ActiveRecord::Base.establish_connection(
  YAML.load_file('config/database.yml')['development']
)

def parse_attributes(args)
  attributes = {}
  args.each do |arg|
    if arg.include?('=')
      key, value = arg.split('=')
      value = value.gsub('"', '')
      attributes[key] = value
    end
  end
  attributes
end

def get_model_class(table_name)
  case table_name.downcase
  when 'autores' then Autor
  when 'livros' then Livro
  when 'categorias' then Categoria
  when 'usuarios' then Usuario
  when 'carteira_bibliotecas' then CarteiraBiblioteca
  when 'emprestimos' then Emprestimo
  else
    puts "Tabela não encontrada: #{table_name}"
    nil
  end
end

def handle_command(command, table_name, *args)
  model_class = get_model_class(table_name)
  return unless model_class

  attributes = parse_attributes(args)

  case command
  when 'insere'
    record = model_class.create(attributes)
    puts "Registro criado com sucesso: #{record.inspect}"
  
  when 'altera'
    if attributes['id']
      record = model_class.find_by(id: attributes['id'])
      if record
        record.update(attributes)
        puts "Registro atualizado com sucesso: #{record.inspect}"
      else
        puts "Registro não encontrado com ID: #{attributes['id']}"
      end
    else
      puts "É necessário especificar um ID para alteração"
    end
  
  when 'exclui'
    if attributes['id']
      record = model_class.find_by(id: attributes['id'])
      if record
        record.destroy
        puts "Registro excluído com sucesso"
      else
        puts "Registro não encontrado com ID: #{attributes['id']}"
      end
    else
      puts "É necessário especificar um ID para exclusão"
    end
  
  when 'lista'
    records = model_class.all
    records.each do |record|
      puts record.inspect
    end
  
  else
    puts "Comando não reconhecido: #{command}"
  end
end

# Loop principal
loop do
  print "> "
  input = gets.chomp
  break if input.downcase == 'sair'

  command, table_name, *args = input.split(' ')
  handle_command(command, table_name, *args)
end 
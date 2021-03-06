require './input'
require './options'
require './main_menu'

# App class
class App
  attr_accessor :input, :options

  def initialize
    @input = Input.new
    @options = Options.new
  end

  def run
    puts 'Welcome to School Library App!'
    options.obtain_data
    loop do
      main_menu
      menu_option = input.user_input.to_i
      running = options.category_menu(menu_option)

      break unless running
    end
    options.save_data
  end
end

def main
  app = App.new
  app.run
end

main

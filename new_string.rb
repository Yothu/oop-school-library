require './user_input'

def new_string
  word = ''
  loop do
    print yield
    word = user_input
    break if word.match(/^[[:alpha:][:blank:]]+$/)
  end
  word
end

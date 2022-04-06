require './user_input'

def new_y_n_response
  response = ''
  loop do
    print yield
    response = user_input
    break if response.upcase == 'Y' || response.upcase == 'N'
  end
  return true if response.upcase == 'Y'
  return false if response.upcase == 'N'
end

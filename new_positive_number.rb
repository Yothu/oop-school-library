require './user_input'

def new_positive_number
  num = 0
  loop do
    print yield
    num = user_input.to_i
    break if num.instance_of?(Integer) && num.positive?
  end
  num
end

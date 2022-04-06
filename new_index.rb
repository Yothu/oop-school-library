require './user_input'

def new_index(array)
  num = 0
  loop do
    num = user_input.to_i
    break if num.instance_of?(Integer) && num >= 0 && num < array.length
  end
  num
end

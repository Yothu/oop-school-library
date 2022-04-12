class Input
  def user_input
    gets.chomp
  end

  def index(array)
    num = 0
    loop do
      num = user_input.to_i
      break if num.instance_of?(Integer) && num >= 0 && num < array.length
    end
    num
  end

  def natural_int
    num = 0
    loop do
      print yield
      num = user_input.to_i
      break if num.instance_of?(Integer) && num.positive?
    end
    num
  end

  def text
    print yield
    user_input
  end

  def y_n
    response = ''
    loop do
      print yield
      response = user_input
      break if response.upcase == 'Y' || response.upcase == 'N'
    end
    return true if response.upcase == 'Y'
    return false if response.upcase == 'N'
  end
end

class Solver
  def factorial(num)
    raise StandardError if num.negative?
    return 1 if num.zero?

    i = num - 1
    while i.positive?
      num *= i
      i -= 1
    end
    num
  end

  def reverse(str)
    str.reverse
  end

  def fizzbuzz
    
  end
end

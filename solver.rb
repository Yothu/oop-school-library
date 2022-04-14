class Solver
  def factorial(num)
    return 1 if num.zero?

    i = num - 1
    while i.positive?
      num *= i
      i -= 1
    end
    num
  end
end

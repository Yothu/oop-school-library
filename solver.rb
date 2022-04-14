class Solver
  def factorial(num)
    i = num - 1
    while i.positive?
      num *= i
      i -= 1
    end
    num
  end
end

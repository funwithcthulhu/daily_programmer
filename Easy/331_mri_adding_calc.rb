# mri solution with string interpolation and type conversion to get negative values...
class AddingCalculator
  def initialize
    input_loop
  end

  def input_loop
    loop do
      print '> '
      @input = gets.chomp
      check_input
    end
  end

  def check_input
    @arr = @input.split(' ')
    @a = @arr[0].to_i
    @b = @arr[2].to_i
    @operator = @arr[1]
    evaluate
  end

  def evaluate
    case @operator
    when '*' then puts multiply(@a, @b)
    when '/' then puts divide(@a, @b)
    when '+' then puts @a + @b
    when '-' then puts subtract(@a, @b)
    when '^' then puts exponent(@a, @b)
    end
  end

  def multiply(a, b)
    if a < 0 && b > 0
      c = 0
      b.times { c += a }
      return c
    elsif b < 0 && a > 0
      c = 0
      a.times { c += b }
      return c
    else
      c = 0
      a.abs.times { c += b.abs}
      return c
    end
  end

  def exponent(a, b)
    return 'Non-integral answer' if b < 0
    return 0 if a.zero? unless b.zero?
    neg = false
    if a < 0
      neg = true
      a = a.abs
    end
    count = 0
    c = 1
    until count == b
      c = multiply(a, c)
      count += 1
    end
    neg ? "-#{c}".to_i : c
  end

  def subtract(a, b)
    negative = false
    return "-#{b}".to_i if b > 0 && a.zero?
    return b.abs if b < 0 && a.zero?
    return "-#{a.abs + b}".to_i if a < 0 && b > 0
    return a + b.abs if a > 0 && b < 0
    if a < 0 && b < 0
      a = a.abs
      b = b.abs
      negative = true
    end
    count = 0
    until b == a
      b += 1
      count += 1
    end
    negative ? count = "-#{count}".to_i : count
  end

  def divide(a, b)
    temp_a = a
    negative = false
    return 'Not-defined' if b.zero?
    if temp_a < 0 && b < 0
      temp_a = temp_a.abs
      b = b.abs
    elsif temp_a < 0 && b > 0
      negative = true
      temp_a = temp_a.abs
    elsif b < 0 && temp_a > 0
      negative = true
      b = b.abs
    end
    count = 0
    c = 0
    until c >= temp_a
      c += b
      count += 1
    end
    count = "-#{count}".to_i if negative
    c == temp_a ? count : 'Non-integral answer'
  end
end
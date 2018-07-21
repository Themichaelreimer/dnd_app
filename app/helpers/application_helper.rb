module ApplicationHelper

  # TODO: Make eval_expr helper methods private.
  # Keep roll, valid_expr, and eval_expr public

  def valid_expr?(str)
    # TODO: Check that brackets match up
    !(/[0-9\+\-d*x\(\)]/=~str).nil?
  end

  def is_number?(char)
    !(/\d/=~char).nil?
  end

  def is_operator?(char)
    !(/[\+\-d*x]/=~char).nil?
  end

  def roll(dice, sides)
    result = 0
    for i in 1..dice
      result += 1 + rand(sides)
    end
    result
  end

  # Returns value of parsed expression if it's valid. nil otherwise
  def try_eval(expr)
      eval_expr(expr)
  end

  def eval_expr(expr)

    precedence = {
      "(" => 0,
      ")" => 0,
      "+" => 1,
      "-" => 1,
      "*" => 2,
      "/" => 2,
      "d" => 3,
      "^" => 3,
    }

    #Assume left associativity, because our parser doesn't use exponentiation
    if valid_expr?(expr)

      stk = []
      queue = []

      num_buffr = ''
      a = -1
      b = -1

      #shunting algorithm to get postfix
      expr.split("").each do |c|

        if !is_number?(c) && is_number?(queue.last)
          queue.push(',')
        end

        if is_number?(c)
          queue.push(c)
        elsif is_operator?(c)

          while !stk.empty? && (precedence[c] <= precedence[stk.last]) && (precedence[stk.last] != '(')
            queue.push(stk.pop)
          end
          stk.push(c)
        elsif c == '('
          stk.push(c)
        elsif c == ')'
          while stk.last != '('
            queue.push(stk.pop)
          end
          stk.pop
        end

      end

      # Clear number char buffer
      if is_number?(queue.last)
        queue.push(",")
      end

      # Clear op stack
      while !stk.empty?
        queue.push(stk.pop)
      end

      # End of yard shunting algorithm.
      # Linear pass to evaluate rpn form
      # Note stack is necessarily empty now

      queue.each do |c|

        if is_number?(c)
          num_buffr.concat(c)
        elsif c == ','
          print("Parsing "+num_buffr.to_i.to_s+"\n")
          stk.push(num_buffr.to_i)
          num_buffr = ''
          print("pushing "+stk.last.to_s+"\n")
        elsif is_operator?(c)
          a = stk.pop
          b = stk.pop
          print("Popping "+a.to_s+", and "+b.to_s+"\n")
          case c
          when '+'
            stk.push(b+a)
          when '-'
            stk.push(b-a)
          when '*'
            stk.push(b*a)
          when 'x'
            stk.push(b*a)
          when '/'
            stk.push(b/a)
          when 'd'
            stk.push(roll(b,a))
          end

        end


      end

    end
    stk.pop
  end

end

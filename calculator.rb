require 'byebug'

class Calculator
  EXPONENTS = '**'.freeze
  DIVISION = '/'.freeze
  MULTIPLICATION = '*'.freeze
  ADDITION = '+'.freeze
  SUBTRACTION = '-'.freeze

  def initialize(sum)
    @sum = sum
    @sum_as_tokens = @sum.split(' ')
  end

  def calculate
    presedence_order.each do |operator|
      @sum_as_tokens.detect.with_index do |token, index|
        if operator == token
          operator = token
          first_operand = @sum_as_tokens[index - 1]
          second_operand = @sum_as_tokens[index + 1]
          sub_total = first_operand.to_i.send(operator, second_operand.to_i)
          @sum_as_tokens[(index-1)...(index+2)] = sub_total
        end
      end
    end
    @sum_as_tokens.first.to_i
  end

  private

  def presedence_order
    [
      EXPONENTS,
      DIVISION,
      MULTIPLICATION,
      ADDITION,
      SUBTRACTION
    ]
  end
end

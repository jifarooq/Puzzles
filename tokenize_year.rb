# after each digit, put +, * or nothing until number == 2002
num = 123456789

def print_sol(num, target, ops = [])
	len = Integer( Math.log(num, 10) )

	if ops.size == len
		expr, result = compute_tokens(num, ops)
		print expr + "\n" if result == target
		return
	end

	poss_ops = %w(+ - * /) + ['']
	poss_ops.each do |op|
		print_sol(num, target, ops + [op])
	end
end

def compute_tokens(num, opers)
	ops = opers.dup
	digits = num.to_s.chars
	expr = digits.shift

	until ops.empty?
		expr += ops.shift
		expr += digits.shift
	end

	[expr, eval(expr)]
end

puts print_sol(num, 2015)

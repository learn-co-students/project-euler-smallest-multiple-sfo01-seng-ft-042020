def smallest_multiple(input)
    needed_factors = {}
    for i in 2..input
        needed = find_factors(i)
        needed.uniq.each do |f|
            count = needed.count(f)
            if !needed_factors[f] || needed_factors[f] < count
                needed_factors[f] = count
            end
        end
    end
    product = 1
    needed_factors.each_pair do |k, v|
        product = product * k ** v
    end
    product
end

def find_factors(num)
    drain = num
    factors = []
    loop do
        factor = find_factor(drain)
        if factor
            drain = drain / factor
            factors << factor
        end
        break if drain == 1
    end
    factors
end

def find_factor(num)
    for i in 2..num
        if num % i == 0
            return i
        end
    end
end
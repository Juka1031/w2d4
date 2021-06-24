def no_dupes?(arr)
    no_dup = arr.select do |ele|
        if arr.count(ele) == 1
            ele
        end
    end
    no_dup
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele,idx|
        if arr[idx+1] == ele
            return false
        end
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    h = Hash.new([])
    str.each_char.with_index do |char,idx|
        h[char] += [idx]
    end
    h
end


# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    substring = []
    str.each_char.with_index do |char1,idx1|
        str.each_char.with_index do |char2,idx2|
            if idx2 >= idx1
                substring << str[idx1..idx2]
            end
        end
    end
    substring.select! {|array| array if array.split("").uniq.size == 1}
    largest = ""
    substring.uniq.each do |ele|
        if ele.length>= largest.length
            largest = ele
        end
    end
    largest
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
def bi_prime?(num)
    factor_pair = []
    (1..num).each do |factor|
        if num % factor == 0
            factor_pair << [factor,num/factor]
        end
    end
    factor_pair.each do |pair|
        if is_prime?(pair[0]) && is_prime?(pair[1])
            return true
        end
    end
    false
end

def is_prime?(num)
    if num == 2
        return true
    end
    if num < 2
        return false
    end
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, key)
    key_index = 0 
    alpha = ("a".."z").to_a
    new_str = ""

    message.each_char.with_index do|char,idx|
        new_str += alpha[(alpha.index(char) + key[key_index % key.length])%26]
        key_index += 1
    end
    new_str
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "AEIOUaeiou"
    vowel_arr = []
    str.each_char do |char|
        if vowels.include?(char)
            vowel_arr << char
        end
    end
    vowel_arr.rotate!(-1)
    idx2 = 0
    str.each_char.with_index do |char,idx|
        if vowels.include?(char)
            str[idx] = vowel_arr[idx2]
            idx2 += 1
        end
    end
    str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&block)
        if block == nil
            return ""
        end
        new_s = ""
        self.each_char.with_index do |char,idx|
            if block.call(char) == true
            new_s += char
            end
        end
        new_s
    end

    def map!(&block)
        self.each_char.with_index do |char,idx|
            self[idx] = block.call(char,idx)
            
            
        end
        self
    end
end

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a,b)
    if a == 0 || b == 0
        return 0
    end
    if a == 1
        return b
    end
    if a > 0
        b + multiply(a-1,b)
    elsif a < 0 && b < 0
        multiply(-a,-b)
    else
        multiply(-a,-b)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    if n == 0
        return []
    end
    if n == 1 
        return [2]
    end
    if n == 2
        return [2,1]
    end
    lucas_sequence(n-1) << lucas_sequence(n-1)[-1] + lucas_sequence(n-1)[-2]
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    if is_prime?(num)
        return [num]
    end
    factors = []
    (2..num).each do |factor|
        if num % factor == 0
            factors << factor
            factors << prime_factorization(num/factor)
            
            break
        end
    end
    factors.flatten

end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
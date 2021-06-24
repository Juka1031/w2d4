# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
# def least_common_multiple(num_1, num_2) #no idea why im making this overly complicated
#     lcm = []
#     hash1 = Hash.new(0)
#     hash2 = Hash.new(0)
#     factors1 = prime_factorization(num_1)
#     factors2 = prime_factorization(num_2)
#     factors1.each {|ele| hash1[ele]+=1}
#     factors2.each {|ele| hash2[ele]+=1}
#     uniq = (factors1+factors2).uniq 
#     uniq.each do |ele|
#         if hash1[ele] >= hash2[ele]
#             hash1[ele].times do
#                 lcm << ele
#             end
#         else
#             hash2[ele].times do
#                 lcm << ele
#             end
#         end
#     end
#     lcm.inject {|acc,ele| acc * ele}

# end

# def prime_factorization(num)
#     factors = []
#     numx = num
#     while (factors.inject{|acc,ele| acc *ele} != num)
#         (2..numx).each do |factor|
#             if numx % factor == 0
#                 factors << factor
#                 numx = numx / factor
#                 break
#             end
#         end
#     end
#     factors
# end

def least_common_multiple(num_1, num_2)
    if num_1 >= num_2
        min = num_1
    else
        min = num_2
    end

    (min..Float::INFINITY).each do |factor|
        if factor % num_1 == 0 && factor % num_2 == 0
            return factor
        end
    end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    sub_str_arr = []
    bigram_count = Hash.new(0)
    str.each_char.with_index do |char,idx|
        if idx+1 != nil && str[idx..idx+1].length ==2
            sub_str_arr << str[idx..idx+1]
        end
    end
    sub_str_arr.each {|bigram| bigram_count[bigram]+=1}
    
    sorted = bigram_count.sort_by {|key,value| value}
    sorted [-1][0]


end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        keys = self.keys
        values = self.values
        new_hash = Hash.new()
        keys.each_with_index do |ele,idx|
            new_hash[values[idx]] = keys[idx]
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = []
        self.each_with_index do |numbers1,idx1|
            self.each_with_index do |numbers2,idx2|
                if idx2 > idx1
                    pairs << numbers1 + numbers2
                end
            end
        end
        pairs.count(num)
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = true
        if prc == nil #sort by increasing order probably numbers
            while sorted
                sorted = false
                self.each_with_index do |ele,idx|
                    if (self[idx+1] !=nil) && (self[idx] > self[idx+1])
                        self[idx] , self[idx+1] = self[idx+1] , self[idx]
                        sorted = true
                    end
                end
            end
        else
            while sorted
                sorted= false
                self.each_with_index do |ele,idx|
                    if (self[idx+1] !=nil) && prc.call(self[idx],self[idx+1]) == 1
                        self[idx] , self[idx+1] = self[idx+1] , self[idx]
                        sorted = true
                    end
                end
            end
        end
        self
    end
end

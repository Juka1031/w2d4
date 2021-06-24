# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "AEIOUaeiou"
    pairs = []
    words.each_with_index do |word1,idx1|
        words.each_with_index do |word2,idx2|
            if idx2 > idx1
                pairs << [word1, word2]
            end
        end
    end
    selected_pairs = []
    pairs.select! do |pair|
        if (pair[0].include?("a") || pair[1].include?("a")) && (pair[0].include?("e") || pair[1].include?("e")) && (pair[0].include?("i") || pair[1].include?("i")) && (pair[0].include?("o") || pair[1].include?("o")) && (pair[0].include?("u") || pair[1].include?("u"))  
            selected_pairs << pair[0] +" "+ pair[1]
        end
    end
    selected_pairs

end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    factor = num -1
    while factor  != 1
        return true if num % factor == 0
        factor-= 1
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    word_arr = str.split(" ")
    found = bigrams.select.each do |bigram|
        contain = false
        word_arr.each do |word|
            if word.include?(bigram)
                contain = true
            end
        end
        if contain == true
            bigram
        end
    end
    found
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = Hash.new
        if prc != nil #there exist a proc
            self.each do |k,v|
                if prc.call(k,v)
                    new_hash[k] = v
                end
            end
        else #there is no proc
            self.each do |k,v|
                if k == v
                    new_hash[k] = v
                end
            end
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substring = []
        
        if length == nil
            self.each_char.with_index do |char1,idx1|
                self.each_char.with_index do |char2,idx2|
                    if idx1 <= idx2
                        substring << self[idx1..idx2]
                    end
                end
            end
        else
            self.each_char.with_index do |char1,idx1|
                self.each_char.with_index do |char2,idx2|
                    if idx1 <= idx2 && self[idx1..idx2].length == length
                        substring << self[idx1..idx2]
                    end
                end
            end
        end
        substring       
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        str_arr = self.split("")
        str_arr.each_with_index do |char,idx|
            str_arr[idx] = alpha[(alpha.index(char)+num)%26]
        end
        str_arr.join
    end
end

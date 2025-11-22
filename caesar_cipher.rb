ALPHABET_LENGTH = 26
LOWERCASE_START = 97
LOWERCASE_END = 122
UPPERCASE_START = 65
UPPERCASE_END = 90

def caesar_cipher(string, shift)
  return nil if shift < 0
  return string if shift % ALPHABET_LENGTH == 0

  string_array = string.split ""
  
  result_array = string_array.collect do |character|
    code = character.ord
    is_lowercase = code.between?(LOWERCASE_START, LOWERCASE_END)
    is_uppercase = code.between?(UPPERCASE_START, UPPERCASE_END)
    
    if is_lowercase || is_uppercase
      r_start = is_lowercase ? LOWERCASE_START : UPPERCASE_START
      r_end = is_lowercase ? LOWERCASE_END : UPPERCASE_END
      r_shift = shift % ALPHABET_LENGTH
      tmp_code = code + r_shift
      result_code = tmp_code <= r_end ? tmp_code : (r_start + tmp_code - r_end - 1)
      result_code.chr
    else
      character
    end
  end

  result_array.join
end
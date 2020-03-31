#!/usr/bin/ruby -w

def form_roots(num = 3, form = :root)
  case form
  when :root
    num.times { |i| puts "#{i.next}: #{form_root}" }
  when :suffix
    num.times { |i| puts "#{i.next}: -#{form_suffix}" }
  else
    puts "Didn't recognize argument \"#{form}\"."
  end
end

def form_suffix(shape = rand(100), shape_two = rand(100))
  # Possible root shapes: 10,000
  # 36x   -C       (B89)                    | 36
  # 204x  -CC      (B21)                    | 240
  # 60x   -CC[+]   (B1)                     | 300
  # 588x  -CV      (240x V1, 348x E89)      | 888
  # 1972x -CVC     (E21)                    | 2860
  # 340x  -CVC[+]  (E1)                     | 3200
  # 1936x -V       (1120x AH1, 816x AH89)   | 5136
  # 4624x -VC      (AH21)                   | 9760
  # 240x  -VC[+]   (CL1)                    | 10000
  root = ''

  # first syllable
  root << random_phoneme(INITIAL_OR_FINAL_CONSONANT) if shape < 33
  root << random_phoneme(FIRST_VOWEL) if shape >= 4
  root << if shape_two.between?(21, 88)
            random_phoneme(INITIAL_OR_FINAL_CONSONANT)
          elsif shape_two < 21
            "#{random_phoneme(MEDIAL_CONSONANT).to_s}#{second_syllable.to_s}"
          else ""
          end

  root
end

def form_root(shape = nil, shape_two = nil)
  root_shape, root_shape_two, root = shape || rand(100), shape_two || rand(100), ''

  # first syllable
  root << random_phoneme(INITIAL_OR_FINAL_CONSONANT) if root_shape < 75
  root << random_phoneme(FIRST_VOWEL)
  root << random_phoneme(INITIAL_OR_FINAL_CONSONANT) if root_shape_two.between?(21, 88)
  root << random_phoneme(MEDIAL_CONSONANT) if root_shape_two < 21
  root << second_syllable if root_shape_two < 21
  root
end

def second_syllable
  syllable_shape, syllable = rand(100), ''

#  syllable << ":" if syllable_shape < 29
  syllable << random_phoneme(NONFIRST_VOWEL)
  syllable << random_phoneme(INITIAL_OR_FINAL_CONSONANT) if syllable_shape < 40 && syllable_shape >= 5
  syllable << random_phoneme(MEDIAL_CONSONANT) if syllable_shape < 5
  syllable << random_phoneme(NONFIRST_VOWEL) if syllable_shape < 5
  syllable
end

def random_phoneme possibilities
  case possibilities.size
  when 6 # Consonants
    chosen = rand 41
    case
    when chosen < 4 then possibilities[1].random
    when chosen < 9 then possibilities[2].random
    when chosen < 15 then possibilities[3].random
    when chosen < 22 then possibilities[4].random
    when chosen < 31 then possibilities[5].random
    else possibilities[6].random
    end
  when 5 # Vowels
    chosen = rand 39
    case
    when chosen < 5 then possibilities[1].random
    when chosen < 12 then possibilities[2].random
    when chosen < 20 then possibilities[3].random
    when chosen < 29 then possibilities[4].random
    else possibilities[5].random
    end
  end
end

INITIAL_OR_FINAL_CONSONANT = {
  6 => %w[t k s m n],
  5 => %w[p b d g f l z ḿ ń],
  4 => %w[j b́ d́ ǵ ĺ ź t́ ḱ t̀ k̀ m̀ ǹ],
  3 => %w[x j́ ʼ ṕ p̀ b̀ d̀ g̀ q],
  2 => %w[m̂ n̂ q̀],
  1 => %w[h b̂ d̂ ĝ q́]
}.freeze

FIRST_VOWEL = {
  5 => %w[i],
  4 => %w[u í],
  3 => %w[a ú],
  2 => %w[e á o é],
  1 => %w[à ó ò â ô h]
}.freeze

MEDIAL_CONSONANT = {
  6 => %w[t k s m n],
  5 => %w[p b d g f l z ḿ ń],
  4 => %w[j b́ d́ ǵ ĺ ź],
  3 => %w[t́ ḱ t̀ k̀ m̀ ǹ x j́ ʼ q],
  2 => %w[ṕ p̀ b̀ d̀ g̀ q̀],
  1 => %w[m̂ n̂ h q́]
  # none: BQ DQ GQ
}.freeze

NONFIRST_VOWEL = {
  5 => %w[i],
  4 => %w[u],
  3 => %w[í a],
  2 => %w[ú e o],
  1 => %w[á é à ò],
  # Out: O Ə Ɔ X
}.freeze

class Array
  def random
    self[rand length]
  end
end

form_roots ARGV[0].to_i, (ARGV[1] ? ARGV[1].to_sym : :root)

#!/usr/bin/env ruby
# encoding: UTF-8

def form_roots(num=3, form=:root)
  case form
  when :root
	  num.times do |num|
 	  	puts "%d: %s" % [num.next, form_root]
 		end
 	when :suffix
 		num.times do |num|
 			puts "%d: -%s" % [num.next, form_suffix]
 		end
 	else
 		puts "Didn't recognize argument \"#{form}\"."
 	end
end

def form_suffix(shape = nil, shape_two = nil)
  root_shape, root_shape_two, root = shape || rand(100), shape_two || rand(100), ""
  
  # first syllable
  root << second_medial_consonant if root_shape < 95
  root << second_vowel if !root_shape.between?(55,95)
  root << second_final_consonant if root_shape_two.between?(10, 25) && !root_shape.between?(55,95)
  root << second_medial_consonant if root_shape_two < 10 && !root_shape.between?(55,95)
  root << second_syllable if root_shape_two < 10 && !root_shape.between?(55,95)
  root
end

def form_root(shape = nil, shape_two = nil)
  root_shape, root_shape_two, root = shape || rand(100), shape_two || rand(100), ""
  
  # first syllable
  root << first_consonant if root_shape < 75
  root << first_vowel 
  root << second_final_consonant if root_shape_two.between?(21, 88)
  root << second_medial_consonant if root_shape_two < 21
  root << second_syllable if root_shape_two < 21
  root
end

def first_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ th kh tᴥ kᴥ mᴥ nᴥ},
    3 => %w{x ι ¿ ph pᴥ bᴥ dᴥ gᴥ q},
    2 => %w{μᴥ νᴥ ᴥ},
    1 => %w{h βᴥ δᴥ γᴥ ϙ}
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def first_vowel
  vowel = { 
    5 => %w{i},
    4 => %w{u ι},
    3 => %w{a υ},
    2 => %w{e α o η},
    1 => %w{à ω ò ὰ ὼ h},
  }

  chosen = rand 39
  case 
  when chosen < 5 then vowel[1].random
  when chosen < 12 then vowel[2].random
  when chosen < 20 then vowel[3].random
  when chosen < 29 then vowel[4].random
  else vowel[5].random
  end
end

def second_medial_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i ν δ γ λ ζ},
    3 => %w{th kh tᴥ kᴥ mᴥ nᴥ x ι ¿ q},
    2 => %w{ph pᴥ bᴥ dᴥ gᴥ ᴥ},
    1 => %w{μᴥ νᴥ h ϙ}
    # none: BQ DQ GQ 
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def second_final_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ th kh tᴥ kᴥ mᴥ nᴥ},
    3 => %w{x ι ¿ ph pᴥ bᴥ dᴥ gᴥ q},
    2 => %w{μᴥ νᴥ ᴥ},
    1 => %w{h βᴥ δᴥ γᴥ ϙ}
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def second_syllable
  syllable_shape, syllable = rand(100), ""
  
#  syllable << ":" if syllable_shape < 29
  syllable << second_vowel
  syllable << third_final_consonant if syllable_shape < 40 && syllable_shape >= 5
  syllable << third_medial_consonant if syllable_shape < 5
  syllable << third_vowel if syllable_shape < 5
  syllable
end

def second_vowel
  vowel = { 
    5 => %w{i},
    4 => %w{u},
    3 => %w{ι a},
    2 => %w{υ e o},
    1 => %w{α η à ò},
    # Out: O Ə Ɔ X
  }

  chosen = rand 39
  case 
  when chosen < 5 then vowel[1].random
  when chosen < 12 then vowel[2].random
  when chosen < 20 then vowel[3].random
  when chosen < 29 then vowel[4].random
  else vowel[5].random
  end
end

def third_medial_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ},
    3 => %w{th kh tᴥ kᴥ mᴥ nᴥ x ι ¿ q},
    2 => %w{ph pᴥ bᴥ dᴥ gᴥ ᴥ},
    1 => %w{μᴥ νᴥ h ϙ}
    # none: BQ DQ GQ 
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def third_final_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ th kh tᴥ kᴥ mᴥ nᴥ},
    3 => %w{x ι ¿ ph pᴥ bᴥ dᴥ gᴥ q},
    2 => %w{μᴥ νᴥ ᴥ},
    1 => %w{h βᴥ δᴥ γᴥ ϙ}
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def third_vowel
  vowel = { 
    5 => %w{i},
    4 => %w{u},
    3 => %w{ι a},
    2 => %w{υ e o},
    1 => %w{α η à ò},
    # Out: O Ə Ɔ X
  }

  chosen = rand 39
  case 
  when chosen < 5 then vowel[1].random
  when chosen < 12 then vowel[2].random
  when chosen < 20 then vowel[3].random
  when chosen < 29 then vowel[4].random
  else vowel[5].random
  end
end

class Array
  def random
    self[rand length]
  end
end

form_roots ARGV[0].to_i, (ARGV[1] ? ARGV[1].to_sym : :root)

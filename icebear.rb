#!/usr/bin/env ruby
# encoding: UTF-8

def form_roots(num=3)
  num.times do |num|
    puts "%d: %s" % [num.next, form_root]
  end
end

def form_root(shape = nil, shape_two = nil)
  root_shape, root_shape_two, root = shape || rand(100), shape_two || rand(100), ""
  
  # first syllable
  root << first_consonant if root_shape < 75
  root << first_vowel 
  root << second_final_consonant if root_shape_two.between?(42, 88)
  root << second_medial_consonant if root_shape_two < 42
  root << second_syllable if root_shape_two < 42
  root
end

def first_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z mm nn},
    4 => %w{y bb dd gg ll zz tt kk t‘ k‘ m‘ n‘},
    3 => %w{x yy ! pp p‘ b‘ d‘ g‘ q},
    2 => %w{mm‘ nn‘ ‘},
    1 => %w{h bb‘ dd‘ gg‘ q‘}
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
    4 => %w{u ii},
    3 => %w{a uu},
    2 => %w{e aa o ee},
    1 => %w{à oo ò àà òò h},
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
    5 => %w{p b d g f l z mm nn},
    4 => %w{y bb dd gg ll zz},
    3 => %w{tt kk t‘ k‘ m‘ n‘ x yy ! q},
    2 => %w{pp p‘ b‘ d‘ g‘ ‘},
    1 => %w{mm‘ nn‘ h q‘}
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
    5 => %w{p b d g f l z mm nn},
    4 => %w{y bb dd gg ll zz tt kk t‘ k‘ m‘ n‘},
    3 => %w{x yy ! pp p‘ b‘ d‘ g‘ q},
    2 => %w{mm‘ nn‘ ‘},
    1 => %w{h bb‘ dd‘ gg‘ q‘}
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
  syllable << third_final_consonant if syllable_shape < 40 && syllable_shape >= 10
  syllable << third_medial_consonant if syllable_shape < 10
  syllable << third_vowel if syllable_shape < 10
  syllable
end

def second_vowel
  vowel = { 
    5 => %w{i},
    4 => %w{u},
    3 => %w{ii a},
    2 => %w{uu e o},
    1 => %w{aa ee à ò},
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
    5 => %w{p b d g f l z mm nn},
    4 => %w{y bb dd gg ll zz},
    3 => %w{tt kk t‘ k‘ m‘ n‘ x yy ! q},
    2 => %w{pp p‘ b‘ d‘ g‘ ‘},
    1 => %w{mm‘ nn‘ h q‘}
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
    5 => %w{p b d g f l z mm nn},
    4 => %w{y bb dd gg ll zz tt kk t‘ k‘ m‘ n‘},
    3 => %w{x yy ! pp p‘ b‘ d‘ g‘ q},
    2 => %w{mm‘ nn‘ ‘},
    1 => %w{h bb‘ dd‘ gg‘ q‘}
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
    3 => %w{ii a},
    2 => %w{uu e o},
    1 => %w{aa ee à ò},
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

form_roots ARGV[0].to_i

require 'securerandom'

def random_chars_generator

  array = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join

end

 def new_url
    array = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
   p "http://ro.ro.com/#{array}"
  end

  new_url
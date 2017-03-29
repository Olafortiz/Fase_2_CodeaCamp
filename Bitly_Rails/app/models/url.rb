class Url < ActiveRecord::Base

  def self.generate_url

    array = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
    return array
   
  end
end

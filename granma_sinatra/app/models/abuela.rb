class Abuela < ActiveRecord::Base
  # Remember to create a migration!
  def self.deaf_grandma(input)
    if input == "BYE TQM"
      "D'oh, adios mijito"
    elsif input != input.to_s.upcase
      "HUH?! NO TE ESCUCHO, PERLA!"
    else
      "NO, NO DESDE 1983"
    end
 end
end
 
class Abuela < ActiveRecord::Base
  # Remember to create a migration!
  def self.deaf_grandma(input)
    if input == "BYE TQM"
      "Adios mijita"
    elsif input != input.to_s.upcase
      "HUH?! NO TE ESCUCHO, PERLA!"
    else
      "TE VAS A IR AL INFIERNO"
    end
 end
end
 
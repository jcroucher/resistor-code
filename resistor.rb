=begin

Author: John Croucher 
john@jcroucher.com
www.jcroucher.com 

=end

class Resistor


  def initialize()

    @band1to3        = Array['black','brown','red','orange','yellow','green','blue','purple','grey','white']
    @multiplier      = Array['silver','gold','black','brown','red','orange','yellow','green','blue','purple','grey']
    @multiplier_val  = Array[0.01,0.1,1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000]
    @tolerance       = Array['brown','red','gold','silver']

    @range = {'' => 0,'K' => 3,'M' => 6, 'G' => 9}

  end

  def convertValue(face_value)

    face_value = face_value.upcase

    # Get all the numbers from the value. Make sure we don't have a decimal
    numeric_value = (face_value.gsub(/[^0-9.]/, '').to_f * 10).to_i

    # Get the text unit value
    unit = face_value.gsub(/[^A-Z]/, '')

    # Split the value out into individual bands. eg. 270 = 2,7,0
    bands = numeric_value.to_s.chars.map(&:to_i)

    # Holder for our output values
    four_band_colors = Array[]
    five_band_colors = Array[]

    band_count = 0

    bands.each { |band|

      # 4 band resistor stops after 2 bands
      if band_count < 2
        four_band_colors.push(@band1to3[band])
      end

      # 5 band resistor stops after 3 bands
      if band_count < 3
        five_band_colors.push(@band1to3[band])
      end    

      band_count += 1
    }

    # 5 band resistor will always have black if there are less than 3 bands filled in
    while band_count < 3
      five_band_colors.push(@band1to3[0])
      band_count += 1
    end

    
    # Based on the length of the value, we need to get the correct multiplier color
    if numeric_value.to_s.length <= 2
      five_band_colors.push(@multiplier[ @range[unit].to_i + 0 ])
      four_band_colors.push(@multiplier[ @range[unit].to_i + 1 ])

    elsif numeric_value.to_s.length <= 3
      five_band_colors.push(@multiplier[ @range[unit].to_i + 1 ])
      four_band_colors.push(@multiplier[ @range[unit].to_i + 2 ])

    elsif numeric_value.to_s.length >= 4
      five_band_colors.push(@multiplier[ @range[unit].to_i + 2 ])
      four_band_colors.push(@multiplier[ @range[unit].to_i + 3 ])

    end

    # Add the tolerance band
    five_band_colors.push(@tolerance[2])
    four_band_colors.push(@tolerance[2])

    return {'val' => face_value, 'four' => four_band_colors, 'five' => five_band_colors}

  end

end
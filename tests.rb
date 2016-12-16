#!/usr/bin/env ruby

=begin

Author: John Croucher 
john@jcroucher.com
www.jcroucher.com 

=end

require_relative 'resistor'

# Test Values
values = [
	{'val' => "1.5M", 'four' => "brown/green/green/gold", 'five' => "brown/green/black/yellow/gold"},
	{'val' => "1M", 'four' => "brown/black/green/gold", 'five' => "brown/black/black/yellow/gold"},
	{'val' => "4.7M", 'four' => "yellow/purple/green/gold", 'five' => "yellow/purple/black/yellow/gold"},
	{'val' => "10K", 'four' => "brown/black/orange/gold", 'five' => "brown/black/black/red/gold"},
	{'val' => "1.2K", 'four' => "brown/red/red/gold", 'five' => "brown/red/black/brown/gold"},
	{'val' => "5.6K", 'four' => "green/blue/red/gold", 'five' => "green/blue/black/brown/gold"},
	{'val' => "10", 'four' => "brown/black/black/gold", 'five' => "brown/black/black/gold/gold"},
	{'val' => "68", 'four' => "blue/grey/black/gold", 'five' => "blue/grey/black/gold/gold"}
]

resistor = Resistor.new()

resistor_list = Array[]

values.each { | resistor_value |
  resistor_list.push(resistor.convertValue(resistor_value['val']))
}


# Check all the return values match the expected values
resistor_list.each { | current_resistor |

	face_value = current_resistor['val']

	four = current_resistor['four'].join("/")
	five = current_resistor['five'].join("/")

	test_resistor = values.select { |u| u['val'] == face_value}

	if five != test_resistor[0]['five']
		puts "Test Failed: " + face_value +  ". 5 band Expected: " +  test_resistor[0]['five'] + ". Returned: " + five
	end

	if four != test_resistor[0]['four']
		puts "Test Failed: " + face_value + ". 4 band Expected: " +  test_resistor[0]['four'] + ". Returned: " + four
	end

}

puts "all tests completed"
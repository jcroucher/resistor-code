# resistor-code
Resistor color code generator

Simple ruby script for converting a list of resistor codes to their colors. You can either include *resistor.rb* in your own project and call using:

```ruby
require_relative 'resistor'

values = Array["1.5M","1M","4.7M","10K","1.2K","5.6K","10","68"]

resistor = Resistor.new() resistor_list = Array[]

values.each { | face_value | resistor_list.push(resistor.convertValue(face_value)) }
````

Or you can use *generate-list.rb* to output a list to a PDF. I used this to create lables when sorting resistors.

There is a *tests.rb* file which provides a list of values then compares to the returned color codes.

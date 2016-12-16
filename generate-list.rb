#!/usr/bin/env ruby

=begin

Author: John Croucher 
john@jcroucher.com
www.jcroucher.com 

=end

require 'erb'
require 'pdfkit'
require_relative 'resistor'


values = Array["1.5M","1M","4.7M","10K","1.2K","5.6K","10","68"]


resistor = Resistor.new()

resistor_list = Array[]

values.each { | face_value |
  resistor_list.push(resistor.convertValue(face_value))
}

template = ERB.new File.new("template.erb").read, nil, "%"
template.result(binding)
output = template.result()

kit = PDFKit.new(output, :page_size => 'A4')
pdf = kit.to_pdf
file = kit.to_file('resistor-list.pdf')
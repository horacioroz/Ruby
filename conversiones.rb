require "./converter.rb"

print "Escriba el numero que quiere convertir: "
number_to_convert = gets.chomp()
puts number_to_convert
# verificar que sea un numero
converter = Converter.new(number_to_convert)

puts converter.convertToRoman


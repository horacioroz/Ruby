class Converter
  
  def initialize(number)
    @number = number.reverse
    final= []
    @final = final
    @cuatromil= 73.chr + 238.chr
  end
  
  def convertToRoman
     number_to_convert_lenght = @number.length
     print "largo del numero :",number_to_convert_lenght,"\n"
  
    @position = 0
      while @position<number_to_convert_lenght
        @digit = @number.to_s.byteslice(@position)
        #print @position," ",@digit,"\n"
        #puts convertionCase(@position)
        @tipe = convertionCase(@position)[0]
        @previous = convertionCase(@position)[1]
        @following = convertionCase(@position)[2]
        simbols(@digit).to_s
        @position +=1
      end
    print @final.reverse.join
  end

  def convertionCase (position)
    @romanSigns = case position
    when 0 then ["0","I","V"]
    when 1 then ["1","X","L"]
    when 2 then ["2","C","D"]
    when 3 && @digit < 4 then ["3","M"]
    when 3 && @digit > 4 then ["3",@cuatromil]
    #when "4" then #previous = "M" 
    #when "5" then previous = "I" and following = "V"
    #when "6" then previous = "I" and following = "V"
    #when "7" then previous = "I" and following = "V"
    #when "8" then previous = "I" and following = "V"
    end
  end

  def simbols digit
    case digit
    when "1" then @uno = {:"#{@tipe}" => @previous}
             @unoFinal = @uno.values.first.to_s
            @final << @unoFinal
    when "2" then @dos = {:"#{@tipe}" => @previous*2}
             @dosFinal = @dos.values.first.to_s
            @final << @dosFinal
    when "3" then @tres = {:"#{@tipe}" => @previous*3}
             @tresFinal = @tres.values.first.to_s
            @final << @tresFinal
    when "4" then @cuatro = {:"#{@tipe}" => @previous+@following}
             @cuatroFinal = @cuatro.values.first.to_s
            @final << @cuatroFinal
    when "5" then @cinco = {:"#{@tipe}" => @following}
             @cincoFinal = @cinco.values.first.to_s
            @final << @cincoFinal
    when "6" then @seis = {:"#{@tipe}" => @following + @previous}
             @seisFinal = @seis.values.first.to_s
            @final << @seisFinal
    when "7" then @siete = { :"#{@tipe}" => @following + @previous * 2}
             @sieteFinal = @siete.values.first.to_s
            @final << @sieteFinal
    when "8" then @ocho = { :"#{@tipe}" => @following + @previous * 3}
             @ochoFinal = @ocho.values.first.to_s
            @final << @ochoFinal
    when "9" then @nueve = {:"#{@tipe}" => @previous + convertionCase(@position+1)[1]}
             @nueveFinal = @nueve.values.first.to_s
             @final << @nueveFinal
    when "0" then return
    else
      puts "no tengo respuesta"
    end
  end
end

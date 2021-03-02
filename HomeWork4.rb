class Person

  def get_information_about_person
    puts "Введите свое имя: "
    name = gets.chomp
    puts "Введите свой возраст: "
    age = gets.chomp

    if age.to_i > 13
      puts "Ваш возраст допустим для данной операции "
    else
      puts "Для данной операции необходим возраст от 13 лет "
      abort "Программа завершена"
    end
    puts "Имя: #{name}, возраст: #{age}"

    File.open("text/file_with_names.txt", "a") do |file|
      file.write(name,"\n")
      file.write(age,"\n\r")
    end
  end
end

person1 = Person.new()
person1.get_information_about_person


class Card
  puts "Введите номер своей карты "
  def number_is_luhn_valid?(number_from_consol = gets.chomp)
    card_number = number_from_consol.tr(' _', '')

    if card_number.to_i.to_s.length != 16
      puts "Не валидное значение, карта должна состоять только из 16 цифр"
      return
    end
    cc_digits = card_number.reverse.chars.map(&:to_i)
    check_sum = 0
    cc_digits.each_slice(2) do |odd, even|
      check_sum += odd
      next unless even
      even *= 2
      even = even.divmod(10).inject(:+) if even > 9
      check_sum += even
    end

    puts check_sum.modulo(10) == 0
  end
end
card = Card.new
card.number_is_luhn_valid?
class View
  def ask(topic)
    puts "what is the #{topic}?"
    return gets.chomp
  end

  def ask_index(topic)
    puts "What is the index number of #{topic}?"
    return gets.chomp
  end

  def list(cookbook)
    cookbook.each_wiht_index  do |recipe, index|
      puts "#{index + 1}. #{recipe.name} \n ###{recipe.description}"
    end
  end
end

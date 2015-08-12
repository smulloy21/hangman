class Word

  define_method(:initialize) do |word|
    @word = word
    @characters = word.split(//)
    @masked_array = []
    @correct_guesses = []
    @wrong_guesses = []
  end

  define_method(:print) do
    @word
  end

  define_method(:masked_word) do
    @characters = @word.split(//)
    @characters.each() do
      @masked_array.push("_")
    end
    @masked_array
  end

  define_method(:check) do |letter|
    @masked_array = []

    if @characters.include?(letter)
      @correct_guesses.push(letter)
    else
      @wrong_guesses.push(letter)
    end

    @characters.each() do |spot|
      if @correct_guesses.include?(spot)
        @masked_array.push(spot)
      else
        @masked_array.push('_')
      end
    end

    @masked_array
  end

  define_method(:wrong_guesses) do
    @wrong_guesses
  end

  define_method(:win) do
    @masked_array == @characters
  end


end

require('rspec')
require('hangman')

describe(Word) do
  describe('#print') do
    it('returns the word') do
      test_word = Word.new('aesthetic')
      expect(test_word.print()).to(eq('aesthetic'))
    end
  end

  describe('masked_word') do
    it("creates an array of underscores the length of the play-word") do
      test_word = Word.new('aesthetic')
      expect(test_word.masked_word()).to(eq(['_', '_', '_', '_', '_', '_', '_', '_', '_']))
    end
  end

  describe('check') do
    it('checks a letter against the play_word array. if letter is in play_word, push the letter to the masked_word array in the same index locations it is found in in play_word') do
      test_word = Word.new('aesthetic')
      test_word.masked_word()
      expect(test_word.check('e')).to(eq(['_','e','_','_','_','e','_','_','_',]))
    end
    it('saves past correct guesses and adds new ones') do
      test_word = Word.new('aesthetic')
      test_word.masked_word()
      test_word.check('e')
      expect(test_word.check('a')).to(eq(['a','e','_','_','_','e','_','_','_',]))
    end
    it('saves past correct guesses and adds new ones') do
      test_word = Word.new('aesthetic')
      test_word.masked_word()
      test_word.check('e')
      test_word.check('a')
      expect(test_word.check('t')).to(eq(['a','e','_','t','_','e','t','_','_',]))
    end
    it('saves past correct guesses and adds new ones') do
      test_word = Word.new('aesthetic')
      test_word.masked_word()
      test_word.check('e')
      test_word.check('a')
      expect(test_word.check('w')).to(eq(['a','e','_','_','_','e','_','_','_',]))
    end
  end

  describe('wrong_guesses') do
    it('returns an array of the wrong guesses that a user makes') do
      test_word = Word.new('aesthetic')
      test_word.masked_word()
      test_word.check('e')
      test_word.check('a')
      test_word.check('j')
      test_word.check('k')
      expect(test_word.wrong_guesses()).to(eq(['j', 'k']))
    end
  end

  describe('win') do
    it('checks to see if youve won') do
      test_word = Word.new('dog')
      test_word.check('d')
      test_word.check('o')
      test_word.check('g')
      expect(test_word.win()).to(eq(true))
    end

    it('checks to see if youve not yet won') do
      test_word = Word.new('dog')
      test_word.check('d')
      test_word.check('g')
      test_word.check('g')
      expect(test_word.win()).to(eq(false))
    end
  end
end

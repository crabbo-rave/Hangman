import Hangman.HelperFuncs
open HelperFuncs

structure HangmanGame where
  zippedWord : List (Char × Char)
  lettersGuessed : List String

instance : ToString HangmanGame where
  toString state := 
    s!"Zipped word: {state.zippedWord}¬Guessed letters {state.lettersGuessed}"

namespace HangmanGame

def init (word : String) : HangmanGame :=
  let zippedWord := convertToHiddenWord word 
  { zippedWord := zippedWord, lettersGuessed := [] }

end HangmanGame

#eval HangmanGame.init "apple bottom jeans"

#eval "hello world".length
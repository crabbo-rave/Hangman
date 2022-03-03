structure HangmanGame where
  zippedWord : List (Char × Char)
  lettersGuessed : List String

instance : ToString HangmanGame where
  toString state := 
    s!"Zipped word: {state.zippedWord}¬Guessed letters {state.lettersGuessed}"

namespace HangmanGame

def convertToHiddenChar : Char → Char 
  | ' ' => ' '
  | _ => '_'

def convertToHiddenWord (str : String) : List (Char × Char) :=
  str
  |>.toList 
  |>.map (fun c => (c, convertToHiddenChar c))

def joinHiddenWord (state : HangmanGame) : String :=
  state.zippedWord
  |>.foldr (fun t accstr => (toString t.snd) ++ accstr) ""

def revealLetter (state : HangmanGame) (c : Char) : HangmanGame :=
  let newZippedWords := 
    state.zippedWord
    |>.map (fun t => if t.fst = c then (t.fst, c) else (t.fst, t.snd))
  { state with zippedWord := newZippedWords }

end HangmanGame

namespace HangmanGame

def init (word : String) : HangmanGame :=
  let zippedWord := convertToHiddenWord word 
  { zippedWord := zippedWord, lettersGuessed := [] }

end HangmanGame

def abj := HangmanGame.init "apple bottom jeans"

#eval abj.joinHiddenWord

#eval abj |>.revealLetter 'a' |>.joinHiddenWord
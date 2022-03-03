-- namespace HangmanGame

-- def convertToHiddenChar : Char → Char 
--   | ' ' => ' '
--   | _ => '_'

-- def convertToHiddenWord (str : String) : List (Char × Char) :=
--   str
--   |>.toList 
--   |>.map (fun c => (c, convertToHiddenChar c))

-- def joinHiddenWord (state : HangmanGame) :=
--   state.zippedWord
--   |>.map (·.fst)

-- end HangmanGame


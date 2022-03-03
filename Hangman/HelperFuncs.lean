namespace HelperFuncs

def convertToHiddenChar : Char → Char 
  | ' ' => ' '
  | _ => '_'

def convertToHiddenWord (str : String) : List (Char × Char) :=
  str
  |>.toList 
  |>.map (fun c => (c, convertToHiddenChar c))

end HelperFuncs
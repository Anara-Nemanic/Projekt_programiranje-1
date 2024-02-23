type t = 
  | Prazen 
  | Sestavljen of int * t


let ustvari_sklad stevilo = Sestavljen (stevilo, Prazen)

let trenutno_na_skladu = function
  | Prazen -> None
  | Sestavljen (stevilo, _) -> Some stevilo

let push sklad stevilo = Sestavljen (stevilo, sklad)
let zamenjaj_na_skladu sez = function
  | Prazen -> Prazen (* nikoli ne bo prazen *)
  | Sestavljen (_, sklad) -> List.fold_left push sklad sez 


(* let pop = function
  | Prazen -> None
  | Sestavljen (_, sklad) -> Some sklad *)

(* let na_koncu sklad = (sklad = Prazen) *)
type t = 
  | Prazen 
  | Sestavljen of char * t


let ustvari_sklad crka = Sestavljen (crka, Prazen)

let trenutno_na_skladu = function
  | Prazen -> None
  | Sestavljen (crka, _) -> Some crka

let push sklad crka = Sestavljen (crka, sklad)
let zamenjaj_na_skladu sez = function
  | Prazen -> Prazen (* nikoli ne bo prazen *)
  | Sestavljen (_, sklad) -> List.fold_left push sklad sez 
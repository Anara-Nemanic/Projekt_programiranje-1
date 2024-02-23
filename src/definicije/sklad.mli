type t

val ustvari_sklad : char -> t
val trenutno_na_skladu : t -> char option
val zamenjaj_na_skladu : char list -> t -> t

(* val na_koncu : t -> bool *)
(* val pop : t -> t option *)
(* val push : t -> int -> t *)
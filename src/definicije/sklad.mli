type t

val ustvari_sklad : int -> t
val trenutno_na_skladu : t -> int option
val zamenjaj_na_skladu : int list -> t -> t

(* val na_koncu : t -> bool *)
(* val pop : t -> t option *)
(* val push : t -> int -> t *)
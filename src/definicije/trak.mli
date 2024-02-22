type t

val prazen : t
val trenutno_na_traku : t -> char
val na_koncu : t -> bool
val premakni_naprej : t -> t
val iz_niza : string -> t
val v_niz : t -> string
val prebrani : t -> string
val neprebrani : t -> string

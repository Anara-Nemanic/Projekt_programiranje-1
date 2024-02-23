type t

val ustvari_sklad : char -> t
val trenutno_na_skladu : t -> char option
val zamenjaj_na_skladu : char list -> t -> t
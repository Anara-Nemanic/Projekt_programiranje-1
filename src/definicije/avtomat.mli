type t

val prazen_avtomat : Stanje.t -> Sklad.t -> t

val dodaj_sprejemno_stanje : Stanje.t -> t -> t
val dodaj_nesprejemno_stanje : Stanje.t -> t -> t
val dodaj_prehod : Stanje.t -> char -> char -> Stanje.t -> char list -> t -> t
val dodaj_epsilon_prehod : Stanje.t -> char -> Stanje.t -> char list -> t -> t
val dodaj_opis : string -> t -> t

val prehodna_funkcija : t -> char -> (Stanje.t * Sklad.t) -> (Stanje.t * Sklad.t) list
val epsilon_prehodna_funkcija : t -> (Stanje.t * Sklad.t) -> (Stanje.t * Sklad.t) list

val seznam_stanj : t -> Stanje.t list
val zacetno_stanje : t -> Stanje.t
val sklad : t -> Sklad.t
val zacetni_sklad : t -> Sklad.t
val seznam_prehodov : t -> (Stanje.t * char * char * Stanje.t * char list ) list
val seznam_epsilon_prehodov : t -> (Stanje.t * char * Stanje.t * char list ) list
val opis : t -> string

val je_sprejemno_stanje : t -> Stanje.t -> bool

val preberi_niz : t -> Stanje.t -> Sklad.t -> string -> (Stanje.t * Sklad.t) list

val palindromi : t


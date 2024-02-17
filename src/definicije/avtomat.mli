type t

val prazen_avtomat : Stanje.t -> Sklad.t -> t
val dodaj_nesprejemno_stanje : Stanje.t -> t -> t
val dodaj_sprejemno_stanje : Stanje.t -> t -> t
val dodaj_prehod : Stanje.t -> int -> char -> Stanje.t -> int list -> t -> t
val dodaj_prazen_prehod : Stanje.t -> int -> Stanje.t -> int list -> t -> t
val prehodna_funkcija : t -> Stanje.t -> int -> char -> (Stanje.t) option
val prehodna_funkcija_za_sklad : t -> Stanje.t -> int -> char -> int list
val zacetno_stanje : t -> Stanje.t
val seznam_stanj : t -> Stanje.t list
val seznam_prehodov : t -> (Stanje.t * int * char * Stanje.t * int list ) list
val seznam_praznih_prehodov : t -> (Stanje.t * int * Stanje.t * int list ) list
val sklad : t -> Sklad.t
val zacetni_sklad : t -> Sklad.t
val je_sprejemno_stanje : t -> Stanje.t -> bool
val enke_1mod3 : t
val dpda_enako_stevilo_nicel_in_enk : t
val preberi_niz : t -> Stanje.t -> Sklad.t -> string -> (Stanje.t * Sklad.t) option

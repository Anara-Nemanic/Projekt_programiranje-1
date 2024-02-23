type stanje = Stanje.t
type sklad = Sklad.t

type t = {
  stanja : stanje list;
  zacetno_stanje : stanje;
  sprejemna_stanja : stanje list;
  sklad : sklad;
  zacetni_sklad: sklad;
  prehodi : ( stanje * char * char * stanje * char list ) list;
  epsilon_prehodi : ( stanje * char * stanje * char list ) list;
  opis : string;
}

let prazen_avtomat zacetno_stanje sklad =
  {
    stanja = [ zacetno_stanje ];
    zacetno_stanje;
    sprejemna_stanja = [];
    sklad = sklad;
    zacetni_sklad = sklad;
    prehodi = [];
    epsilon_prehodi = [];
    opis = "Ni opisa";
  }

let dodaj_sprejemno_stanje stanje avtomat =
  {
    avtomat with
    stanja = stanje :: avtomat.stanja;
    sprejemna_stanja = stanje :: avtomat.sprejemna_stanja;
  }

let dodaj_nesprejemno_stanje stanje avtomat =
  { avtomat with stanja = stanje :: avtomat.stanja }

let dodaj_prehod trenutno_stanje crka_na_skladu crka novo_stanje (nov_del_sklada : char list) avtomat =
  { avtomat with prehodi = (trenutno_stanje, crka_na_skladu, crka, novo_stanje, nov_del_sklada) :: avtomat.prehodi }

let dodaj_epsilon_prehod trenutno_stanje crka_na_skladu novo_stanje (nov_del_sklada : char list) avtomat =
  { avtomat with epsilon_prehodi = (trenutno_stanje, crka_na_skladu, novo_stanje, nov_del_sklada) :: avtomat.epsilon_prehodi }

let dodaj_opis opis avtomat = 
  { avtomat with opis = opis }


let prehodna_funkcija avtomat crka (stanje, sklad) =
  let crka_na_skladu = Option.get (Sklad.trenutno_na_skladu sklad) in
  let rec pomozna acc = function
  | [] -> acc
  | (_, _, _, novo_stanje, novi_del_sklada) :: rep -> pomozna ((novo_stanje, Sklad.zamenjaj_na_skladu novi_del_sklada sklad) :: acc) rep in
  pomozna [] (
    List.filter
    (fun (trenutno_stanje, na_skladu, crka', _, _) -> trenutno_stanje = stanje && crka = crka' && na_skladu = crka_na_skladu)
    avtomat.prehodi
  )

let epsilon_prehodna_funkcija avtomat (stanje, sklad) =
  let znak_na_skladu = Option.get (Sklad.trenutno_na_skladu sklad) in
  let rec pomozna acc = function
  | [] -> acc
  | (_, _, novo_stanje, novi_del_sklada) :: rep -> pomozna ((novo_stanje, Sklad.zamenjaj_na_skladu novi_del_sklada sklad) :: acc) rep in
  pomozna [] (
    List.filter
    (fun (trenutno_stanje, na_skladu, _, _) -> trenutno_stanje = stanje && na_skladu = znak_na_skladu)
    avtomat.epsilon_prehodi
  )


let seznam_stanj avtomat = avtomat.stanja
let zacetno_stanje avtomat = avtomat.zacetno_stanje
let sklad avtomat = avtomat.sklad
let zacetni_sklad avtomat = avtomat.zacetni_sklad
let seznam_prehodov avtomat = avtomat.prehodi
let seznam_epsilon_prehodov avtomat = avtomat.epsilon_prehodi
let opis avtomat = avtomat.opis


let je_sprejemno_stanje avtomat stanje =
  List.mem stanje avtomat.sprejemna_stanja


let preberi_niz avtomat zacetno_stanje zacetni_sklad niz =
  let rec epsilon acc list =  
    match list with
      | [] -> acc
      | sez -> epsilon (acc @ list) (List.flatten (List.map (epsilon_prehodna_funkcija avtomat) sez)) in
  let z_znakom seznam znak = 
    List.flatten (List.map (prehodna_funkcija avtomat znak) (epsilon [] seznam)) in
    epsilon [] (niz |> String.to_seq |> Seq.fold_left z_znakom [(zacetno_stanje, zacetni_sklad)])

let palindromi =
  let q0 = Stanje.iz_niza "q0"
  and q1 = Stanje.iz_niza "q1"
  and q2 = Stanje.iz_niza "q2"
  and q3 = Stanje.iz_niza "q3" in
  prazen_avtomat q0 (Sklad.ustvari_sklad 'A')
  |> dodaj_opis "Avtomat je narejen za iskanje palindromov iz črk e, n in z. 
Vpiši niz iz teh črk in avtomat bo preveril, ali se tvoja beseda prebere enako z leve in desne."
  |> dodaj_nesprejemno_stanje q1
  |> dodaj_nesprejemno_stanje q2
  |> dodaj_sprejemno_stanje q3
  |> dodaj_prehod q0 'A' 'e' q1 ['A'; 'e']
  |> dodaj_prehod q0 'A' 'n' q1 ['A'; 'n']
  |> dodaj_prehod q0 'A' 'z' q1 ['A'; 'z'] 

  |> dodaj_prehod q1 'e' 'e' q1 ['e'; 'e']
  |> dodaj_prehod q1 'e' 'n' q1 ['e'; 'n']
  |> dodaj_prehod q1 'e' 'z' q1 ['e'; 'z']
  |> dodaj_prehod q1 'n' 'e' q1 ['n'; 'e']
  |> dodaj_prehod q1 'n' 'n' q1 ['n'; 'n']
  |> dodaj_prehod q1 'n' 'z' q1 ['n'; 'z']
  |> dodaj_prehod q1 'z' 'e' q1 ['z'; 'e']
  |> dodaj_prehod q1 'z' 'n' q1 ['z'; 'n']
  |> dodaj_prehod q1 'z' 'z' q1 ['z'; 'z']

  |> dodaj_prehod q1 'e' 'e' q2 []
  |> dodaj_prehod q1 'n' 'n' q2 []
  |> dodaj_prehod q1 'z' 'z' q2 []
  |> dodaj_epsilon_prehod q1 'e' q2 []
  |> dodaj_epsilon_prehod q1 'n' q2 []
  |> dodaj_epsilon_prehod q1 'z' q2 []

  |> dodaj_prehod q2 'e' 'e' q2 []
  |> dodaj_prehod q2 'n' 'n' q2 []
  |> dodaj_prehod q2 'z' 'z' q2 []

  |> dodaj_epsilon_prehod q2 'A' q3 ['A']
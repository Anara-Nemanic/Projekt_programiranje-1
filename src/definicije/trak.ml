type t = { niz : string; indeks_trenutnega_znaka : int }

(* let trenutno_na_traku trak = String.get trak.niz trak.indeks_trenutnega_znaka *)
(* let na_koncu trak = 
  String.length trak.niz = trak.indeks_trenutnega_znaka *)
(* let premakni_naprej trak =
  { trak with indeks_trenutnega_znaka = succ trak.indeks_trenutnega_znaka } *)
(* let iz_niza niz = { niz; indeks_trenutnega_znaka = 0 } *)
(* let nov_trak = iz_niza "" *)
(* let v_niz trak = trak.niz *)
(* let prebrani trak = String.sub trak.niz 0 trak.indeks_trenutnega_znaka *)
(* and neprebrani trak =
  String.sub trak.niz trak.indeks_trenutnega_znaka
    (String.length trak.niz - trak.indeks_trenutnega_znaka) *)

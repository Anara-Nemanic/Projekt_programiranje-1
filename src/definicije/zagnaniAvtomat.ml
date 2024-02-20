type t = { avtomat : Avtomat.t; trak : Trak.t; stanje : Stanje.t ; sklad : Sklad.t }

let pozeni avtomat trak =
  { avtomat; trak; stanje = Avtomat.zacetno_stanje avtomat ; sklad = Avtomat.sklad avtomat }

let avtomat { avtomat; _ } = avtomat
let trak { trak; _ } = trak
let stanje { stanje; _ } = stanje

let sklad { sklad; _ } = sklad

let je_v_sprejemnem_stanju { avtomat; stanje; _ } =
  Avtomat.je_sprejemno_stanje avtomat stanje

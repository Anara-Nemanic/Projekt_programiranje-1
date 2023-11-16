# Skladovni avtomati

Projekt vsebuje implementacijo skladovnih avtomatov, ki so končni avtomati z dodanim skladom. Sklad je mogoče obravnavati kot set krožnikov v omari, kjer krožnik lahko dodaš na set ali pa ga iz njega vzameš, nikoli pa ne moreš dostopati do katerega drugega krožnika, razen vrhnjega. So bolj zmogljivi kot končni avtomati, saj so končni avtomati neke vrste podmnožica skladovnih, kajti vsak končni avtomat je le skladovni avtomat, ki pa svojega sklada nikdar ne uporabi (več pa v razdelku "Kako se skladovni avtomati razlikujejo od končnih?"). So pa vseeno manj zmogljivi kot Turingovi stroji, saj ne omogočajo premikanja po vhodnem nizu in spreminjanja le-njega. 

Skladovni avtomat deluje tako, da prebere dani vhodni niz od leve proti desni. V vsakem koraku izbere prehod oziraje se na vhodni simbol, trenutno stanje in simbol na vrhu sklada. Skladovni avtomat lahko tudi upravlja s skladom kot del izvajanja prehoda, kar pomeni, da avtomat lahko potisne določen simbol na vrh sklada, ga od tam vzame ali ne naredi nič od naštetega in sklad pusti takšnega, kot je. Enostavneje torej ustroj potisnega avtomata razložimo takole: glede na vhodni simbol, trenutno stanje in simbol na vrhu sklada lahko avtomat sledi prehodu v drugo stanje in po želji spremeni (potisne na- ali vzame iz-) sklad. Če je v vsaki situaciji možen največ en takšen prehod, potem avtomat sodi med deterministične potisne avtomate, če pa je možnih več prehodov, pa avtomat spada med splošne ali nedeterministične skladovne avtomate. 
Pri takih avtomatih rečemo, da je niz sprejet, če obstaja vsaj ena pot, po kateri niz konča v sprejemnem stanju. Na prav take avtomate se bom v svojem projektu osredotočila jaz.

### Kako se skladovni avtomati razlikujejo od končnih?

Končni avtomat začne v enem izmed možnih stanj, nato pa glede na trenutno stanje in trenutni simbol preide v neko novo stanje. Če ob pregledu celotnega niza konča v enem od sprejemnih stanj, je niz sprejet, sicer pa ni. Torej končni avtomat samo gleda na vhodni signal in trenutno stanje: nima sklada, s katerim bi delal, in zato ne more dostopati do prejšnjih vrednosti vhoda. Izbere lahko le novo stanje, ki je posledica sledenja prehodu. Nedeterministični skladovni avtomat pa se razlikuje od končnega avtomata na tri načine:

  1. Uporabi lahko vrh sklada, pri odločanju, kateri prehod naj izvede.
  2. Lahko manipulira s skladom kot del izvajanja prehoda.
  3. Možnih je več prehodov v več različnih stanj hkrati.

### Primer

Delala pa bom na primeru iskanja palindromov s skladovnim avtomatom. Palindróm je beseda, fraza, število ali katerokoli drugo zaporedje enot, ki imajo to lastnost, da se berejo z obeh strani enako. Pri tem se presledki in ostala ločila ne upoštevajo. Ta avtomat torej sprejema nize, sestavljene iz velikih in malih črk, presledkov in ločil: vejica (,), podpičje (;), pika (.), dvopičje (:), klicaj(!) in vprašaj(?), ki se berejo enako tako z leve kot desne strani. Tak avtomat predstavimo z naslednjim diagramom, na katerem je začetno stanje označeno s puščico, sprejemna stanja pa so dvojno obkrožena:

DIAGRAM AVTOMATA - TODO

## Matematična definicija

Skladovni avtomat je definiran kot nabor sedmih elementov $M = (Q, \Sigma, \Gamma, \delta, q_0, Z, F)$, kjer so:

- $Q$ - končna množica stanj
- $\Sigma$ - končna množica simbolov, ki nam definira *vhodno abecedo*
- $\Gamma$ - končna množica simbolov, ki nam definira *abecedo sklada*
- $\delta$ - končna podmnožica $Q \times (\Sigma \cup \\{\epsilon\\}) \times \Gamma \times Q \times \Gamma^\*$, ki je množica relacij prehoda, pri čemer je $\epsilon$ prazen niz in $\Gamma^\*$ množica nizov končne dolžine nad abecedo $\Gamma$
- $q_0 \in Q$ - začetno stanje
- $Z \in \Gamma$ - začetni simbol sklada in
- $F \subseteq Q$ - množica sprejemnih stanj

Toda to je le ena izmed možnih implementacij skladovnega avtomata. Možne različice so še take, ki prehode namesto kot relacijo predstavijokot preslikavo; take, ki sklad predstavijo kot seznam, ... 

### Primer

Na primer, zgornji skladovni avtomat predstavimo z naborom $M = (Q, \Sigma, \Gamma, \delta, q_0, Z, F)$, kjer so:

- **stanja:** $Q = \\{0\\}$
- **vhodna abceda:** $\Sigma = \\{A-Z, a-z, ( ), (,), (.), (;), (:), (!), (?)\\}$, kjer $a-z$ pomeni vse male črke angleške abecede, $A-Z$ vse velike črke angleške abecede, $( )$ predstavlja presledek, vsi nadaljnji oklepaji pa predstavljajo simbole znotraj oklepajev (slednji služijo zgolj večji preglednosti)
- **abeceda sklada:** $\Gamma = \Sigma$
- **začetno stanje:** $q_0 = 0$
- **začetni simbol sklada:** $Z = \epsilon$
- **sprejemna stanja:** $F = 0$

Prehodna relacija $\delta$ pa sestoji iz elementov:

### Viri
- https://en.wikipedia.org/wiki/Pushdown_automaton#Turing_machines (definicija)
- https://www.cs.odu.edu/~zeil/cs390/latest/Public/pda-jflap/index.html (ideja primera)
- https://sl.wikipedia.org/wiki/Palindrom (definicija palindroma)
- https://github.com/matijapretnar/programiranje-1/tree/master/projekt (predloga)

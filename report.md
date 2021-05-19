#Harjoitus 7

## a) edelliset läksyt.

## b) oma moduuli

**Johdanto**

Tein moduulin, jolla voin asentaa puhtaalle linuxille sovelluksia, joita käytän itse usein. Moduuli asentaa Firefoxin, Discordin, Steamin, ufw, Runescapen ja Blenderin. Ajattelin, että tästä projektista olisi hyötyä myöhemmin, jos päätän asentaa linux desktopin uudelleen. 

![SLS TIEDOSTON SISÄLTÖ](/images/kuva1)

Aloitin projektin tekemällä salttiin moduulille kansion. Tein kansioon init.sls tiedoston, johon myöhemmin laitan kaiken tavaran. Aloitin asentamalla firefoxin käsin, jotta voisin kopioida konfigurointitiedoston, johon voin muuttaa oletussivun duckduckgo.com. Aloitin init.sls tiedoston täyttämisen asentamalla ensin firefoxin ja muutaman hyötyohjelman, joita tulen käyttämään myöhemmin. Laitoin myös tarvittavan koodin, jotta saan file.managedin toimimaan. Laitoin tässä vaiheessa sls tiedostoon seuraavan koodin.

  tools:
    pkg.installed:
      - pkgs:
        - curl
        - firefox
        - tree
        - git
    
  /etc/firefox/syspref.js:
    file.managed:
      - source: salt://projekti/syspref.js

![kuva1](/images/kuva1)

Tässä vaiheessa kaikki toimi moitteetta. Testasin avata firefoxin ja duckduckgo.com aukesi niin kuin pitikin. 

![kuva1](/images/kuva1)

Seuraavaksi asensin Blenderin ensin käsin, jotta voin muokata sen haluamakseni ja ottaa siitä tarvittavat konfigurointitiedostot. Asensin sen sudo apt install blender ja avasin sen. Vaihdoin taustaa tummemmaksi, koska se on minun mielestäni mukavampi. 

![kuva3](images/kuva3)

Kun olin muuttanut asetuksia käytin find komentoa löytääkseni muutetut asetustiedostot komennolla: "find -printf '%T+ %p\n'|sort|tail". Kopioin konfigurointitiedoston salttiin, jonka jälkeen poistin blenderin. Tein sls tiedostoon muutoksia lisäämällä sinne blenderin asennuksen ja konfigurointitiedostoa varten file.managedin. init.sls tiedoston sisältö:

  tools:
    pkg.installed:
      - pkgs:
        - curl
        - firefox
        - tree
        - git
    
  /etc/firefox/syspref.js:
    file.managed:
      - source: salt://projekti/syspref.js
  
  blender:
    pkg.installed
  
  /etc/skel/userpref.blend:
    file.managed:
      - source: salt://projekti/userpref.blend
  



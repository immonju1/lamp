# Raportti

Aloitin tekemisen tunnilla ja tallensin githubiin, tunnilla sain tilan valmiiksi.

Tarkoitus oli tehdä raportti englanniknsi, mutta aikapulan takia teen vielä suomeksi.

Dokumentin apuna käytetty [Tero Karvisen kotisivuja](https://terokarvinen.com)

## Ympäristöt
 
Ensimmäinen versio tehtiin labraluokassa
- Ubuntu 18.04 Livetikulta
- Master ja minion samalla koneella

Toinen version on tehty omalla Hewlett-Packard kotikoneella, jossa Ubuntu 18.04. Muistia 6 GB ja CPU on Intel i5 M 450 @ 2.40GHz.
- Master ja minion samalla koneella
- Minion oli Vagrant Ubuntu 16.04

## Jatkokehitys

Kirjaan tälle raportille lyhyesti mitä tein lisää tunnilla valmistuneeseen tilaan.

Paljon ongelmia aiheutui siitä, että labarassa olin jo asentanut manuaalisesti kaikki palvelut. Tällöin kaikki viat eivät tulleet esille.

Tyhjälle koneelle asentaessa, tuli esille paljon bugeja. 
- PHP versio oli eri 
- Mariadb komento ei tiominut, mutta mysql komento toimi, esim. ```sudo mysql -u root```

### cmd.run komennosta idempotentti

Lisätty rivi Teron ohjeen mukaan
```
- unless: "echo 'show databases'|sudo mysql -u root|grep '^books$'"
```
Testattu ```sudo salt '*' state.highstate``` peräkkäin. Ei tullut virheilmoitusta siitä, että tietokanta on jo olemassa.

### Käyttäjän luonti ja oikeudet kuntoon

Lisätty seuraavat rivit /srv/salt/apache/init.sls
```
user_xubuntu:
  user.present:
    - name: xubuntu
    - shell: /bin/bash
    - fullname: Juha Immonen test user

/home/xubuntu/public_html:
  file.directory:
    - user: xubuntu
    - group: xubuntu
    - mode: 775
```

### Vagrantilla oli php7.0

Muutettu konfiguraatiotiedoston nimi

```
/etc/apache2/mods-enabled/php7.0.conf:
  file.managed:
    - source: salt://apache/php7.0.conf
```
### php testiohjelma

Hakemistoon ```/srv/salt/apache/php``` viety PHP ohjelma koodit, ohjelmaa tekee CRUD operaatiot tietokantaan.

Tiedostojen kopiointi minionille
```
/home/xubuntu/public_html/php:
  file.recurse:
    - source: salt://apache/php
    - include_empty: True
    - user: xubuntu
    - group: xubuntu
```
### Testaus

Selaimella URL:
http://juha.example.com:8080/php/list.php

Testitulos: 
![alt text](https://github.com/immonju1/lamp/raw/master/src/common/images/tulos.png "Testin tulos")

### Asennus helpommaksi

todo

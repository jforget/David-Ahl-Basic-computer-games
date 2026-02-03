-*- encoding: utf-8; indent-tabs-mode: nil -*-

BUT
===

Depuis la  fin de  2022, Monsieur  Tout-le-monde a  accès à  des sites
d'intelligence  artificielle  via  sa connexion  Internet.  J'ai  même
entendu   dire  que   certaines   personnes   utilisaient  des   sites
d'intelligence artificielle en pour  tenir lieu de psychanalyste. Cela
m'a rappelé  l'un des  précurseurs des programmes  de ce  type, Eliza,
écrit dans les années 1960.

La  version BASIC  d'Eliza  a  été publiée  par  David  Ahl, dans  son
deuxième livre  _More Basic Computer  Games_, qui faisait suite  à son
livre à  succès _Basic Computer  Games_. Mon intérêt pour  Eliza s'est
ainsi étendu aux jeux publiés par David Ahl.

Ce  dépôt décrit  mes  efforts pour  récupérer ces  jeux  et pour  les
exécuter.

PROGRAMMES DE JEUX
==================

Eliza
-----

[Eliza](https://fr.wikipedia.org/wiki/ELIZA)
n'est pas  l'œuvre de David Ahl.  Le programme a été  écrit par Joseph
Weizenbaum. De nombreux fichiers sources sont disponibles dans un
[dépôt Github](https://github.com/jeffshrager/elizagen.org),
utilisant plusieurs langages de  programmation différents. Étant donné
que  je   suis  intéressé  seulement   pas  la  version   Basic,  j'ai
sélectionné, plus ou moins au hasard,
[une version de 1979](https://github.com/jeffshrager/elizagen.org/blob/master/Other_Elizas/1979_EricPlatt_DR_CHALLENGER_CLEAN.BAS),
[une version de 2013](https://github.com/jeffshrager/elizagen.org/blob/master/Other_Elizas/20130209_www.jesperjuul.net%7Celiza%7CELIZA.BAS)
disponible également sur
[un autre site](https://jesperjuul.net/eliza/ELIZA.BAS)
et [une autre version de 2013](https://github.com/jeffshrager/elizagen.org/blob/3f3414c8a3e359e5f392d92883241d3bd41e7988/Other_Elizas/20120310ShragerNorthEliza.c64basic).

Basic Computer Games
--------------------

Les
[deux](https://www.atariarchives.org/basicgames/)
[livres](https://www.atariarchives.org/morebasicgames/)
de David Ahl sont disponibles sur
[Atari Archives](https://www.atariarchives.org/),
ainsi qu'un
[troisième livre](https://www.atariarchives.org/bigcomputergames/)
que je ne connaissais pas. Et il y a bien
[Eliza](https://www.atariarchives.org/morebasicgames/showpage.php?page=56)
dans le lot.

Le problème est que ces programmes sont fournis sous la forme d'images
GIF. Il  faut donc  les passer dans  des programmes  de reconnaissance
automatisée  de   caractères,  avec  nécessairement   vérification  et
correction des erreurs. Heureusement,  les programmes du premier livre
sont  disponibles sous  la forme  d'une archive  Zip ou  d'une archive
tar.gz sur le
[site de Vintage Basic](http://www.vintage-basic.net/games.html)
et les programme  du deuxième livre sont disponibles en  mode texte ou
sous la forme d'une archive Zip sur
[un autre site](https://www.roug.org/retrocomputing/languages/basic/morebasicgames).

Les deux premiers livres sont disponibles également sur le
[site](https://archive.org/details/basic-computer-games-microcomputer-edition_202207)
[archive.org](https://archive.org/details/More_BASIC_Computer_Games)
en  mode  GIF  (ou JPEG  ou  PNG  ?),  avec  des liens  permettant  de
télécharger le livre au format texte ou au format PDF. Néanmoins, pour
le format texte,  il y a de nombreuses erreurs  de transcription. Cela
dit, cela peut  toujours servir de point de départ  pour récupérer les
sources de tel ou tel programme.

Interpréteurs BASIC
===================

Le [langage BASIC](https://rosettacode.org/wiki/99_Bottles_of_Beer/Basic)
a considérablement évolué entre ses  débuts en 1965 et maintenant. Les
numéros de ligne ont disparu,  il existe maintenant des fonctions avec
paramètres,  des  variables locales  avec  règles  de visibilité  bien
définies. Un
[programme moderne](https://rosettacode.org/wiki/10001th_prime#BASIC256)
présente très peu de ressemblances avec un
[programme classique](https://rosettacode.org/wiki/10001th_prime#GW-BASIC).

Pour  les jeux  programmés  dans  les années  1970,  j'ai besoin  d'un
interpréteur acceptant la  syntaxe classique avec numéros  de ligne et
tout.

Pour mes  tests, j'utilise  une machine  virtuelle xubuntu  25.04. Une
machine virtuelle, car la désinstallation  d'un logiciel peut se faire
simplement  en  restaurant un  instantané.  xubuntu,  parce que  cette
distribution  contient  plus de  paquets  pour  BASIC que  les  autres
distributions que  j'utilise comme  Fedora. 25.04  parce que  c'est la
plus récente installée parmi mes machines virtuelles.

brandy
------

Le [site web](https://brandy.matrixnetwork.co.uk/)
annonce la version 1.23.6, le paquet APT en est à la version 1.23.4.

Lorsque je teste le programme minimal `test1.bas` tiré de `bcg.tar.gz` :

```
10 print "I am test 1"
20 end
```

l'interpréteur `brandy` plante :

```
$ brandy test1.bas
heap.c:init_workspace: Requested heapsize is 67108864 (&4000000)
heap.c:init_workspace: Allocating at 0x400000, size &4000000
heap.c:init_workspace: mmap returns 0x400000
```

Idem avec les quelques autres programmes que j'ai essayés.

Néanmoins, si je  lance l'interpréteur sans donner de  nom de fichier,
l'interpréteur ouvre une fenêtre de saisie où l'on peut taper du BASIC
(majuscules   uniquement,  les   minuscules   provoquent  un   message
d'erreur).  Ainsi, le  programme  `test1.bas` ne  fonctionne pas,  car
`print` et `end`  doivent être en majuscules. En  revanche, les autres
programmes   comme   `sinewave.bas`,   `amazing.bas`   ou   `love.bas`
fonctionnent. D'autres,  comme `bunny.bas` et `eliza.bas`  (la version
de `mbcg.zip`)  génèrent une erreur  : dans  le cas de  `bunny.bas` le
tableau `B`  n'est pas  dimensionné, le programme  `eliza.bas` utilise
une variable `P$` en ligne 255 sans l'avoir définie.

Le problème le  plus important, c'est qu'il est  impossible de changer
les  dimensions de  la  fenêtre  et qu'il  n'y  a  pas possibilité  de
remonter dans le texte (pas de barre de défilement).

Quelques commandes utiles :

```
HELP
HELP "."
HELP "LOAD"
LOAD "amazing.bas"
RUN
QUIT
```

Notez que les commandes doivent être  en majuscules, mais que les noms
de fichier doivent  correspondre à la façon dont ils  sont écrits dans
le répertoire sur le disque.

bwbasic
-------

La [page web](https://sourceforge.net/projects/bwbasic/)
indique la version 3.40, le paquet APT en est à la version 2.20pl2.

La  commande  est  `bwbasic`.  Elle  admet  un  nom  de  programme  en
paramètre. L'interpréteur  utilise la fenêtre  xterm pour sa  ligne de
commande,  donc  il  est  possible  de  paginer  avec  les  barres  de
défilement.

Il  est  possible d'utiliser  les  minuscules.  En revanche,  certains
problèmes se présentent. Par  exemple, dans `sinewave`, un commentaire
est  introduit par  `REMARKABLE` au  lieu de  simplement `REM`.  Cette
version  de BASIC  ne reconnaît  pas l'instruction  `REM` dans  ce mot
`REMARKABLE`. Ou alors, dans de nombreux programmes, l'interpréteur ne
reconnaît pas les fins de boucle `NEXT`  si elles ne sont pas au début
de la ligne de code.

Plus curieux  : lorsque je  lance "calendar.bas", après  avoir corrigé
les `NEXT`  qui ne sont pas  en début de ligne,  j'obtiens des erreurs
étiquetées comme venant  de `sh`. Ces erreurs ne  sont pas bloquantes.
En fait, l'erreur bloquante concerne  le tableau `M`, déclaré par `DIM
M(12)`, et  pour lequel les  indices utilisés sont  0 à 12.  Voici les
erreurs :

```
bwBASIC: load "calendar.bas"
bwBASIC: run
                               CALENDAR
              CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY
sh: 1: PRINT:PRINT:PRINT: not found
sh: 1: REM: not found
sh: 1: Syntax error: "(" unexpected
sh: 1: 10: not found
sh: 1: FOR: not found
sh: 1: NEXT: not found

ERROR in line 160: in dim_check(): array subscript var <M> pos <0> val <2> out
of range <0>-<1>.
```

Quant à `eliza.bas` (version de `mbcg.zip`), il y a un problème que je
ne comprends pas pour l'association entre les `READ` et les `DATA`. Le
programme  commence par  lire des  données alphabétiques.  Ensuite, au
moment  de lire  des  données  numériques, un  déphasage  fait que  le
pointeur interne des `DATA` pointe vers une donnée alphabétique. Et on
a encore les erreurs attribuées à `sh`.

```
bwBASIC: load "eliza.bas"
bwBASIC: run
                         ELIZA
                   CREATIVE COMPUTING
                 MORRISTOWN, NEW JERSEY
sh: 1: PRINT:PRINT:PRINT: not found
sh: 1: REM: not found
sh: 1: Syntax error: "(" unexpected

ERROR in line 140: expression <WHEN?> is not a numerical constant.
bwBASIC:
```


COPYRIGHT ET LICENCE
====================

Pour les textes
---------------

La documentation  de ce dépôt  est diffusée sous la  licence CC-BY-SA,
Creative Commons  avec clause de  paternité et partage  à l'identique.
Voir le
[site de Creative Commons](https://creativecommons.org/licenses/by-sa/4.0/deed.fr).

Copyright (c) 2026 Jean Forget

Si nécessaire, pour les programmes de ce dépôt
----------------------------------------------

Les programmes de ce dépôt sont sous la même licence que Perl : GPL et
licence  artistique.  Voir  le  texte (en  anglais)  dans  le  fichier
`LICENSE`.

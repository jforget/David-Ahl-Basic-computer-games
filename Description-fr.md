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

En fait, comme vous le lirez dans le paragraphe suivant, j'ai trouvé
une autre source pour le programme Eliza.

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
le format texte,  il y a de nombreuses erreurs  de transcription. Donc
autant utiliser les archives Zip.

INTERPRÉTEURS BASIC
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
de `morebasicgames.zip`)  génèrent une erreur : dans le cas de `bunny.bas` le
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
indique la version  3.40, disponible depuis 2025-10-23.  Le paquet APT
en est à la version 2.20pl2.

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

Quant à `eliza.bas` (version de `morebasicgames.zip`), il y a un problème que je
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

gambas
------

La [page web](https://gambaswiki.org/website/en/main.html)
indique la version 3.21.2, le paquet APT en est à la version 3.20.2.

La commande `gambas3` lance un environnement de développement complet,
pour créer non pas de simples programmes en ligne de commande, pas des
applications   graphiques  complètes.   C'est   trop  compliqué   pour
simplement  lancer (et  éventuellement adapter)  des programmes  créés
dans les années 1970.

yabasic
------

La [page web](https://2484.de/yabasic/)
indique  la version  2.91.4, disponible  depuis  le 31  août 2025.  Le
paquet APT en est à la version 2.91.1, datant du 24 janvier 2025.

La commande  `yabasic` prend  un nom de  fichier source  en paramètre.
S'il n'y a  pas de paramètre, la commande entre  dans une interface en
ligne de  commande où  vous pouvez  saisir votre  programme au  fil de
l'eau puis l'exécuter. Une fois le programme terminé (programme au fil
de l'eau ou fichier-programme), `yabasic` rend la main au shell. Si le
programme n'attend pas de données saisies par l'utilisateur, ou si les
données saisies  par l'utilisateur  peuvent être préparées,  l'appel à
`yabasic`  peut  s'intégrer à  un  _pipeline_  shell ou  utiliser  une
redirection `>`.

Exemple  avec  `love.bas`,  dans  lequel  l'utilisateur  anticipe  sur
l'unique demande d'entrée du programme :

```
echo bises | yabasic love.bas | less
```

Un  certain nombre  de  particularités syntaxiques  de  BASIC dans  la
version des années 1970 sont refusées par `yabasic` (tous les exemples
proviennent de `sinewave.bas`) :

* imprimer plusieurs arguments séparés par un point-virgule

  ```
  ---Error: syntax error
     10 PRINT TAB(30); "SINE WAVE"
                       ^~~~~~~~~~~
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

  Mais vous pouvez imprimer plusieurs arguments séparés par une virgule.

* détecter un mot-clé dissimulé à l'intérieur d'un identifiant

  ```
  ---Error in sinewave.bas, line 4:
  ---Error: syntax error
     40 REMARKABLE PROGRAM BY DAVID AHL
                   ^~~~~~~
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

* `GOTO` implicite dans un `IF ... THEN`

  ```
  ---Error in sinewave.bas, line 10:
  ---Error: syntax error
     140 IF B=1 THEN 180
                     ^~~
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

* un `IF ... THEN` doit être suivi d'un `ENDIF`

  ```
  ---Error in sinewave.bas, line 16:
  ---Error: a closing endif is expected before next
     200 NEXT T
         ^~~~
  ---Error: if-statement starting at line 10 has seen no 'endif' yet
     200 NEXT T
         ^~~~
  ---Error: syntax error
     200 NEXT T
              ^
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

  Vous pouvez utiliser [`FI`](https://2484.de/yabasic/yabasic.htm#ref_fi)
  à la place de `ENDIF`.

* la fonction `TAB` qui permet de générer une chaîne contenant _n_ espaces est inconnue

  ```
  ---Error in sinewave.bas, line 1:
  ---Error: 'TAB()' is neither array nor subroutine
     10 PRINT TAB(30), "SINE WAVE"
                    ^
  ---Error: Program stopped due to an error
  ```

  En fait, il faut utiliser la
  [fonction `string$()`](https://2484.de/yabasic/yabasic.htm#ref_string).

  Une autre possibilité,  c'est de créer une  fonction utilisateur. Il
  reste un hic, toutefois. La  fonction crée une chaîne de caractères,
  donc elle pourra s'appeler `TAB$` (ou `tab$`, attention à la casse),
  mais pas `TAB`.

  ```
  10 PRINT tab$(30), "SINE WAVE"
  20 PRINT tab$(15), "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
  [...]
  130 PRINT tab$(A);
  [...]
  300 sub tab$(n)
  310 return string$(n, " ")
  320 end sub
  ```

Vintage BASIC
-------------

Il n'y a pas de paquet APT pour Vintage BASIC, il faut aller chercher sur le
[site](http://vintage-basic.net/).
La version obtenue est 1.0.3.

Le première méthode d'installation que j'ai essayée est :

```
cp -R vintage-basic-1.0.3-linux-x86_64/bin ~/bin
cp -R vintage-basic-1.0.3-linux-x86_64/share ~/share
```

comme indiqué sur le
[site web](http://vintage-basic.net/download.html).
Cela ne fonctionne pas, mais

```
cp -R vintage-basic-1.0.3-linux-x86_64/bin/* ~/bin
cp -R vintage-basic-1.0.3-linux-x86_64/share/* ~/share
```

fonctionne  et   permet  d'avoir  un  exécutable   `vintbas`.  Il  est
obligatoire  de fournir  un nom  de  fichier source  en paramètre.  Le
programme BASIC est  exécuté puis `vintbas` rend la main  au shell. Le
fonctionnement  est ainsi  conforme aux  habitudes Unix  (_pipelines_,
redirection). En  revanche, il  n'y a  pas de mode  où l'on  saisit le
programme ligne par ligne avant de le lancer.

Tous les programmes venant  de `bcg.tar.gz` et de `morebasicgames.zip`
et  que j'ai  testés fonctionnent  tels  quels, sans  avoir besoin  de
modification.

Il faut  faire un peu  de ménage  dans le répertoire  de documentation
`~/share/doc`, car l'archive comporte  des fichiers cachés spécifiques
à Mac OSX.

```
  /home/jf/share/doc:
  drwxr-xr-x 3 jf jf 4096 févr.  4 19:14 .
  drwxrwxr-x 3 jf jf 4096 févr.  4 19:14 ..
  -rw-r--r-- 1 jf jf  120 févr.  4 19:14 ._.DS_Store
  -rw-r--r-- 1 jf jf 6148 févr.  4 19:14 .DS_Store
  -rwxr-xr-x 1 jf jf  176 févr.  4 19:14 ._vintage-basic-1.0.3
  drwxr-xr-x 3 jf jf 4096 févr.  4 19:14 vintage-basic-1.0.3
```

Par acquit de conscience, j'ai essayé les autres façons d'installer l'interpréteur.

```
sudo cp -R vintage-basic-1.0.3-linux-x86_64/bin /usr/local/bin
sudo cp -R vintage-basic-1.0.3-linux-x86_64/share /usr/local/share
```

Comme  précédemment,  il  faut  ajouter  des  étoiles  pour  que  cela
fonctionne.

```
sudo cp -R vintage-basic-1.0.3-linux-x86_64/bin/* /usr/local/bin
sudo cp -R vintage-basic-1.0.3-linux-x86_64/share/* /usr/local/share
```

Également, pensez à faire le ménage dans `/usr/local/share/doc`.

Pour l'installation à partir des sources, l'archive
`vintage-basic-1.0.3.tar.gz` ne doit pas être téléchargée à partir de
`http://www.vintage-basic.net/downloads.html` ("download" au pluriel,
ainsi que le lien est codé), mais à partir de l'adresse
[`http://vintage-basic.net/download.html`](http://vintage-basic.net/download.html),
("download" au singulier) ou bien à partir de
[Hackage](https://hackage.haskell.org/package/vintage-basic)
(pas testé). Je n'ai pas testé non plus l'installation à partir du clone de
[Github](https://github.com/lylek/vintage-basic).

L'installation de
[Stack](http://haskellstack.org/)
se fait  à partir des packages  APT de xubuntu. On  obtient la version
2.15.7. La commande

```
stack setup
```

a pris un temps  certain, car sur ma machine elle  a dû installer GHC.
Très tôt, il y a eu un avertissement :

```
Warning: Stack has not been tested with GHC versions 9.10 and above, and using 9.10.3, this may fail.
Preparing to install GHC (tinfo6) to an isolated location. This will not interfere with any system-level installation.
```

puis  de nombreux  messages d'erreur  du genre  `mkdir impossible`  ou
`write impossible` pour se terminer par

```
Error: [S-7441]
       Received ExitFailure 2 when running
       Raw command: /usr/bin/tar Jxf /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.tar.xz
       Run from: /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.temp/

       Error encountered while unpacking GHC with
         tar Jxf /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.tar.xz
         run in /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.temp/

       The following directories may now contain files, but won't be used by Stack:
       * /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.temp/
       * /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3/

       For more information consider rerunning with --verbose flag.
```

J'ai préféré laisser tomber cette méthode d'installation basée sur les
sources. L'installation de l'archive binaire fonctionne très bien.

ÉMULATEURS DE MACHINES BASIC
============================

Un moyen détourné d'installer un interpréteur BASIC est d'installer un
émulateur ciblant un PC de la génération qui a commencé avec les Apple
II, les  Pet Commodore et  les TRS80. Dans  le cas de  la distribution
xubuntu, il  existe des  paquets APT  pour émuler  un ZX  Spectrum, un
Commodore ou un TRS80.

Je note également un émulateur pour  les consoles de jeux Atari 800 et
2600, mais je  ne sais pas si ces consoles  comportent un interpréteur
BASIC. Même interrogation à propos des émulateurs KC85, MSX

fbzx
----

Le [site web](https://rastersoft.com/programas/fbzx.html)
annonce  la version  4.8.0 depuis  2021, c'est  cette version  qui est
proposée parmi les paquets APT.

J'y  ajoute  le  paquet  `zmakebas`  (version  1.2b),  qui  permet  de
convertir  un  fichier source  de  programme  BASIC en  fichier  bande
magnétique.

Pour utiliser le programme `test1.bas`, commencer par créer une « bande
magnétique » avec

```
zmakebas -n test1 -o test1.tap test1.bas
```

Ensuite,  lancer l'exécutable  `fbzx`, sélectionner  le fichier  bande
avec `F1  F3 1`,  puis sélection habituelle  dans une  arborescence de
fichiers, `ESC F1 F6 ESC` et  l'on revient à l'écran du Spectrum. Mais
lorsque l'on tape `R` (pour « run ») ou `K` (pour « list »), on ne lit
rien.

Autre tentative. Je sélectionne le fichier  bande avec `F1 F3 1` comme
précédemment, puis je  reviens à l'écran du Spectrum  avec `Esc`. Puis
je lance la commande

```
load "test1"
```

Il se  passe quelque chose. Au  lieu d'un écran complètement  gris, la
fenêtre  du Spectrum  affiche un  cadre entourant  un centre  gris. Ce
cadre est tantôt cyan, tantôt rouge. Cela dure plusieurs minutes, puis
je perds patience et j'interromps l'émulateur. Encore raté, tant pis.

Commandes utiles :

| Touche(s) | Fonction              | Sortie |
| :-------- | :-------------------  | :----- |
| F1        | Aide en ligne         | ESC    |
| F1 F8 1   | Affichage du clavier  | ESC    |
| F1 F3 1   | Sélection d'une bande | ESC    |
| F1 F6     | Jouer la bande        | ESC    |
| K         | List                  |        |
| R         | Run                   |        |
| J         | Load                  |        |
| Ctrl-P    | double-quote          |        |

Néanmoins,  je n'arrive  pas  à récupérer  le  programme contenu  dans
`test1.tap` et à le lister ou  l'exécuter. Je peux taper un programme,
mais cela  nécessite l'affichage  fréquent du clavier  par `F1  F8 1`,
pour obtenir la  correspondance entre les mots-clés et  les touches du
clavier.

Inutilisable, sauf pour des programmes très très courts.

### Utilisation du clavier

En héritage du ZX80 et du ZX81, la saisie au clavier du ZX Spectrum et
de ses émulateurs utilise un curseur multiforme, rappelant un automate
à états finis. Voici une description approximative de cet automate.

Curseur K : en début de ligne  (avec ou sans numéro de ligne) ou après
un  séparateur  « `:` », on  attend  un  mot-clé d'instruction  ou  un
chiffre (numéro de ligne).

Curseur L :  une fois que l'on  a tapé le mot-clé blanc,  on attend en
général un  nombre, un nom  de variable,  un mot-clé de  fonction (par
opposition à mot-clé d'instruction) ou une chaîne de caractères.

Curseur C :  variante du curseur L, lorsque l'on  a activé `Caps-Lock`
(`shift-é` sur AZERTY, `shift-2` sur QWERTY ou QWERTZ).

Curseur  E  : pour  saisir  un  paramètre  étendu.  Le curseur  E  est
sélectionné en  appuyant sur  Ctrl-Shift, puis  en relâchant  les deux
touches.  Il   disparaît  dès   que  vous   avez  tapé   le  caractère
sélectionnant le paramètre  étendu ou lorsque vous  appuyez de nouveau
sur Ctrl-Shift.

Curseur  G :  pour  saisir  un caractère  graphique  ou  une série  de
caractères  graphiques.  Le  curseur  G est  activé  en  sélectionnant
`Graphics` (`shift-ç` sur mon clavier AZERTY, `shift-9` sur un clavier
QWERTY /  QWERTZ). Il est  désactivé de  la même manière,  sachant que
dans ce cas, le modificateur `shift` est facultatif.

![clavier obtenu par F1 F8 1](Spectrum-keyboard.png)

Prenons l'exemple de la touche « Q ».

| On veut                       | exemple | Curseur      | Taper             |
| :---------------------------- | :------ | :----------: | :---------------- |
| La lettre majuscule           | Q       |      L       | Shift-q           |
| La lettre majuscule           | Q       |      C       | q ou Shift-q      |
| La lettre minuscule           | q       |      L       | q                 |
| Le mot-clé blanc              | PLOT    |      K       | q ou Shift-q      |
| La chaîne rouge à côté        | <=      | K ou L ou C  | Ctrl-q            |
| Le mot-clé vert au-dessus     | SIN     |      E       | q                 |
| Le mot-clé rouge en-dessous   | ASN     |      E       | Ctrl-q ou Shift-q |

Utilisation de la  rangée supérieure du clavier,  en prenant l'exemple
de la première touche, « `&` » sur  mon clavier AZERTY (ou « `1` » sur
un clavier QWERTY / QWERTZ).

| On veut                           | exemple | Curseur     | Taper   |
| :-------------------------------- | :------ | :---------: | :------ |
| Le chiffre                        | 1       | K ou L ou C | &       |
| L'instruction en blanc au-dessus  | EDIT    | K ou L ou C | Shift-& |
| Le caractère graphique à côté     | ▝       |      G      | &       |
| Car. graphique en vidéo inverse   | ▙       |      G      | Shift-& |
| Le caractère ASCII rouge à côté   | !       | K ou L ou C | Ctrl-&  |
| La couleur de fond                | BLUE    |      E      | &       |
| La couleur des caractères         | BLUE    |      E      | Shift-& |
| L'instruction en rouge au-dessous | EDIT    |      E      | Ctrl-&  |

Lorsque l'on utilise  des touches alphabétiques avec le  curseur G, la
plupart du  temps on obtient  la lettre majuscule. Il  existe quelques
exceptions,  qui  ne  sont  pas  mentionnées  dans  la  copie  d'écran
ci-dessus

| Touche | Fonction |
| :----: | :------- |
|   V    | RND      |
|   X    | PI       |
|   W    | INKEY$   |
|   Y    | FN       |
|   Z    | POINT    |

fuse-emulator, variante SDL
---------------------------

Existe en  deux versions, `fuse-emulator-gtk`  et `fuse-emulator-sdl`,
version  3.6.0  dans  les  deux  cas. Voici  le  test  de  la  version
`fuse-emulator-sdl`. L'exécutable s'appelle `fuse`. Comme pour `fbzx`,
j'ajoute le paquet `zmakebas`.

Au démarrage,  la fenêtre est  très petite. Mais  avec F1 →  Options →
Full screen, on obtient quelque chose de lisible.

Pour  taper un  programme ou  des instructions,  le fonctionnement  du
clavier  est  le  même  que   pour  FBZX.  Reportez-vous  à  ce
[mode d'emploi](#utilisation-du-clavier).

Pour charger un programme, il faut avoir créé un fichier bande avec

```
zmakebas -n test1 -o test1.tap test1.bas
```

Pour  charger le  fichier  bande,  il y  a  deux  façons. La  première
consiste à  lancer l'émulateur depuis la  ligne de commande Unix  et à
fournir le nom du fichier bande en paramètre.

```
fuse test1.tap
```

La seconde façon : pour charger le fichier bande, sélectionner dans le
menu applicatif  F1 →  Media →  Tape → Open,  puis choisir  le fichier
`test1.tap`.  Attention, les  fichiers sources  `xxx.bas` ne  sont pas
filtrés dans la liste des fichiers. Ensuite, dans la ligne de commande
du Spectrum, taper `LOAD ""` (touches J, Ctrl-P, Ctrl-P).

Attention, dans les  deux cas, le source BASIC doit  correspondre à la
version utilisée  par le Spectrum.  Par exemple, le mot-clé  `LET` est
obligatoire et le mot-clé `END` est  infini. Faute de quoi, vous aurez
une erreur du genre

```
C Nonsense in BASIC, 10:1
```

La  conséquence  est   que  pour  utiliser  les   fichiers  source  de
`bcg.tar.gz` ou de `morebasicgames.zip`, il  y aura un certain travail
d'adaptation à effectuer avant de générer les fichiers bandes.

fuse-emulator, variante GTK
---------------------------

La fenêtre  de départ est  toute petite,  comme pour la  variante SDL.
J'ai de plus un avertissement concernant la ROM originale du Spectrum,
qui n'a  pas pu être trouvée.  Mais en sélectionnant Options  → Select
ROMs → Machine ROMs, j'ai un choix pour « Spectrum 48K... ».

La  fenêtre est  toute  petite.  Le menu  du  gestionnaire de  fenêtre
propose bien  les choix  « maximiser », « redimensionner »  et « plein
écran », mais  ils sont  inopérants, la fenêtre  reste à  sa dimension
d'origine.

Le choix Media → Tape → Open  (ou la touche F7) permet de sélectionner
`test1.tap`. À l'inverse de la variante SDL, les fichiers sont filtrés
pour éviter d'afficher les fichiers `xxx.bas`.

Ensuite,  je n'arrive  pas  à  taper la  commande  `load "test1"`.  Le
raccourci  `J` pour  « load » ne  fonctionne  pas, mais  ce n'est  pas
grave, je  peux taper la  commande en  toutes lettres et  l'espace qui
suit. Pour  les doubles quotes, je  dois taper `Ctrl-P` comme  avec la
version SDL. Le problème bloquant, c'est pour taper le chiffre 1. Cela
ne fonctionne  pas, ni avec  le pavé numérique,  ni avec la  rangée du
haut du clavier, avec ou sans Shift, avec ou sans Ctrl.

En revanche, je  peux charger le programme avec la  commande `load ""`
sans donner le nom du programme. Je  peux le lister, mais la ligne `20
end`  est remplacée  par une  ligne `3328  DELETE end`.  Pourquoi ? Et
l'exécution avec `run` se traduit pas un message d'erreur de syntaxe.

spectemu-x11
------------

La version  du paquet APT  est 0.94a. L'exécutable  s'appelle `xspect`
pour  l'utilisation sous  X11. Il  y a  également `vgaspect`  pour une
utilisation à partir  de la console, mais il n'a  pas été installé sur
ma   machine.  D'un   autre   côté,  si   le   paquet  APT   s'appelle
`spectemu-x11`...

Pour utiliser un fichier bande, il faut spécifier le nom du fichier en
paramètre  de la  commande  `xpesct`.  Le chargement  se  fait par  la
commande

```
load "test1"
```

Après avoir lancé la commande `load`,  la fenêtre xterm signale que la
bande est en pause. Il faut  donc la réactiver avec la touche fonction
`F6`. On obtient un affichage  légèrement semblable à l'affichage avec
`fbzx`, mais beaucoup  plus bref, et le programme est  chargé.

Comme pour [fuse](#fuse-emulator-variante-sdl),
le source  du programme  doit correspondre à  la variante  Spectrum de
BASIC, où  l'instruction `LET` est obligatoire  et l'instruction `END`
est interdite.  Donc, comme pour  fuse, il  y aura un  certain travail
d'adaptation à  effectuer avant de  générer les fichiers  bandes. pour
utiliser    les    fichiers    source   de    `bcg.tar.gz`    ou    de
`morebasicgames.zip`.

### Utilisation du clavier dans Spectemu

Comme pour  le Spectrum  et ses  émulateurs FBZX  et Fuse,  le curseur
possède plusieurs  états K, L,  C, G et E.  Le problème est  que, pour
l'instant, je n'ai réussi à activer que les états K et L.

Une autre  particularité de Spectemu,  c'est que les touches  Shift de
mon  clavier ne  sont pas  équivalentes, elles  donnent des  résultats
différents dans  l'émulateur Spectemu.  La touche  de gauche  donne la
lettre majuscule, la touche de droite donne le mot-clé ou la chaîne de
caractères en rouge  à côté de la lettre (« `<=` »  pour Q, « `STOP` »
pour A, etc).

En  appuyant sur  F1,  l'émulateur  affiche un  texte  d'aide dans  la
fenêtre  de la  ligne de  commande Unix.  En appuyant  sur Ctrl-K,  on
obtient une nouvelle fenêtre affichant  le clavier du Spectrum. Il est
possible  de cliquer  sur  les  touches de  ce  clavier,  mais il  est
impossible  avec la  souris  d'activer simultanément  la touche  `CAPS
SHIFT` et une touche normale, ou  bien la touche `SYMBOL SHIFT` et une
touche normale.

Sur mon clavier  AZERTY, le pavé numérique ne permet  pas de taper les
chiffres. Il  faut utiliser  la rangée  supérieure du  pavé principal,
bien  entendu avec  la touche  `SHIFT` (celle  de gauche  ou celle  de
droite,  peu importe  dans ce  cas),  tandis que  l'utilisation de  la
touche sans modificateur donne le caractère spécial habituel : « `&` »
pour la touche  « 1 », double quote pour la touche  « 3 », et ainsi de
suite. Si le  caractère n'est pas reconnu par le  Spectrum (« é » pour
la touche  « 2 », « ç » pour  la touche « 9 »), l'émulateur  ignore la
touche si elle n'a pas de modificateur `SHIFT`

vice
----

La version du paquet APT est la version 3.9+dfsg.

Ainsi qu'il est  marqué dans les instructions  présentées par Synaptic
pour le paquet `vice`,  le paquet ne fournit pas les  ROM, il faut les
télécharger  en  fonction  de  ce  qui  est  marqué  dans  le  fichier
`README.ROMs`, c'est-à-dire le fichier
`/usr/share/doc/vice/README.ROMs`.
J'ai ainsi téléchargé un  fichier `vice-1.5-roms.tar.gz`, puis dézippé
et  détarré.  Le  répertoire `vice-1.5.roms/data/C64`  contient  trois
fichiers qu'il  faut installer dans `~/.local/share/vice/C64`.  Il m'a
toutefois fallu plusieurs tentatives  pour comprendre qu'il faut aussi
les renommer :

* `basic-901226-01.bin`

* `chargen-901225-01.bin`

* `kernal-901227-03.bin`

On peut alors lancer l'exécutable `x64`.  Mais ensuite, je ne sais pas
comment charger un  source BASIC dans la machine, à  moins de le taper
du début jusqu'à la fin. Les menus permettent d'attacher des images de
disque, des images de « datassette »  et des images de cartouche, mais
je ne sais pas comment convertir  un fichier source `test1.bas` en une
telle image. Je suppose que `zmakebas` ne me sera d'aucun secours.

J'abandonne cette  idée pour l'instant. Inutile  de tester l'émulation
des Pet et des VIC-20, je serais bloqué au même endroit.

xtrs
----

Comme pour `vice`, ce paquet est incomplet, il faut se procurer la ROM
quelque  part. J'ai  décidé  d'arrêter là  et de  ne  pas analyser  ce
paquet.

LANGAGE BASIC
=============

On brocarde  souvent les objets ou  concepts conçus ou définis  par un
comité. La plaisanterie traditionnelle est

> Regardez le chameau, on dirait que  c'est un cheval tel que l'aurait
> conçu un comité.

Il y  a pis. Dans  le chapitre 2 de  son roman _Le  Dernier Restaurant
avant la fin du monde_, Douglas Adams décrit un vaisseau spatial ainsi

> Comme tous les vaisseaux vogons,  il ne ressemblait pas au résultat
> d'une conception, mais plutôt au résultat d'une congélation.

(Traduction par mes soins, j'ai lu le livre en V.O.)

En fait, certains  langages ont été initialement conçus  par un comité
ou bien leur définition est mise à  jour par un comité, comme C ou Ada
et le résultat  est, somme toute, tout-à-fait correct. On  ne peut pas
en  dire  autant  de  certains  langages, comme  BASIC,  qui  ont  été
congelés.

Noms de variables
-----------------

Dans le premier livre de programmation  BASIC que j'ai lu, les noms de
variable étaient soit  des noms à une lettre (`A`,  `B`, etc) soit des
noms  formés  d'une lettre  et  d'un  chiffre  (`A0`, `A1`,  etc).  En
d'autres termes,  les noms de variable  devaient vérifier l'expression
rationnelle `/^[A-Z][0-9]?$/`. Cela donnait  donc 286 noms de variable
différents. Le  livre ajoutait que  si ce n'était pas  suffisant, vous
pouviez utiliser les  tableaux pour stocker plusieurs  valeurs dans la
même variable.

Je ne me souviens plus si  ce livre mentionnait les variables stockant
des chaînes de caractères (`A$`, `B1$`). Je les laisse de côté dans la
suite de ce chapitre.

En  survolant  les  livres  de  D.  Ahl,  j'ai  l'impression  que  les
programmes de  `bcg.tar.gz` et  de `morebasicgames.zip`  suivent cette
règle.

Puis j'ai  lu un livre  sur le PET  Commodore. Sur cette  machine, les
variables   pouvaient   avoir   un   nom   de   plusieurs   caractères
alphanumériques, peut-être  jusqu'à 8  ou jusqu'à  16, sachant  que le
premier devait  être obligatoirement une  lettre, ce qui  correspond à
l'expression  rationnelle  `/^[A-Z][A-Z0-9]*$/`. Plus  une  contrainte
exposée dans le chapitre suivant.

Cela  permettait d'avoir  des noms  plus clairs.  Le hic,  c'était que
seuls les  deux premiers  caractères étaient significatifs.  Ainsi, le
programme

```
10 INDEX = 1
20 INITIAL = 3
30 PRINT INDEX
```

aurait affiché  « `3` ». Cela  donne 936 variables  différentes. C'est
ainsi que fonctionne `vintbas`.

Ultérieurement, sont apparues  des machines qui tenaient  compte de la
totalité  des  caractères des  noms  de  variable.  C'est le  cas  des
interpréteurs et des émulateurs que j'ai testés : `brandy`, `bwbasic`,
`yabasic`, `fuse` et `xspect` affichent tous « `1` ».

Remarquons  que la  première  version  donne quand  même  286 noms  de
variable différents.  C'est plus qu'il  n'en faut pour  des programmes
fonctionnant  sur des  machines de  48 Ko  de mémoire.  Dans les  gros
programmes apparus depuis  (noyau Linux, par exemple),  il existe plus
de 286 variables. Mais avec les  règles de visibilité, je pense que le
nombre de  variables visibles à  tel ou  tel point du  programme reste
limité, vraisemblablement en-deçà de 286. Le principal défaut de cette
version, c'est que les noms sont arbitraires et peu explicatifs. C'est
seulement  gênant pour  les  jeux  diffusés par  David  Ahl, c'est  en
revanche  très pénalisant  dans le  cas d'un  programme sérieux  et de
taille importante, comme le noyau Linux.

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

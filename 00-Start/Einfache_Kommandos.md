
# Einfache Kommandos

`pwd` ist das Kommando was mir anzeigt, wo mein aktuelles Arbeitsverzeichnis ist.


```bash
pwd
```

    /home/vagrant/rdf/bsa/hands-on-bsa/00-Start


Mit dem Kommando `ls` werden mir Dateien/Verzeichnisse im aktuellen Arbeitsverzeichnis ausgegeben. Die Optionen `-lachi` steht für __long__ __all__ __sort create time__ __human__ und __inode__


```bash
ls -lachi
```

    insgesamt 76K
    6955078 drwxrwxr-x 3 vagrant vagrant 4,0K Okt 17 08:07 .
    6954996 drwxrwxr-x 4 vagrant vagrant 4,0K Okt 17 07:58 ..
    6955080 -rw-rw-r-- 1 vagrant vagrant  22K Okt 17 07:58 00-Aufsetzen-des-Containers.ipynb
    6955081 -rw-rw-r-- 1 vagrant vagrant  19K Okt 17 07:58 01-SSH.ipynb
    6955079 -rw-rw-r-- 1 vagrant vagrant   25 Okt 17 07:58 .gitignore
    6955089 drwxr-xr-x 2 vagrant vagrant 4,0K Okt 17 08:07 .ipynb_checkpoints
    6955082 -rw-rw-r-- 1 vagrant vagrant  990 Okt 17 07:58 lxc-attach.log
    6955083 -rw-rw-r-- 1 vagrant vagrant  904 Okt 17 07:58 ssh.log
    6955084 -rw-rw-r-- 1 vagrant vagrant  191 Okt 17 07:58 start-bsa.sh
    6955099 -rw-r--r-- 1 vagrant vagrant   72 Okt 17 08:07 Untitled.ipynb



```bash
ls --help
```

    Aufruf: ls [OPTION]... [DATEI]...
    Auflistung von Informationen über die DATEIen (Standardvorgabe ist das
    momentane Verzeichnis). Alphabetisches Sortieren der Einträge, falls weder
    -cftuvSUX noch --sort angegeben wurden.
    
    Erforderliche Argumente für lange Optionen sind auch für kurze erforderlich.
      -a, --all                  Einträge, die mit . beginnen, nicht verstecken
      -A, --almost-all           implizierte . und .. nicht anzeigen
          --author               mit -l, den Urheber jeder Datei ausgeben
      -b, --escape               nicht‐druckbare Zeichen oktale ausgeben
          --block-size=GRÖßE     GRÖßE große Blöcke verwenden. So gibt z.B
                                   „--block-size=M“ die Größen in Einheiten von
                                   1,048,576 Bytes aus. Siehe GRÖßE Format unten.
      -B, --ignore-backups       implizite Einträge, die mit ~ enden, nicht ausgeben
      -c                         mit -lt: Sortieren nach und Anzeige von ctime 
                                   (Zeit der letzten Veränderung der Datei‐Status‐
                                   informationen); mit -l: ctime anzeigen und nach
                                   Namen sortieren
      -C                         Einträge mehrspaltig ausgeben
          --color[=WANN]         Kontrolle, wann Farbe zum Unterscheiden der
                                 Dateitypen eingesetzt wird; WANN kann
                                 „never“ (nie), „always“ (immer) oder „auto“
                                 sein
      -d, --directory            Verzeichnis‐Einträge statt der Inhalte anzeigen,
                                   symbolische Verknüpfungen nicht verfolgen
      -D, --dired                Ausgabe für den „dired“‐Modus im Emacs formatieren
      -f                         nicht sortieren, -aU an‐ und -ls --color abschalten
      -F, --classify             ein Zeichen (aus */=>@|) zur Typisierung anhängen
          --file-type            genauso, aber kein „*“ anhängen
          --format=WORT          across -x, commas -m, horizontal -x, long -l,
                                   single-column -1, verbose -l, vertical -C
          --full-time            wie -l --time-style=full-iso
      -g                         wie -l, aber Eigentümer nicht auflisten
          --group-directories-first
                                 Verzeichnisse vor den Dateien gruppieren;
                                   kann zusammen mit Sortierung benutzt werden,
                                   doch --sort=none schaltet Gruppierung ab
      -G, --no-group             in Langform Gruppennamen nicht auflisten
      -h, --human-readable       in Langform Größenangaben in menschenlesbarem
                                   Format ausgeben (z. B. 1K 234M 2G)
          --si                   genauso, aber mit 1000 statt 1024 als Teiler
      -H, --dereference-command-line   symbolischen Verknüpfungen, die auf der
                                   Kommandozeile aufgeführt sind, folgen
          --dereference-command-line-symlink-to-dir
                                 symbolischen Verknüpfungen auf der Kommandozeile,
                                   die auf Verzeichnisse zeigen, folgen
          --hide=MUSTER          implizite Einträge, auf die Shell‐MUSTER passt,
                                   nicht auflisten (überschrieben durch -a oder -A)
          --indicator-style=WORT  Indikator des Stils WORT an Namen der Einträge
                                   anhängen: „none“ (Standardvorgabe), „slash“ (-p)
                                   „file-type“ (--file-type), „classify“ (-F)
      -i, --inode                mit -l, Inode‐Nummer ausgeben
      -I, --ignore=MUSTER        implizierte Einträge, auf die Shell‐MUSTER
                                   passt, nicht auflisten
      -k, --kibibytes            benutzt 1024 Byte Blöcke
      -l                         lange Listenformat verwenden
      -L, --dereference          bei symbolischen Verknüpfungen die Eigenschaften
                                   der jeweiligen Zieldatei anzeigen
      -m                         so viele Einträge wie möglich, durch Kommata
                                   getrennt, in eine Zeile packen
      -n, --numeric-uid-gid      wie -l, aber numerische UIDs und GIDs anzeigen
      -N, --literal              rohe Eintragsnamen anzeigen (z. B. Kontroll‐
                                   zeichen nicht besonders behandeln)
      -o                         wie -l, aber ohne Gruppen‐Informationen
      -p, --indicator-style=slash  an Verzeichnisse ein „/“ anhängen
      -q, --hide-control-chars   print ? instead of nongraphic characters
          --show-control-chars   show nongraphic characters as-is (the default,
                                   unless program is 'ls' and output is a terminal)
      -Q, --quote-name           enclose entry names in double quotes
          --quoting-style=WORD   use quoting style WORD for entry names:
                                   literal, locale, shell, shell-always,
                                   shell-escape, shell-escape-always, c, escape
      -r, --reverse              umgekehrte Reihenfolge beim Sortieren
      -R, --recursive            Unterverzeichnissen rekursiv ausgeben
      -s, --size                 die Größe jeder Datei in Blöcken ausgeben
      -S                         nach Dateigröße sortieren
          --sort=WORT            nach WORT anstatt nach Name sortieren: none -U
                                   extension -X, size -S, time -t, version -v
          --time=WORT            mit -l, Zeit als WORT statt der Änderungszeit:
                                   atime -u, access -u, use -u, ctime -c, status -c;
                                   die angegebene Zeit als Sortierkriterium
                                   bei --sort=time verwenden
          --time-style=STIL      mit -l, Zeiten mittels Stil STIL anzeigen:
                                   full-iso, long-iso, iso, locale, +FORMAT
                                 FORMAT wie bei „date“; hat FORMAT die Form
                                 FORMAT1<newline>FORMAT2, wird FORMAT1 für nicht
                                 kürzlich geänderte Dateien verwendet und FORMAT2
                                 für kürzlich geänderte; beginnt STIL mit „posix-“,
                                 ist STIL nur außerhalb der POSIX‐Locale gültig
      -t                         nach Änderungszeit sortieren, neueste zuerst
      -T, --tabsize=SPALTEN      Tabstops statt alle 8 alle SPALTEN Zeichen setzen
      -u                         mit -lt: Sortieren nach und Anzeige von
                                 Zugriffszeit; mit -l: Anzeige von Zugriffszeit
                                 und nach Namen sortieren; sonst: nach Zugriffszeit
      -U                         nicht sortieren; Einträge in Reihenfolge des
                                   Verzeichnisses auflisten
      -v                         natürliche Ordnung von Versionsnummern innerhalb
                                   von Text
      -w, --width=COLS           set output width to COLS.  0 means no limit
      -x                         list entries by lines instead of by columns
      -X                         sort alphabetically by entry extension
      -Z, --context              print any security context of each file
      -1                         list one file per line.  Avoid '\n' with -q or -b
          --help     diese Hilfe anzeigen und beenden
          --version  Versionsinformation anzeigen und beenden
    
    GRÖẞE ist eine Ganzzahl und eine optionale Einheit (Beispiel: 10M sind
    10*1024*1024). Einheiten sind K, M, G, T, P, E, Z, Y (Potenzen von 1024) oder
    KB, MB, ... (Potenzen von 1000).
    
    Die Verwendung von Farben um Dateitypen zu unterscheiden ist normalerweise
    oder bei Angabe von --color=never unterbunden. Bei --color=auto werden nur
    dann Farben verwendet, wenn die Standardausgabe mit einem Terminal verbunden
    ist. Die Umgebungsvariable LS_COLORS kann die Einstellungen verändern.
    Verwenden Sie den Befehl dircolors um sie zu setzen.
    
    Rückgabewert:
     0  wenn alles in Ordnung,
     1  bei kleineren Problemen (z. B. kein Zugriff auf Unterverzeichnis),
     2  bei großem Ärger (z. B. kein Zugriff auf Kommandozeilenargument).
    
    GNU coreutils Onlinehilfe: <http://www.gnu.org/software/coreutils/>
    Melden Sie Übersetzungsfehler für ls an <translation-team-de@lists.sourceforge.net>
    Die vollständige Dokumentation ist hier: <http://www.gnu.org/software/coreutils/ls>
    oder auch lokal mittels „info '(coreutils) ls invocation'“



```bash
ansible --version
```

    ansible 2.4.0.0
      config file = /etc/ansible/ansible.cfg
      configured module search path = [u'/home/vagrant/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
      ansible python module location = /usr/lib/python2.7/dist-packages/ansible
      executable location = /usr/bin/ansible
      python version = 2.7.12 (default, Nov 19 2016, 06:48:10) [GCC 5.4.0 20160609]


Ansible ist in der Version 2.4.0.0 installiert mehr in AIS.


```bash
inspec --version
```

    Der Befehl »inspec« wurde nicht gefunden, meinten Sie vielleicht:
     Befehl »inspect« aus dem Paket »libboost1.58-tools-dev« (main)
    inspec: Befehl nicht gefunden.





```bash

```

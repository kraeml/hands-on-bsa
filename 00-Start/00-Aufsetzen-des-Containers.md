
# Aufsetzen des Containers

Wir arbeiten mit LXC https://wiki.ubuntuusers.de/LXC/.

> LinuX Container (LXC) bieten die Möglichkeit, Prozesse und Prozessgruppen zu isolieren, indem Kernel-Ressourcen virtualisiert und gegeneinander abgeschottet werden. Dies wird mit Hilfe der im Kernel enthaltenen Cgroups realisiert. Mit LXC kann man entweder einzelne Anwendungen oder ganze Linux-Distributionen in einem Container starten. Ähnliche Konzepte gibt es bei Linux-VServer oder Jails (FreeBSD) oder Zones (Solaris).

## Installation prüfen

Pakete sollten installiert sein:

* lxc
* debootstrap
* bridge-utils

Das Paket `lxc` ist nicht installiert. Dies wurde aus den neusten Quellen kompaliert. `debootstrap` ist als Paket installiert. Das Paket `bridge-utils` ist nicht installiert.

Mit `apt-cache policy` bzw. `apt policy` kann geprüft werden, welche Pakete installiert sind oder nicht.


```bash
sudo lxc-config -l
```

    lxc.default_config
    lxc.lxcpath
    lxc.bdev.lvm.vg
    lxc.bdev.lvm.thin_pool
    lxc.bdev.zfs.root
    lxc.cgroup.use
    lxc.cgroup.pattern



```bash
apt-cache policy debootstrap
```

    debootstrap:
      Installiert:           1.0.78+nmu1ubuntu1.4
      Installationskandidat: 1.0.78+nmu1ubuntu1.4
      Versionstabelle:
     *** 1.0.78+nmu1ubuntu1.4 500
            500 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages
            500 http://us.archive.ubuntu.com/ubuntu xenial-updates/main i386 Packages
            100 /var/lib/dpkg/status
         1.0.78+nmu1ubuntu1 500
            500 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 Packages
            500 http://us.archive.ubuntu.com/ubuntu xenial/main i386 Packages



```bash
apt policy bridge-utils
```

    bridge-utils:
      Installiert:           (keine)
      Installationskandidat: 1.5-9ubuntu1
      Versionstabelle:
         1.5-9ubuntu1 500
            500 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 Packages


## Auflisten von vorhandenen Containern

Mehr zu lxc-ls mit lxc-ls --help.


```bash
sudo lxc-ls --fancy
```

## Die bsa-bashy


```bash
sudo lxc-create --template ubuntu --name bsa-bashy
```

    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    Checking cache download in /var/cache/lxc/xenial/rootfs-amd64 ... 
    Copy /var/cache/lxc/xenial/rootfs-amd64 to /var/lib/lxc/bsa-bashy/rootfs ... 
    Copying rootfs to /var/lib/lxc/bsa-bashy/rootfs ...
    Generating locales (this might take a while)...
      de_DE.UTF-8... done
    Generation complete.
    debconf: kann Oberfläche nicht initialisieren: Dialog
    debconf: (Die Dialog-Oberfläche funktioniert nicht auf einem Dumb-Terminal, einem Emacs-Shellbuffer oder ohne ein steuerndes Terminal.)
    debconf: greife zurück auf die Oberfläche: Readline
    debconf: kann Oberfläche nicht initialisieren: Readline
    debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
    debconf: greife zurück auf die Oberfläche: Teletype
    Creating SSH2 RSA key; this may take some time ...
    2048 SHA256:n/3y6oPYDcLZd1BkT2BN4tMdxmGuPZL7YfDT7b/AAsw root@rdf-dev (RSA)
    Creating SSH2 DSA key; this may take some time ...
    1024 SHA256:2J3e32dygiNMVtABSfCe4/lDeizkwCUjLJI2ZIfxjRY root@rdf-dev (DSA)
    Creating SSH2 ECDSA key; this may take some time ...
    256 SHA256:yE77AB5AN9e/mpWztboimLhfgXnv5QG3ULlkjZ5d/B4 root@rdf-dev (ECDSA)
    Creating SSH2 ED25519 key; this may take some time ...
    256 SHA256:H5El6UJ2AD3stGKUT0RUGaddIsKzaTujokJDu78LJ4Q root@rdf-dev (ED25519)
    invoke-rc.d: could not determine current runlevel
    invoke-rc.d: policy-rc.d denied execution of start.
    
    Current default time zone: 'Etc/UTC'
    Local time is now:      Tue Oct 17 08:45:03 UTC 2017.
    Universal Time is now:  Tue Oct 17 08:45:03 UTC 2017.
    
    
    ##
    # The default user is 'ubuntu' with password 'ubuntu'!
    # Use the 'sudo' command to run tasks as root in the container.
    ##
    
    The configuration file contains legacy configuration keys.
    Please update your configuration file!


### Auflisten der bsa-bashy


```bash
sudo lxc-ls bsa-bashy --fancy
```

    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    NAME      STATE   AUTOSTART GROUPS IPV4 IPV6 
    bsa-bashy STOPPED 0         -      -    -    


Die Meldung:

```
The configuration file contains legacy configuration keys.
Please update your configuration file!
```

bekommen wir mit folgendem Befehl weg:


```bash
sudo lxc-update-config -c /var/lib/lxc/bsa-bashy/config
```


```bash
sudo lxc-ls bsa-bashy --fancy
```

    NAME      STATE   AUTOSTART GROUPS IPV4 IPV6 
    bsa-bashy STOPPED 0         -      -    -    


### Starten der bsa-bashy


```bash
sudo lxc-start --name bsa-bashy
sleep 5
sudo lxc-ls bsa-bashy --fancy
```

    NAME      STATE   AUTOSTART GROUPS IPV4      IPV6 
    bsa-bashy RUNNING 0         -      10.0.3.27 -    


### Stoppen der bsa-bashy


```bash
sudo lxc-stop --name bsa-bashy
sudo lxc-ls bsa-bashy --fancy
```

    NAME      STATE   AUTOSTART GROUPS IPV4 IPV6 
    bsa-bashy STOPPED 0         -      -    -    


### Löschen der bsa-bashy


```bash
sudo lxc-destroy --name bsa-bashy
```

    Destroyed container bsa-bashy



```bash
sudo lxc-ls --fancy
```

### BSA Start/Kill Skripte


```bash
type echo
```

    echo ist eine von der Shell mitgelieferte Funktion.



```bash
help echo
```

    echo: echo [-neE] [Argument ...]
        Ausgabe der Argumente auf die Standardausgabe.
        
        Zeigt die Argumente auf der Standardausgabe gefolgt von einem
        Zeilenumbruch an.
        
        Optionen:
          -n	Keinen Zeilenumbruch anfügen
          -e	Interpretation der folgenden Escape-Sequenzen zulassen
          -E	Keine Interpretation der Escape-Sequenzen.
        
        »echo« interpretiert die folgenden Escape-Sequenzen:
          \a	Alarm (Glocke)
          \b	Rücktaste (Backspace)
          \c	weitere Ausgabe unterdrücken
          \e	Escape-Zeichen
          \E        Escape Zeichen
          \f	Seitenvorschub
          \n	Zeilenvorschub
          \r	Wagenrücklauf
          \t	Horizontaler Tabulator
          \v	Vertikaler Tabulator
          \\        umgekehrter Schrägstrich (Backslash)
          \0nnn	Zeichen mit dem ASCII-Code »NNN« (oktal). »NNN« kann null
        		bis drei oktale Ziffern haben.
          \xHH	Acht-Bit-Zeichen mit dem Wert »HH« (hexadezimal). »HH«
        		kann ein oder zwei hexadezimale Ziffern haben.
        
        Rückgabewert:
        Gibt »Erfolg« zurück, außer ein Ausgabefehler tritt auf.



```bash
echo -E '#!/bin/bash
set -xe
sudo lxc-create --template ubuntu --name bsa-bashy
sudo lxc-update-config -c /var/lib/lxc/bsa-bashy/config
sudo lxc-start --name bsa-bashy
sleep 5
sudo lxc-ls bsa-bashy --fancy' > bsa-start.sh
```


```bash
cat bsa-start.sh
```

    #!/bin/bash
    set -xe
    sudo lxc-create --template ubuntu --name bsa-bashy
    sudo lxc-update-config -c /var/lib/lxc/bsa-bashy/config
    sudo lxc-start --name bsa-bashy
    sleep 5
    sudo lxc-ls bsa-bashy --fancy



```bash
chmod u+x bsa-start.sh
```


```bash
./bsa-start.sh
```

    + sudo lxc-create --template ubuntu --name bsa-bashy
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    Checking cache download in /var/cache/lxc/xenial/rootfs-amd64 ... 
    Copy /var/cache/lxc/xenial/rootfs-amd64 to /var/lib/lxc/bsa-bashy/rootfs ... 
    Copying rootfs to /var/lib/lxc/bsa-bashy/rootfs ...
    Generating locales (this might take a while)...
      de_DE.UTF-8... done
    Generation complete.
    debconf: kann Oberfläche nicht initialisieren: Dialog
    debconf: (Die Dialog-Oberfläche funktioniert nicht auf einem Dumb-Terminal, einem Emacs-Shellbuffer oder ohne ein steuerndes Terminal.)
    debconf: greife zurück auf die Oberfläche: Readline
    debconf: kann Oberfläche nicht initialisieren: Readline
    debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
    debconf: greife zurück auf die Oberfläche: Teletype
    Creating SSH2 RSA key; this may take some time ...
    2048 SHA256:aoKA2U1IaCFgPWOz2UsOMPRXl4e7o7hUjuOFfGfiALg root@rdf-dev (RSA)
    Creating SSH2 DSA key; this may take some time ...
    1024 SHA256:qAT5w57XgPSWZVq19aiQlOJmTfWaCWDy6BHBtm7I+Yw root@rdf-dev (DSA)
    Creating SSH2 ECDSA key; this may take some time ...
    256 SHA256:xySuFT0ImgQE4W2/+biEmI97R0poqGH/7HXJpE2VAb4 root@rdf-dev (ECDSA)
    Creating SSH2 ED25519 key; this may take some time ...
    256 SHA256:zrHZWogOg2rGcy2Vr4yTHBFkfpjbBrjLM50vDeaE8TM root@rdf-dev (ED25519)
    invoke-rc.d: could not determine current runlevel
    invoke-rc.d: policy-rc.d denied execution of start.
    
    Current default time zone: 'Etc/UTC'
    Local time is now:      Tue Oct 17 09:04:04 UTC 2017.
    Universal Time is now:  Tue Oct 17 09:04:04 UTC 2017.
    
    
    ##
    # The default user is 'ubuntu' with password 'ubuntu'!
    # Use the 'sudo' command to run tasks as root in the container.
    ##
    
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    + sudo lxc-update-config -c /var/lib/lxc/bsa-bashy/config
    + sudo lxc-start --name bsa-bashy
    + sleep 5
    + sudo lxc-ls bsa-bashy --fancy
    NAME      STATE   AUTOSTART GROUPS IPV4      IPV6 
    bsa-bashy RUNNING 0         -      10.0.3.23 -    



```bash
echo '#!/bin/bash
set -xe
sudo lxc-destroy --name bsa-bashy --force' > bsa-kill.sh
```


```bash
cat bsa-kill.sh
```

    #!/bin/bash
    set -xe
    sudo lxc-destroy --name bsa-bashy --force



```bash
chmod u+x bsa-kill.sh
```


```bash
./bsa-kill.sh
```

    + sudo lxc-destroy --name bsa-bashy --force
    Destroyed container bsa-bashy


### Arbeiten auf der bsa-bashy


```bash
./bsa-start.sh
```

    + sudo lxc-create --template ubuntu --name bsa-bashy
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    Checking cache download in /var/cache/lxc/xenial/rootfs-amd64 ... 
    Copy /var/cache/lxc/xenial/rootfs-amd64 to /var/lib/lxc/bsa-bashy/rootfs ... 
    Copying rootfs to /var/lib/lxc/bsa-bashy/rootfs ...
    Generating locales (this might take a while)...
      de_DE.UTF-8... done
    Generation complete.
    debconf: kann Oberfläche nicht initialisieren: Dialog
    debconf: (Die Dialog-Oberfläche funktioniert nicht auf einem Dumb-Terminal, einem Emacs-Shellbuffer oder ohne ein steuerndes Terminal.)
    debconf: greife zurück auf die Oberfläche: Readline
    debconf: kann Oberfläche nicht initialisieren: Readline
    debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.1 /usr/local/share/perl/5.22.1 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base .) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
    debconf: greife zurück auf die Oberfläche: Teletype
    Creating SSH2 RSA key; this may take some time ...
    2048 SHA256:ksLjMFKfZv/8fy1wtIC5LXBY0QXB4Mpld8b6b47wDcU root@rdf-dev (RSA)
    Creating SSH2 DSA key; this may take some time ...
    1024 SHA256:F2FZkGVpoOjmhkhnR0bDvRTngjc1xfmO7muTpd9M1sA root@rdf-dev (DSA)
    Creating SSH2 ECDSA key; this may take some time ...
    256 SHA256:4kHIDDXCk8wvrn75hzAyunaL6d42NooXoTD23Ox1kIc root@rdf-dev (ECDSA)
    Creating SSH2 ED25519 key; this may take some time ...
    256 SHA256:Dl5dx26HtJp+VGNzemlqyjCtOItE9gz15LwTkx8IINw root@rdf-dev (ED25519)
    invoke-rc.d: could not determine current runlevel
    invoke-rc.d: policy-rc.d denied execution of start.
    
    Current default time zone: 'Etc/UTC'
    Local time is now:      Tue Oct 17 09:05:56 UTC 2017.
    Universal Time is now:  Tue Oct 17 09:05:56 UTC 2017.
    
    
    ##
    # The default user is 'ubuntu' with password 'ubuntu'!
    # Use the 'sudo' command to run tasks as root in the container.
    ##
    
    The configuration file contains legacy configuration keys.
    Please update your configuration file!
    + sudo lxc-update-config -c /var/lib/lxc/bsa-bashy/config
    + sudo lxc-start --name bsa-bashy
    + sleep 5
    + sudo lxc-ls bsa-bashy --fancy
    NAME      STATE   AUTOSTART GROUPS IPV4      IPV6 
    bsa-bashy RUNNING 0         -      10.0.3.36 -    


Via:

* lxc

    ```
    vagrant@virtualbox-ubuntu1604:~/bsa/hands-on-bsa/00-Start$ sudo lxc-attach --name bsa-bashy
    root@bsa-bashy:/# sudo apt-get update
    Holen:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [102 kB]
    OK:2 http://archive.ubuntu.com/ubuntu xenial InRelease
    Holen:3 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [102 kB]
    Es wurden 204 kB in 0 s geholt (290 kB/s).
    Paketlisten werden gelesen... Fertig
    root@bsa-bashy:/# sudo apt-get install python3
    Paketlisten werden gelesen... Fertig
    Abhängigkeitsbaum wird aufgebaut.
    Statusinformationen werden eingelesen.... Fertig
    »python3« ist bereits die neuste Version (3.5.1-3).
    0 aktualisiert, 0 neu installiert, 0 zu entfernen und 0 nicht aktualisiert.
    root@bsa-bashy:/# exit
    exit
    vagrant@virtualbox-ubuntu1604:~/bsa/hands-on-bsa/00-Start$
    ```
  
* ssh (Standard)

    ```
    vagrant@virtualbox-ubuntu1604:~/bsa/hands-on-bsa/00-Start$ ssh ubuntu@10.0.3.238
    ubuntu@10.0.3.238's password:
    Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-87-generic x86_64)

     * Documentation:  https://help.ubuntu.com
     * Management:     https://landscape.canonical.com
     * Support:        https://ubuntu.com/advantage
    Last login: Mon Oct  2 12:28:18 2017 from 10.0.3.1
    ubuntu@bsa-bashy:~$ apt-cache policy python python3
    python:
      Installiert:           2.7.11-1
      Installationskandidat: 2.7.11-1
      Versionstabelle:
     *** 2.7.11-1 500
            500 http://archive.ubuntu.com/ubuntu xenial/main amd64 Packages
            100 /var/lib/dpkg/status
    python3:
      Installiert:           3.5.1-3
      Installationskandidat: 3.5.1-3
      Versionstabelle:
     *** 3.5.1-3 500
            500 http://archive.ubuntu.com/ubuntu xenial/main amd64 Packages
            100 /var/lib/dpkg/status
    ubuntu@bsa-bashy:~$ exit
    Abgemeldet
    Connection to 10.0.3.238 closed.
    vagrant@virtualbox-ubuntu1604:~/bsa/hands-on-bsa/00-Start$
    ```

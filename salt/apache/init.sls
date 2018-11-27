apache2:
  pkg.installed:
    - pkgs:
        - apache2
        - libapache2-mod-php

/etc/hosts:
  file.managed:
    - source: salt://apache/hosts

/var/www/html/index.html:
  file.managed:
    - source: salt://apache/index.html

/etc/apache2/sites-available/juha.example.com.conf:
  file.managed:
    - source: salt://apache/juha.example.com.conf

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

a2ensite juha.example.com.conf:
  cmd.run

/etc/apache2/mods-enabled/php7.2.conf:
  file.managed:
    - source: salt://apache/php7.2.conf

/home/xubuntu/public_html/index.html:
  file.managed:
    - source: salt://apache/index.html

/home/xubuntu/public_html:
  file.managed:
    - source: salt://apache/connection.php

/home/xubuntu/public_html:
  file.managed:
    - source: salt://apache/list.php

apache2restart:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/sites-available/juha.example.com.conf
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
      - file: /etc/apache2/mods-enabled/php7.2.conf

mariadb-server:
  pkg.installed
     
mariadb-client:
  pkg.installed

/tmp/createdb.sql:
  file.managed:
    - mode: 600
    - source: salt://mariadb/createdb.sql

run_create:
  cmd.run:
    - name: cat /tmp/createdb.sql |mariadb -u root
    - unless: "echo 'show databases'|sudo mariadb -u root|grep '^horses$'"

mysql-client:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb-client

run_preseed:
  cmd.run:
    - name: cat /srv/salt/mariadb/preseed.sql | sudo mariadb -u root

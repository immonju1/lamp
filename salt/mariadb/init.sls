mysql-client:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb-client

run_preseed:
  cmd.run:
    - name: cat preseed.sql | sudo mariadb -u root

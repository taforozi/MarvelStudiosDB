CREATE USER 'testadmin'@'localhost' IDENTIFIED BY 'iamgod';
GRANT ALL PRIVILEGES ON marvelstudiosdb.* TO 'testadmin'@'localhost';

CREATE USER 'testemployee'@'%' IDENTIFIED BY 'iamsemigod';
GRANT INSERT, UPDATE, SELECT ON marvelstudiosdb.* TO 'testemployee'@'%';

CREATE USER 'testuser'@'%' IDENTIFIED BY 'iamadreamer';
GRANT SELECT ON marvelstudiosdb.* TO 'testuser'@'%';


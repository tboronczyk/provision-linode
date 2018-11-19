CREATE TABLE domains (
  name VARCHAR(128) NOT NULL
);
INSERT INTO domains VALUES ('{{mydomain}}');

CREATE TABLE users (
  username VARCHAR(128) NOT NULL,
  domain VARCHAR(128) NOT NULL,
  password VARCHAR(128) NOT NULL,
  active CHAR(1) DEFAULT 'Y' NOT NULL
);
INSERT INTO users VALUES ('{{myuser}}', '{{mydomain}}', '{SHA512-CRYPT}\$6\$GU6NOMcXSdePd8tr\$kSi3g/SGdZuUcFETYvQKXTH2J125cIvJkyv5XWVkX/0UxgZSk6s61Zc9B7pzyZ9j8zCj8as3TKId.xepI1625/', 'Y');

CREATE TABLE aliases (
  source VARCHAR(128) NOT NULL,
  destination VARCHAR(128) NOT NULL
);
INSERT INTO aliases VALUES ('abuse@{{mydomain}}', '{{myuser}}@{{mydomain}}');
INSERT INTO aliases VALUES ('security@{{mydomain}}', '{{myuser}}@{{mydomain}}');
INSERT INTO aliases VALUES ('postmaster@{{mydomain}}', '{{myuser}}@{{mydomain}}');
INSERT INTO aliases VALUES ('hostmaster@{{mydomain}}', '{{myuser}}@{{mydomain}}');
INSERT INTO aliases VALUES ('webmaster@{{mydomain}}', '{{myuser}}@{{mydomain}}');


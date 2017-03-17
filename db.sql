CREATE SEQUENCE seq_user
	MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
	
CREATE TABLE Hck_Users (
    ID INT,
    login VARCHAR2(16) NOT NULL,
    password CHAR(16) NOT NULL,
    user_type VARCHAR2(30) default 'Patient',
    PRIMARY KEY (ID, login),cc
	CONSTRAINT type_constraint CHECK (user_type in ('Patient', 'Doctor'))
);

CREATE OR REPLACE TRIGGER add_user
    BEFORE INSERT
    ON Hck_Users
    REFERENCING NEW AS newuser
    FOR EACH ROW
    BEGIN
    SELECT seq_user.nextval INTO :newuser.ID FROM dual;
END;
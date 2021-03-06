CREATE TABLE STUDENT (
    S_ID           INT PRIMARY KEY,
    NAME           VARCHAR(30) NOT NULL,
    JOINING_DATE   DATE NOT NULL,
    BRANCH         VARCHAR(10) NOT NULL,
    QUOTA          SMALLINT NOT NULL,
    BOOK_COUNT     SMALLINT NOT NULL,
    GENDER         CHAR(1) NOT NULL
);

CREATE TABLE LIBRARIAN (
    L_ID       VARCHAR(10) PRIMARY KEY,
    L_PW       VARCHAR(10) NOT NULL,
    IS_ADMIN   CHAR(1) DEFAULT 'n'
);

CREATE TABLE BOOK (
    BOOK_ID        INT PRIMARY KEY,
    TITLE          VARCHAR(80) NOT NULL,
    AUTHOR         VARCHAR(80) NOT NULL,
    ISBN           VARCHAR(30),
    PUBLISH_YEAR   INT NOT NULL,
    PUBLISHER      VARCHAR(100),
    AVAILABILITY   NUMBER(1),
    ISSUED_TO      INT,
    ISSUED_BY      VARCHAR(10),
    CONSTRAINT ISSUED_TO_FK FOREIGN KEY ( ISSUED_TO )
        REFERENCES STUDENT ( S_ID ),
    CONSTRAINT ISSUED_BY_FK FOREIGN KEY ( ISSUED_BY )
        REFERENCES LIBRARIAN ( L_ID )
);

CREATE SEQUENCE S_SEQ INCREMENT BY 1 START WITH 1000;

CREATE SEQUENCE B_SEQ INCREMENT BY 1 START WITH 1000;

INSERT INTO LIBRARIAN VALUES (
    'admin',
    'admin',
    'y'
);

COMMIT;
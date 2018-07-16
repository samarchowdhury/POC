CREATE SEQUENCE HIBERNATE_SEQUENCE 
  START WITH 1000 
  INCREMENT BY 5; 

CREATE TABLE CUSTOMER 
  ( 
     ID            BIGINT NOT NULL, 
     DATE_OF_BIRTH TIMESTAMP, 
     FIRST_NAME    VARCHAR(255), 
     LAST_NAME     VARCHAR(255), 
     PRIMARY KEY (ID) 
  ); 

CREATE TABLE ADDRESS 
  ( 
     COUNTY      VARCHAR(255), 
     POSTCODE    VARCHAR(255), 
     STREET      VARCHAR(255), 
     TOWN        VARCHAR(255), 
     CUSTOMER_ID BIGINT NOT NULL, 
     PRIMARY KEY (CUSTOMER_ID), 
     CONSTRAINT FK_ADDRESS_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(ID) 
  );

CREATE TABLE orders
  (
     ORDER_ID         BIGINT NOT NULL,
     created_on       TIMESTAMP,
     order_number     VARCHAR(255) NOT NULL UNIQUE,
     status           VARCHAR(255),
     CUSTOMER_ID      BIGINT NOT NULL,
     PRIMARY KEY      (ORDER_ID),
     CONSTRAINT FK_ORDER_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(ID)
  );

CREATE TABLE POST 
  (
    ID       BIGINT NOT NULL,
    TITLE         VARCHAR(255),
    PRIMARY KEY   (ID)
  );

create table POST_COMMENT 
  (
    id bigint not null, 
    review varchar(255), 
    POST_ID bigint, 
    primary key (id),
    CONSTRAINT FK_POST_COMMENT FOREIGN KEY (POST_ID) REFERENCES POST(ID)
  );

create table post_details 
  (
    created_by varchar(255), 
    created_on timestamp, 
    POST_ID bigint not null, 
    primary key (POST_ID),
    CONSTRAINT FK_POST_DETAILS FOREIGN KEY (POST_ID) REFERENCES POST(ID)
  );

create table tag 
  (
    ID bigint not null, 
    name varchar(255),
    primary key (ID)
  );

create table post_tag 
  (
    POST_ID bigint not null, 
    TAG_ID bigint not null,
    CONSTRAINT FK_POST_TAG_POST FOREIGN KEY (POST_ID) REFERENCES POST(ID),
    CONSTRAINT FK_POST_TAG_TAG FOREIGN KEY (TAG_ID) REFERENCES TAG(ID)
  );


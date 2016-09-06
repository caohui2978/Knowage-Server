CREATE INDEX FK_SBI_OBJECTS_5 ON SBI_OBJECTS(ENGINE_ID);
ALTER TABLE SBI_OBJECTS ADD CONSTRAINT FK_SBI_OBJECTS_5 FOREIGN KEY (ENGINE_ID) REFERENCES SBI_ENGINES (ENGINE_ID) ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SBI_META_MODELS_VERSIONS CHANGE COLUMN CONTENT CONTENT MEDIUMBLOB NULL;
ALTER TABLE SBI_META_MODELS_VERSIONS ADD COLUMN FILE_MODEL MEDIUMBLOB NULL AFTER NAME;

ALTER TABLE SBI_OBJ_METACONTENTS ADD COLUMN ADDITIONAL_INFO VARCHAR(255) NULL DEFAULT NULL AFTER ORGANIZATION;

ALTER TABLE SBI_CATALOG_FUNCTION 
ADD COLUMN OWNER 	VARCHAR(50) NOT NULL AFTER ORGANIZATION,
ADD COLUMN KEYWORDS VARCHAR(255) NULL DEFAULT NULL AFTER OWNER;

ALTER TABLE SBI_CATALOG_FUNCTION 
ADD COLUMN LABEL VARCHAR(50) NOT NULL AFTER KEYWORDS;

ALTER TABLE SBI_CATALOG_FUNCTION
ADD CONSTRAINT UNIQUE_LABEL_ORG UNIQUE (LABEL,ORGANIZATION);

ALTER TABLE SBI_CATALOG_FUNCTION 
ADD COLUMN TYPE VARCHAR(50) NULL DEFAULT NULL AFTER LABEL;

ALTER TABLE SBI_DATA_SET DROP IS_PUBLIC;

CREATE TABLE IF NOT EXISTS  SBI_WHATIF_WORKFLOW(
	ID INT(8),
    MODEL_ID INT(11),
    USER_ID INT(11),
    SEQUENCE INT(8),
    STATE VARCHAR(20),
    NOTES VARCHAR(100),
    INFO VARCHAR(100),
    USER_IN VARCHAR(100),
    USER_UP VARCHAR(100),
    USER_DE VARCHAR(100),
    TIME_IN TIMESTAMP,
    TIME_UP TIMESTAMP,
    TIME_DE TIMESTAMP,
    SBI_VERSION_IN VARCHAR(10),
    SBI_VERSION_UP VARCHAR(10),
    SBI_VERSION_DE VARCHAR(10),
    ORGANIZATION VARCHAR(20),
    PRIMARY KEY (ID)
);

ALTER TABLE SBI_WHATIF_WORKFLOW 				ADD CONSTRAINT FK_SBI_MODEL_WORKFLOW			FOREIGN KEY (MODEL_ID) 				REFERENCES SBI_ARTIFACTS(ID)					ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SBI_WHATIF_WORKFLOW 				ADD CONSTRAINT FK_SBI_USER_WORKFLOW			FOREIGN KEY (USER_ID) REFERENCES SBI_USER(ID)	ON DELETE CASCADE ON UPDATE CASCADE;

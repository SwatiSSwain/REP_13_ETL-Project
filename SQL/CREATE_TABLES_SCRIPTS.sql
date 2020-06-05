--COMMUNITY
DROP TABLE IF EXISTS COMMUNITY CASCADE;
CREATE TABLE COMMUNITY (
    community_id INT   NOT NULL,
    name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_COMMUNITY PRIMARY KEY (
        community_id
     ),
    CONSTRAINT uc_COMMUNITY_name UNIQUE (
        name
    )
);

--NEIGHBORHOOD
DROP TABLE IF EXISTS NEIGHBORHOOD CASCADE;
CREATE TABLE NEIGHBORHOOD (
    neighborhood_id INT   NOT NULL,
    name VARCHAR(50)   NOT NULL,
    community_id INT   NOT NULL,
    CONSTRAINT pk_NEIGHBORHOOD PRIMARY KEY (
        neighborhood_id
     ),
    CONSTRAINT uc_NEIGHBORHOOD_name UNIQUE (
        name
    )
	
);

DROP TABLE IF EXISTS HOUSEHOLD_INCOME_BY_NEIGHBORHOOD CASCADE;
CREATE TABLE HOUSEHOLD_INCOME_BY_NEIGHBORHOOD (
    household_income_by_neighborhood_id INT   NOT NULL,
    neighborhood_id INT   NOT NULL,
    IncomeLess35000_count INT  DEFAULT  NULL,
    IncomeLess35000_percent DECIMAL(10,2) DEFAULT   NULL,
    IncomeLess35to49_count INT  DEFAULT  NULL,
    IncomeLess35to49_percent DECIMAL(10,2)  DEFAULT  NULL,
    IncomeLess50to74_count INT DEFAULT   NULL,
    IncomeLess50to74_percent DECIMAL(10,2)  DEFAULT  NULL,
    IncomeLess75to99_count INT  DEFAULT  NULL,
    IncomeLess75to99_percent DECIMAL(10,2) DEFAULT   NULL,
    Income100Plus_count INT  DEFAULT  NULL,
    Income100Plus_percent DECIMAL(10,2)  DEFAULT  NULL,
    Median_Income_Total DECIMAL(10,2) DEFAULT   NULL,
    CONSTRAINT pk_HOUSEHOLD_INCOME_BY_NEIGHBORHOOD PRIMARY KEY (
        household_income_by_neighborhood_id
     ),
    CONSTRAINT uc_HOUSEHOLD_INCOME_BY_NEIGHBORHOOD_neighborhood_id UNIQUE (
        neighborhood_id
    )
);

DROP TABLE IF EXISTS HOUSEHOLD_INCOME_BY_COMMUNITY CASCADE;
CREATE TABLE HOUSEHOLD_INCOME_BY_COMMUNITY (
    household_income_by_community_id INT   NOT NULL,
    community_id INT   NOT NULL,
    IncomeLess35000_count INT  DEFAULT  NULL,
    IncomeLess35000_percent DECIMAL(10,2)  DEFAULT  NULL,
    IncomeLess35to49_count INT DEFAULT   NULL,
    IncomeLess35to49_percent DECIMAL(10,2)  DEFAULT  NULL,
    IncomeLess50to74_count INT  DEFAULT  NULL,
    IncomeLess50to74_percent DECIMAL(10,2) DEFAULT   NULL,
    IncomeLess75to99_count INT  DEFAULT  NULL,
    IncomeLess75to99_percent DECIMAL(10,2) DEFAULT   NULL,
    Income100Plus_count INT  DEFAULT  NULL,
    Income100Plus_percent DECIMAL(10,2)  DEFAULT  NULL,
    Median_Income_Total DECIMAL(10,2) DEFAULT   NULL,
    CONSTRAINT pk_HOUSEHOLD_INCOME_BY_COMMUNITY PRIMARY KEY (
        household_income_by_community_id
     ),
    CONSTRAINT uc_HOUSEHOLD_INCOME_BY_COMMUNITY_community_id UNIQUE (
        community_id
    )
);

DROP TABLE IF EXISTS RACE_BY_NEIGHBORHOOD CASCADE;
CREATE TABLE RACE_BY_NEIGHBORHOOD (
    race_by_neighborhood_id SERIAL   NOT NULL,
    neighborhood_id INT   NOT NULL,
    total_cnt DECIMAL(10,2)   DEFAULT NULL,
    white_pct DECIMAL(10,5)   DEFAULT NULL,
    black_pct DECIMAL(10,5)   DEFAULT NULL,
    native_pct DECIMAL(10,5)   DEFAULT NULL,
    asian_pct DECIMAL(10,5)   DEFAULT NULL,
    other_pct DECIMAL(10,5)   DEFAULT NULL,
    two_or_more_pct DECIMAL(10,5)   DEFAULT NULL,
    hispanic_pct DECIMAL(10,5)   DEFAULT NULL,
    of_color_pct DECIMAL(10,5)   DEFAULT NULL,
    CONSTRAINT pk_RACE_BY_NEIGHBORHOOD PRIMARY KEY (
        race_by_neighborhood_id
     ),
    CONSTRAINT uc_RACE_BY_NEIGHBORHOOD_neighborhood_id UNIQUE (
        neighborhood_id
    )
);

DROP TABLE IF EXISTS RACE_BY_COMMUNITY CASCADE;
CREATE TABLE RACE_BY_COMMUNITY (
    race_by_community_id SERIAL   NOT NULL,
    community_id INT   NOT NULL,
    total_cnt DECIMAL(10,2)   DEFAULT NULL,
    white_pct DECIMAL(10,5)   DEFAULT NULL,
    black_pct DECIMAL(10,5)   DEFAULT NULL,
    native_pct DECIMAL(10,5)   DEFAULT NULL,
    asian_pct DECIMAL(10,5)   DEFAULT NULL,
    other_pct DECIMAL(10,5)   DEFAULT NULL,
    two_or_more_pct DECIMAL(10,5)   DEFAULT NULL,
    hispanic_pct DECIMAL(10,5)   DEFAULT NULL,
    of_color_pct DECIMAL(10,5)   DEFAULT NULL,
    CONSTRAINT pk_RACE_BY_COMMUNITY PRIMARY KEY (
        race_by_community_id
     ),
    CONSTRAINT uc_RACE_BY_COMMUNITY_community_id UNIQUE (
        community_id
    )
);

DROP TABLE IF EXISTS POLICE_USE_OF_FORCE CASCADE;
CREATE TABLE POLICE_USE_OF_FORCE (
    police_use_of_force_id SERIAL   NOT NULL,
    response_date TIMESTAMP   DEFAULT NULL,
    case_number VARCHAR(50)  DEFAULT NULL,
    problem VARCHAR(100)   DEFAULT NULL,
    subject_race VARCHAR(50)   DEFAULT NULL,
    subject_sex VARCHAR(50)   DEFAULT NULL,
    subject_age INT   DEFAULT NULL,
    subject_role VARCHAR(50)   DEFAULT NULL,
    primary_offense VARCHAR(50)   DEFAULT NULL,
    type_of_resistance VARCHAR(50)   DEFAULT NULL,
    police_use_of_force_type VARCHAR(50)   DEFAULT NULL,
    force_type_action VARCHAR(50)   DEFAULT NULL,
    subject_injury VARCHAR(50)   DEFAULT NULL,
    neighborhood_id INT   DEFAULT NULL,
    neighborhood VARCHAR(50)   DEFAULT NULL,
    precinct VARCHAR(10)   DEFAULT NULL,
    CONSTRAINT pk_POLICE_USE_OF_FORCE PRIMARY KEY (
        police_use_of_force_id
     ),
    CONSTRAINT uc_POLICE_USE_OF_FORCE_case_number UNIQUE (
        case_number
    )
);

DROP TABLE IF EXISTS POLICE_INCIDENT CASCADE;
CREATE TABLE POLICE_INCIDENT (
    police_incident_id SERIAL   NOT NULL,
    casenumber VARCHAR(50)   DEFAULT NULL,
    reporteddate TIMESTAMP   DEFAULT NULL,
    offense VARCHAR(100)   DEFAULT NULL,
    neighborhood VARCHAR(100)   DEFAULT NULL,
    incident_id INT   DEFAULT NULL,
    neighborhood_id INT   DEFAULT NULL,
    community_id INT   DEFAULT NULL,
    CONSTRAINT pk_POLICE_INCIDENT PRIMARY KEY (
        police_incident_id
     ),
    CONSTRAINT uc_POLICE_INCIDENT_incident_id UNIQUE (
        incident_id
    )
);


--Foreign Keys
ALTER TABLE NEIGHBORHOOD ADD CONSTRAINT fk_NEIGHBORHOOD_community_id FOREIGN KEY(community_id)
REFERENCES COMMUNITY (community_id);


ALTER TABLE HOUSEHOLD_INCOME_BY_NEIGHBORHOOD ADD CONSTRAINT fk_HOUSEHOLD_INCOME_BY_NEIGHBORHOOD_neighborhood_id FOREIGN KEY(neighborhood_id)
REFERENCES NEIGHBORHOOD (neighborhood_id);

ALTER TABLE HOUSEHOLD_INCOME_BY_COMMUNITY ADD CONSTRAINT fk_HOUSEHOLD_INCOME_BY_COMMUNITY_community_id FOREIGN KEY(community_id)
REFERENCES COMMUNITY (community_id);

ALTER TABLE HOUSEHOLD_INCOME_BY_NEIGHBORHOOD ADD CONSTRAINT fk_HOUSEHOLD_INCOME_BY_NEIGHBORHOOD_neighborhood_id FOREIGN KEY(neighborhood_id)
REFERENCES NEIGHBORHOOD (neighborhood_id);

ALTER TABLE HOUSEHOLD_INCOME_BY_COMMUNITY ADD CONSTRAINT fk_HOUSEHOLD_INCOME_BY_COMMUNITY_community_id FOREIGN KEY(community_id)
REFERENCES COMMUNITY (community_id);

ALTER TABLE RACE_BY_COMMUNITY ADD CONSTRAINT fk_RACE_BY_COMMUNITY_community_id FOREIGN KEY(community_id)
REFERENCES COMMUNITY (community_id);

ALTER TABLE POLICE_USE_OF_FORCE ADD CONSTRAINT fk_POLICE_USE_OF_FORCE_neighborhood_id FOREIGN KEY(neighborhood_id)
REFERENCES NEIGHBORHOOD (neighborhood_id);

ALTER TABLE POLICE_INCIDENT ADD CONSTRAINT fk_POLICE_INCIDENT_neighborhood_id FOREIGN KEY(neighborhood_id)
REFERENCES NEIGHBORHOOD (neighborhood_id);

ALTER TABLE POLICE_INCIDENT ADD CONSTRAINT fk_POLICE_INCIDENT_community_id FOREIGN KEY(community_id)
REFERENCES COMMUNITY (community_id);

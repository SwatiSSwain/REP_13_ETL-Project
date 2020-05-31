-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/06aL97
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "msp_nbhd_race_mix" (
    "NBHD_KEY" varchar(255)   NOT NULL,
    "white_pct" float   NOT NULL,
    "black_pct" float   NOT NULL,
    "native_pct" float   NOT NULL,
    "asian_pct" float   NOT NULL,
    "other_pct" float   NOT NULL,
    "two_or_more_pct" float   NOT NULL,
    "hispanic_pct" float   NOT NULL,
    "of_color_pct" float   NOT NULL
);

CREATE TABLE "msp_cmnty_keys" (
    "CMNTY_KEY" varchar(255)   NOT NULL,
    "COMMUNITY" varchar(255)   NOT NULL,
    CONSTRAINT "pk_msp_cmnty_keys" PRIMARY KEY (
        "CMNTY_KEY"
     )
);

CREATE TABLE "msp_nbhd_keys" (
    "NBHD_KEY" varchar(255)   NOT NULL,
    "NEIGHBORHOOD" varchar(255)   NOT NULL,
    "CMNTY_KEY" varchar(255)   NOT NULL,
    CONSTRAINT "pk_msp_nbhd_keys" PRIMARY KEY (
        "NBHD_KEY"
     )
);

ALTER TABLE "msp_nbhd_race_mix" ADD CONSTRAINT "fk_msp_nbhd_race_mix_NBHD_KEY" FOREIGN KEY("NBHD_KEY")
REFERENCES "msp_nbhd_keys" ("NBHD_KEY");

ALTER TABLE "msp_nbhd_keys" ADD CONSTRAINT "fk_msp_nbhd_keys_CMNTY_KEY" FOREIGN KEY("CMNTY_KEY")
REFERENCES "msp_cmnty_keys" ("CMNTY_KEY");


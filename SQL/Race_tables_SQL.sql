-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/06aL97
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "NEIGHBORHOOD_RACE" (
    "neighborhood_id" int   NOT NULL,
    "total_pop" int   NOT NULL,
    "white_pct" float   NOT NULL,
    "black_pct" float   NOT NULL,
    "native_pct" float   NOT NULL,
    "asian_pct" float   NOT NULL,
    "other_pct" float   NOT NULL,
    "two_or_more_pct" float   NOT NULL,
    "hispanic_pct" float   NOT NULL,
    "of_color_pct" float   NOT NULL
);

CREATE TABLE "COMMUNITY_RACE" (
    "community_id" int   NOT NULL,
    "total_pop" int   NOT NULL,
    "white_pct" float   NOT NULL,
    "black_pct" float   NOT NULL,
    "native_pct" float   NOT NULL,
    "asian_pct" float   NOT NULL,
    "other_pct" float   NOT NULL,
    "two_or_more_pct" float   NOT NULL,
    "hispanic_pct" float   NOT NULL,
    "of_color_pct" float   NOT NULL
);

CREATE TABLE "NEIGHBORHOOD" (
    "neighborhood_id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "community_id" int   NOT NULL,
    CONSTRAINT "pk_NEIGHBORHOOD" PRIMARY KEY (
        "neighborhood_id"
     )
);

CREATE TABLE "COMMUNITY" (
    "community_id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_COMMUNITY" PRIMARY KEY (
        "community_id"
     )
);

ALTER TABLE "NEIGHBORHOOD_RACE" ADD CONSTRAINT "fk_NEIGHBORHOOD_RACE_neighborhood_id" FOREIGN KEY("neighborhood_id")
REFERENCES "NEIGHBORHOOD" ("neighborhood_id");

ALTER TABLE "COMMUNITY_RACE" ADD CONSTRAINT "fk_COMMUNITY_RACE_community_id" FOREIGN KEY("community_id")
REFERENCES "COMMUNITY" ("community_id");

ALTER TABLE "NEIGHBORHOOD" ADD CONSTRAINT "fk_NEIGHBORHOOD_community_id" FOREIGN KEY("community_id")
REFERENCES "COMMUNITY" ("community_id");


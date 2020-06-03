-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Police_Use_Of_Force" (
    "Police_Use_Of_Force_ID" INTEGER   NOT NULL,
    "Response_Date" DATETIME   NOT NULL,
    "Case_Number" VARCHAR(50)   NOT NULL,
    "Problem" VARCHAR(100)   NOT NULL,
    "Subject_Race" VARCHAR(50)   NOT NULL,
    "Subject_Sex" VARCHAR(50)   NOT NULL,
    "Subject_Event_Age" INTEGER   NOT NULL,
    "Subject_Role" VARCHAR(50)   NOT NULL,
    "Primary_Offense" VARCHAR(50)   NOT NULL,
    "Type_Of_Resistance" VARCHAR(50)   NOT NULL,
    "Police_Use_Of_Force_Type" VARCHAR(50)   NOT NULL,
    "Force_Type_Action" VARCHAR(50)   NOT NULL,
    "Subject_Injury" VARCHAR(50)   NOT NULL,
    "Neiborhood_ID" INTEGER   NOT NULL,
    "Neighborhood" VARCHAR(50)   NOT NULL,
    "Precinct" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Police_Use_Of_Force" PRIMARY KEY (
        "Police_Use_Of_Force_ID"
     ),
    CONSTRAINT "uc_Police_Use_Of_Force_Case_Number" UNIQUE (
        "Case_Number"
    )
);


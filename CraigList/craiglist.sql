-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/MxJQ3z
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Regions" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "preffered_regionid" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" int   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "location" text   NOT NULL,
    "userid" int   NOT NULL,
    "categoryid" int   NOT NULL,
    "regionid" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_preffered_regionid" FOREIGN KEY("preffered_regionid")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_userid" FOREIGN KEY("userid")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_categoryid" FOREIGN KEY("categoryid")
REFERENCES "Categories" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_regionid" FOREIGN KEY("regionid")
REFERENCES "Regions" ("id");


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
CREATE DATABASE 

CREATE TABLE "MedicalCenter" (
    "id" int   NOT NULL,
    "center_name" text   NOT NULL,
    "Address" string   NOT NULL,
    CONSTRAINT "pk_MedicalCenter" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Doctors" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "m_center_id" int   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" int   NOT NULL,
    "doc-id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "date" date   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" int   NOT NULL,
    "disease_name" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnosis" (
    "id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_m_center_id" FOREIGN KEY("m_center_id")
REFERENCES "MedicalCenter" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doc-id" FOREIGN KEY("doc-id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");


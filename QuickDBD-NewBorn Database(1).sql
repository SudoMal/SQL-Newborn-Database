-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Gd86S5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Tables
CREATE TABLE "Parent" (
    "ParentID" int  NOT NULL ,
    "Name" text  NOT NULL ,
    "Email" text  NOT NULL ,
    CONSTRAINT "pk_Parent" PRIMARY KEY (
        "ParentID"
    ),
    CONSTRAINT "uk_Parent_Email" UNIQUE (
        "Email"
    )
)

GO

CREATE TABLE "Child" (
    "ChildID" int  NOT NULL ,
    "Name" text  NOT NULL ,
    "Birthdate" date  NOT NULL ,
    "ParentID" int  NOT NULL ,
    CONSTRAINT "pk_Child" PRIMARY KEY (
        "ChildID"
    )
)

GO

CREATE TABLE "MedicalRecord" (
    "RecordID" int  NOT NULL ,
    "ChildID" int  NOT NULL ,
    "VisitDate" date  NOT NULL ,
    "Description" text  NOT NULL ,
    CONSTRAINT "pk_MedicalRecord" PRIMARY KEY (
        "RecordID"
    )
)

GO

CREATE TABLE "Inventory" (
    "ItemID" int  NOT NULL ,
    "Name" text  NOT NULL ,
    "Category" text  NOT NULL ,
    "Quantity" int  NOT NULL ,
    "ReorderLevel" int  NOT NULL ,
    CONSTRAINT "pk_Inventory" PRIMARY KEY (
        "ItemID"
    )
)

GO

CREATE TABLE "Appointment" (
    "AppointmentID" int  NOT NULL ,
    "ChildID" int  NOT NULL ,
    "Date" date  NOT NULL ,
    "Time" time  NOT NULL ,
    "Description" text  NOT NULL ,
    CONSTRAINT "pk_Appointment" PRIMARY KEY (
        "AppointmentID"
    )
)

GO

ALTER TABLE "Child" ADD CONSTRAINT "fk_Child_ParentID" FOREIGN KEY("ParentID")
REFERENCES "Parent" ("ParentID")
GO

ALTER TABLE "MedicalRecord" ADD CONSTRAINT "fk_MedicalRecord_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID")
GO

ALTER TABLE "Appointment" ADD CONSTRAINT "fk_Appointment_ChildID" FOREIGN KEY("ChildID")
REFERENCES "Child" ("ChildID")
GO


-- Create Prescription Table
CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY,
    Patient_ID INT,
    HealthcareProvider_ID INT,
    Date_Prescribed DATE,
    Medication_Name VARCHAR(255),
    Dosage VARCHAR(50),
    Instructions TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES PatientInformation(Patient_ID),
    FOREIGN KEY (HealthcareProvider_ID) REFERENCES HealthcareProviders(HealthcareProvider_ID)
);

-- Populate Prescription Table
INSERT INTO Prescription (Prescription_ID, Patient_ID, HealthcareProvider_ID, Date_Prescribed, Medication_Name, Dosage, Instructions)
VALUES
(1, 3, 1, '2023-01-10', 'Aspirin', '100mg', 'Take with food'),
(2, 4, 2, '2023-01-05', 'Ibuprofen', '200mg', 'Every 6 hours as needed'),
(3, 7, 1, '2023-01-07', 'Day-quil', '200mg', 'Every Morning'),
(4, 6, 3, '2023-01-19', 'Night-quil', '100mg', 'Every Night'),
(5, 1, 1, '2023-01-07', 'Day-quil', '150mg', 'Every Morning'),
(6, 2, 3, '2023-01-28', 'Tynalol', '400mg', 'Every Afternoon'),
(7, 5, 2, '2023-01-20', 'Menoxil', '100mg', 'Every night')
;

-- Create PatientInformation Table
CREATE TABLE PatientInformation (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(255),
    Contact_Number VARCHAR(20),
    Date_of_Birth DATE,
    Address VARCHAR(255),
    Medical_History TEXT,
    Allergies TEXT,
    Previous_Treatments TEXT
);

-- Populate PatientInformation Table
INSERT INTO PatientInformation (Patient_ID, Patient_Name, Contact_Number, Date_of_Birth, Address, Medical_History, Allergies, Previous_Treatments)
VALUES
(1, 'John Doe', '123-456-7890', '1990-05-15', '123 Main St, City', 'Hypertension', 'Penicillin', 'Surgery in 2018'),
(2, 'Jane Smith', '987-654-3210', '1985-08-22', '456 Oak St, Town', 'None', 'None', 'Physical Therapy'),
(3, 'Sarah Miller', '555-1212-3333', '2015-10-26', '789 Elm St, Village', 'Asthma', 'Peanuts', 'Inhaler medication'),
(4, 'William Davis', '432-543-2109', '1950-03-07', '1011 Pine St, Borough', 'Type 2 Diabetes', 'Shellfish', 'Insulin injections'),
(5, 'Emily Jones', '321-987-6543', '1995-07-04', '1213 Birch St, District', 'Iron-deficiency anemia (pregnancy-related)', 'No known allergies', 'Iron supplements'),
(6, 'Michael Brown', '876-312-4509', '1980-01-11', '1415 Maple St, County', 'Chronic back pain from car accident', 'NSAIDS', 'Physical therapy'),
(7, 'Elizabeth Garcia', '234-567-8901', '1975-11-19', '1617 Cedar St, State', 'Major depressive disorder', 'No known allergies', 'Antidepressant medication')
;

-- Create HealthcareProviders Table
CREATE TABLE HealthcareProviders (
    HealthcareProvider_ID INT PRIMARY KEY,
    Provider_Name VARCHAR(255),
    Specialization VARCHAR(100),
    Contact_Details VARCHAR(255),
    Schedule TEXT
);

-- Populate HealthcareProviders Table
INSERT INTO HealthcareProviders (HealthcareProvider_ID, Provider_Name, Specialization, Contact_Details, Schedule)
VALUES
(1, 'Dr. Smith','Cardiology','555-1234','Mon-Fri, 9 AM - 5 PM'),
(2, 'Dr. Johnson','Orthopedics','555-5678','Tue-Thu, 10 AM - 6 PM'),
(3,	'Dr. Smith','Cardiology','555-1234','Mon-Fri, 9 AM - 5 PM'),
(4,	'Dr. Lee','Dermatology','555-9876','Tue-Wed, 1 PM - 7 PM'),
(5,	'Dr. Garcia','Neurology','555-4321','Thu-Sat, 10 AM - 4 PM');

-- Create Appointments Table
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    HealthcareProvider_ID INT,
    Date DATE,
    Time TIME,
    Purpose TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES PatientInformation(Patient_ID),
    FOREIGN KEY (HealthcareProvider_ID) REFERENCES HealthcareProviders(HealthcareProvider_ID)
);

-- Populate Appointments Table
INSERT INTO Appointments (Appointment_ID, Patient_ID, HealthcareProvider_ID, Date, Time, Purpose)
VALUES
(1, 1, 1, '2023-03-15', '10:00:00', 'Follow-up checkup'),
(2, 2, 2, '2023-04-20', '14:30:00', 'Consultation for knee pain'),
(3,	1,	3, '2024-12-04','12:04:22',	'Blood test'),
(4,	3,	2,	'2024-12-04','12:04:22',	'Follow-up checkup'),
(5,	4,	2,	'2024-03-16',	'11:22:20',	'Post-operative checkup'),
(7,	5,	1,	'2024-08-25',	'11:03:58',	'Routine checkup'),
(8,	6,	3,	'2024-09-23',	'12:32:13',	'Post-operative checkup'),
(9,	7,	3,	'2024-09-27',	'12:32:13',	'X-ray');

-- Create MedicalRecords Table
CREATE TABLE MedicalRecords (
    Record_ID INT PRIMARY KEY,
    Patient_ID INT,
    Diagnosis TEXT,
    Prescribed_Medications TEXT,
    Treatment_Plans TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES PatientInformation(Patient_ID)
);

-- Populate MedicalRecords Table
INSERT INTO MedicalRecords (Record_ID, Patient_ID, Diagnosis, Prescribed_Medications, Treatment_Plans)
VALUES
(1, 1, 'Hypertension', 'Aspirin', 'Lifestyle changes'),
(2, 2, 'Knee pain', 'Ibuprofen', 'Physical therapy and rest'),
(3,7,'Diabetes type 2','Metformin', 'blood sugar monitoring'),
(4,3,'Migraine headaches', 'Propranolol','Stress management'),
(5,	6,	'Asthma	Albuterol', 'Bronchodilator inhalers', 'allergy management'),
(6,	5,	'Anxiety disorder','Lexapro', 'Cognitive behavioral therapy'),
(7,	4,	'Gastritis	Omeprazole', 'Pepto-Bismol',	'Dietary modifications');

-- Create BillingAndInsurance Table
CREATE TABLE BillingAndInsurance (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    HealthcareProvider_ID INT,
    Service_Charges DECIMAL(10, 2),
    Insurance_Coverage DECIMAL(10, 2),
    Claims TEXT,
    Payments DECIMAL(10, 2),
    FOREIGN KEY (Patient_ID) REFERENCES PatientInformation(Patient_ID),
    FOREIGN KEY (HealthcareProvider_ID) REFERENCES HealthcareProviders(HealthcareProvider_ID)
);

-- Populate BillingAndInsurance Table
INSERT INTO BillingAndInsurance (Bill_ID, Patient_ID, HealthcareProvider_ID, Service_Charges, Insurance_Coverage, Claims, Payments)
VALUES
(1, 1, 1, 150.00, 80.00, 'Cardiology consultation', 70.00),
(2, 2, 2, 200.00, 150.00, 'Orthopedic consultation', 50.00),
(3, 2, 5, 250.00, 175.00, 'General checkup', 75.00),
(4, 5, 3, 180.00, 126.00, 'Dermatology consultation', 54.00),
(5, 6, 4, 300.00, 210.00, 'MRI scan', 90.00),
(6, 4, 2, 120.00, 84.00, 'Physical therapy session', 36.00),
(7, 1, 5, 270.00, 189.00, 'Dental procedure', 81.00),
(8, 3, 3, 160.00, 112.00, 'Blood test panel', 48.00),
(9, 6, 2, 220.00, 154.00, 'Ultrasound examination', 66.00),
(10, 4, 1, 190.00, 133.00, 'Nutritional counseling session', 57.00),
(11, 7, 4, 350.00, 245.00, 'Gynecological examination', 105.00),
(12, 5, 3, 140.00, 98.00, 'Vaccination shots', 42.00);


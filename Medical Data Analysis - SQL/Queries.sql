-- Find Appointments within a certain date 
SELECT *
FROM Appointments
WHERE Date BETWEEN '2023-12-15' AND '2023-12-18';

-- Dr. Smith Appointments 
SELECT a.*
FROM Appointments a
INNER JOIN HealthcareProviders p ON a.HealthcareProvider_ID = p.HealthcareProvider_ID
WHERE p.Provider_Name like '%Dr. Smith%';

--  Find all appointments made by patients diagnosed with Hypertension
SELECT a.*
FROM Appointments a
INNER JOIN patientinformation p ON a.Patient_ID = p.Patient_ID
INNER JOIN medicalrecords m ON p.Patient_ID = m.Patient_ID
WHERE m.Diagnosis IN (
  SELECT Diagnosis
  FROM medicalrecords
  WHERE Diagnosis like '%Hypertension%'
);

-- All patients who have upcoming appointments
SELECT p.*
FROM patientinformation p
INNER JOIN Appointments a ON p.Patient_ID = a.Patient_ID
WHERE a.Date >= CURDATE();

-- Find all medications prescribed by any healthcare provider specializing in a specific field
SELECT pr.*
FROM Prescription pr
INNER JOIN HealthcareProviders p ON pr.HealthcareProvider_ID = p.HealthcareProvider_ID
WHERE p.Specialization IN (
  SELECT Specialization
  FROM HealthcareProviders
  WHERE Specialization = 'Cardiology'
);

-- Calculate the total amount of charges for a specific patient
SELECT SUM(Service_Charges) AS Total_Charges
FROM BillingAndInsurance
WHERE Patient_ID = 1;

-- Find all patients who have a penicillin allergy
SELECT p.*
FROM patientinformation p
INNER JOIN medicalrecords m ON p.Patient_ID = m.Patient_ID
WHERE p.Allergies LIKE '%penicillin%';

-- Find all appointments for a follow up 
SELECT *
FROM Appointments
WHERE Purpose like '%Follow-up%' ;





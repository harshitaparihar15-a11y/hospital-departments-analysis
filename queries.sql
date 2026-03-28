-- ============================================================
-- HOSPITAL OPERATIONS ANALYSIS
-- Author: [Your Name]
-- Tools: SQL (PostgreSQL)
-- Dataset: Multi-hospital patient data across 10 Indian cities
-- ============================================================

-- ============================================================
-- SECTION 1: PATIENT VOLUME ANALYSIS
-- ============================================================

-- 1. Total Number of Patients Across All Hospitals
SELECT SUM(patients_count) AS total_patients 
FROM patients;
-- Result: 9,347 patients across 10 hospitals

-- 2. Top 3 Busiest Departments by Patient Volume
SELECT Department, 
       SUM(Patients_count) AS Total_Patients 
FROM patients 
GROUP BY Department
ORDER BY Total_Patients DESC 
LIMIT 3;
-- Result: Urology (1,766), Neurology (1,229), ENT (1,064)

-- 3. Department with Lowest Patient Load
SELECT Department, 
       SUM(Patients_Count) AS Total_Patients
FROM patients
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;

-- 4. Total Patients Treated Per City
SELECT Location,
       SUM(patients_count) AS patients_treated 
FROM patients
GROUP BY Location
ORDER BY patients_treated DESC;
-- Result: Jaipur leads (1,505), followed by Ahmedabad (1,467)

-- ============================================================
-- SECTION 2: FINANCIAL ANALYSIS
-- ============================================================

-- 5. Hospital with Maximum Total Medical Expenses
SELECT hospital_name, 
       SUM(medical_expenses) AS total_expenses
FROM patients 
GROUP BY hospital_name
ORDER BY total_expenses DESC
LIMIT 1;
-- Result: Healing Touch (₹352,178)

-- 6. Average Medical Expenses Per Hospital
SELECT hospital_name,
       ROUND(AVG(medical_expenses), 2) AS avg_expenses
FROM patients
GROUP BY hospital_name
ORDER BY avg_expenses DESC;

-- 7. Monthly Medical Expenses Report
SELECT EXTRACT(MONTH FROM admission_date) AS Month_Number,
       TO_CHAR(admission_date, 'Month') AS Month_Name,
       ROUND(SUM(medical_expenses), 2) AS total_expenses
FROM patients
GROUP BY EXTRACT(MONTH FROM admission_date), TO_CHAR(admission_date, 'Month')
ORDER BY total_expenses DESC;
-- Result: September highest (₹341,284), April lowest (₹88,995)

-- ============================================================
-- SECTION 3: LENGTH OF STAY ANALYSIS
-- ============================================================

-- 8. Patient with Longest Hospital Stay
SELECT patient_id, 
       hospital_name, 
       (discharge_date - admission_date) AS stay_days
FROM patients
ORDER BY stay_days DESC
LIMIT 1;

-- 9. Average Length of Stay Per Department
SELECT department, 
       ROUND(AVG(discharge_date - admission_date), 2) AS avg_stay_days
FROM patients
GROUP BY department
ORDER BY avg_stay_days DESC;
-- Result: Neurology (9.25 days), Pediatrics (9.11 days) have longest stays

-- ============================================================
-- SECTION 4: ORIGINAL ANALYSIS (Beyond Assignment)
-- ============================================================

-- 10. Cost Efficiency: Medical Expense Per Patient by Department
--     Identifies which departments are most resource-intensive
SELECT department,
       ROUND(SUM(medical_expenses) / SUM(patients_count), 2) AS expense_per_patient
FROM patients
GROUP BY department
ORDER BY expense_per_patient DESC;
-- Insight: Gynecology (₹351/patient) and Oncology (₹340/patient) 
-- are most expensive — chronic/surgical departments cost more per patient

-- 11. Doctor-to-Patient Ratio by Department
--     Flags departments that may be understaffed
SELECT department,
       ROUND(AVG(patients_count::FLOAT / doctors_count), 2) AS patients_per_doctor
FROM patients
GROUP BY department
ORDER BY patients_per_doctor DESC;
-- Insight: Pediatrics (7.35 patients/doctor) and ENT (6.83) are most stretched
-- General Medicine (2.40) is relatively well-staffed

-- 12. Average Doctors Per Hospital
SELECT hospital_name, 
       ROUND(AVG(doctors_count), 2) AS avg_doctors
FROM patients
GROUP BY hospital_name
ORDER BY avg_doctors DESC;

-- 13. Seasonal Expense Trends (Q3 peak detection)
SELECT 
    CASE 
        WHEN EXTRACT(MONTH FROM admission_date) IN (1,2,3) THEN 'Q1 (Jan-Mar)'
        WHEN EXTRACT(MONTH FROM admission_date) IN (4,5,6) THEN 'Q2 (Apr-Jun)'
        WHEN EXTRACT(MONTH FROM admission_date) IN (7,8,9) THEN 'Q3 (Jul-Sep)'
        ELSE 'Q4 (Oct-Dec)'
    END AS quarter,
    ROUND(SUM(medical_expenses), 2) AS total_expenses,
    SUM(patients_count) AS total_patients
FROM patients
GROUP BY quarter
ORDER BY total_expenses DESC;
-- Insight: Q3 and Q4 show highest expenses — possible seasonal disease burden

-- 14. High-Burden Cities: Patients + Expense Combined View
SELECT location,
       SUM(patients_count) AS total_patients,
       ROUND(SUM(medical_expenses), 2) AS total_expenses,
       ROUND(SUM(medical_expenses)/SUM(patients_count), 2) AS expense_per_patient
FROM patients
GROUP BY location
ORDER BY total_patients DESC;
-- Insight: Jaipur & Ahmedabad have highest patient volume but vary in cost efficiency

# 🏥 Hospital Operations Analysis — SQL Project

## 📌 Project Overview

This project analyzes operational data from **10 hospitals across 10 major Indian cities** to uncover patterns in patient volume, department workload, medical expenses, and resource allocation. The goal is to provide data-driven insights that hospital administrators can use to optimize staffing, reduce costs, and improve patient care.

---

## 🎯 Problem Statement

Hospital administrators often lack a clear, data-driven view of:
- Which departments are **overloaded** with patients
- Where **medical costs** are highest and why
- How **staffing levels** relate to patient volumes
- Whether **seasonal trends** affect hospital expenses

This analysis answers all four questions using structured SQL queries on real hospital data.

---

## 📊 Dataset

| Attribute | Details |
|---|---|
| **Records** | 100 rows |
| **Hospitals** | 10 (Apollo Health, Fortis Care, City Hospital, etc.) |
| **Cities** | 10 (Delhi, Mumbai, Bangalore, Hyderabad, Chennai, etc.) |
| **Departments** | 10 (Cardiology, Neurology, Urology, Oncology, etc.) |
| **Columns** | Hospital Name, Location, Department, Doctors Count, Patients Count, Admission Date, Discharge Date, Medical Expenses |
| **Time Period** | 2023–2024 |

---

## 🔍 Key Findings

### 1. 🔴 Department Workload
- **Urology** is the busiest department with **1,766 patients** — nearly 3x more than the average department
- **Neurology (1,229)** and **ENT (1,064)** follow as the next most burdened departments
- **Jaipur (1,505)** and **Ahmedabad (1,467)** are the highest patient-volume cities

### 2. 💰 Medical Expenses
- **Healing Touch** recorded the highest total expenses at **₹3,52,178**
- **September** sees the peak in medical expenses (₹3,41,284) — suggesting seasonal disease burden in Q3
- **April** records the lowest expenses (₹88,995), possibly reflecting post-winter low admission rates

### 3. 🛏️ Length of Stay
- **Neurology** patients stay the longest on average (**9.25 days**) — consistent with the complexity of neurological conditions
- **Pediatrics (9.11 days)** and **Urology (8.72 days)** follow closely
- **Dermatology** has the shortest stays (**5.6 days**) — mostly outpatient-adjacent care

### 4. 👨‍⚕️ Staffing Efficiency (Original Analysis)
- **Pediatrics** has the highest patient-to-doctor ratio (**7.35 patients/doctor**) — a potential understaffing risk
- **General Medicine** is best staffed (**2.40 patients/doctor**) despite handling moderate patient volumes
- **Gynecology (₹351/patient)** and **Oncology (₹340/patient)** are the most expensive departments per patient — reflecting surgical and chronic care costs

---

## 💡 Business Recommendations

1. **Redistribute resources to Urology** — the 1,766 patient load with 5.6 patients/doctor signals risk of burnout and quality decline
2. **Investigate Q3 expense spike** — September's 60%+ expense surge vs April warrants root cause analysis (seasonal illness? elective surgeries?)
3. **Review Pediatrics staffing** — highest patient-to-doctor ratio at 7.35 needs immediate attention from a care quality perspective
4. **Benchmark Healing Touch costs** — their total expenses are 20% above average; a department-level audit is recommended

---

## 🛠️ Tools Used

- **SQL** (PostgreSQL)
- **Python / Pandas** (data validation)
- **Excel** (initial data exploration)

---

## 📁 Repository Structure

```
hospital-department-analysis/
│
├── README.md           ← Project overview and findings 
├── queries.sql         ← All SQL queries with comments and results
├── Hospital_Data.csv   ← Raw dataset
└── dashboard.png       ← Visual summary (coming soon — Power BI)
```

---

## 🚀 How to Run

1. Import `Hospital_Data.csv` into PostgreSQL or any SQL environment
2. Run queries from `queries.sql` in order
3. Each query includes comments explaining the business question and findings

---

- 🔗 www.linkedin.com/in/harshita-rajput-01389a1b6
- 📧 harshitaparihar.15@gmail.com



CREATE DATABASE hospital_management;
USE hospital_management;

-- Table for online retail app user login

CREATE TABLE IF NOT EXISTS user_login (
    user_id VARCHAR(255) PRIMARY KEY,
    user_password VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sign_up_on DATE,
    email_id VARCHAR(255)
);

-- Table for patient details

CREATE TABLE IF NOT EXISTS patient (
    email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(30) NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(60) NOT NULL,
    gender VARCHAR(20) NOT NULL
);

-- Table for medical history

CREATE TABLE IF NOT EXISTS medical_history (
    medical_history_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    conditions VARCHAR(100) NOT NULL,
    surgeries VARCHAR(100) NOT NULL,
    medication VARCHAR(100) NOT NULL
);

-- Table for doctor details

CREATE TABLE IF NOT EXISTS doctor (
    email VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(20) NOT NULL,
    password VARCHAR(30) NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Table for appointment details

CREATE TABLE IF NOT EXISTS appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status VARCHAR(15) NOT NULL
);

-- Table for patient visits

CREATE TABLE IF NOT EXISTS patient_visits (
    patient VARCHAR(50) NOT NULL,
    appt INT NOT NULL,
    concerns VARCHAR(40) NOT NULL,
    symptoms VARCHAR(40) NOT NULL,
    PRIMARY KEY (patient, appt),
    FOREIGN KEY (patient) REFERENCES patient(email),
    FOREIGN KEY (appt) REFERENCES appointment(appointment_id)
);

-- Table for doctor schedules

CREATE TABLE IF NOT EXISTS schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    break_time TIME NOT NULL,
    day VARCHAR(20) NOT NULL
);

-- Table for patients' medical history

CREATE TABLE IF NOT EXISTS patients_history (
    patient VARCHAR(50) NOT NULL,
    history INT NOT NULL,
    PRIMARY KEY (patient, history),
    FOREIGN KEY (patient) REFERENCES patient(email),
    FOREIGN KEY (history) REFERENCES medical_history(medical_history_id)
);

-- Table for diagnosis details

CREATE TABLE IF NOT EXISTS diagnose (
    appt INT NOT NULL,
    doctor VARCHAR(50) NOT NULL,
    diagnosis VARCHAR(40) NOT NULL,
    prescription VARCHAR(50) NOT NULL,
    PRIMARY KEY (appt, doctor),
    FOREIGN KEY (appt) REFERENCES appointment(appointment_id),
    FOREIGN KEY (doctor) REFERENCES doctor(email)
);

-- Table for doctor schedules

CREATE TABLE IF NOT EXISTS doctor_schedules (
    sched INT NOT NULL,
    doctor VARCHAR(50) NOT NULL,
    PRIMARY KEY (sched, doctor),
    FOREIGN KEY (sched) REFERENCES schedule(schedule_id),
    FOREIGN KEY (doctor) REFERENCES doctor(email)
);

-- Table for doctor view history

CREATE TABLE IF NOT EXISTS doctor_view_history (
    history INT NOT NULL,
    doctor VARCHAR(50) NOT NULL,
    PRIMARY KEY (history, doctor),
    FOREIGN KEY (history) REFERENCES medical_history(medical_history_id),
    FOREIGN KEY (doctor) REFERENCES doctor(email)
);

-- Insert sample data into user_login
INSERT INTO user_login (user_id, user_password, first_name, last_name, sign_up_on, email_id) VALUES
('user1', 'pass123', 'Raj', 'Patel', '2024-01-01', 'raj.patel@example.com'),
('user2', 'pass456', 'Anita', 'Sharma', '2024-02-01', 'anita.sharma@example.com'),
('user3', 'pass789', 'Amit', 'Singh', '2024-03-01', 'amit.singh@example.com'),
('user4', 'pass101', 'Sneha', 'Reddy', '2024-04-01', 'sneha.reddy@example.com'),
('user5', 'pass202', 'Ravi', 'Kumar', '2024-05-01', 'ravi.kumar@example.com');
-- Output
SELECT * FROM user_login;

-- Insert sample data into patient
INSERT INTO patient (email, password, name, address, gender) VALUES
('patient1@example.com', 'password1', 'Amit Singh', '123 Mango Street', 'Male'),
('patient2@example.com', 'password2', 'Sneha Reddy', '456 Coconut Lane', 'Female'),
('patient3@example.com', 'password3', 'Ravi Kumar', '789 Banana Road', 'Male'),
('patient4@example.com', 'password4', 'Pooja Sharma', '101 Papaya Avenue', 'Female'),
('patient5@example.com', 'password5', 'Vikram Patel', '202 Guava Boulevard', 'Male');
-- Output
SELECT * FROM patient;


-- Insert sample data into medical_history
INSERT INTO medical_history (date, conditions, surgeries, medication) VALUES
('2024-03-01', 'Hypertension', 'None', 'Amlodipine'),
('2024-03-15', 'Diabetes', 'Appendectomy', 'Metformin'),
('2024-04-01', 'Asthma', 'None', 'Albuterol'),
('2024-05-01', 'Back Pain', 'None', 'Ibuprofen'),
('2024-06-01', 'Allergy', 'None', 'Cetirizine');
-- Output
SELECT * FROM medical_history;


-- Insert sample data into doctor
INSERT INTO doctor (email, gender, password, name) VALUES
('doctor1@example.com', 'Male', 'docpass1', 'Dr. Arun Sharma'),
('doctor2@example.com', 'Female', 'docpass2', 'Dr. Neha Gupta'),
('doctor3@example.com', 'Male', 'docpass3', 'Dr. Rajesh Patel'),
('doctor4@example.com', 'Female', 'docpass4', 'Dr. Priya Desai'),
('doctor5@example.com', 'Male', 'docpass5', 'Dr. Vijay Kumar');
-- Output
SELECT * FROM medical_history;


-- Insert sample data into appointment
INSERT INTO appointment (date, start_time, end_time, status) VALUES
('2024-03-01', '09:00:00', '10:00:00', 'Scheduled'),
('2024-03-15', '10:00:00', '11:00:00', 'Completed'),
('2024-04-01', '11:00:00', '12:00:00', 'Cancelled'),
('2024-05-01', '13:00:00', '14:00:00', 'Scheduled'),
('2024-06-01', '15:00:00', '16:00:00', 'Completed');
-- Output
SELECT * FROM appointment;


-- Insert sample data into patient_visits
INSERT INTO patient_visits (patient, appt, concerns, symptoms) VALUES
('patient1@example.com', 1, 'Headache', 'Nausea'),
('patient2@example.com', 2, 'Abdominal pain', 'Vomiting'),
('patient3@example.com', 3, 'Shortness of breath', 'Wheezing'),
('patient4@example.com', 4, 'Lower back pain', 'Muscle ache'),
('patient5@example.com', 5, 'Itchy eyes', 'Sneezing');
-- Output
SELECT * FROM patient_visits;


-- Insert sample data into schedule
INSERT INTO schedule (start_time, end_time, break_time, day) VALUES
('08:00:00', '12:00:00', '00:30:00', 'Monday'),
('13:00:00', '17:00:00', '00:30:00', 'Tuesday'),
('09:00:00', '13:00:00', '00:30:00', 'Wednesday'),
('14:00:00', '18:00:00', '00:30:00', 'Thursday'),
('10:00:00', '14:00:00', '00:30:00', 'Friday');
-- Output
SELECT * FROM schedule;


-- Insert sample data into patients_history
INSERT INTO patients_history (patient, history) VALUES
('patient1@example.com', 1),
('patient2@example.com', 2),
('patient3@example.com', 3),
('patient4@example.com', 4),
('patient5@example.com', 5);
-- Output
SELECT * FROM patients_history;


-- Insert sample data into diagnose
INSERT INTO diagnose (appt, doctor, diagnosis, prescription) VALUES
(1, 'doctor1@example.com', 'Migraine', 'Ibuprofen'),
(2, 'doctor2@example.com', 'Gastritis', 'Omeprazole'),
(3, 'doctor3@example.com', 'Chronic Bronchitis', 'Steroids'),
(4, 'doctor4@example.com', 'Muscle Strain', 'Muscle Relaxants'),
(5, 'doctor5@example.com', 'Allergic Rhinitis', 'Antihistamines');
-- Output
SELECT * FROM diagnose;


-- Insert sample data into doctor_schedules
INSERT INTO doctor_schedules (sched, doctor) VALUES
(1, 'doctor1@example.com'),
(2, 'doctor2@example.com'),
(3, 'doctor3@example.com'),
(4, 'doctor4@example.com'),
(5, 'doctor5@example.com');
-- Output
SELECT * FROM doctor_schedules;


-- Insert sample data into doctor_view_history
INSERT INTO doctor_view_history (history, doctor) VALUES
(1, 'doctor1@example.com'),
(2, 'doctor2@example.com'),
(3, 'doctor3@example.com'),
(4, 'doctor4@example.com'),
(5, 'doctor5@example.com');
-- Output
SELECT * FROM doctor_view_history;




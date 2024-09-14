
CREATE DATABASE student_management;
USE student_management;
drop database student_management;
-- Drop tables if they exist
DROP TABLE IF EXISTS user_login;
CREATE TABLE user_login (
    user_id VARCHAR(255) PRIMARY KEY,
    user_password VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sign_up_date VARCHAR(25),
    email_id VARCHAR(255)
);


CREATE TABLE parent_details (
    parent_id VARCHAR(255) PRIMARY KEY,
    father_first_name VARCHAR(255),
    father_last_name VARCHAR(255),
    father_email_id VARCHAR(255),
    father_mobile VARCHAR(255),
    father_occupation VARCHAR(255),
    mother_first_name VARCHAR(255),
    mother_last_name VARCHAR(255),
    mother_email_id VARCHAR(255),
    mother_mobile VARCHAR(255),
    mother_occupation VARCHAR(255)
);


CREATE TABLE teachers (
    teacher_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    email_id VARCHAR(255),
    contact VARCHAR(255),
    registration_date DATE,
    registration_id VARCHAR(255) UNIQUE
);


CREATE TABLE class_details (
    class_id VARCHAR(255) PRIMARY KEY,
    class_teacher VARCHAR(255),
    class_year VARCHAR(255)
);


CREATE TABLE student_details (
    student_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    class_id VARCHAR(255),
    roll_no VARCHAR(255),
    email_id VARCHAR(255),
    parent_id VARCHAR(255),
    registration_date DATE,
    registration_id VARCHAR(255) UNIQUE,
    FOREIGN KEY (class_id) REFERENCES class_details(class_id),
    FOREIGN KEY (parent_id) REFERENCES parent_details(parent_id)
);

CREATE TABLE subject (
    subject_id VARCHAR(255) PRIMARY KEY,
    subject_name VARCHAR(255),
    class_year VARCHAR(255),
    subject_head VARCHAR(255),
    FOREIGN KEY (subject_head) REFERENCES teachers(teacher_id)
);


CREATE TABLE subject_tutors (
    row_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id VARCHAR(255),
    teacher_id VARCHAR(255),
    class_id VARCHAR(255),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (class_id) REFERENCES class_details(class_id)
);


-- Insert data into user_login
INSERT INTO user_login (user_id, user_password, first_name, last_name, sign_up_date, email_id) VALUES
('user657', 'GDigegfw123', 'Ankit', 'Sharma', '2024-01-15', 'amit.sharma@gmail.com'),
('user784', 'UIDhagIG646', 'Priya', 'Kumar', '2024-02-20', 'priya.kumar@hijhdu.com'),
('user758', 'hhdsdg687gd', 'Ravi', 'Chopra', '2024-03-12', 'ravi.patel@uhuf.com'),
('user978', 'urfu7iuifTFD', 'Anita', 'Kumar', '2024-04-05', 'anita.verma@apnatime.com'),
('user854', 'HUIGfuih783t', 'Sohan', 'Reddy', '2024-05-18', 'sohan.reddy@ramnam.com');

-- Output
SELECT * FROM user_login;

-- Insert data into parent_details
INSERT INTO parent_details (parent_id, father_first_name, father_last_name, father_email_id, father_mobile, father_occupation, mother_first_name, mother_last_name, mother_email_id, mother_mobile, mother_occupation) VALUES
('parent001', 'Govind', 'Sharma', 'Govind.sharma@example.com', '9876543210', 'Engineer', 'Usha', 'Sharma', 'Usha.sharma@example.com', '9123456780', 'Teacher'),
('parent002', 'Ravi', 'Sharma', 'ravi.sharma@example.com', '9765432109', 'Doctor', 'Anita', 'Sharma', 'anita.sharma@example.com', '9234567890', 'Nurse'),
('parent003', 'Sunil', 'Chopra', 'sunil.chopra@example.com', '9654321098', 'Businessman', 'Neeta', 'Chopra', 'neeta.chopra@example.com', '9345678901', 'Housewife'),
('parent004', 'Manoj', 'Kumar', 'manoj.kumar@example.com', '9543210987', 'Lawyer', 'Rupa', 'Kumar', 'rupa.kumar@example.com', '9123456790', 'Consultant'),
('parent005', 'Deepak', 'Jain', 'deepak.jain@example.com', '9432109876', 'Architect', 'Kiran', 'Jain', 'kiran.jain@example.com', '9213456789', 'Teacher');

-- Output
SELECT * FROM parent_details;

-- Insert data into teachers
INSERT INTO teachers (teacher_id, first_name, last_name, date_of_birth, email_id, contact, registration_date, registration_id) VALUES
('teacher001', 'Rohit', 'Mehta', '1985-06-15', 'rohit.mehta@example.com', '9812345678', '2024-01-01', 'REG123456'),
('teacher002', 'Neha', 'Gupta', '1988-09-23', 'neha.gupta@example.com', '9988776655', '2024-01-05', 'REG123457'),
('teacher003', 'Amit', 'Sharma', '1990-03-10', 'amit.sharma@example.com', '9701234567', '2024-02-01', 'REG123458'),
('teacher004', 'Priya', 'Singh', '1987-12-20', 'priya.singh@example.com', '9834567890', '2024-02-10', 'REG123459'),
('teacher005', 'Vijay', 'Reddy', '1982-07-18', 'vijay.reddy@example.com', '9888776655', '2024-03-01', 'REG123460');

-- Output
SELECT * FROM teachers;

-- Insert data into class_details
INSERT INTO class_details (class_id, class_teacher, class_year) VALUES
('class001', 'Ram', '2024'),
('class002', 'Shyam', '2024'),
('class003', 'Geeta', '2024'),
('class004', 'Kishan', '2024'),
('class005', 'Gopal', '2024');

-- Output
SELECT * FROM class_details;


-- Insert data into student_details
INSERT INTO student_details (student_id, first_name, last_name, date_of_birth, class_id, roll_no, email_id, parent_id, registration_date, registration_id) VALUES
('student001', 'Aarav', 'Singh', '2010-05-12', 'class001', 'ROLL001', 'aarav.singh@example.com', 'parent001', '2024-01-10', 'REGSTU123456'),
('student002', 'Isha', 'Sharma', '2011-11-22', 'class002', 'ROLL002', 'isha.sharma@example.com', 'parent002', '2024-01-12', 'REGSTU123457'),
('student003', 'Vivaan', 'Patel', '2012-08-30', 'class003', 'ROLL003', 'vivaan.patel@example.com', 'parent003', '2024-01-15', 'REGSTU123458'),
('student004', 'Anaya', 'Verma', '2010-09-25', 'class004', 'ROLL004', 'anaya.verma@example.com', 'parent004', '2024-01-18', 'REGSTU123459'),
('student005', 'Arjun', 'Reddy', '2011-06-10', 'class005', 'ROLL005', 'arjun.reddy@example.com', 'parent005', '2024-01-20', 'REGSTU123460');

-- Output
SELECT * FROM class_details;


-- Insert data into subject
INSERT INTO subject (subject_id, subject_name, class_year, subject_head) VALUES
('subject001', 'Mathematics', '2024', 'teacher001'),
('subject002', 'Science', '2024', 'teacher002'),
('subject003', 'English', '2024', 'teacher003'),
('subject004', 'History', '2024', 'teacher004'),
('subject005', 'Geography', '2024', 'teacher005');

-- Output
SELECT * FROM subject;


-- Insert data into subject_tutors
INSERT INTO subject_tutors (subject_id, teacher_id, class_id) VALUES
('subject001', 'teacher001', 'class001'),
('subject002', 'teacher002', 'class002'),
('subject003', 'teacher003', 'class003'),
('subject004', 'teacher004', 'class004'),
('subject005', 'teacher005', 'class005');

-- Output
SELECT * FROM subject_tutors;
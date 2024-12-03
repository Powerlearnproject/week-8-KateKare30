CREATE DATABASE SDG_Health;

USE SDG_Health;

CREATE TABLE Children (
    Child_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Year_in_School VARCHAR(50),
    Major VARCHAR(100)
);

CREATE TABLE Diet (
    Diet_ID INT AUTO_INCREMENT PRIMARY KEY,
    Child_ID INT,
    Daily_Calories INT,
    Daily_Sugar_Intake INT,
    Daily_Fat_Intake INT,
    Date DATE,
    FOREIGN KEY (Child_ID) REFERENCES Children(Child_ID)
);

CREATE TABLE Physical_Activity (
    Activity_ID INT AUTO_INCREMENT PRIMARY KEY,
    Child_ID INT,
    Daily_Exercise_Minutes INT,
    Daily_Screen_Time_Minutes INT,
    Date DATE,
    FOREIGN KEY (Child_ID) REFERENCES Children(Child_ID)
);

CREATE TABLE Health (
    Health_ID INT AUTO_INCREMENT PRIMARY KEY,
    Child_ID INT,
    Height DECIMAL(5,2),
    Weight DECIMAL(5,2),
    BMI DECIMAL(5,2),
    Date DATE,
    FOREIGN KEY (Child_ID) REFERENCES Children(Child_ID)
);
INSERT INTO Children (Name, Age, Gender, Year_in_School, Major) VALUES
('John Doe', 10, 'Male', 'Grade 5', 'None'),
('Jane Smith', 17, 'Female', 'Grade 11', 'Math'),
('Jane Smit', 10, 'Female', 'Grade 6', 'None'),
('Janet Smiths', 12, 'Female', 'Grade 8', 'None'),
('Jaye Kith', 19, 'Male', 'Grade 12', 'History');

INSERT INTO Diet (Child_ID, Daily_Calories, Daily_Sugar_Intake, Daily_Fat_Intake, Date) VALUES
(1, 2000, 50, 90, '2023-01-01'),
(2, 1800, 40, 60, '2023-01-01'),
(3, 1400, 30, 89, '2023-01-01'),
(4, 900, 40, 60, '2023-01-01'),
(5, 700, 55, 50, '2023-01-01');

INSERT INTO Physical_Activity (Child_ID, Daily_Exercise_Minutes, Daily_Screen_Time_Minutes, Date) VALUES
(1, 60, 120, '2023-01-01'),
(2, 45, 150, '2023-01-01'),
(3, 30, 180, '2023-01-01'),
(4, 15, 100, '2023-01-01'),
(5, 45, 150, '2023-01-01');

INSERT INTO Health (Child_ID, Height, Weight, BMI, Date) VALUES
(1, 140, 35, 17.9, '2023-01-01'),
(2, 150, 80, 25.8, '2023-01-01'),
(3, 180, 40, 12.8, '2023-01-01'),
(4, 190, 40, 38.8, '2023-01-01'),
(5, 149, 120, 29.8, '2023-01-01');
select c.Name, c.Age, c.Gender, c.Year_in_School, d.Child_ID, d.Daily_Calories, d.Daily_Sugar_Intake, d.Daily_Fat_Intake, 
h.Height, h.Weight, h.BMI, p.Daily_Exercise_Minutes, p.Daily_Screen_Time_Minutes from children c
left join diet d on d.child_id=c.child_id
left join health h on h.child_id = d.child_id
left join Physical_Activity p on p.child_id=h.child_id;

select * from children;

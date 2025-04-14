CREATE DATABASE project_management;

USE project_management
go

CREATE TABLE Project (
    id INT PRIMARY KEY IDENTITY(1,1),
    project_name VARCHAR(255),
    description TEXT,
    start_date DATE,
    status VARCHAR(50),
);

CREATE TABLE Employee (
    id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    designation VARCHAR(100),
    gender VARCHAR(50),
    salary DECIMAL(10,2),
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES Project(id)
);

CREATE TABLE Task (
    task_id INT PRIMARY KEY IDENTITY(1,1),
    task_name VARCHAR(255),
    project_id INT,
    employee_id INT,
    status VARCHAR(50),
    FOREIGN KEY (project_id) REFERENCES Project(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);













INSERT INTO Project (project_name, description, start_date, status) VALUES
('AI Chatbot', 'Developing a chatbot using NLP', '2024-01-15', 'In Progress'),
('E-Commerce Website', 'Building an online shopping platform', '2023-12-10', 'Completed'),
('HR Management System', 'An HR automation tool', '2024-02-01', 'In Progress'),
('Healthcare App', 'A mobile app for patient tracking', '2023-11-20', 'Pending'),
('Cloud Storage System', 'Developing a cloud-based storage service', '2023-09-30', 'Completed'),
('IoT Smart Home', 'Home automation using IoT', '2024-03-10', 'In Progress'),
('Banking Security System', 'Implementing fraud detection in banking', '2024-04-05', 'Pending'),
('Supply Chain Analytics', 'Data-driven supply chain optimization', '2023-08-15', 'Completed'),
('Social Media App', 'Building a new social networking platform', '2024-05-01', 'In Progress'),
('Automated Attendance System', 'AI-powered employee attendance system', '2023-10-12', 'Completed');


INSERT INTO Employee (Name, designation, gender, salary, project_id) VALUES
('Sakthi', 'Software Engineer', 'Male', 75000.00, 1),
('Joe', 'Project Manager', 'Female', 95000.00, 2),
('Ram', 'Data Scientist', 'Female', 85000.00, 3),
('Sri', 'Backend Developer', 'Male', 72000.00, 1),
('Naveen', 'Frontend Developer', 'Male', 70000.00, 2),
('Krish', 'HR Specialist', 'Female', 60000.00, 3),
('Sanjay', 'Cloud Engineer', 'Male', 80000.00, 5),
('Dharani', 'UX Designer', 'Female', 65000.00, 4),
('Saran', 'Security Analyst', 'Male', 77000.00, 7),
('Naresh', 'DevOps Engineer', 'Female', 82000.00, 6);


INSERT INTO Task (task_name, project_id, employee_id, status) VALUES
('Design Chatbot Flow', 1, 1, 'In Progress'),
('Database Optimization', 2, 2, 'Completed'),
('Data Preprocessing', 3, 3, 'Pending'),
('Develop API Endpoints', 1, 4, 'In Progress'),
('UI Design', 2, 5, 'Completed'),
('Employee Records Automation', 3, 6, 'In Progress'),
('Cloud Deployment', 5, 7, 'Pending'),
('App Wireframing', 4, 8, 'Completed'),
('Security Patch Update', 7, 9, 'In Progress'),
('CI/CD Pipeline Setup', 6, 10, 'Completed');

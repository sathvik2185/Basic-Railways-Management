USE [RAILWAYS MANAGEMENT];


CREATE TABLE Passenger (
    Passenger_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Passenger VALUES
('P001', 'Rajesh Kumar', 45, 'Male', '9876543210', 'rajesh.kumar@email.com'),
('P002', 'Anjali Sharma', 34, 'Female', '9876543211', 'anjali.sharma@email.com'),
('P003', 'Vikram Singh', 28, 'Male', '9876543212', 'vikram.singh@email.com'),
('P004', 'Priya Verma', 22, 'Female', '9876543213', 'priya.verma@email.com'),
('P005', 'Amit Patel', 50, 'Male', '9876543214', 'amit.patel@email.com'),
('P006', 'Sunita Rao', 39, 'Female', '9876543215', 'sunita.rao@email.com'),
('P007', 'Deepak Mehta', 31, 'Male', '9876543216', 'deepak.mehta@email.com'),
('P008', 'Kavita Desai', 27, 'Female', '9876543217', 'kavita.desai@email.com'),
('P009', 'Manoj Pillai', 42, 'Male', '9876543218', 'manoj.pillai@email.com'),
('P010', 'Sneha Nair', 29, 'Female', '9876543219', 'sneha.nair@email.com'),
('P011', 'Arjun Reddy', 36, 'Male', '9876543220', 'arjun.reddy@email.com'),
('P012', 'Meera Iyer', 33, 'Female', '9876543221', 'meera.iyer@email.com'),
('P013', 'Sanjay Gupta', 47, 'Male', '9876543222', 'sanjay.gupta@email.com'),
('P014', 'Nisha Aggarwal', 26, 'Female', '9876543223', 'nisha.aggarwal@email.com'),
('P015', 'Rohit Malhotra', 38, 'Male', '9876543224', 'rohit.malhotra@email.com');


CREATE TABLE Train_Details (
    Train_ID VARCHAR(10) PRIMARY KEY,
    Train_Name VARCHAR(100),
    Train_Type_ID VARCHAR(10),
    Origin_Station_ID VARCHAR(10),
    Destination_Station_ID VARCHAR(10)
);

INSERT INTO Train_Details VALUES
('T001', 'Kerala Express', 'TT001', 'S001', 'S010'),
('T002', 'Rajdhani Express', 'TT002', 'S002', 'S011'),
('T003', 'Shatabdi Express', 'TT003', 'S003', 'S012'),
('T004', 'Garib Rath Express', 'TT004', 'S004', 'S013'),
('T005', 'Duronto Express', 'TT005', 'S005', 'S014');


CREATE TABLE Train_Types (
    Train_Type_ID VARCHAR(10) PRIMARY KEY,
    Train_Type_Name VARCHAR(50)
);

INSERT INTO Train_Types VALUES
('TT001', 'Superfast'),
('TT002', 'Rajdhani'),
('TT003', 'Shatabdi'),
('TT004', 'Garib Rath'),
('TT005', 'Duronto');


CREATE TABLE Station (
    Station_ID VARCHAR(10) PRIMARY KEY,
    Station_Name VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Station VALUES
('S001', 'Thiruvananthapuram', 'Kerala'),
('S002', 'New Delhi', 'Delhi'),
('S003', 'Chennai Central', 'Tamil Nadu'),
('S004', 'Mumbai CST', 'Maharashtra'),
('S005', 'Howrah Junction', 'West Bengal'),
('S006', 'Bengaluru City', 'Karnataka'),
('S007', 'Hyderabad Deccan', 'Telangana');

CREATE TABLE Schedule (
    Schedule_ID VARCHAR(10) PRIMARY KEY,
    Train_ID VARCHAR(10), --FOREIGN KEY to train_details 
    Station_ID VARCHAR(10), --FOREIGN KEY to station
    Arrival_Time TIME,
    Departure_Time TIME,
    FOREIGN KEY (Train_ID) REFERENCES Train_Details(Train_ID),
    FOREIGN KEY (Station_ID) REFERENCES Station(Station_ID)
);

INSERT INTO Schedule VALUES
('SCH001', 'T001', 'S001', '08:00', '08:15'),
('SCH002', 'T001', 'S006', '12:00', '12:10'),
('SCH003', 'T002', 'S002', '14:00', '14:20'),
('SCH004', 'T003', 'S003', '16:00', '16:15'),
('SCH005', 'T004', 'S004', '18:00', '18:10');

CREATE TABLE Reservation (
    Reservation_ID VARCHAR(10) PRIMARY KEY,
    Passenger_ID VARCHAR(10), --FOREIGN KEY to passenger
    Train_ID VARCHAR(10), -- FOREIGN KEY to train_details
    Reservation_Date DATE,
    Seat_Number INT,
    Coach_ID VARCHAR(10), --FOREIGN KEY to coach
    Payment_ID VARCHAR(10),
);

INSERT INTO Reservation VALUES
('R001', 'P001', 'T001', '2025-03-10', 21, 'C001', 'PAY001'),
('R002', 'P002', 'T002', '2025-03-11', 15, 'C002', 'PAY002'),
('R003', 'P003', 'T003', '2025-03-12', 10, 'C003', 'PAY003'),
('R004', 'P004', 'T004', '2025-03-13', 5, 'C004', 'PAY004'),
('R005', 'P005', 'T005', '2025-03-14', 30, 'C005', 'PAY005');

CREATE TABLE Payment (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Reservation_ID VARCHAR(10), --FOREIGN KEY to reservation
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method VARCHAR(20),
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID)
);

INSERT INTO Payment VALUES
('PAY001', 'R001', 1500, '2025-03-10', 'Credit Card'),
('PAY002', 'R002', 2000, '2025-03-11', 'Debit Card'),
('PAY003', 'R003', 1800, '2025-03-12', 'Cash');

CREATE TABLE Cargo (
    Cargo_ID VARCHAR(10) PRIMARY KEY,
    Train_ID VARCHAR(10), -- FOREIGN KEY to train_details
    Sender_Name VARCHAR(50),
    Receiver_Name VARCHAR(50),
    Cargo_Type VARCHAR(30),
    Weight_kg INT,
    Departure_Station VARCHAR(10),
    Arrival_Station VARCHAR(10),
    Delivery_Status VARCHAR(20)
);

INSERT INTO Cargo VALUES
('C001', 'T001', 'ABC Logistics', 'XYZ Traders', 'Electronics', 1200, 'S001', 'S010', 'In Transit'),
('C002', 'T002', 'FreshFarms', 'GreenGrocers', 'Vegetables', 850, 'S002', 'S011', 'Delivered'),
('C003', 'T003', 'AutoMakers', 'Dealers Pvt.', 'Automobiles', 5000, 'S003', 'S012', 'In Transit'),
('C004', 'T004', 'PharmaCorp', 'HealthPlus', 'Medicines', 450, 'S004', 'S013', 'Dispatched'),
('C005', 'T005', 'FashionWear', 'Retailers Ltd', 'Textiles', 3000, 'S005', 'S014', 'Delivered');

CREATE TABLE Food (
    Food_ID VARCHAR(10) PRIMARY KEY,
    Train_ID VARCHAR(10), -- FOREIGM KEY to train_details
    Food_Item VARCHAR(50),
    Price DECIMAL(10,2),
    Availability_Status VARCHAR(20),
    FOREIGN KEY (Train_ID) REFERENCES Train_Details(Train_ID)
);

INSERT INTO Food VALUES
('F001', 'T001', 'Veg Thali', 150, 'Available'),
('F002', 'T002', 'Chicken Biryani', 200, 'Available'),
('F003', 'T003', 'Masala Dosa', 100, 'Limited Stock'),
('F004', 'T004', 'Paneer Butter Masala', 180, 'Available'),
('F005', 'T005', 'Idli Sambar', 80, 'Out of Stock');

CREATE TABLE Seating_Types (
    Seat_Type_ID VARCHAR(10) PRIMARY KEY,
    Seat_Type_Name VARCHAR(50),
    Description VARCHAR(255)
);

INSERT INTO Seating_Types VALUES
('ST001', 'Sleeper Class', 'Affordable sleeping berths'),
('ST002', 'AC 3-Tier', 'Air-conditioned 3-tier berths'),
('ST003', 'AC 2-Tier', 'Air-conditioned 2-tier berths'),
('ST004', 'Executive Class', 'Premium seating with extra space');

CREATE TABLE Coaches (
    Coach_ID VARCHAR(10) PRIMARY KEY,
    Train_ID VARCHAR(10), --FOREIGN KEY to train_details
    Seat_Type_ID VARCHAR(10), --FOREIGN KEY to seating_types
    Total_Seats INT,
    Coach_Type VARCHAR(50),
    FOREIGN KEY (Train_ID) REFERENCES Train_Details(Train_ID),
    FOREIGN KEY (Seat_Type_ID) REFERENCES Seating_Types(Seat_Type_ID)
);

INSERT INTO Coaches VALUES
('C001', 'T001', 'ST001', 72, 'Sleeper'),
('C002', 'T002', 'ST002', 64, 'AC 3-Tier'),
('C003', 'T003', 'ST003', 48, 'AC 2-Tier'),
('C004', 'T004', 'ST004', 30, 'Executive'),
('C005', 'T005', 'ST001', 80, 'Sleeper');

CREATE TABLE Complaint (
    Complaint_ID VARCHAR(10) PRIMARY KEY,
    Passenger_ID VARCHAR(10), --FOREIGN KEY to passenger
    Train_ID VARCHAR(10), --FOREIGN KEY to train_details
    Complaint_Type VARCHAR(50),
    Description TEXT,
    Status VARCHAR(20)
);

INSERT INTO Complaint (Complaint_ID, Passenger_ID, Train_ID, Complaint_Type, Description, Status)
VALUES
('CMP001', 'P001', 'T001', 'Delayed Train', 'Train delayed by 3 hours', 'Resolved'),
('CMP002', 'P002', 'T002', 'Unhygienic Food', 'Food served was stale', 'Pending'),
('CMP003', 'P003', 'T003', 'AC Not Working', 'AC was not functioning properly', 'In Process'),
('CMP004', 'P004', 'T004', 'Seat Issue', 'Seat was not as per booking', 'Resolved'),
('CMP005', 'P005', 'T005', 'Lost Luggage', 'Luggage was missing', 'Pending');

CREATE TABLE Employee (
    Employee_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Position VARCHAR(50),
    Train_ID VARCHAR(10), -- FOREIGN KEY to train_details
    Station_ID VARCHAR(10), -- FOREIGN KEY to station
    Contact_Number VARCHAR(15),
    Department VARCHAR(50)
);

INSERT INTO Employee (Employee_ID, Name, Age, Gender, Position, Train_ID, Station_ID, Contact_Number, Department)
VALUES
('E001', 'Ramesh Iyer', 45, 'Male', 'Train Driver', 'T001', 'S001', '9876543201', 'Operations'),
('E002', 'Suman Sharma', 38, 'Female', 'Ticket Collector', 'T002', 'S002', '9876543202', 'Ticketing'),
('E003', 'Arun Prakash', 50, 'Male', 'Train Conductor', 'T003', 'S003', '9876543203', 'Operations'),
('E004', 'Preeti Verma', 30, 'Female', 'Catering Manager', 'T004', 'S004', '9876543204', 'Catering'),
('E005', 'Vinod Reddy', 42, 'Male', 'Security Officer', 'T005', 'S005', '9876543205', 'Security'),
('E006', 'Kavitha Menon', 35, 'Female', 'Ticket Collector', 'T001', 'S006', '9876543206', 'Ticketing'),
('E007', 'Sandeep Joshi', 28, 'Male', 'Maintenance Staff', 'T002', 'S007', '9876543207', 'Maintenance'),
('E008', 'Radha Krishnan', 40, 'Male', 'Senior Technician', 'T003', 'S001', '9876543208', 'Technical'),
('E009', 'Anusha Pillai', 32, 'Female', 'Train Attendant', 'T004', 'S002', '9876543209', 'Hospitality'),
('E010', 'Mohan Gupta', 48, 'Male', 'Locomotive Engineer', 'T005', 'S003', '9876543210', 'Operations'),
('E011', 'Neha Agarwal', 29, 'Female', 'Station Master', 'T001', 'S004', '9876543211', 'Management'),
('E012', 'Prakash Singh', 37, 'Male', 'Baggage Handler', 'T002', 'S005', '9876543212', 'Logistics'),
('E013', 'Sneha Ramesh', 31, 'Female', 'Food Supplier', 'T003', 'S006', '9876543213', 'Catering'),
('E014', 'Gopal Desai', 46, 'Male', 'Security Guard', 'T004', 'S007', '9876543214', 'Security'),
('E015', 'Meena Chatterjee', 33, 'Female', 'Customer Service', 'T005', 'S001', '9876543215', 'Customer Service');

CREATE TABLE Enquiry (
    Enquiry_ID VARCHAR(10) PRIMARY KEY,
    Passenger_ID VARCHAR(10), -- FOREIGN KEY to passenger
    Train_ID VARCHAR(10), -- FOREIGN KEY to train_details
    Enquiry_Type VARCHAR(50),
    Enquiry_Details TEXT,
    Response_Status VARCHAR(20)
);

INSERT INTO Enquiry (Enquiry_ID, Passenger_ID, Train_ID, Enquiry_Type, Enquiry_Details, Response_Status)
VALUES
('ENQ001', 'P001', 'T001', 'Ticket Booking', 'Asked about seat availability', 'Resolved'),
('ENQ002', 'P002', 'T002', 'Train Timing', 'Wanted to confirm departure time', 'Resolved'),
('ENQ003', 'P003', 'T003', 'Food Service', 'Asked about veg meal availability', 'Pending'),
('ENQ004', 'P004', 'T004', 'Cancellation', 'Asked about refund policy', 'Resolved'),
('ENQ005', 'P005', 'T005', 'Luggage Policy', 'Asked about baggage rules', 'In Process'),
('ENQ006', 'P006', 'T001', 'Seat Change', 'Requested a window seat', 'Resolved'),
('ENQ007', 'P007', 'T002', 'Coach Details', 'Asked about AC vs Sleeper coach', 'Pending');

CREATE TABLE Running_Status (
    Status_ID VARCHAR(10) PRIMARY KEY,
    Train_ID VARCHAR(10), -- FOREIGN KEY to train_details
    Current_Station_ID VARCHAR(10),
    Expected_Arrival TIME,
    Expected_Departure TIME,
    Delay_Status VARCHAR(20)
);

INSERT INTO Running_Status (Status_ID, Train_ID, Current_Station_ID, Expected_Arrival, Expected_Departure, Delay_Status)
VALUES
('RS001', 'T001', 'S003', '09:00 AM', '09:15 AM', 'On Time'),
('RS002', 'T002', 'S005', '02:30 PM', '02:45 PM', '10 min Late'),
('RS003', 'T003', 'S007', '05:00 PM', '05:15 PM', 'On Time'),
('RS004', 'T004', 'S002', '07:00 AM', '07:10 AM', '5 min Early'),
('RS005', 'T005', 'S004', '11:00 AM', '11:20 AM', '15 min Late'),
('RS006', 'T001', 'S006', '03:00 PM', '03:15 PM', 'On Time'),
('RS007', 'T002', 'S001', '06:00 PM', '06:20 PM', '20 min Late');



                    --DBMS QUERIES FOR PROJECT 'RAILWAYS MANAGEMENT SYSTEM'




SELECT * FROM Passenger;

SELECT * FROM Train_Details;

SELECT * FROM Train_Types;

SELECT * FROM Station;

SELECT * FROM Schedule;

SELECT * FROM Reservation;

SELECT * FROM Payment;

SELECT * FROM Cargo;

SELECT * FROM Food;

SELECT * FROM Types_of_Seating;

SELECT * FROM Coaches;

SELECT * FROM Complaint;

SELECT * FROM Employee_Details;

SELECT * FROM Enquiry;

SELECT * FROM Running_Status;

--Q)Which male passengers are listed in the database?
SELECT * FROM Passenger WHERE Gender = 'Male';

--Q)Which female passengers are listed in the database?
SELECT * FROM Passenger WHERE Gender = 'Female';

--Q)Which passengers are older than 40 years?
SELECT * FROM Passenger WHERE Age > 40;

--Q)What are the names and types of all trains available?
SELECT Train_Name, Train_Type_Name FROM Train_Details
JOIN Train_Types ON Train_Details.Train_Type_ID = Train_Types.Train_Type_ID;

--Q)Which passengers have made reservations?
SELECT Name FROM Passenger
JOIN Reservation ON Passenger.Passenger_ID = Reservation.Passenger_ID;

--Q)How many total passengers are there in the database?
SELECT COUNT(*) AS Total_Passengers FROM Passenger;

--Q)How many total trains are listed in the database?
SELECT COUNT(*) AS Total_Trains FROM Train_Details;

--Q)Which passengers have reserved tickets for the 'Kerala Express' train?
SELECT Name FROM Passenger
JOIN Reservation ON Passenger.Passenger_ID = Reservation.Passenger_ID
JOIN Train_Details ON Reservation.Train_ID = Train_Details.Train_ID
WHERE Train_Name = 'Kerala Express';

--Q)What is the schedule of all trains ordered by their arrival time?
SELECT * FROM Schedule ORDER BY Arrival_Time;

--Q)How many reservations have been made for each train?
SELECT Train_ID, COUNT(*) AS Total_Reservations FROM Reservation GROUP BY Train_ID;

--Q)What is the highest payment amount recorded?
SELECT MAX(Amount) AS Highest_Payment FROM Payment;

--Q)What is the lowest payment amount recorded?
SELECT MIN(Amount) AS Lowest_Payment FROM Payment;

--Q)What is the total revenue generated from all payments?
SELECT SUM(Amount) AS Total_Revenue FROM Payment;

--Q)Which unique passengers have made payments for their reservations?
SELECT DISTINCT Name FROM Passenger
JOIN Reservation ON Passenger.Passenger_ID = Reservation.Passenger_ID
JOIN Payment ON Reservation.Reservation_ID = Payment.Reservation_ID;

--Q)How many passengers have reserved tickets for each train?
SELECT Train_ID, COUNT(Passenger_ID) AS Passenger_Count FROM Reservation GROUP BY Train_ID;

--Q)What is the most expensive food item available?
SELECT * FROM Food ORDER BY Price DESC LIMIT 1;

--Q)What is the cheapest food item available?
SELECT * FROM Food ORDER BY Price ASC LIMIT 1;

--Q)Which food items are currently available for purchase?
SELECT * FROM Food WHERE Availability_Status = 'Available';

--Q)Which trains have a coach with seat type 'ST001'?
SELECT DISTINCT Train_ID FROM Coaches WHERE Seat_Type_ID = 'ST001';

--Q)Which trains have a delay status indicating they are running late?
SELECT * FROM Running_Status WHERE Delay_Status LIKE '%Late%';


--Q)Which passengers have filed complaints?
SELECT DISTINCT Name FROM Passenger
JOIN Complaint ON Passenger.Passenger_ID = Complaint.Passenger_ID;

--Q)How many complaints have been registered for each train?
SELECT Train_ID, COUNT(*) AS Total_Complaints FROM Complaint GROUP BY Train_ID;

--Q)Which trains originate from station ID 'S001'?
SELECT * FROM Train_Details WHERE Origin_Station_ID = 'S001';

--Q)Which trains have their final destination at station ID 'S002'?
SELECT * FROM Train_Details WHERE Destination_Station_ID = 'S002';

--Q)Which employees are assigned to station ID 'S004'?
SELECT * FROM Employee_Details WHERE Station_ID = 'S004';

--Q)What is the total cargo weight carried by each train?
SELECT Train_ID, SUM(Weight) AS Total_Weight FROM Cargo GROUP BY Train_ID;

--Q)Which trains have successfully delivered cargo?
SELECT DISTINCT Train_ID FROM Cargo WHERE Delivery_Status = 'Delivered';

--Q)How many customer inquiries are still pending response?
SELECT COUNT(*) AS Pending_Enquiries FROM Enquiry WHERE Response_Status = 'Pending';

--Q)Which employees work in the 'Operations' department?
SELECT * FROM Employee_Details WHERE Department = 'Operations';

--Q)Which trains have complaints related to delays?
SELECT DISTINCT Train_ID FROM Complaint WHERE Complaint_Type = 'Delayed Train';

--Q)Which passengers have made reservations but have not completed a payment?
SELECT Name FROM Passenger
JOIN Reservation ON Passenger.Passenger_ID = Reservation.Passenger_ID
LEFT JOIN Payment ON Reservation.Reservation_ID = Payment.Reservation_ID
WHERE Payment.Payment_ID IS NULL;

--Q)Which coaches belong to the 'Executive' class?
SELECT * FROM Coaches WHERE Coach_Type = 'Executive';

--Q)What are the coach IDs and total seats available in each coach?
SELECT Coach_ID, Total_Seats FROM Coaches;

--Q)What is the total revenue generated per train from payments in the 'PaymentEPP' table?
SELECT Train_ID, SUM(Amount) AS Total_Revenue FROM PaymentEPP
JOIN Reservation ON Payment.Reservation_ID = Reservation.Reservation_ID
GROUP BY Train_ID;

--Q)What is the average age of all passengers?
SELECT AVG(Age) AS Average_Age FROM Passenger;

--Q)Which trains have the highest number of reservations?
SELECT Train_ID, COUNT(Passenger_ID) AS Passenger_Count FROM Reservation GROUP BY Train_ID ORDER BY Passenger_Count DESC;

--Q)Which trains have generated the highest revenue from ticket payments?
SELECT Train_ID, SUM(Amount) AS Total_Revenue FROM Payment
JOIN Reservation ON Payment.Reservation_ID = Reservation.Reservation_ID
GROUP BY Train_ID ORDER BY Total_Revenue DESC;

--Q)How many employees work in each department, sorted by the highest count?
SELECT Department, COUNT(*) AS Total_Employees FROM Employee_Details GROUP BY Department ORDER BY Total_Employees DESC;

--Q)How many employees work in each department, sorted in descending order?
SELECT Department, COUNT(*) AS Total_Employees FROM Employee_Details GROUP BY Department ORDER BY Total_Employees DESC;


--Q)What are the reservation details for all passengers, including seat and coach information?
SELECT p.Name, r.Reservation_ID, r.Train_ID, r.Reservation_Date, r.Seat_Number, r.Coach_ID
FROM Passenger p
JOIN Reservation r ON p.Passenger_ID = r.Passenger_ID;

--Q)How many reservations have been made per train?
SELECT Train_ID, COUNT(*) AS Reservation_Count
FROM Reservation
GROUP BY Train_ID;

--Q)What is the total count of male and female passengers?
SELECT Gender, COUNT(*) AS Count
FROM Passenger
GROUP BY Gender;

--Q)Which reservations have seat numbers greater than 20?
SELECT * FROM Reservation WHERE Seat_Number > 20;

--Q)What are the contact details of passengers who have made reservations?
SELECT p.Name, p.Contact_Number, p.Email
FROM Passenger p
JOIN Reservation r ON p.Passenger_ID = r.Passenger_ID;

--Q)Which employees are assigned to delayed trains?
SELECT Name, Position, Train_ID 
FROM Employee 
WHERE Train_ID IN (SELECT Train_ID FROM Running_Status WHERE Delay_Status <> 'On Time');

--Q)Which reservations are for trains with an ID starting with 'T00'?
SELECT * FROM Reservation WHERE Train_ID LIKE 'T00%';

--Q)Which passengers have names starting with 'A'?
SELECT * FROM Passenger WHERE Name LIKE 'A%';

--Q)Which reservations were made on or after March 12, 2025?
SELECT * FROM Reservation WHERE Reservation_Date >= '2025-03-12';

--Q)What is the total amount collected from all payments?
SELECT SUM(Amount) AS Total_Amount FROM Payment;

--Q)What are the reservation and payment details for all transactions?
SELECT r.Reservation_ID, r.Passenger_ID, r.Train_ID, r.Reservation_Date, p.Amount, p.Payment_Method
FROM Reservation r
JOIN Payment p ON r.Reservation_ID = p.Reservation_ID;

--Q)How many reservations have been made per train?
SELECT Train_ID, COUNT(*) AS Reservation_Count
FROM Reservation
GROUP BY Train_ID;

--Q)Which reservations have no corresponding payment records?
SELECT * FROM Reservation 
WHERE Payment_ID NOT IN (SELECT Payment_ID FROM Payment);

--Q)What is the highest recorded payment amount?
SELECT * FROM Payment 
ORDER BY Amount DESC 
LIMIT 1;

--Q)What is the total number of reservations made?
SELECT COUNT(*) AS Total_Reservations FROM Reservation;

--Q)What are the train names and types available in the system?
SELECT t.Train_Name, tt.Train_Type_Name
FROM Train_Details t
JOIN Train_Types tt ON t.Train_Type_ID = tt.Train_Type_ID;

--Q)Which trains have 'S012' as their destination station?
SELECT * FROM Train_Details WHERE Destination_Station_ID = 'S012';

--Q)Which trains have 'Express' in their name?
SELECT * FROM Train_Details WHERE Train_Name LIKE '%Express%';

--Q)Which passengers have reserved tickets for train ID 'T001'?
SELECT Name 
FROM Passenger 
WHERE Passenger_ID IN (SELECT Passenger_ID FROM Reservation WHERE Train_ID = 'T001');

--Q)Which train stops at station ID 'S001' according to the schedule?
SELECT Train_Name 
FROM Train_Details 
WHERE Train_ID IN (SELECT Train_ID FROM Schedule WHERE Station_ID = 'S001');

--Q)Which payment record has the highest amount?
SELECT * FROM Payment 
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

--Q)Who is the oldest passenger who has made a reservation?
SELECT * FROM Passenger 
WHERE Age = (SELECT MAX(Age) FROM Passenger WHERE Passenger_ID IN (SELECT Passenger_ID FROM Reservation));

--Q)What food items are available on the train reserved by passenger ID 'P003'?
SELECT Food_Item 
FROM Food 
WHERE Train_ID = (SELECT Train_ID FROM Reservation WHERE Passenger_ID = 'P003');

--Q)Which train is reserved by the passenger named 'Rajesh Kumar'?
SELECT Train_Name 
FROM Train_Details 
WHERE Train_ID = (
    SELECT Train_ID 
    FROM Reservation 
    WHERE Passenger_ID = (
        SELECT Passenger_ID 
        FROM Passenger 
        WHERE Name = 'Rajesh Kumar'
    )
);

--Q)Find the train names that have a seating type of 'AC 3-Tier'.
SELECT Train_Name 
FROM Train_Details 
WHERE Train_ID IN (
    SELECT Train_ID 
    FROM Coaches 
    WHERE Seat_Type_ID = (
        SELECT Seat_Type_ID FROM Seating_Types WHERE Seat_Type_Name = 'AC 3-Tier'
    )
);

--Q)Get the names of passengers who have made a payment of more than 1500.
SELECT Name 
FROM Passenger 
WHERE Passenger_ID IN (
    SELECT Passenger_ID 
    FROM Reservation 
    WHERE Reservation_ID IN (
        SELECT Reservation_ID 
        FROM Payment 
        WHERE Amount > 1500
    )
);

--Q)Find the train names that have cargo of type 'Electronics'.
SELECT Train_Name 
FROM Train_Details 
WHERE Train_ID IN (
    SELECT Train_ID 
    FROM Cargo 
    WHERE Cargo_Type = 'Electronics'
);

--Q)Find the names of passengers who have made a complaint about seat issues.
SELECT Name 
FROM Passenger 
WHERE Passenger_ID IN (
    SELECT Passenger_ID 
    FROM Complaint 
    WHERE Complaint_Type = 'Seat Issue'
);

--Q)Find all passengers who have filed a complaint but have not received a resolution
SELECT Name 
FROM Passenger 
WHERE Passenger_ID IN (
    SELECT Passenger_ID 
    FROM Complaint 
    WHERE Status = 'Pending' OR Status = 'In Process'
);

--Q) Get the train details for the train that has the highest number of reservations
SELECT Train_ID, Train_Name 
FROM Train_Details 
WHERE Train_ID = (
    SELECT TOP 1 Train_ID 
    FROM Reservation 
    GROUP BY Train_ID 
    ORDER BY COUNT(*) DESC
);

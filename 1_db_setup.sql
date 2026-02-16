CREATE DATABASE IF NOT EXISTS EagleEye_Fraud_DB;
USE EagleEye_Fraud_DB;

CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20),
    transaction_date DATETIME,
    amount DECIMAL(18, 2),
    transaction_type ENUM('EFT', 'ATM Cash Withdrawal', 'Point of Sale', 'Petrol', 'International Transfer'),
    merchant_category VARCHAR(50),
    is_flagged BOOLEAN DEFAULT 0
);

DELIMITER $$
CREATE PROCEDURE GenerateSyntheticData()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO Transactions (account_number, transaction_date, amount, transaction_type, merchant_category, is_flagged)
        VALUES (CONCAT('ACC-', FLOOR(100000 + RAND()*900000)), NOW(), ROUND(RAND()*10000, 2), 'EFT', 'Retail', IF(RAND()>0.95, 1, 0));
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL GenerateSyntheticData();
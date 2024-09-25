SELECT * FROM bank_loan

SELECT COUNT(id) AS Total_Applications FROM bank_loan

SELECT COUNT(id) AS MTD_Total_Applications FROM bank_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Applications FROM bank_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan

SELECT SUM(total_payment) AS MTD_Total_Amount_Collected FROM bank_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected FROM bank_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Int_Rate FROM bank_loan

SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Int_Rate FROM bank_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Int_Rate FROM bank_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4) * 100 AS Avg_DTI FROM bank_loan

SELECT ROUND(AVG(dti),4) * 100 AS MTD_Avg_DTI FROM bank_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Avg_DTI FROM bank_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) AS Good_loan_percentage
FROM bank_loan

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Charged Off'

SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY term
ORDER BY term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY emp_length
ORDER BY COUNT(id) DESC

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY purpose
ORDER BY COUNT(id) DESC

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY home_ownership
ORDER BY COUNT(id) DESC

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
WHERE grade = 'A'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC
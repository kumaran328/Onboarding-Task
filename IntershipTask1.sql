
SELECT op.PropertyId, op.OwnerId,
       Property.Name AS PropertyName, CONCAT(Person.FirstName, ' ' , Person.LastName) AS TenantName,
	   pv.Value AS PropertyValue,
	   tp.PaymentAmount AS RentalAmount,tf.Code AS RentPaymentFrequency,
	   tp.StartDate AS TenancyStartdate, tp.EndDate AS TenancyEndDate,
	   (DATEDIFF(WEEK, StartDate, EndDate)*tp.PaymentAmount) AS SumOfTotalPayment, 
	   DATEDIFF(WEEK, StartDate, EndDate) AS DurationOfTenancy,
	   Job.JobDescription AS JobsAvailable,px.Amount AS Expense,
	   Yield AS Yield
	   
	   
	   

FROM [dbo].[OwnerProperty] op
	INNER JOIN [dbo].[Property] ON op.Id = Property.Id
	INNER JOIN [dbo].[PropertyHomeValue] pv ON op.PropertyId = pv.PropertyId
	
	LEFT JOIN [dbo].[TenantProperty] tp ON pv.Id = tp.Id
	LEFT JOIN [dbo].[TenantPaymentFrequencies] tf ON tp.PaymentFrequencyId = tf.Id
	LEFT JOIN [dbo].[Job] ON op.Id = Job.Id
	LEFT JOIN [dbo].[PropertyFinance] pf ON op.PropertyId = pf.PropertyId
	LEFT JOIN [dbo].[Person] ON op.Id = Person.Id
	LEFT JOIN [dbo].[PropertyExpense] px ON op.PropertyId = px.PropertyId
	
	

WHERE op.OwnerId = 1426 AND pv .IsActive = 1






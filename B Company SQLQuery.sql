SELECT *
FROM DAPortfolio.DBO.Burrow


SELECT COUNT (DocType) as 'TotalNumberOfTransactions'
FROM DAPortfolio.DBO.Burrow


SELECT DocumentDate, TotalInvoiceAmount
FROM DAPortfolio.DBO.Burrow


SELECT
YEAR(DocumentDate) POYear,
MONTH(DocumentDate) POMonth,
SUM(TotalInvoiceAmount) sum_of_invoice
FROM DAPortfolio.DBO.Burrow
GROUP BY
YEAR(DocumentDate),
MONTH(DocumentDate)
ORDER BY
YEAR(DocumentDate),
MONTH(DocumentDate)


SELECT COUNT(DocType) as NumberofTransactions,
YEAR(DocumentDate) POYear,
MONTH(DocumentDate) POMonth
FROM DAPortfolio.DBO.Burrow
GROUP BY
YEAR(DocumentDate),
MONTH(DocumentDate)
ORDER BY
YEAR(DocumentDate),
MONTH(DocumentDate)


SELECT DestStateProvinceDocHeader, TotalInvoiceAmount 
FROM DAPortfolio.DBO.Burrow
ORDER BY DestStateProvinceDocHeader


SELECT DestStateProvinceDocHeader,
SUM(TotalInvoiceAmount) sum_of_invoice
FROM DAPortfolio.DBO.Burrow
GROUP BY DestStateProvinceDocHeader
ORDER BY DestStateProvinceDocHeader


SELECT DestStateProvinceDocHeader,
SUM(TotalInvoiceAmount) sum_of_invoice
FROM DAPortfolio.DBO.Burrow
GROUP BY DestStateProvinceDocHeader
ORDER BY sum_of_invoice desc


SELECT DestStateProvinceDocHeader, COUNT(DocType) as NumberofTransactions
FROM DAPortfolio.DBO.Burrow
GROUP BY DestStateProvinceDocHeader
ORDER BY NumberofTransactions desc


SELECT DestStateProvinceDocHeader,
AVG(TotalInvoiceAmount) avg_of_invoice
FROM DAPortfolio.DBO.Burrow
GROUP BY DestStateProvinceDocHeader
ORDER BY avg_of_invoice desc
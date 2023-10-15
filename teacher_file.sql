use Northwind
go
--Trên CSDL Northwind. Viết 1 script thực hiện các công việc sau:
--	Tạo một biến là MinOrder
--	Lấy thông tin về tổng giá trị (số tiền) nhỏ nhất (Quantity * UnitPrice * (1-Discount)) của sản phẩm trong tất cả hoá đơn của khách hàng có mã CustomerID=’ALFKI’,  gán giá trị này vào biến MinOrder
--	 Hiển thị thông tin của biến MinOrder.

DECLARE @MinOrder money
SELECT @MinOrder = MIN(Quantity * UnitPrice * (1-Discount))
FROM [Order Details] od
JOIN Orders o
ON od.OrderID = o.OrderID
WHERE CustomerID = 'ALFKI'
SELECT @MinOrder

GO
--Bai 3
Declare @CustID char(5);
Set @CustID='ALFKI';
DECLARE @OrderID int
DECLARE @MaxQuatityOrder int
select @OrderID = OrderID, @MaxQuatityOrder = tquantity 
From 
(
	SELECT top (1) o.orderid, sum(Quantity)as tquantity
	FROM [Order Details] od
		 JOIN Orders o ON od.OrderID = o.OrderID
	WHERE CustomerID = @CustID
	group by o.orderid
	order by tquantity desc
) as T
Print 'So hoa don co khoi luong hang hoa lon nhat: ' + convert (varchar(20),@OrderID) 
Print 'Khoi luong hang hoa:' + convert(varchar(20),@MaxQuatityOrder)

GO

--Bai 4
DECLARE @counter INT
DECLARE @varstr varchar(30)
SET @counter=1
SET @varstr= ''
WHILE @counter <= 10
BEGIN
	SET @varstr=@varstr + ' ' + cast(@counter as varchar) --convert(varchar(2), @counter) 
	SET @counter=@counter+1
END
PRINT @varstr

GO
--Bai 8

DECLARE @customerID AS nchar(5);
SET @customerID = 'ALFKI';

DECLARE @sql AS NVARCHAR(200);
SET @sql = 'SELECT * FROM dbo.customers as C join dbo.Orders as O on C.CustomerID =O.CustomerID
			 WHERE C.CustomerID = @custid;';
EXEC sp_executesql
  @stmt = @sql,
  @params = N'@custid AS nchar(5)',
  @custid = @customerID;

  GO

--Bài 9
Declare @OrderID int
Declare @ProductID int, @UnitPrice money, @Quantity smallint, @Discount real
Set @OrderID= 10248
select @ProductID=6, @UnitPrice =10, @Quantity =1, @Discount =0.1
BEGIN TRY
 if @Quantity <=0 
	Raiserror ('So luong phai > 0', 10, 1)
 if @Discount >=10 
	Raiserror ('giam gia <10', 11, 1)
 INSERT INTO [Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount)
		VALUES(@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)
 PRINT 'INSERT succeeded.';
END TRY
BEGIN CATCH
    /* handle error here */
	PRINT Error_Message();
END CATCH
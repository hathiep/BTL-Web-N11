CREATE TABLE Products (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(max),
	title NVARCHAR(max),
	category_id INT,
	image1 NVARCHAR(max),
	image2 NVARCHAR(max),
	des NVARCHAR(max),
	price INT,
	quantity_sold INT,
	quantity_remain INT
);
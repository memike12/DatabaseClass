SELECT Count(BarCode) from Product WHERE Price > (Select AVG(Price) from Product); 

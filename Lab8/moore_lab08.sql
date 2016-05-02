DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
       BarCode int(15) NOT NULL,
       PName varchar(50),
       Price int(15),
       QuantityInStock int(15),
       PRIMARY KEY (BarCode)
);

DROP TABLE IF EXISTS Sale;
CREATE TABLE Sale(
       SaleID int(50) NOT NULL,
       DeliveryAddress varchar(200),
       CreditCard int(16),
       PRIMARY KEY (SaleID)
);

DROP TABLE IF EXISTS SaleItem;
CREATE TABLE SaleItem(
       SaleID int(50),
       BarCode int(15),
       Quantity int(10),

       CONSTRAINT pk_SaleItem PRIMARY KEY (SaleID, BarCode)
);



/* Part 1 */
DROP PROCEDURE IF EXISTS spInsertProduct;

DELIMITER $$
CREATE PROCEDURE spInsertProduct(BarCodevar int(15), PNamevar varchar(50), Pricevar int(15), QuantityInStockvar int(15))
BEGIN
        if Pricevar > 0 && QuantityInStockvar >= 0 then
        INSERT INTO Product(BarCode, PName, Price, QuantityInStock)
        Values(BarCodevar, PNamevar, Pricevar, QuantityInStockvar);
        end if;
END $$
Delimiter ;

call spInsertProduct(12, "stuff", -15, 12);
call spInsertProduct(12, "stuff", 15, 12);



/* Part 2  */
DROP TRIGGER IF EXISTS updateAvailableQuantity;
DELIMITER $$

CREATE TRIGGER updateAvailableQuantity AFTER INSERT ON SaleItem
FOR EACH ROW
BEGIN
        UPDATE Product SET QuantityInStock = QuantityInStock - new.Quantity WHERE BarCode = new.BarCode;

END; $$

Delimiter ;
        
Insert INTO Sale(SaleID, DeliveryAddress, CreditCard)
Values(10, "1 Wilson Rd.", 1234123412341234);

Insert INTO SaleItem(SaleID, BarCode, Quantity)
Values(10, 12, 3);


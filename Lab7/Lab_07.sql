CREATE Table Item(
       ItemID varchar(255) PRIMARY KEY,
       Description varchar(255),
       PurchaseDate varchar(255),
       Store varchar(255),
       City varchar(255),
       Weight varchar(255),
       PriceInLocalCurrency varchar(255),
       ExchangeRate varchar(255)
);

CREATE Table SHIPMENT(
       ShipmentID varchar(255) PRIMARY KEY,
       ShipperName varchar(255),
       ShipperInvoiceNumber varchar(255),
       DepartureDate varchar(255),
       ArrivalDate varchar(255),
       InsuredValue varchar(255)
);

CREATE Table SHIPPED_ITEM(
       ShipmentID varchar(255),
       ShipmentItemNb varchar(255),
       ItemID varchar(255),
       Value varchar(255),
       CONSTRAINT pk_ShippedItem PRIMARY KEY (ShipmentID, ShipmentItemNb),
       CONSTRAINT fk_itemz FOREIGN KEY (ItemID) REFERENCES Item(ItemID) 
);

INSERT INTO Item(ItemID, Description)
Values (1, "Book");

INSERT INTO Item(ItemID, Description)
Values (2, "computer");

INSERT INTO SHIPMENT(ShipmentID)
Values (1);

INSERT INTO SHIPMENT(ShipmentID)
Values (2);

INSERT INTO SHIPPED_ITEM(ShipmentID, ShipmentItemNb, ItemID, value)
Values (1, 11, 2, 12);

INSERT INTO SHIPPED_ITEM(ShipmentID, ShipmentItemNb, ItemID, value)
Values (2, 12, 1, 5);

Alter table SHIPPED_ITEM Alter Column Value INTEGER;

SELECT ItemID, Description FROM Item WHERE ItemID = (SELECT ItemID FROM SHIPPED_ITEM WHERE Value = (Select min(Value) from SHIPPED_ITEM) );

Select min(Value) from SHIPPED_ITEM;

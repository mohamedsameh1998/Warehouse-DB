CREATE TABLE `Entity`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(25) NOT NULL,
    `fax` VARCHAR(30),
    `country` VARCHAR(20) NOT NULL,
    `state` VARCHAR(20) NOT NULL,
    `city` VARCHAR(20) NOT NULL,
    `street` VARCHAR(20) NOT NULL,
    `building` VARCHAR(20) NOT NULL
);

CREATE TABLE `Supplier`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `contract_start` DATE NOT NULL,
    `contract_end` DATE,
    FOREIGN KEY (`ID`) REFERENCES `Entity` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Items`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `arrival_time` TIMESTAMP NOT NULL,
    `color_pallete` VARCHAR(10) NOT NULL,
    `status` varchar(255) NOT NULL,
    `location_letter` CHAR(1) NOT NULL,
    `location_num` CHAR(3) NOT NULL,
    `supplier_ID` INTEGER NOT NULL,
    `distributor_ID` INTEGER NOT NULL,
    `Category_ID` INTEGER NOT NULL,
    FOREIGN KEY (`supplier_ID`) REFERENCES `Supplier` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    FOREIGN KEY (`distributor_ID`) REFERENCES `Distributor`(`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Distributor`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `tax_No` VARCHAR(40) NOT NULL,
    FOREIGN KEY (`ID`) REFERENCES `Entity` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Company`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `register_No` VARCHAR(40) NOT NULL,
    FOREIGN KEY (`ID`) REFERENCES `Distributor` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Person`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `SSN` VARCHAR(20) NOT NULL,
    FOREIGN KEY (`ID`) REFERENCES `Distributor` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `TV`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `screensize` FLOAT NOT NULL,
    `Model_No` VARCHAR(20),
    `screentype` VARCHAR(10),
    FOREIGN KEY (`ID`) REFERENCES `Category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Chargers`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `voltage` FLOAT NOT NULL,
    `charger_Type` VARCHAR(40) NOT NULL,
    FOREIGN KEY (`ID`) REFERENCES `Category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Category`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `weight` FLOAT NOT NULL,
    `company` VARCHAR(50) NOT NULL,
    `length` FLOAT NOT NULL,
    `width` FLOAT NOT NULL,
    `height` FLOAT NOT NULL,
    `desc` VARCHAR(500)
);

CREATE TABLE `Mobiles`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `screensize` FLOAT NOT NULL,
    `Model_No` VARCHAR(20) NOT NULL,
    FOREIGN KEY (`ID`) REFERENCES `Category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Video_Games`
(
    `ID` INTEGER PRIMARY KEY NOT NULL,
    `genre` VARCHAR(20),
    `release_date` DATE,
    FOREIGN KEY (`ID`) REFERENCES `Category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `platform`
(
    `name` VARCHAR(20) NOT NULL,
    `version` VARCHAR(20) NOT NULL,
    `video_game_id` INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY (`video_game_id`) REFERENCES `Video_Games` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE `Color`
(
    `color_pallete` VARCHAR(10) NOT NULL,
    `Category_ID` INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
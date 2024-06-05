### Mangrove ####

USE TNC_BLUECON;

SELECT * 
FROM mangrove_apr24;

ALTER TABLE mangrove_apr24
RENAME COLUMN `Area(ha)` TO Area_ha,
RENAME COLUMN `TotalCost($/ha)` TO TotalCost_c$_ha,
RENAME COLUMN `TotalCost(US$/ha)` TO TotalCost_usd_ha,
RENAME COLUMN `Monitoring(US$/ha)` TO Monitoring_usd_ha,
RENAME COLUMN `Maintenance($/ha)` TO Maintenance_usd_ha,
RENAME COLUMN `CarbonStandardFees(US$/ha)` TO CarbonStandardFees_usd_ha,
RENAME COLUMN `BaselineReassessment(US$/ha)` TO BaseLineReassessment_usd_ha,
RENAME COLUMN `MRV(US$/ha)` TO MRV_usd_ha,
RENAME COLUMN `LongTermProjectOperating(US$/ha)` TO LongTermProjectOperating_usd_ha;

ALTER TABLE `mangrove_apr24` 
ADD COLUMN `id` INT AUTO_INCREMENT UNIQUE FIRST;

UPDATE mangrove_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha/25396  # currency 2024)
WHERE Currency = 'VND';

UPDATE mangrove_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha/58 # currency 2024
WHERE Currency = 'PhP';

UPDATE mangrove_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha/7.83 # currency 2024
WHERE Currency = 'HKD';

UPDATE mangrove_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha
WHERE (id BETWEEN 2 AND 4);

UPDATE mangrove_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha
WHERE (id BETWEEN 6 AND 9);

UPDATE mangrove_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha
WHERE (id BETWEEN 11 AND 17);

START TRANSACTION;
ALTER TABLE `TNC_BLUECON`.`mangrove_apr24` 
ADD COLUMN `CountryCode` VARCHAR(45) NOT NULL AFTER `Country`;

UPDATE mangrove_apr24
SET CountryCode = Country;

START TRANSACTION;
UPDATE mangrove_apr24
    SET CountryCode = (case when CountryCode = 'Vietnam' then 'VNM'
                         when CountryCode = 'Indonesia' then 'IND'
                         when CountryCode = 'Bangladesh' then 'BGD'
                         when CountryCode = 'Hong Kong' then 'HKG'
                         when CountryCode = 'Philippines' then 'PHL'
                         when CountryCode = 'Thailand' then 'THA'
                         when CountryCode = 'American Samoa' then 'ASM'
                         when CountryCode = 'USA' then 'USA'
                         when CountryCode = 'Ecuador' then 'ECU'
                         when CountryCode = 'Venezuela' then 'VEN'
                    end);
ROLLBACK;
-- COMMIT;


ALTER TABLE mangrove_apr24
RENAME COLUMN `Vietnam` TO VNM,
RENAME COLUMN `Indonesia` TO IND,
RENAME COLUMN `Bangladesh` TO BGD,
RENAME COLUMN `Hong Kong` TO HKG,
RENAME COLUMN `Philippines` TO PHL,
RENAME COLUMN `Thailand` TO THA,
RENAME COLUMN `American Samoa` TO ASM,
RENAME COLUMN `USA` TO USA,
RENAME COLUMN `Ecuador` TO ECU,
RENAME COLUMN `Venezuela` TO VEN;
ROLLBACK;




SELECT 
    id, Country,
    TotalCost_usd_ha,
    Monitoring_usd_ha
FROM 
    mangrove_apr24;
    


##### SALTMARSH ######
USE TNC_BLUECON;

SELECT * FROM saltmarsh_apr24;

ALTER TABLE saltmarsh_apr24
RENAME COLUMN `Area(ha)` TO Area_ha,
RENAME COLUMN `TotalCost(US$/ha)` TO TotalCost_usd_ha,
RENAME COLUMN `Monitoring(US$/ha)` TO Monitoring_usd_ha,
RENAME COLUMN `Maintenance($/ha)` TO Maintenance_usd_ha,
RENAME COLUMN `CarbonStandardFees(US$/ha)` TO CarbonStandardFees_usd_ha,
RENAME COLUMN `BaselineReassessment(US$/ha)` TO BaseLineReassessment_usd_ha,
RENAME COLUMN `MRV(US$/ha)` TO MRV_usd_ha,
RENAME COLUMN `LongTermProjectOperating(US$/ha)` TO LongTermProjectOperating_usd_ha;

ALTER TABLE `saltmarsh_apr24` 
ADD COLUMN `id` INT AUTO_INCREMENT UNIQUE FIRST;



##### SEAGRASS ######
USE TNC_BLUECON;
-- selecting the data form the seagrass file 
SELECT * FROM seagrass_apr24;
-- changing the name columns 
ALTER TABLE seagrass_apr24
RENAME COLUMN `Area(ha)` TO Area_ha,
RENAME COLUMN `TotalCost($/ha)` TO TotalCost_c$_ha,
RENAME COLUMN `TotalCost(US$/ha)` TO TotalCost_usd_ha,
RENAME COLUMN `Monitoring(US$/ha)` TO Monitoring_usd_ha,
RENAME COLUMN `Maintenance($/ha)` TO Maintenance_usd_ha,
RENAME COLUMN `CarbonStandardFees(US$/ha)` TO CarbonStandardFees_usd_ha,
RENAME COLUMN `BaselineReassessment(US$/ha)` TO BaseLineReassessment_usd_ha,
RENAME COLUMN `MRV(US$/ha)` TO MRV_usd_ha,
RENAME COLUMN `LongTermProjectOperating(US$/ha)` TO LongTermProjectOperating_usd_ha;

ALTER TABLE `seagrass_apr24` 
ADD COLUMN `id` INT AUTO_INCREMENT UNIQUE FIRST;

UPDATE seagrass_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha*1.08 # currency 2024
WHERE Currency = 'EURO';


START TRANSACTION;
UPDATE seagrass_apr24
SET TotalCost_usd_ha = NULL
WHERE TotalCost_usd_ha= 'USD';
ROLLBACK;
-- COMMIT;

Start Transaction; 
UPDATE seagrass_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha
WHERE id BETWEEN 3 AND 12;

UPDATE seagrass_apr24
SET TotalCost_usd_ha = TotalCost_c$_ha 
WHERE id=1;
Rollback;
## COMMIT;


#### rough codes ####





    
    

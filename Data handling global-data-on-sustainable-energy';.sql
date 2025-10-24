SELECT *
FROM [global-data-on-sustainable-energy ]

--selecting all row which is NULL in Renewables_equivalent_primary_energy
SELECT * 
FROM [global-data-on-sustainable-energy ]
WHERE Renewables_equivalent_primary_energy is null;

-- a large amount of rows are NULL so we have to delete the column as it is of no use 
ALTER TABLE [global-data-on-sustainable-energy ]
DROP COLUMN Renewables_equivalent_primary_energy;

--1 Rename column name 'Entity' to "Country'
EXEC sp_rename '[global-data-on-sustainable-energy].[Entity]', 'Country', 'COLUMN';


--Remove duplicate rows
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY [Country], [Year] ORDER BY [Country]) AS rn
    FROM [global-data-on-sustainable-energy ]
)
DELETE FROM CTE WHERE rn > 1;

--there are no duplicates in this dataset

--2 Delete rows with NULLs in important columns
--Remove incomplete data.
DELETE FROM [global-data-on-sustainable-energy ]
WHERE [Country] IS NULL
   OR [Year] IS NULL
   OR [Access_to_electricity_of_population] IS NULL
   OR [Renewable_energy_share_in_the_total_final_energy_consumption] IS NULL;

--3 Standardize numeric fields — replace negative or invalid values with NULL
UPDATE [global-data-on-sustainable-energy ]
SET [Access_to_electricity_of_population] = NULL
WHERE [Access_to_electricity_of_population] < 0;

--Replacing all NULL with '0' to make our data efficient
UPDATE [global-data-on-sustainable-energy ]
SET 
    Access_to_clean_fuels_for_cooking = ISNULL(Access_to_clean_fuels_for_cooking, 0),
    Renewable_electricity_generating_capacity_per_capita = ISNULL(Renewable_electricity_generating_capacity_per_capita, 0),
    Financial_flows_to_developing_countries_US = ISNULL(Financial_flows_to_developing_countries_US, 0),
    Renewable_energy_share_in_the_total_final_energy_consumption = ISNULL(Renewable_energy_share_in_the_total_final_energy_consumption, 0),
    Electricity_from_fossil_fuels_TWh = ISNULL(Electricity_from_fossil_fuels_TWh, 0),
    Electricity_from_nuclear_TWh = ISNULL(Electricity_from_nuclear_TWh, 0),
    Electricity_from_renewables_TWh = ISNULL(Electricity_from_renewables_TWh, 0),
    Low_carbon_electricity_electricity = ISNULL(Low_carbon_electricity_electricity, 0),
    Primary_energy_consumption_per_capita_kWh_person = ISNULL(Primary_energy_consumption_per_capita_kWh_person, 0),
    Energy_intensity_level_of_primary_energy_MJ_2017_PPP_GDP = ISNULL(Energy_intensity_level_of_primary_energy_MJ_2017_PPP_GDP, 0),
    Value_co2_emissions_kt_by_country = ISNULL(Value_co2_emissions_kt_by_country, 0),
    gdp_growth = ISNULL(gdp_growth, 0),
    gdp_per_capita = ISNULL(gdp_per_capita, 0),
    Density_n_P_Km2 = ISNULL(Density_n_P_Km2, 0),
    Land_Area_Km2 = ISNULL(Land_Area_Km2, 0);


select * 
from [global-data-on-sustainable-energy ]
where [Financial_flows_to_developing_countries_US] is null;   --1886 rows


select * 
from [global-data-on-sustainable-energy ]
where [Renewable_electricity_generating_capacity_per_capita] is null; -- 866 rows

select * 
from [global-data-on-sustainable-energy ]
where [Renewable_energy_share_in_the_total_final_energy_consumption] is null; --0 rows


select * 
from [global-data-on-sustainable-energy ]
where [Access_to_clean_fuels_for_cooking] is null; --160 rows


--let's see our data 
select * 
from [global-data-on-sustainable-energy ]


--Now we don't have any NULLS in our data set
-- data is cleaned now 








--- Create Ranger Table
create table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    region VARCHAR(30)
);

--- Create Species Table
create table species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(40),
    scientific_name VARCHAR(50),
    discover_date date,
    conservation_status VARCHAR(10)
);

--- Create Sightings Table
create table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(10),
    notes VARCHAR(100)
);

--- Inset Values Into Rangers
INSERT INTO rangers (name, region) VALUES
('David Black', 'Forest Edge'),
('Emma Stone', 'Northern Hills'),
('Frank Brown', 'River Delta'),
('Grace Miller', 'Mountain Range'),
('Henry Wilson', 'Forest Edge'),
('Isla Johnson', 'Northern Hills'),
('Jack Davis', 'River Delta'),
('Katie Lewis', 'Mountain Range'),
('Liam Walker', 'Forest Edge'),
('Mia Hall', 'Northern Hills'),
('Noah Allen', 'River Delta'),
('Olivia Young', 'Mountain Range'),
('Paul Hernandez', 'Forest Edge'),
('Quinn Robinson', 'Northern Hills'),
('Ruby Clark', 'River Delta'),
('Samuel Rodriguez', 'Mountain Range'),
('Tina Lee', 'Forest Edge'),
('Umar Scott', 'Northern Hills'),
('Vera Adams', 'River Delta'),
('William Baker', 'Mountain Range');

--- Insert Values into Species
INSERT INTO species (common_name, scientific_name, discover_date, conservation_status) VALUES
('African Elephant', 'Loxodonta africana', '1758-01-01', 'Vulnerable'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-01-01', 'Vulnerable'),
('Black Rhino', 'Diceros bicornis', '1758-01-01', 'Endangered'),
('Mountain Gorilla', 'Gorilla beringei beringei', '1903-01-01', 'Endangered'),
('Amur Leopard', 'Panthera pardus orientalis', '1857-01-01', 'Endangered'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered'),
('Hawksbill Turtle', 'Eretmochelys imbricata', '1766-01-01', 'Endangered'),
('Saola', 'Pseudoryx nghetinhensis', '1992-01-01', 'Endangered'),
('Vaquita', 'Phocoena sinus', '1958-01-01', 'Endangered'),
('Yangtze Giant Softshell Turtle', 'Rafetus swinhoei', '1873-01-01', 'Endangered'),
('Bornean Orangutan', 'Pongo pygmaeus', '1760-01-01', 'Endangered'),
('Sumatran Orangutan', 'Pongo abelii', '1827-01-01', 'Endangered'),
('Leatherback Turtle', 'Dermochelys coriacea', '1761-01-01', 'Vulnerable'),
('Javan Rhino', 'Rhinoceros sondaicus', '1822-01-01', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
('Philippine Eagle', 'Pithecophaga jefferyi', '1896-01-01', 'Endangered'),
('Gharial', 'Gavialis gangeticus', '1789-01-01', 'Endangered'),
('Axolotl', 'Ambystoma mexicanum', '1863-01-01', 'Endangered'),
('Kakapo', 'Strigops habroptilus', '1785-01-01', 'Endangered'),
('Northern Bald Ibis', 'Geronticus eremita', '1758-01-01', 'Endangered');

--- Insert Values into Sightings
INSERT INTO sightings (species_id, ranger_id, sighting_time, location, notes) VALUES
(1, 2, '2024-05-20 06:30:00', 'Peak Ridge', 'Tracks found near summit'),
(2, 1, '2024-05-21 14:15:00', 'River Bend', 'Pair sighted crossing water'),
(3, 3, '2024-05-22 08:50:00', 'Bamboo Grove East', 'Nesting behavior observed'),
(4, 6, '2024-05-23 17:45:00', 'Snowfall Pass', 'Fresh droppings located'),
(5, 4, '2024-05-24 07:00:00', 'Forest Edge', 'Howling sounds recorded'),
(6, 5, '2024-05-25 15:20:00', 'Northern Hills', 'Resting under tree canopy'),
(7, 8, '2024-05-26 09:35:00', 'River Delta', 'Mother and calf pair seen'),
(8, 7, '2024-05-27 12:10:00', 'Mountain Range', 'Scratches on bark observed'),
(9, 10, '2024-05-28 18:00:00', 'Forest Edge', 'Camera trap image captured'),
(10, 9, '2024-05-29 05:50:00', 'Snowfall Pass', 'Footprints in fresh snow'),
(11, 12, '2024-05-31 10:25:00', 'River Bend', 'Individual basking on rock'),
(12, 11, '2024-06-01 13:55:00', 'Bamboo Grove East', 'Observed with binoculars'),
(13, 13, '2024-06-02 19:15:00', 'Snowfall Pass', 'Camera trap malfunctioned'),
(14, 16, '2024-06-03 06:20:00', 'Northern Hills', 'Nest site documented'),
(15, 15, '2024-06-04 15:10:00', 'River Delta', 'Two adults seen hunting'),
(16, 14, '2024-06-05 11:45:00', 'Mountain Range', 'Scat sample collected'),
(17, 18, '2024-06-06 17:30:00', 'Forest Edge', 'Juvenile spotted alone'),
(18, 17, '2024-06-07 08:40:00', 'Peak Ridge', 'Individual climbing slope'),
(19, 20, '2024-06-08 14:50:00', 'Bamboo Grove East', 'Resting in tree canopy'),
(20, 19, '2024-06-09 07:55:00', 'Snowfall Pass', 'Fresh tracks along trail');


Select * from rangers;
Select * from species;
Select * from sightings;


--- Problem 1
INSERT INTO rangers (name, region) VALUES(
    'Derek Fox',
    'Coastal Plains'
);

--- Problem 2
select count(DISTINCT scientific_name) as unique_species_count from species;

--- Problem 3
select * from sightings where location LIKE '%Pass%';

--- Problem 4
select r.name as name, count(*) as total_sightings from sightings as s 
join rangers as r on s.ranger_id = r.ranger_id
GROUP BY r.ranger_id;

--- Problem 5
select common_name from 
(select * from species LEFT join sightings on sightings.species_id = species.species_id)
where sighting_id IS NULL;

--- Problem 6
select spec.common_name, sight.sighting_time, ranger.name 
from sightings as sight 
LEFT JOIN rangers as ranger on sight.ranger_id = ranger.ranger_id 
LEFT JOIN species as spec on sight.species_id = spec.species_id 
ORDER BY sight.sighting_time DESC LIMIT 2;

--- Problem 7
UPDATE species set conservation_status =  'Historic' where EXTRACT(YEAR FROM discover_date) < 1800;

--- Problem 8
CREATE or REPLACE Function get_day_status(date_time TIMESTAMP)
RETURNS TEXT
LANGUAGE plpgsql
as
$$
BEGIN
    if EXTRACT(HOUR from date_time) < 12 then
        RETURN 'Morning';
    ELSEIF EXTRACT(HOUR from date_time) = 12 OR EXTRACT(HOUR from date_time) < 17 then
        RETURN 'Afternoon';
    ELSE RETURN 'Evening';
    END if;
    END;
$$

select sighting_id,get_day_status(sighting_time) as time_of_day from sightings;

--- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);
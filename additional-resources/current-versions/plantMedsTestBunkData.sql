USE `PlantMeds-test`;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `Plants`;
TRUNCATE TABLE `PlantCommonNames`;
TRUNCATE TABLE `PlantTechnicalNames`;
TRUNCATE TABLE `Illnesses`;
TRUNCATE TABLE `IllnessCommonNames`;
TRUNCATE TABLE `IllnessTechnicalNames`;
TRUNCATE TABLE `Instructions`;
TRUNCATE TABLE `AssessmentForms`;
TRUNCATE TABLE `Plant_Illnesses`;
TRUNCATE TABLE `Locations`;
TRUNCATE TABLE `Plant_LocationImages`;
TRUNCATE TABLE `Users`;
TRUNCATE TABLE `PlantImages`;
TRUNCATE TABLE `Plant_Locations`;
TRUNCATE TABLE `Authorities`;
SET FOREIGN_KEY_CHECKS = 1;

#tables with no fks

INSERT INTO `Users` (`first_name`,`last_name`,`username`,`email`,`password`,`enabled`,`join_date`,`last_active`) VALUES ('Matt','Farabaugh','mattfara5','mattfarabaugh50@gmail.com','Skdfj%7d7f', '1', '2017-11-01', '2017-12-22');
INSERT INTO `Users` (`first_name`,`last_name`,`username`,`email`,`password`,`enabled`,`join_date`,`last_active`) VALUES ('Ady','Ding','DingDingDong','linluding@gmail.com','Skdfj%7d7f', '1', '2017-12-23', '2017-12-23');

INSERT INTO `Authorities` (`username`, `authority`) VALUES ('mattfara5', 'ADMIN');
INSERT INTO `Authorities` (`username`, `authority`) VALUES ('DingDingDong', 'USER');


INSERT INTO `Illnesses` (`description`,`date_created`,`last_updated`) VALUES ('Asthma is a common long-term inflammatory disease of the airways of the lungs.[3] It is characterized by variable and recurring symptoms, reversible airflow obstruction, and bronchospasm.[10] Symptoms include episodes of wheezing, coughing, chest tightness, and shortness of breath.[2] These episodes may occur a few times a day or a few times per week.[3] Depending on the person, they may become worse at night or with exercise.','2012-12-22','2012-12-22');

INSERT INTO `Illnesses` (`description`,`date_created`,`last_updated`) VALUES ('Scurvy is a disease resulting from a lack of vitamin C.[1] Early symptoms include weakness, feeling tired, and sore arms and legs.[1][2] Without treatment, decreased red blood cells, gum disease, changes to hair, and bleeding from the skin may occur.[1][3] As scurvy worsens there can be poor wound healing, personality changes, and finally death from infection or bleeding.[2]
Typically, scurvy is caused by a lack of vitamin C in the diet.[1] It takes at least a month of little to no vitamin C before symptoms occur.[1][2] In modern times, it occurs most commonly in people with mental disorders, unusual eating habits, alcoholism, and old people who live alone.[2] Other risk factors include intestinal malabsorption and dialysis.[2] Humans and certain other animals require vitamin C in their diets to make the building blocks for collagen.[2] Diagnosis typically is based on physical signs, X-rays, and improvement after treatment.[2]
Treatment is with vitamin C supplements taken by mouth.[1] Improvement often begins in a few days with complete recovery in a few weeks.[2] Sources of vitamin C in the diet include citrus fruit and a number of vegetables such as tomatoes and potatoes.[2] Cooking often decreases vitamin C in foods.[2]
Scurvy currently is rare.[2] It occurs more often in the developing world in association with malnutrition.[2] Rates among refugees are reported at 5% to 45%.[4] Scurvy was described as early as the time of ancient Egypt.[2] It was a limiting factor in long distance sea travel, often killing large numbers of people.[5] A Scottish surgeon in the Royal Navy, James Lind, was the first to prove it could be treated with citrus fruit in a 1753 publication.[2][6] His experiments represented the first controlled trial.[7] It took another 40 years before the British Navy began giving out lemon juice routinely.','2012-12-22','2012-12-22');


INSERT INTO `Locations` (`lattitude`,`longitude`,`date_created`,`last_updated`) VALUES ('41.0695166','-81.518073','2017-12-23','2017-12-23');
INSERT INTO `Locations` (`lattitude`,`longitude`,`date_created`,`last_updated`) VALUES ('40.918083','-73.0196407','2017-12-23','2017-12-23');


INSERT INTO `Plants` (`plant_type`,`description`, `date_created`, `last_updated`) VALUES ('tree','Hell of a tree', '2012-12-22', '2012-12-22');
INSERT INTO `Plants` (`plant_type`,`description`, `date_created`, `last_updated`) VALUES ('tree','muck fucker', '2012-12-22', '2012-12-22');


INSERT INTO `Plant_Illnesses` (`plant_id`,`illness_id`, `date_created`,`last_updated`) VALUES ('1','1','2017-12-24','2017-12-24');
INSERT INTO `Plant_Illnesses` (`plant_id`,`illness_id`, `date_created`,`last_updated`) VALUES ('2','2','2017-12-24','2017-12-24');



INSERT INTO `Instructions` (`instructions`, `plant_illness_id`) VALUES ('fuck if I know','1');
INSERT INTO `Instructions` (`instructions`, `plant_illness_id`) VALUES ('½ cup of pine needles, green young needles are best
        1.5 pints of water
        Bring water to boil in a stainless steel pan (do not use aluminum)
        Add the pine needles, reduce heat to a simmer for 20 minutes to overnight.
        Strain needles and drink warm or cold
            yMinute doses of the seed are used internally in the treatment of spasmodic coughs, asthma and internal irritations[1]. It is used externally as a tea or an ointment in the treatment of rheumatism and piles[1]. An extract of the bark has been used as an irritant of the cerebro-spinal system[2].ou can also put them in unbleached tea bags
','2');


INSERT INTO `AssessmentForms` (`effectiveness_score`,`date_used`,`comments`,`plant_illness_id`) VALUES ('4','2017-12-23','Asthma came back after the placebo effect wore off','1');
INSERT INTO `AssessmentForms` (`effectiveness_score`,`date_used`,`comments`,`plant_illness_id`) VALUES ('7','2017-12-23','Cleared up that scurvy in a hot second','2');





INSERT INTO `Plant_LocationImages` (`image`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/personal_projects/PlantMeds/src/main/webapp/images/plant_cursor.jpg'),'2017-12-23');
INSERT INTO `Plant_LocationImages` (`image`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/personal_projects/PlantMeds/src/main/webapp/images/sick_face_cursor.jpg'),'2017-12-23');


INSERT INTO `Plant_Locations` (`pick_limit`,`plant_id`,`location_id`,`plant_location_image_id`, `user_id`) VALUES ('25','1','1','1','1');
INSERT INTO `Plant_Locations` (`pick_limit`,`plant_id`,`location_id`,`plant_location_image_id`, `user_id`) VALUES ('300','2','2','2','2');

INSERT INTO `PlantImages` (`image`,`plant_id`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/personal_projects/PlantMeds/src/main/webapp/images/pageDivider-floral.png'),'1','2017-12-23');
INSERT INTO `PlantImages` (`image`,`plant_id`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/personal_projects/PlantMeds/src/main/webapp/images/homePage.jpg'),'2','2017-12-23');






INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('Ohio Buckeye','1');
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('Buckeye','1');
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('Eastern White Pin','2');
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('Northern White Pine','2');
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('White Pine','2');
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('Weymouth Pine','2');
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES ('Soft Pine','2');

INSERT INTO `PlantTechnicalNames` (`name`,`plant_id`) VALUES ('Pinus strobus','2');





INSERT INTO `IllnessCommonNames` (`name`,`illness_id`) VALUES ('asthma','1');
INSERT INTO `IllnessCommonNames` (`name`,`illness_id`) VALUES ('scurvy','2');

INSERT INTO `IllnessTechnicalNames` (`name`,`illness_id`) VALUES ('asthma','1');
INSERT INTO `IllnessTechnicalNames` (`name`,`illness_id`) VALUES ('scurvy','2');






USE `PlantMeds-test`;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
TRUNCATE TABLE ``;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `Plants` (`plant_type`,`description`, `date_created`, `last_updated`) VALUES (`tree`,`The Ohio buckeye is the state tree of Ohio, and its name is an original term of endearment for the pioneers on the Ohio frontier, with specific association with William Henry Harrison. Capt. Daniel Davis[4] of the Ohio Company of Associates, under Gen. Rufus Putnam, traversed the wilderness in the spring of 1788, and began the settlement of Ohio. Davis was said to be the second man ashore at Point Harmar, on April 7, 1788. He declared later that he cut the first tree felled by a settler west of the Ohio River, a "buckeye" tree. Additionally, Colonel Ebenezer Sproat, another founder of that same pioneer city of Marietta, had a tall and commanding presence; he greatly impressed the local Indians, who in admiration dubbed him "Hetuck", meaning eye of the buck deer, or Big Buckeye.[5][6]
Subsequently, "buckeye" came to be used as the nickname and colloquial name for people from the state of Ohio[7] and The Ohio State University's sports teams. Ohio State adopted "Buckeyes" officially as its nickname in 1950,[8] and it came to be applied to any student or graduate of the university.
Native Americans would blanch buckeye nuts, extracting the tannic acid for use in making leather. The nuts can also be dried, turning dark as they harden with exposure to the air, and strung into necklaces similar to those made from the kukui nut in Hawaii.
Buckeye candy, made to resemble the tree's nut, is made by dipping a ball of peanut butter fudge in milk chocolate, leaving a circle of the peanut butter exposed. These are a popular treat in Ohio, especially during the Christmas and college football seasons.`, `2012-12-22`, `2012-12-22`);
INSERT INTO `Plants` (`plant_type`,`description`, `date_created`, `last_updated`) VALUES (`tree`,`Like all members of the white pine group, Pinus subgenus Strobus, the leaves ("needles") are in fascicles (bundles) of 5, or rarely 3 or 4, with a deciduous sheath. They are flexible, bluish-green, finely serrated, 5–13 cm (2–5 in) long, and persist for 18 months, i.e., from the spring of one season until autumn of the next, when they abscise.
The cones are slender, 8–16 cm (3 1⁄4–6 1⁄4 in) long (rarely longer than that) and 4–5 cm (1 1⁄2–2 in) broad when open, and have scales with a rounded apex and slightly reflexed tip. The seeds are 4–5 mm (5⁄32–3⁄16 in) long, with a slender 15–20 mm (5⁄8–3⁄4 in) wing, and are dispersed by wind. Cone production peaks every 3 to 5 years.
While Eastern White Pine is self-fertile, seeds produced this way tend to result in weak, stunted, and malformed seedlings.
Mature trees are often 200–250 years old, and some live to over 400 years. A tree growing near Syracuse, New York was dated to 458 years old in the late 1980s and trees in Michigan and Wisconsin were dated to approximately 500 years old.`, `2012-12-22`, `2012-12-22`);




INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`Ohio Buckeye`,`1`);
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`Buckeye`,`1`);
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`Eastern White Pin`,`2`);
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`Northern White Pine`,`2`);
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`White Pine`,`2`);
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`Weymouth Pine`,`2`);
INSERT INTO `PlantCommonNames` (`name`,`plant_id`) VALUES (`Soft Pine`,`2`);

INSERT INTO `PlantTechnicalNames` (`name`,`plant_id`) VALUES (`Pinus strobus`,`2`);



INSERT INTO `Illnesses` (`description`,`date_created`,`last_updated`) VALUES (`Asthma is a common long-term inflammatory disease of the airways of the lungs.[3] It is characterized by variable and recurring symptoms, reversible airflow obstruction, and bronchospasm.[10] Symptoms include episodes of wheezing, coughing, chest tightness, and shortness of breath.[2] These episodes may occur a few times a day or a few times per week.[3] Depending on the person, they may become worse at night or with exercise.`,`2012-12-22`,`2012-12-22`);

INSERT INTO `Illnesses` (`description`,`date_created`,`last_updated`) VALUES (`Scurvy is a disease resulting from a lack of vitamin C.[1] Early symptoms include weakness, feeling tired, and sore arms and legs.[1][2] Without treatment, decreased red blood cells, gum disease, changes to hair, and bleeding from the skin may occur.[1][3] As scurvy worsens there can be poor wound healing, personality changes, and finally death from infection or bleeding.[2]
Typically, scurvy is caused by a lack of vitamin C in the diet.[1] It takes at least a month of little to no vitamin C before symptoms occur.[1][2] In modern times, it occurs most commonly in people with mental disorders, unusual eating habits, alcoholism, and old people who live alone.[2] Other risk factors include intestinal malabsorption and dialysis.[2] Humans and certain other animals require vitamin C in their diets to make the building blocks for collagen.[2] Diagnosis typically is based on physical signs, X-rays, and improvement after treatment.[2]
Treatment is with vitamin C supplements taken by mouth.[1] Improvement often begins in a few days with complete recovery in a few weeks.[2] Sources of vitamin C in the diet include citrus fruit and a number of vegetables such as tomatoes and potatoes.[2] Cooking often decreases vitamin C in foods.[2]
Scurvy currently is rare.[2] It occurs more often in the developing world in association with malnutrition.[2] Rates among refugees are reported at 5% to 45%.[4] Scurvy was described as early as the time of ancient Egypt.[2] It was a limiting factor in long distance sea travel, often killing large numbers of people.[5] A Scottish surgeon in the Royal Navy, James Lind, was the first to prove it could be treated with citrus fruit in a 1753 publication.[2][6] His experiments represented the first controlled trial.[7] It took another 40 years before the British Navy began giving out lemon juice routinely.`,`2012-12-22`,`2012-12-22`);


INSERT INTO `IllnessCommonNames` (`name`,`illness_id`) VALUES (`asthma`,`1`);
INSERT INTO `IllnessCommonNames` (`name`,`illness_id`) VALUES (`scurvy`,`2`);

INSERT INTO `IllnessTechnicalNames` (`name`,`illness_id`) VALUES (`asthma`,`1`);
INSERT INTO `IllnessTechnicalNames` (`name`,`illness_id`) VALUES (`scurvy`,`2`);

INSERT INTO `Instructions` (`instructions`) VALUES (`fuck if I know`);
INSERT INTO `Instructions` (`instructions`) VALUES/home/matt/Documents/bitbucket/matthew-farabaugh-individual-work/Personal-Work/side_projects/PlantMeds/src/main/webapp/images (`½ cup of pine needles, green young needles are best
        1.5 pints of water
        Bring water to boil in a stainless steel pan (do not use aluminum)
        Add the pine needles, reduce heat to a simmer for 20 minutes to overnight.
        Strain needles and drink warm or cold
            yMinute doses of the seed are used internally in the treatment of spasmodic coughs, asthma and internal irritations[1]. It is used externally as a tea or an ointment in the treatment of rheumatism and piles[1]. An extract of the bark has been used as an irritant of the cerebro-spinal system[2].ou can also put them in unbleached tea bags
`);


INSERT INTO `AssessmentForms` (`effectiveness_score`,`date_used`,`comments`) VALUES (`4`,`2017-12-23`,`Asthma came back after the placebo effect wore off`);
INSERT INTO `AssessmentForms` (`effectiveness_score`,`date_used`,`comments`) VALUES (`7`,`2017-12-23`,`Cleared up that scurvy in a hot second`);

INSERT INTO `Plant_Illnesses` (`plant_id`,`illness_id`,`instructions_id`,`assessment_forms_id`, `date_created`,`last_updated`) VALUES (`1`,`1`,`1`,`1`,`2017-12-24`,`2017-12-24`);

INSERT INTO `Locations` (`lattitude`,`longitude`,`date_created`,`last_updated`) VALUES (`41.0695166`,`-81.518073`,`2017-12-23`,`2017-12-23`);
INSERT INTO `Locations` (`lattitude`,`longitude`,`date_created`,`last_updated`) VALUES (`40.918083`,`-73.0196407`,`2017-12-23`,`2017-12-23`);

INSERT INTO `Plant_LocationImages` (`image`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/bitbucket/matthew-farabaugh-individual-work/Personal-Work/side_projects/PlantMeds/src/main/webapp/images/plant_cursor.jpg'),`2017-12-23`);
INSERT INTO `Plant_LocationImages` (`image`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/bitbucket/matthew-farabaugh-individual-work/Personal-Work/side_projects/PlantMeds/src/main/webapp/images/sick_face_cursor.jpg'),`2017-12-23`);

INSERT INTO `Users` (`first_name`,`last_name`,`username`,`email`,`password`,`enabled`,`join_date`,`last_active`) VALUES (`Matt`,`Farabaugh`,`mattfara5`,`mattfarabaugh50@gmail.com`,`Skdfj%7d7f`, `1`, `2017-11-01`, `2017-12-22`);
INSERT INTO `Users` (`first_name`,`last_name`,`username`,`email`,`password`,`enabled`,`join_date`,`last_active`) VALUES (`Ady`,`Ding`,`DingDingDong`,`linluding@gmail.com`,`Skdfj%7d7f`, `1`, `2017-12-23`, `2017-12-23`);

INSERT INTO `Plant_Locations` (`pick_limit`,`plant_id`,`location_id`,`plant_location_image_id`, `user_id`) VALUES (`25`,`1`,`1`,`1`,`1`);
INSERT INTO `Plant_Locations` (`pick_limit`,`plant_id`,`location_id`,`plant_location_image_id`, `user_id`) VALUES (`300`,`2`,`2`,`2`,`2`);

INSERT INTO `PlantImages` (`image`,`plant_id`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/bitbucket/matthew-farabaugh-individual-work/Personal-Work/side_projects/PlantMeds/src/main/webapp/images/pageDivider-floral.png'),`1`,`2017-12-23`);
INSERT INTO `PlantImages` (`image`,`plant_id`,`date_created`) VALUES (LOAD_FILE('/home/matt/Documents/bitbucket/matthew-farabaugh-individual-work/Personal-Work/side_projects/PlantMeds/src/main/webapp/images/homePage.jpg'),`2`,`2017-12-23`);

INSERT INTO `Authorities` (`username`, `authority`) VALUES (`mattfara5`, `ADMIN`);
INSERT INTO `Authorities` (`username`, `authority`) VALUES (`DingDingDong`, `USER`);

INSERT INTO `Seasons` (`name`) VALUES (`winter`);
INSERT INTO `Seasons` (`name`) VALUES (`spring`);
INSERT INTO `Seasons` (`name`) VALUES (`summer`);
INSERT INTO `Seasons` (`name`) VALUES (`fall`);


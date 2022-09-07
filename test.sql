-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM `students` WHERE `date_of_birth` LIKE '1990%';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM `courses` WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`,`date_of_birth`, TIMESTAMPDIFF(YEAR,`date_of_birth`,CURRENT_DATE()) AS `age` FROM `students` WHERE (TIMESTAMPDIFF(YEAR,`date_of_birth`,CURRENT_DATE()) > 30);

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses` WHERE `period`LIKE 'I semestre%' AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE HOUR(`hour`) > 13 AND DATE(`date`) LIKE '2020-06-20%';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees` WHERE `level` LIKE 'magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`) FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`) FROM `teachers` WHERE `phone` IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS `anno` , COUNT(`id`) FROM `students` GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address` , COUNT(*) FROM `teachers` GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id` , ROUND(AVG(`vote`),2) AS `media_voti` FROM `exam_student` GROUP BY `exam_id`; --MEDIA VOTI ESAMI PER ID APPELLO 
-----------------------------EXTRA-------------------------------------------------------------------------------------------------
SELECT ROUND(AVG(`vote`),2) AS `media_voti` FROM `exam_student` WHERE `exam_id` = 1; --MEDIA VOTI DI UN DATO APPELLO D'ESAME 

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id`, COUNT(*) FROM `degrees` GROUP BY `department_id`;


--1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * FROM `students` JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id` WHERE `degrees`.`name`= 'corso di laurea in economia';
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

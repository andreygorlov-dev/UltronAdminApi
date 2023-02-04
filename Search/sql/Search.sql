SELECT 
    `ID`,
    `NAME` AS `TITLE`,
    NULL AS `SRC`,
    'PAGES' AS `TYPE`
FROM `PAGES`
WHERE `NAME` LIKE '%%QUERY%%'

UNION

SELECT 
    `ID`,
    `TITLE` AS `TITLE`,
    `FILE_SRC` AS `SRC`,
    'DOCUMENTS' AS `TYPE`
FROM `DOCUMENTS`
WHERE `TITLE` LIKE '%%QUERY%%'

UNION

SELECT 
    `ID`,
    `TITLE_PREVIEW` AS `TITLE`,
    `SRC` AS `SRC`,
    'CARDS' AS `TYPE`
FROM `CARDS`
WHERE `TITLE_PREVIEW` LIKE '%%QUERY%%'
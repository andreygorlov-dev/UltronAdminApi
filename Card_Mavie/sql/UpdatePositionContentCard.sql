UPDATE `CARDS_CONTENT_MAVIE` SET 
    `POSITION` = `POSITION` %OPERATION% 1
WHERE `POSITION` IS NOT NULL AND `POSITION` >= %FIRST_POSITION% AND `POSITION` <= %SECOND_POSITION% AND `ID_CARD` = %ID_CARD%
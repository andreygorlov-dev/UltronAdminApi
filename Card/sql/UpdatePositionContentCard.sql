UPDATE `CARDS_CONTENT` SET 
    `POSITION` = `POSITION` %OPERATION% 1
WHERE `POSITION` >= %FIRST_POSITION% AND `POSITION` <= %SECOND_POSITION% AND `ID_CARD` = %ID_CARD%
UPDATE `CARDS` SET 
    `TITLE` = '%TITLE%',
    `DESCRIPTION` = '%DESCRIPTION%',
    %IMG%
    `VIDEO_SRC` = '%VIDEO_SRC%'
WHERE `ID` = %ID%
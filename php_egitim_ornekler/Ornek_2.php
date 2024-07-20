<!DOCTYPE html>
<html lang="tr-TR">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="todo_list.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <title>ORNEK 2-</title>
    <style>
    body{
        background-color: black;
        color: white;
    }
</style>

</head>
<body>
    <?php 
     echo "Buse Berren ÜNAL<br /><br  /> ";
     echo <<<END
    Merhaba bu çoklu yazım 
    php de echo ile
    sondaki bitirme END inin başında kesinlikle boşluk olmamalı
    buna dikkat!
    END;
    ?>
    <input type="button" onClick="Deneme();" value="Işlem Yap"><br /><br  />
    <div id="IslemAlani"></div> 
</body>
</html>
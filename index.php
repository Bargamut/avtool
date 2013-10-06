<?php include('top.php');?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/default.css" />
    <link rel="shortcut icon" href="<?=SITE_ICON?>" type="image/x-icon">
    <title><?=SITE_TITLE?></title>
</head>

<body>
    <div class="main ">
        <div class="header">
            <?=SITE_LOGO?>
        </div>
        <div class="content">
            <form action="/" method="post" enctype="multipart/form-data">
                Расстояние: <?=$SITE->getFiltersHtml('distance');?>
                <br />
                <br />
                <div class="tools">
                    <h3>Передатчики</h3>
                    Тип установки: <?=$SITE->getFiltersHtml('mounting');?><br />
                    Температура: <?=$SITE->getFiltersHtml('temperature');?><br />
                    Напряжение: <?=$SITE->getFiltersHtml('voltage');?>
                </div>
                <div class="tools">
                    <h3>Приёмники</h3>
                    Количество каналов: <?=$SITE->getFiltersHtml('channel');?><br />
                    Настройка: <?=$SITE->getFiltersHtml('settingtype');?><br />
                    Тип камеры: <?=$SITE->getFiltersHtml('videotype');?>
                </div>
                <input class="btnOk" type="submit" value="Ок" />
            </form>
            <?php $res = $SITE->getProductsHtml(); ?>
            <div class="device"><?=$res['transmitters'];?></div>
            <div class="device"><?=$res['recievers'];?></div>
        </div>
        <div class="push"></div>
    </div>
    <div class="footer">
        <hr />
        <?=DEVELOPERS?>
    </div>
</body>
</html>
<?php include('bottom.php');?>
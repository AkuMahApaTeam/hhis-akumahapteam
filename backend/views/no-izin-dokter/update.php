<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\NoIzinDokter */

$this->title = 'Update No Izin Dokter: ' . $model->no_izin;
$this->params['breadcrumbs'][] = ['label' => 'No Izin Dokters', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->no_izin, 'url' => ['view', 'id' => $model->no_izin]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="no-izin-dokter-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

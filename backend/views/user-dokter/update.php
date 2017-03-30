<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\UserDokter */

$this->title = 'Update User Dokter: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'User Dokters', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="user-dokter-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

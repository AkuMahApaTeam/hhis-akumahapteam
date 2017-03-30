<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\UserDokter */

$this->title = 'Create User Dokter';
$this->params['breadcrumbs'][] = ['label' => 'User Dokters', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-dokter-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

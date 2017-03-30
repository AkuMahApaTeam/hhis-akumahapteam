<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UserDokterSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'User Dokters';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-dokter-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create User Dokter', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_dokter',
            'username_dokter',
            'password_dokter',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\NoIzinDokter */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="no-izin-dokter-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'no_izin')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'keahlian')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

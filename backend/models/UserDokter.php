<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user_dokter".
 *
 * @property integer $id_dokter
 * @property string $username_dokter
 * @property string $password_dokter
 *
 * @property Dokter $idDokter
 */
class UserDokter extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_dokter';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_dokter'], 'required'],
            [['id_dokter'], 'integer'],
            [['username_dokter', 'password_dokter'], 'string', 'max' => 255],
            [['id_dokter'], 'exist', 'skipOnError' => true, 'targetClass' => Dokter::className(), 'targetAttribute' => ['id_dokter' => 'id_dokter']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_dokter' => 'Id Dokter',
            'username_dokter' => 'Username Dokter',
            'password_dokter' => 'Password Dokter',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdDokter()
    {
        return $this->hasOne(Dokter::className(), ['id_dokter' => 'id_dokter']);
    }
}

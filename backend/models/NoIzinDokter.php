<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "no_izin_dokter".
 *
 * @property string $no_izin
 * @property string $keahlian
 *
 * @property Dokter[] $dokters
 */
class NoIzinDokter extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'no_izin_dokter';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['no_izin'], 'required'],
            [['no_izin'], 'string', 'max' => 25],
            [['keahlian'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'no_izin' => 'No Izin',
            'keahlian' => 'Keahlian',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDokters()
    {
        return $this->hasMany(Dokter::className(), ['no_izin' => 'no_izin']);
    }
}

<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pasien".
 *
 * @property integer $id_pasien
 * @property string $nama_pasien
 * @property string $alamat
 * @property string $no_telp_pasien
 * @property string $gol_darah
 * @property string $jenis_kelamin
 *
 * @property Riwayat[] $riwayats
 */
class Pasien extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pasien';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_pasien'], 'required'],
            [['id_pasien'], 'integer'],
            [['nama_pasien', 'alamat'], 'string', 'max' => 255],
            [['no_telp_pasien'], 'string', 'max' => 15],
            [['gol_darah'], 'string', 'max' => 2],
            [['jenis_kelamin'], 'string', 'max' => 10],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_pasien' => 'Id Pasien',
            'nama_pasien' => 'Nama Pasien',
            'alamat' => 'Alamat',
            'no_telp_pasien' => 'No Telp Pasien',
            'gol_darah' => 'Gol Darah',
            'jenis_kelamin' => 'Jenis Kelamin',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRiwayats()
    {
        return $this->hasMany(Riwayat::className(), ['id_pasien' => 'id_pasien']);
    }
}

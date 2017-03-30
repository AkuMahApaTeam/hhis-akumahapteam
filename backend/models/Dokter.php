<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dokter".
 *
 * @property integer $id_dokter
 * @property string $no_izin
 * @property string $email
 * @property string $alamat_rumah
 * @property string $alamat_praktik
 * @property string $nama_dokter
 * @property string $no_telp
 *
 * @property NoIzinDokter $noIzin
 * @property Riwayat[] $riwayats
 * @property UserDokter[] $userDokters
 */
class Dokter extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dokter';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_dokter', 'no_izin'], 'required'],
            [['id_dokter'], 'integer'],
            [['no_izin'], 'string', 'max' => 25],
            [['email'], 'string', 'max' => 50],
            [['alamat_rumah', 'alamat_praktik', 'nama_dokter'], 'string', 'max' => 255],
            [['no_telp'], 'string', 'max' => 15],
            [['no_izin'], 'exist', 'skipOnError' => true, 'targetClass' => NoIzinDokter::className(), 'targetAttribute' => ['no_izin' => 'no_izin']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_dokter' => 'Id Dokter',
            'no_izin' => 'No Izin',
            'email' => 'Email',
            'alamat_rumah' => 'Alamat Rumah',
            'alamat_praktik' => 'Alamat Praktik',
            'nama_dokter' => 'Nama Dokter',
            'no_telp' => 'No Telp',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNoIzin()
    {
        return $this->hasOne(NoIzinDokter::className(), ['no_izin' => 'no_izin']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRiwayats()
    {
        return $this->hasMany(Riwayat::className(), ['id_dokter' => 'id_dokter']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserDokters()
    {
        return $this->hasMany(UserDokter::className(), ['id_dokter' => 'id_dokter']);
    }
}

<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "riwayat".
 *
 * @property integer $id_pasien
 * @property integer $id_dokter
 * @property integer $umur
 * @property integer $berat_badan
 * @property integer $tinggi_badan
 * @property string $turunan_penyakit
 * @property string $gejala
 * @property string $diagnosa
 * @property string $larangan
 * @property string $note
 * @property string $tgl_periksa
 *
 * @property Dokter $idDokter
 * @property Pasien $idPasien
 */
class Riwayat extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'riwayat';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_pasien', 'id_dokter'], 'required'],
            [['id_pasien', 'id_dokter', 'umur', 'berat_badan', 'tinggi_badan'], 'integer'],
            [['turunan_penyakit', 'gejala', 'diagnosa', 'larangan', 'note'], 'string'],
            [['tgl_periksa'], 'safe'],
            [['id_dokter'], 'exist', 'skipOnError' => true, 'targetClass' => Dokter::className(), 'targetAttribute' => ['id_dokter' => 'id_dokter']],
            [['id_pasien'], 'exist', 'skipOnError' => true, 'targetClass' => Pasien::className(), 'targetAttribute' => ['id_pasien' => 'id_pasien']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_pasien' => 'Id Pasien',
            'id_dokter' => 'Id Dokter',
            'umur' => 'Umur',
            'berat_badan' => 'Berat Badan',
            'tinggi_badan' => 'Tinggi Badan',
            'turunan_penyakit' => 'Turunan Penyakit',
            'gejala' => 'Gejala',
            'diagnosa' => 'Diagnosa',
            'larangan' => 'Larangan',
            'note' => 'Note',
            'tgl_periksa' => 'Tgl Periksa',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdDokter()
    {
        return $this->hasOne(Dokter::className(), ['id_dokter' => 'id_dokter']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdPasien()
    {
        return $this->hasOne(Pasien::className(), ['id_pasien' => 'id_pasien']);
    }
}

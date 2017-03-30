<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\UserDokter;

/**
 * UserDokterSearch represents the model behind the search form about `app\models\UserDokter`.
 */
class UserDokterSearch extends UserDokter
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'id_dokter'], 'integer'],
            [['username_dokter', 'password_dokter'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = UserDokter::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'id_dokter' => $this->id_dokter,
        ]);

        $query->andFilterWhere(['like', 'username_dokter', $this->username_dokter])
            ->andFilterWhere(['like', 'password_dokter', $this->password_dokter]);

        return $dataProvider;
    }
}

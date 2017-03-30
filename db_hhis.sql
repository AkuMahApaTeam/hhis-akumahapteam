/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     3/29/2017 4:04:43 pm                         */
/*==============================================================*/


drop table if exists administrator;

drop table if exists dokter;

drop table if exists no_izin_dokter;

drop table if exists pasien;

drop table if exists riwayat;

drop table if exists user;

/*==============================================================*/
/* table: administrator                                         */
/*==============================================================*/
create table administrator
(
   username_admin       varchar(255),
   password_admin       varchar(255)
);

/*==============================================================*/
/* table: dokter                                                */
/*==============================================================*/
create table dokter
(
   id_dokter            int not null,
   no_izin              varchar(25) not null,
   email                varchar(50),
   alamat_rumah         varchar(255),
   alamat_praktik       varchar(255),
   nama_dokter          varchar(255),
   no_telp              varchar(15),
   primary key (id_dokter)
);

/*==============================================================*/
/* table: no_izin_dokter                                        */
/*==============================================================*/
create table no_izin_dokter
(
   no_izin              varchar(25) not null,
   keahlian             varchar(255),
   primary key (no_izin)
);

/*==============================================================*/
/* table: pasien                                                */
/*==============================================================*/
create table pasien
(
   id_pasien            int not null,
   nama_pasien          varchar(255),
   alamat               varchar(255),
   no_telp_pasien       varchar(15),
   gol_darah            varchar(2),
   jenis_kelamin        varchar(10),
   primary key (id_pasien)
);

/*==============================================================*/
/* table: riwayat                                               */
/*==============================================================*/
create table riwayat
(
   id_pasien            int not null,
   id_dokter            int not null,
   umur                 int,
   berat_badan          int,
   tinggi_badan         int,
   turunan_penyakit     text,
   gejala               text,
   diagnosa             text,
   larangan             text,
   note                 text,
   tgl_periksa          date
);

/*==============================================================*/
/* table: user                                                  */
/*==============================================================*/
create table user
(
   id_dokter            int not null,
   username_dokter      varchar(255),
   password_dokter      varchar(255)
);

alter table dokter add constraint fk_relasi_dokter foreign key (no_izin)
      references no_izin_dokter (no_izin) on delete restrict on update restrict;

alter table riwayat add constraint fk_dokter_riwayat foreign key (id_dokter)
      references dokter (id_dokter) on delete restrict on update restrict;

alter table riwayat add constraint fk_pasien_riwayat foreign key (id_pasien)
      references pasien (id_pasien) on delete restrict on update restrict;

alter table user add constraint fk_user_dokter foreign key (id_dokter)
      references dokter (id_dokter) on delete restrict on update restrict;


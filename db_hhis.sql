/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     3/29/2017 4:04:43 PM                         */
/*==============================================================*/


drop table if exists ADMINISTRATOR;

drop table if exists DOKTER;

drop table if exists NO_IZIN_DOKTER;

drop table if exists PASIEN;

drop table if exists RIWAYAT;

drop table if exists USER;

/*==============================================================*/
/* Table: ADMINISTRATOR                                         */
/*==============================================================*/
create table ADMINISTRATOR
(
   USERNAME_ADMIN       varchar(255),
   PASSWORD_ADMIN       varchar(255)
);

/*==============================================================*/
/* Table: DOKTER                                                */
/*==============================================================*/
create table DOKTER
(
   ID_DOKTER            int not null,
   NO_IZIN              varchar(25) not null,
   EMAIL                varchar(50),
   ALAMAT_RUMAH         varchar(255),
   ALAMAT_PRAKTIK       varchar(255),
   NAMA_DOKTER          varchar(255),
   NO_TELP              varchar(15),
   primary key (ID_DOKTER)
);

/*==============================================================*/
/* Table: NO_IZIN_DOKTER                                        */
/*==============================================================*/
create table NO_IZIN_DOKTER
(
   NO_IZIN              varchar(25) not null,
   KEAHLIAN             varchar(255),
   primary key (NO_IZIN)
);

/*==============================================================*/
/* Table: PASIEN                                                */
/*==============================================================*/
create table PASIEN
(
   ID_PASIEN            int not null,
   NAMA_PASIEN          varchar(255),
   ALAMAT               varchar(255),
   NO_TELP_PASIEN       varchar(15),
   GOL_DARAH            varchar(2),
   JENIS_KELAMIN        varchar(10),
   primary key (ID_PASIEN)
);

/*==============================================================*/
/* Table: RIWAYAT                                               */
/*==============================================================*/
create table RIWAYAT
(
   ID_PASIEN            int not null,
   ID_DOKTER            int not null,
   UMUR                 int,
   BERAT_BADAN          int,
   TINGGI_BADAN         int,
   TURUNAN_PENYAKIT     text,
   GEJALA               text,
   DIAGNOSA             text,
   LARANGAN             text,
   NOTE                 text,
   TGL_PERIKSA          date
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   ID_DOKTER            int not null,
   USERNAME_DOKTER      varchar(255),
   PASSWORD_DOKTER      varchar(255)
);

alter table DOKTER add constraint FK_RELASI_DOKTER foreign key (NO_IZIN)
      references NO_IZIN_DOKTER (NO_IZIN) on delete restrict on update restrict;

alter table RIWAYAT add constraint FK_DOKTER_RIWAYAT foreign key (ID_DOKTER)
      references DOKTER (ID_DOKTER) on delete restrict on update restrict;

alter table RIWAYAT add constraint FK_PASIEN_RIWAYAT foreign key (ID_PASIEN)
      references PASIEN (ID_PASIEN) on delete restrict on update restrict;

alter table USER add constraint FK_USER_DOKTER foreign key (ID_DOKTER)
      references DOKTER (ID_DOKTER) on delete restrict on update restrict;


use databaseProject;

 CREATE TABLE kişi (
    kişi_id int PRIMARY KEY UNIQUE NOT NULL,
    isim varchar(255)  NOT NULL,
    email varchar(255)  NOT NULL UNIQUE,
    telefon varchar(255) NOT NULL UNIQUE,
    tip int NOT NULL CHECK (tip >= 0 AND tip <= 2)
); 
 
CREATE TABLE kuruluş (
    kuruluş_id int PRIMARY KEY UNIQUE NOT NULL,
    isim varchar(255)  NOT NULL UNIQUE,
    email varchar(255)  NOT NULL ,
    telefon varchar(255)  NOT NULL ,
    tip int NOT NULL CHECK (tip >= 0 AND tip <= 1)
); 

CREATE TABLE şirket (
    şirket_id int PRIMARY KEY UNIQUE NOT NULL,
    değer varchar(255)  NOT NULL DEFAULT "0" ,
    alan varchar(255)  NOT NULL DEFAULT "None",
    FOREIGN KEY (şirket_id) REFERENCES kuruluş(kuruluş_id)
);  

CREATE TABLE üniversite (
    üni_id int PRIMARY KEY UNIQUE NOT NULL,
    derece varchar(255)  NOT NULL UNIQUE DEFAULT "0",
    FOREIGN KEY (üni_id) REFERENCES kuruluş(kuruluş_id)
);

CREATE TABLE fakülte (
	fakülte_no int PRIMARY KEY UNIQUE NOT NULL,
    isim varchar(255)  NOT NULL UNIQUE,
    üni_id int UNIQUE NOT NULL,
    FOREIGN KEY (üni_id) REFERENCES üniversite(üni_id)
);  

CREATE TABLE bölüm (
    bölüm_no int PRIMARY KEY UNIQUE NOT NULL,
    isim varchar(255)  NOT NULL UNIQUE,
    f_no int UNIQUE NOT NULL,
    FOREIGN KEY (f_no) REFERENCES fakülte(fakülte_no)
); 



CREATE TABLE eğitmen (
    ins_no int PRIMARY KEY UNIQUE NOT NULL,
    bölüm int DEFAULT -1,
    FOREIGN KEY (bölüm) REFERENCES bölüm(bölüm_no),
    FOREIGN KEY (ins_no) REFERENCES kişi(kişi_id),
    tip int NOT NULL CHECK (tip >= 0 AND tip <= 2) DEFAULT -1
); 

 
CREATE TABLE çalışan (
    çalışan_id int PRIMARY KEY UNIQUE NOT NULL,
    maaş int  ,
    FOREIGN KEY (çalışan_id) REFERENCES kişi(kişi_id)
);  


CREATE TABLE asistan (
    asistan_no int PRIMARY KEY UNIQUE NOT NULL,
    tez_konusu varchar(255)  NOT NULL DEFAULT "None",
    FOREIGN KEY (asistan_no) REFERENCES eğitmen(ins_no)
);   

 
CREATE TABLE araştırma_görevlisi (
    araştırma_görevlisi_no int PRIMARY KEY UNIQUE NOT NULL,
    proje_adı varchar(255)  NOT NULL DEFAULT "None",
    FOREIGN KEY (araştırma_görevlisi_no) REFERENCES eğitmen(ins_no)
);   
 
 
 CREATE TABLE öğretim_üyesi (
    öğretim_üyesi_no int PRIMARY KEY UNIQUE NOT NULL,
    ünvan varchar(255)  NOT NULL,
    FOREIGN KEY (öğretim_üyesi_no) REFERENCES eğitmen(ins_no)
);     




CREATE TABLE öğrenci (
    öğrenci_no int PRIMARY KEY UNIQUE NOT NULL,
    bölüm int   NOT NULL ,
    sınıf int  NOT NULL DEFAULT 1,
    gpa DOUBLE(10,2)  NOT NULL DEFAULT 0 CHECK (gpa <=4 AND gpa>=0) ,
    FOREIGN KEY (bölüm) REFERENCES bölüm(bölüm_no),
    FOREIGN KEY (öğrenci_no) REFERENCES kişi(kişi_id)
); 





 CREATE TABLE Ders (
    ders_no int PRIMARY KEY UNIQUE NOT NULL,
    isim varchar(255)  NOT NULL UNIQUE,
    kredi int  NOT NULL ,
    bölüm_no int  NOT NULL,
    ins_no int  NOT NULL,
    FOREIGN KEY (bölüm_no) REFERENCES bölüm(bölüm_no),
    FOREIGN KEY (ins_no) REFERENCES eğitmen(ins_no)
); 


 CREATE TABLE tez (
    öğrenci_no int   NOT NULL,
    tez_no int   NOT NULL,
    isim varchar(255)  NOT NULL UNIQUE,
    notu int  NOT NULL ,
    PRIMARY KEY(öğrenci_no, tez_no),
    FOREIGN KEY (öğrenci_no) REFERENCES öğrenci(öğrenci_no)
);   


 CREATE TABLE okul_projesi (
    proje_no int   NOT NULL,
    öğrenci_no int   NOT NULL,
    ders_no int   NOT NULL,
    ins_no int   NOT NULL,
    isim varchar(255)  NOT NULL UNIQUE,
    notu int  NOT NULL ,
    PRIMARY KEY(proje_no,öğrenci_no,ders_no,ins_no),
    FOREIGN KEY (öğrenci_no) REFERENCES öğrenci(öğrenci_no),
    FOREIGN KEY (ders_no) REFERENCES ders(ders_no),
    FOREIGN KEY (ins_no) REFERENCES eğitmen(ins_no)

);    


CREATE TABLE notlar (
    öğrenci_no int  NOT NULL,
    ders_no int  NOT NULL,
    notu int  check (notu >= 0 AND notu <= 100),
    PRIMARY KEY(öğrenci_no, ders_no),
    FOREIGN KEY (öğrenci_no) REFERENCES öğrenci(öğrenci_no),
    FOREIGN KEY (ders_no) REFERENCES ders(ders_no)
);  


CREATE TABLE asistanlik_eder (
    ders_no int  NOT NULL,
    asistan_no int  NOT NULL,
    PRIMARY KEY(ders_no, asistan_no),
    FOREIGN KEY (ders_no) REFERENCES ders(ders_no),
    FOREIGN KEY (asistan_no) REFERENCES asistan(asistan_no)
   
); 

 
CREATE TABLE çalışır (
    kişi_id int  NOT NULL,
    kuruluş_id int  NOT NULL,
    pozisyon varchar(255)  NOT NULL,
    başlangıç_tarihi varchar(255)  NOT NULL,
    bitiş_tarihi varchar(255) ,
    PRIMARY KEY(kişi_id, kuruluş_id),
    FOREIGN KEY (kişi_id) REFERENCES kişi(kişi_id),
    FOREIGN KEY (kuruluş_id) REFERENCES kuruluş(kuruluş_id)
   
);  


CREATE TABLE bağlantı (
    kişi_1 int  NOT NULL,
    kişi_2 int  NOT NULL,
    PRIMARY KEY(kişi_1, kişi_2),
    FOREIGN KEY (kişi_1) REFERENCES kişi(kişi_id),
    FOREIGN KEY (kişi_2) REFERENCES kişi(kişi_id)
   
);  

 
CREATE TABLE referans (
    ref_alan int  NOT NULL,
    ref int  NOT NULL,
    PRIMARY KEY(ref_alan, ref),
    FOREIGN KEY (ref_alan) REFERENCES kişi(kişi_id),
    FOREIGN KEY (ref) REFERENCES kişi(kişi_id)
   
);  

 
CREATE TABLE sertifika (
    kişi_id int  NOT NULL,
    sertifika_id int NOT NULL,
    sertifika_adı varchar(255)  NOT NULL,
    PRIMARY KEY(kişi_id, sertifika_id),
    FOREIGN KEY (kişi_id) REFERENCES kişi(kişi_id)
   
);   
 
CREATE TABLE proje (
    kişi_id int  NOT NULL,
    proje_id int  NOT NULL,
    proje_adı varchar(255)  NOT NULL,
    link varchar(255)  NOT NULL,
    PRIMARY KEY(kişi_id, proje_id),
    FOREIGN KEY (kişi_id) REFERENCES kişi(kişi_id)
   
);  
 
CREATE TABLE ilgi_alanları (
     kişi_id int  NOT NULL,
    ilgi_id int   NOT NULL,
    şirket varchar(255)  NOT NULL,
     PRIMARY KEY(kişi_id, ilgi_id),
    FOREIGN KEY (kişi_id) REFERENCES kişi(kişi_id)
   
);  

 
CREATE TABLE yetenekler (
     kişi_id int  NOT NULL,
    yetenek_id int   NOT NULL,
    yetenek_adı varchar(255)  NOT NULL,
    level int  NOT NULL,
    başlangıç_tarihi varchar(255)  NOT NULL,
     PRIMARY KEY(kişi_id, yetenek_id),
    FOREIGN KEY (kişi_id) REFERENCES kişi(kişi_id)
   
);  

CREATE TABLE profil_aktivitesi (
	kişi_id int  NOT NULL,
    aktivite_id int   NOT NULL,
    içerik varchar(255)  NOT NULL,
    başlık varchar(255)  NOT NULL,
    tarih varchar(255)  NOT NULL,
    PRIMARY KEY(kişi_id, aktivite_id),
    FOREIGN KEY (kişi_id) REFERENCES kişi(kişi_id)
   
);  


 CREATE TABLE rektörler(
	üni_id int NOT NULL PRIMARY KEY,
    rektör_id int NOT NULL,
    rektör_başlangıç_tarihi date NOT NULL,
    FOREIGN KEY (üni_id) REFERENCES üniversite(üni_id),
    FOREIGN KEY (rektör_id) REFERENCES öğretim_üyesi(öğretim_üyesi_no)
    );
    
CREATE TABLE dekanlar(
	fakülte_no int NOT NULL PRIMARY KEY,
    dekan_id int NOT NULL,
    dekan_başlangıç_tarihi date NOT NULL,
    FOREIGN KEY (fakülte_no) REFERENCES fakülte(fakülte_no),
    FOREIGN KEY (dekan_id) REFERENCES öğretim_üyesi(öğretim_üyesi_no)
    );
    
CREATE TABLE bölüm_başkanlar(
	bölüm_no int NOT NULL PRIMARY KEY,
    bölüm_başkanı_id int NOT NULL,
    bölüm_başkan_başlangıç_tarihi date NOT NULL,
    FOREIGN KEY (bölüm_no) REFERENCES bölüm(bölüm_no),
    FOREIGN KEY (bölüm_başkanı_id) REFERENCES öğretim_üyesi(öğretim_üyesi_no)
    );  
    




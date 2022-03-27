use dbproje;

DROP TRIGGER IF EXISTS kuruluş_tip;
DELIMITER $$
CREATE TRIGGER kuruluş_tip
AFTER INSERT
ON kuruluş FOR EACH ROW
BEGIN
    IF NEW.tip = 0 THEN
        INSERT INTO şirket(şirket_id,değer,alan)
        VALUES(new.kuruluş_id,"","none");
    END IF;
    
     IF NEW.tip = 1 THEN
        INSERT INTO üniversite(üni_id,derece)
        VALUES(new.kuruluş_id,"");
    END IF;
END$$

DELIMITER ;





DROP TRIGGER IF EXISTS kişi_tip;
DELIMITER $$
CREATE TRIGGER kişi_tip
AFTER INSERT
ON kişi FOR EACH ROW
BEGIN
	DECLARE vBölüm int;
    select MIN(bölüm_no) from bölüm INTO vBölüm;
    IF NEW.tip = 0 THEN
        INSERT INTO öğrenci(öğrenci_no,bölüm,sınıf, gpa)
        VALUES(new.kişi_id,vBölüm,1,0);
    END IF;
    
    IF NEW.tip = 1 THEN
        INSERT INTO çalışan(çalışan_id,maaş)
        VALUES(new.kişi_id,null);
    END IF;
    
    IF NEW.tip = 2 THEN
        INSERT INTO eğitmen(ins_no,bölüm,tip)
        VALUES(new.kişi_id,vBölüm,2);
    END IF;
END$$

DELIMITER ;



DROP TRIGGER IF EXISTS eğitmen_tip;
DELIMITER $$
CREATE TRIGGER eğitmen_tip
AFTER INSERT
ON eğitmen FOR EACH ROW
BEGIN
	
    IF NEW.tip = 0 THEN
        INSERT INTO asistan(asistan_no,tez_konusu)
        VALUES(new.ins_no,"");
    END IF;
     IF NEW.tip = 1 THEN
        INSERT INTO araştırma_görevlisi(araştırma_görevlisi_no,proje_adı)
        VALUES(new.ins_no,"");
    END IF;
     IF NEW.tip = 2 THEN
        INSERT INTO öğretim_üyesi(öğretim_üyesi_no,ünvan)
        VALUES(new.ins_no,ünvan);
    END IF;
END$$
DELIMITER ;




DROP TRIGGER IF EXISTS kişi_sil;
DELIMITER $$
CREATE TRIGGER kişi_sil
before delete
ON kişi FOR EACH ROW
BEGIN
	
	IF old.tip = 0 THEN
        delete from öğrenci where old.kişi_id=öğrenci_no;
        
    END IF;
	IF old.tip = 1 THEN
        delete from çalışan where old.kişi_id=çalışan_id;
    END IF;
     IF old.tip = 2 THEN
		 delete from eğitmen where OLD.kişi_id=ins_no;
    END IF;
    delete from bağlantı where old.kişi_id = kişi_1;
    delete from bağlantı where old.kişi_id = kişi_2;
    
    delete from çalışır where old.kişi_id=kişi_id;
    
	delete from referans where old.kişi_id = ref_alan;
    delete from referans where old.kişi_id = ref;
    
    delete from sertifika where old.kişi_id = kişi_id;
    delete from proje where old.kişi_id = kişi_id;
    delete from ilgi_alanları where old.kişi_id = kişi_id;
    delete from yetenekler where old.kişi_id = kişi_id;
    delete from profil_aktivitesi where old.kişi_id = kişi_id;
    
END$$
DELIMITER ;


DROP TRIGGER IF EXISTS kuruluş_sil;
DELIMITER $$
CREATE TRIGGER kuruluş_sil
before delete
ON kuruluş FOR EACH ROW
BEGIN
	
	IF old.tip = 0 THEN
        delete from şirket where old.kuruluş_id=şirket_id;
    END IF;
	IF old.tip = 1 THEN
        delete from üniversite where old.kuruluş_id=üni_id;
    END IF;

    delete from çalışır where old.kuruluş_id=kuruluş_id;
	
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS eğitmen_sil;
DELIMITER $$
CREATE TRIGGER eğitmen_sil
before delete
ON eğitmen FOR EACH ROW
BEGIN
	IF old.tip = 0 THEN
        delete from asistan where old.ins_no=asistan_no;
        delete from asistanlik_eder where old.ins_no = asistan_no;
    END IF;
	IF old.tip = 1 THEN
        delete from çalışan where old.ins_no=araştırma_görevlisi_no;
    END IF;
     IF old.tip = 2 THEN
		 delete from öğretim_üyesi where OLD.ins_no=öğretim_üyesi_no;
    END IF;
	
    delete from okul_projesi where old.ins_no = ins_no;
    
END$$
DELIMITER ;



DROP TRIGGER IF EXISTS öğretim_üyesi_sil;
DELIMITER $$
CREATE TRIGGER öğretim_üyesi_sil
before delete
ON öğretim_üyesi FOR EACH ROW
BEGIN
	delete from rektörler where old.öğretim_üyesi_no = rektör_id;
	delete from dekanlar where old.öğretim_üyesi_no = dekan_id;
	delete from bölüm_başkanlar where old.öğretim_üyesi_no = bölüm_başkanı_id;

END$$

DROP TRIGGER IF EXISTS öğrenci_sil;
DELIMITER $$
CREATE TRIGGER öğrenci_sil
before delete
ON öğrenci FOR EACH ROW
BEGIN
	delete from tez where old.öğrenci_no = öğrenci_no;
	delete from okul_projesi where old.öğrenci_no = öğrenci_no;
    delete from notlar where old.öğrenci_no = öğrenci_no;
    
END$$
DELIMITER ;




DELIMITER ;




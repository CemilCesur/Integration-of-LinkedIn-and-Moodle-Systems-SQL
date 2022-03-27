use databaseProject;

delete from kuruluş where kuruluş_id=0;

INSERT INTO kuruluş(kuruluş_id,isim,email,telefon,tip)
	VALUES(0,"Ege Üniversitesi","EgeUniversitesi@ege.edu.tr","",1);
  
INSERT INTO kuruluş(kuruluş_id,isim,email,telefon,tip)
	VALUES(1,"Arçelik","Arçelik@koç.tr","1",0);

INSERT INTO fakülte(fakülte_no,isim,üni_id)
	VALUES(0,"Mühendislik Fakültesi",0);

INSERT INTO bölüm(bölüm_no,isim,f_no)
	VALUES(0,"Bilgisayar Mühendisliği",0);

 INSERT INTO kişi(kişi_id,isim,email,telefon,tip)
 	VALUES(0,"Adil Özdemir","Adil@test.com","1111",0);

  INSERT INTO kişi(kişi_id,isim,email,telefon,tip)
 	VALUES(1,"Çalişan 1","çalişan_1@test.com","0",1);

 INSERT INTO kişi(kişi_id,isim,email,telefon,tip)
 	VALUES(2,"eğitmen 1","eğitmen_1@test.com","00",2);


delete from kişi where kişi_id=0;



 INSERT INTO çalışır(kişi_id,kuruluş_id,pozisyon,başlangıç_tarihi,bitiş_tarihi)
 	VALUES(1,1,"satiş danişmani","01.01.2020",null);

delete from kuruluş where kuruluş_id=0;



 INSERT INTO rektörler(üni_id,rektör_id,rektör_başlangıç_tarihi)
 	VALUES(0,2,"01.01.2020");
   
 INSERT INTO bölüm_başkanlar(bölüm_no,bölüm_başkanı_id,bölüm_başkan_başlangıç_tarihi)
 	VALUES(0,2,"01.01.2020");
     
INSERT INTO dekanlar(fakülte_no,dekan_id,dekan_başlangıç_tarihi)
 	VALUES(0,2,"01.01.2020");

 INSERT INTO kişi(kişi_id,isim,email,telefon,tip)
 	VALUES(4,"Murat Bey","eğitmen_2@test.com","000000",2);
    
 INSERT INTO kişi(kişi_id,isim,email,telefon,tip)
 	VALUES(3,"Mert Çeçen","Mert@test.com","111111",0);
    
 INSERT INTO Ders(ders_no,isim,kredi,bölüm_no,ins_no)
 	VALUES(0,"Database",6,0,4);

 INSERT INTO notlar(öğrenci_no,ders_no,notu)
 	VALUES(0,0,null);
INSERT INTO notlar(öğrenci_no,ders_no,notu)
 	VALUES(3,0,null);

 INSERT INTO sertifika(kişi_id,sertifika_id,sertifika_adı)
	VALUES(0,0,"sertifika 1");

 INSERT INTO sertifika(kişi_id,sertifika_id,sertifika_adı)
	VALUES(3,1,"sertifika 2");

INSERT INTO yetenekler(kişi_id,yetenek_id,yetenek_adı,level,başlangıç_tarihi)
	VALUES(0,0,"yetenek 1",5,"01.01.2020");

INSERT INTO yetenekler(kişi_id,yetenek_id,yetenek_adı,level,başlangıç_tarihi)
	VALUES(3,1,"yetenek 2",5,"01.01.2020");

INSERT INTO proje(kişi_id,proje_id,proje_adı,link)
	VALUES(3,0,"proje 0","proje linki 0");
   
INSERT INTO proje(kişi_id,proje_id,proje_adı,link)
	VALUES(0,0,"proje 0","proje linki 0");

 INSERT INTO ilgi_alanları(kişi_id,ilgi_id,şirket)
	VALUES(0,0,"ili alani 1");

 INSERT INTO ilgi_alanları(kişi_id,ilgi_id,şirket)
	VALUES(3,0,"ili alani 2");


INSERT INTO profil_aktivitesi(kişi_id,aktivite_id,içerik,başlık,tarih)
	VALUES(0,0,"örnek aktivite","pörnek başlik","01.01.2022");

INSERT INTO profil_aktivitesi(kişi_id,aktivite_id,içerik,başlık,tarih)
	VALUES(3,1,"örnek aktivite","pörnek başlik","01.01.2022");




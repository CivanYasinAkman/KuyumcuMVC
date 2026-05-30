-- 0. TABLOLARI OLUŞTURUYORUZ (Eğer yoklarsa)
CREATE TABLE IF NOT EXISTS Kategoriler (
    KategoriID INTEGER PRIMARY KEY AUTOINCREMENT,
    KategoriAdi TEXT NOT NULL,
    Aciklama TEXT
);

CREATE TABLE IF NOT EXISTS Urunler (
    UrunID INTEGER PRIMARY KEY AUTOINCREMENT,
    KategoriID INTEGER NOT NULL,
    UrunAdi TEXT NOT NULL,
    KisaAciklama TEXT,
    DetayliAciklama TEXT,
    Ayar INTEGER NOT NULL,
    Gramaj REAL,
    IscilikUcreti REAL DEFAULT 0,
    StokDurumu INTEGER DEFAULT 1,
    OlusturulmaTarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KategoriID) REFERENCES Kategoriler(KategoriID)
);

CREATE TABLE IF NOT EXISTS MusteriMesajlari (
    MesajID INTEGER PRIMARY KEY AUTOINCREMENT,
    AdSoyad TEXT NOT NULL,
    Eposta TEXT NOT NULL,
    Telefon TEXT,
    Konu TEXT NOT NULL,
    MesajIcerik TEXT NOT NULL,
    OkunduMu INTEGER DEFAULT 0,
    GonderimTarihi DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 1. EKSİK KATEGORİLERİ TAMAMLIYORUZ (Eğer yoksa eklenecek)
INSERT OR IGNORE INTO Kategoriler (KategoriID, KategoriAdi, Aciklama) VALUES
(1, 'Bilezikler', '22 ve 14 ayar altın bilezik modelleri'),
(2, 'Yüzükler', 'Pırlanta ve altın yüzükler'),
(3, 'Alyanslar', 'Klasik ve modern alyans modelleri'),
(4, 'Setler', 'Düğün ve özel günler için altın setler'),
(5, 'Küpeler', 'Zarif ve şık küpe tasarımları'),
(6, 'Kolyeler', 'Göz alıcı kolye ve zincirler');

-- 2. ESKİ TEST VERİLERİNİ TEMİZLİYORUZ (Çakışma olmaması için)
DELETE FROM Urunler;

-- 3. 12 MUHTEŞEM ÜRÜNÜ (TÜM DETAYLARIYLA) EKLİYORUZ
INSERT INTO Urunler (UrunID, KategoriID, UrunAdi, KisaAciklama, DetayliAciklama, Ayar, Gramaj, IscilikUcreti, StokDurumu) VALUES

(1, 3, 'Klasik Alyans Seti', 
'İki kalbi birleştiren bu klasik alyans seti, sadeliğin içinde büyük bir anlam taşır. Pürüzsüz yüzeyi ve şık tasarımıyla ömürlük bir bağın simgesi olmaya hazır.', 
'Klasik alyans seti, birlikteliğin ve sonsuz bağlılığın en saf sembolüdür. Abartısız, sade tasarımıyla zaman ve modanın ötesinde bir güzellik sunar. 14 Ayar sarı altından üretilen bu set, 4 mm genişliğiyle hem kadın hem erkek bileğine uyumlu oranlar sunar. Tornalama tekniğiyle elde edilen pürüzsüz yüzey yüksek parlaklık polisajıyla tamamlanmıştır. İsim ve tarih yazıdırma hizmeti ücretsiz sunulmaktadır. <ul><li>İki yüzük seti birlikte</li><li>14 Ayar sarı altın</li><li>4 mm gövde genişliği</li><li>Yüksek parlaklık polisaj</li><li>Ücretsiz isim yazıdırma</li><li>Çift kutu ile teslim</li></ul>', 
14, 6.4, 600, 1),

(2, 4, 'Anneler Günü Seti', 
'Dünyanın en önemli insanına en güzel hediyeyi sunun. Özenle tasarlanmış bu ikili set, annenizin her gün yanında taşıyabileceği zarif bir kolye ve küpe ikilisini bir araya getirir.', 
'Anneler Günü Seti, annenize olan sevginizi en zarif şekilde ifade etmek için tasarlanmıştır. Set içeriği: 14 Ayar Çiçek Motifli Kolye (3.0 gr, 42 cm) ve 14 Ayar Çiçek Küpe (2 × 1.1 gr). Çiçek motifi anne sevgisini, yeniden doğuşu ve yaşamın güzelliğini simgeler. 14 Ayar altının zarif sarısı her yaştan annenin cilt tonuyla uyum sağlar. Kişisel mesaj kartınızla birlikte özel bir kutuda teslim edilir. <ul><li>14 Ayar kolye + küpe ikilisi</li><li>Çiçek motifli uyumlu tasarım</li><li>Tüm yaşlara uygun sade estetik</li><li>Kişisel mesaj kartı dahil</li><li>Özel hediyelik kutu ile teslim</li><li>Ücretsiz isim yazıdırma</li></ul>', 
14, 5.2, 0, 1),

(3, 1, 'Burma Bilezik', 
'Geleneksel Türk kuyumculuğunun incelikli dokunuşlarını modern zarafet anlayışıyla harmanlayan Burma Bilezik, ellerin en şık süsü olmaya adaydır. Her örgü, ustalarımızın onlarca yıllık deneyiminin izlerini taşır.', 
'Burma bilezik, Anadolu kuyumculuğunun en köklü geleneklerinden birini temsil eder. Adını aldığı ''Burma'' kelimesi, bükülmüş ve döndürülmüş anlamına gelir. İnce altın teller özel aletlerle bükülüp karakteristik örgü deseni oluşturulur. 22 Ayar altından üretilen bu bilezik hem yatırım hem estetik değer taşır. Mersin atölyemizde ustalıklı eller tarafından tek tek işlenir. <ul><li>Geleneksel el örgü tekniği</li><li>22 Ayar sarı altın</li><li>Devlet damgalı (%91.6)</li><li>Hipo-alerjenik</li><li>Ömür boyu tamir güvencesi</li><li>Özel hediye kutusu ile teslim</li></ul>', 
22, 7.2, 800, 1),

(4, 5, 'Damla Küpe', 
'Suyun damlasından ilham alınan bu zarif küpeler, kulağınızdan aşağıya doğru akarak hem sadeliği hem de hareketi bir arada sunar. Akşam yemeklerinden günlük kullanıma her ortamda şık.', 
'Damla küpe, minimalizm ile feminen zarafetin buluşma noktasıdır. Suyun düşüşünden ilham alınan form, her harekette hafifçe sallanan yapısıyla kulağı çerçeveler. 14 Ayar altından döküm tekniğiyle üretilen her iki küpe de tek tek el perdahından geçirilir. 3 cm uzunluğuyla yüzü incelten bir etki yaratır. Her saç tipine ve yüz hatlarına uyum sağlayan nötr bir tasarımdır. <ul><li>Sallantılı damla form</li><li>14 Ayar sarı altın</li><li>3 cm toplam uzunluk</li><li>Sürgülü emniyetli kanca</li><li>El perdahı yüzey</li><li>Çift poşet hediye paketi</li></ul>', 
14, 2.8, 500, 1),

(5, 4, 'Gelin Seti', 
'En mutlu gününüzü taçlandırmak için tasarlanan Gelin Seti; kolye, bilezik ve küpeden oluşan uyumlu üçlüsüyle tüm gelinlik modellerine mükemmel bir tamamlayıcı sunar.', 
'Gelin seti, hayatınızın en özel gününde baş tacı olacak üç parçalı özel bir koleksiyondur. Set içeriği: 22 Ayar Venezia Kolye (6.5 gr), 22 Ayar Burma Bilezik (8.2 gr) ve 22 Ayar Sıkma Küpe (3.8 gr). Her üç parça aynı tasarım dili ve yüzey işlemiyle birbirini tamamlayacak şekilde üretilmiştir. Setten ayrı satın alınmasına kıyasla %12 tasarruf sağlamaktadır. Özel gelin kutusuyla birlikte kişisel kart notu ile teslim edilmektedir. <ul><li>3 Parça komple set</li><li>22 Ayar sarı altın (tümü)</li><li>Kolye 6.5 gr — Bilezik 8.2 gr — Küpe 3.8 gr</li><li>Uyumlu tasarım dili</li><li>%12 set indirimi uygulanmış</li><li>Özel gelin kutusu ile teslim</li></ul>', 
22, 18.5, 0, 1),

(6, 1, 'Hasır Bilezik', 
'Düz ve temiz çizgileriyle zamansız bir şıklık sunan Hasır Bilezik, geniş yapısıyla bileğinizde güçlü ve zarif bir görünüm oluşturur. Her gün rahatlıkla kullanılabilecek klasik bir tasarım.', 
'Hasır bilezik, Türk kuyumculuğunun en klasik ve köklü tasarımlarından biridir. Altın levhaların özel teknikle üst üste geçirilmesiyle elde edilen hasır örgü deseni kendine özgü bir karakter taşır. 10 mm genişliğiyle bileğinizde güçlü ve zarif bir görünüm sağlar. Hem günlük kullanım hem de özel günler için idealdir. Klasik tasarımı her yaşa ve her stile uyum sağlar. <ul><li>Klasik hasır örgü deseni</li><li>22 Ayar sarı altın</li><li>10 mm geniş tasarım</li><li>Geniş kilit mekanizması</li><li>Devlet damgalı</li><li>Hediye kutusu ile teslim</li></ul>', 
22, 9.5, 1100, 1),

(7, 6, 'Kalp Kolye', 
'Sevginin en saf hali olan kalp formunu zarif bir kuyumculuk eserine dönüştüren bu kolye, özel günlerde en anlamlı hediyelerden biri olmaya adaydır. Sevdiklerinize kalbinizi takın.', 
'Kalp kolye, sevginin evrensel sembolünü zarif bir takıya dönüştürür. 14 Ayar altından döküm tekniğiyle üretilen kalp uç, el perdahı ile pürüzsüz ve parlak bir yüzeye kavuşur. 12×12 mm boyutundaki kalp uç göz alıcı olmadan şık bir görünüm sunar. 42 cm uzunluğundaki ince zinciriyle boyun kemiğinin hemen altında konumlanarak her dekolte ve yaka tipine uyum sağlar. <ul><li>Kalp formlu altın uç</li><li>14 Ayar sarı altın</li><li>42 cm ince zincir</li><li>Döküm ve el perdahı</li><li>Kelebek kilit mekanizması</li><li>Romantik hediye kutusu</li></ul>', 
14, 2.8, 450, 1),

(8, 1, 'Omega Bilezik', 
'Geniş ve düz omega zinciri yapısıyla kalın ve modern bir estetik sunan bu bilezik, bilek üzerinde güçlü bir görsel etki yaratır. Hem spor hem de şık kombinlere kolayca uyum sağlar.', 
'Omega bilezik, 1970''lerin modern takı tasarımından ilham alarak günümüze taşınan ikonik bir bilek süsüdür. Adını Yunan alfabesinin son harfi Omega''dan alan bu tasarım, kuyumculukta geniş ve boru biçimli zincir yapısını ifade eder. 14 Ayar altından üretilen bu bilezik 8 mm genişliğiyle bilek üzerinde güçlü bir görsel etki yaratır. Parlak yüzeyi her ışıkta göz alıcı bir parlaklık yansıtır. <ul><li>Omega boru zincir yapısı</li><li>14 Ayar sarı altın</li><li>8 mm geniş tasarım</li><li>Kemer stili kanca kilit</li><li>Yüksek parlaklık polisaj</li><li>Modern unisex estetik</li></ul>', 
14, 6.8, 750, 1),

(9, 6, 'Safir Taşlı Kolye', 
'Kraliyet mavisi safirin derin rengiyle sarı altının sıcaklığının buluştuğu bu kolye, doğanın en değerli iki güzelliğini tek bir tasarımda bir araya getirir. Asil ve zamansız bir tercih.', 
'Safir taşlı kolye, doğanın en güzel renklerinden birini kuyumculuğun zarafetiyle birleştirir. Korindon mineralinin mavi türevi olan safir, sertlik skalasında elmastan sonra gelen en sert taşlardan biridir. Kullanılan safir taş 1.2 karat ağırlığında, oval kesimli ve doğal kökenlidir. 18 Ayar sarı altın gövde safirin kraliyet mavisini sıcak tonlarıyla çerçeveler. Çatal pençe montaj sayesinde taş maksimum ışık alarak derin mavi rengini en iyi şekilde yansıtır. <ul><li>1.2 ct Doğal Safir Taş</li><li>Oval kesim — Doğal köken</li><li>18 Ayar sarı altın</li><li>Çatal pençe montaj</li><li>Taş sertifikalı teslim</li><li>Lüks kolye kutusu</li></ul>', 
18, 4.1, 1800, 1),

(10, 5, 'Sıkma Küpe', 
'Anadolu kuyumculuğunun en geleneksel küpe formlarından olan Sıkma Küpe, kuşaktan kuşağa aktarılan bir ustalığın ürünüdür. Altının ham güzelliğini en saf haliyle yansıtır.', 
'Sıkma küpe, Anadolu''nun köklü kuyumculuk geleneğinde özel bir yere sahiptir. ''Sıkma'' adını altın levhacıkların birbirine sıkıştırılarak şekillendirilmesi tekniğinden alır. 22 Ayar altının sıcak sarı tonlarıyla hazırlanan bu küpeler hem geleneksel kıyafetlere hem de modern kombinlere uyum sağlar. 12 mm çapıyla dikkat çekmeden şık bir görünüm sağlar. <ul><li>Geleneksel sıkma tekniği</li><li>22 Ayar sarı altın</li><li>12 mm yuvarlak form</li><li>Vida güvenlik sistemi</li><li>Hem klasik hem modern</li><li>Bez kese ile teslim</li></ul>', 
22, 3.6, 700, 1),

(11, 2, 'Solitaire Pırlanta Yüzük', 
'Tek taş pırlantanın sonsuz ışıltısıyla tasarlanmış bu Solitaire Yüzük, evlilik teklifi ve nişan için en çok tercih edilen klasik tasarımdır. Her açıdan göz alıcı bir parlaklık sunar.', 
'Solitaire yüzük, dünyada en çok tercih edilen nişan yüzüğü tasarımıdır. Tek pırlantanın saf güzelliğini ön plana çıkaran minimalist çatal pençe tasarımı, taşın 360° ışık almasını sağlayarak maksimum parlaklık sunar. 0.50 karat ağırlığındaki pırlanta GIA sertifikalı, VVS2 saflık ve F renk grubundadır. 14 Ayar beyaz altın gövde taşın parlaklığını daha da vurgular. <ul><li>0.50 ct GIA Sertifikalı Pırlanta</li><li>VVS2 Saflık — F Renk</li><li>14 Ayar Beyaz Altın</li><li>Teksir (Brilliant) Kesim</li><li>Çatal Pençe Montaj</li><li>Sertifika ile teslim</li></ul>', 
14, 3.8, 2500, 1),

(12, 6, 'Venezia Zincir Kolye', 
'İtalyan zincir ustalarından ilham alınarak tasarlanan Venezia Zincir, her halkasının mükemmel geometrisi ile göz alıcı bir yansıma oyunu oluşturur. Sadeliğin içinde saklı bir lüks.', 
'Venezia zincir, adını İtalya''nın su şehri Venedik''ten almaktadır. Birbirine geçen kare halkaların oluşturduğu bu zincir deseni hem modern hem de klasik kombinlere kolayca uyum sağlar. 22 Ayar sarı altının sıcak tonları Venezia''nın geometrik yapısıyla buluşunca hem sade hem de göz alıcı bir aksesuar ortaya çıkar. Uç kısmına takı, madalyon veya nazar boncuğu takılabilir yapısıyla çok yönlü kullanım sunar. <ul><li>Venezia kare halka zincir</li><li>22 Ayar sarı altın</li><li>45 cm + 5 cm uzatma payı</li><li>Kelebek kilit</li><li>Uç taka uyumlu yapı</li><li>Hediye paketi dahil</li></ul>', 
22, 5.4, 650, 1);
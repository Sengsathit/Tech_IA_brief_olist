/*
==> customers_dataset.csv <==
"customer_id","customer_unique_id","customer_zip_code_prefix","customer_city","customer_state"
"06b8999e2fba1a1fbc88172c00ba8bc7","861eff4711a542e4b93843c6dd7febb0","14409",franca,SP
"18955e83d337fd6b2def6b18a428ac77","290c77bc529b7ac935b93aa66c333dc3","09790",sao bernardo do campo,SP
"4e7b3e00288586ebd08712fdd0374a03","060e732b5b29e8181a18229c7b0b2b5e","01151",sao paulo,SP
b2b6027bc5c5109e529d4dc6358b12c3,"259dac757896d24d7702b9acbbff3f3c","08775",mogi das cruzes,SP
"4f2d8ab171c80ec8364f7c12e35b23ad","345ecd01c38d18a9036ed96c73b8d066","13056",campinas,SP
"879864dab9bc3047522c92c82e1212b8","4c93744516667ad3b8f1fb645a3116a4","89254",jaragua do sul,SC
fd826e7cf63160e536e0908c76c3f441,addec96d2e059c80c30fe6871d30d177,"04534",sao paulo,SP
"5e274e7a0c3809e14aba7ad5aae0d407","57b2a98a409812fe9618067b6b8ebe4f","35182",timoteo,MG
"5adf08e34b2e993982a47070956c5c65","1175e95fb47ddff9de6b2b06188f7e0d","81560",curitiba,PR
*/

CREATE TABLE IF NOT EXISTS customers (
  customer_id TEXT NOT NULL PRIMARY KEY,
  customer_unique_id TEXT,
  customer_zip_code_prefix TEXT,
  customer_city TEXT,
  customer_state TEXT
);




/*
==> geolocation_dataset.csv <==
"geolocation_zip_code_prefix","geolocation_lat","geolocation_lng","geolocation_city","geolocation_state"
"01037",-23.54562128115268,-46.63929204800168,sao paulo,SP
"01046",-23.546081127035535,-46.64482029837157,sao paulo,SP
"01046",-23.54612896641469,-46.64295148361138,sao paulo,SP
"01041",-23.5443921648681,-46.63949930627844,sao paulo,SP
"01035",-23.541577961711493,-46.64160722329613,sao paulo,SP
"01012",-23.547762303364266,-46.63536053788448,são paulo,SP
"01047",-23.546273112412678,-46.64122516971552,sao paulo,SP
"01013",-23.546923208436723,-46.6342636964915,sao paulo,SP
"01029",-23.543769055769133,-46.63427784085132,sao paulo,SP
*/

CREATE TABLE IF NOT EXISTS geolocations (
  geolocation_zip_code_prefix TEXT NOT NULL,
  geolocation_city TEXT NOT NULL,
  geolocation_lng REAL,
  geolocation_state TEXT,
  PRIMARY KEY (geolocation_zip_code_prefix, geolocation_city),
  FOREIGN KEY (geolocation_state) REFERENCES state_name(state)
);




/*
==> order_items_dataset.csv <==
"order_id","order_item_id","product_id","seller_id","shipping_limit_date","price","freight_value"
"00010242fe8c5a6d1ba2dd792cb16214",1,"4244733e06e7ecb4970a6e2683c13e61","48436dade18ac8b2bce089ec2a041202",2017-09-19 09:45:35,58.90,13.29
"00018f77f2f0320c557190d7a144bdd3",1,e5f2d52b802189ee658865ca93d83a8f,dd7ddc04e1b6c2c614352b383efe2d36,2017-05-03 11:05:13,239.90,19.93
"000229ec398224ef6ca0657da4fc703e",1,c777355d18b72b67abbeef9df44fd0fd,"5b51032eddd242adc84c38acab88f23d",2018-01-18 14:48:30,199.00,17.87
"00024acbcdf0a6daa1e931b038114c75",1,"7634da152a4610f1595efa32f14722fc","9d7a1d34a5052409006425275ba1c2b4",2018-08-15 10:10:18,12.99,12.79
"00042b26cf59d7ce69dfabb4e55b4fd9",1,ac6c3623068f30de03045865e4e10089,df560393f3a51e74553ab94004ba5c87,2017-02-13 13:57:51,199.90,18.14
"00048cc3ae777c65dbb7d2a0634bc1ea",1,ef92defde845ab8450f9d70c526ef70f,"6426d21aca402a131fc0a5d0960a3c90",2017-05-23 03:55:27,21.90,12.69
"00054e8431b9d7675808bcb819fb4a32",1,"8d4f2bb7e93e6710a28f34fa83ee7d28","7040e82f899a04d1b434b795a43b4617",2017-12-14 12:10:31,19.90,11.85
"000576fe39319847cbb9d288c5617fa6",1,"557d850972a7d6f792fd18ae1400d9b6","5996cddab893a4652a15592fb58ab8db",2018-07-10 12:30:45,810.00,70.75
"0005a1a1728c9d785b8e2b08b904576c",1,"310ae3c140ff94b03219ad0adc3c778f",a416b6a846a11724393025641d4edd5e,2018-03-26 18:31:29,145.95,11.65
*/

CREATE TABLE IF NOT EXISTS order_items (
  order_id TEXT NOT NULL,
  order_item_id INTEGER NOT NULL,
  product_id TEXT NOT NULL,
  seller_id TEXT NOT NULL,
  shipping_limit_date TEXT,
  price REAL,
  freight_value REAL,
  PRIMARY KEY (order_id, order_item_id, product_id, seller_id)
);




/*
==> order_payments_dataset.csv <==
"order_id","payment_sequential","payment_type","payment_installments","payment_value"
b81ef226f3fe1789b1e8b2acac839d17,1,credit_card,8,99.33
a9810da82917af2d9aefd1278f1dcfa0,1,credit_card,1,24.39
"25e8ea4e93396b6fa0d3dd708e76c1bd",1,credit_card,1,65.71
ba78997921bbcdc1373bb41e913ab953,1,credit_card,8,107.78
"42fdf880ba16b47b59251dd489d4441a",1,credit_card,2,128.45
"298fcdf1f73eb413e4d26d01b25bc1cd",1,credit_card,2,96.12
"771ee386b001f06208a7419e4fc1bbd7",1,credit_card,1,81.16
"3d7239c394a212faae122962df514ac7",1,credit_card,3,51.84
"1f78449c87a54faf9e96e88ba1491fa9",1,credit_card,6,341.09
*/

CREATE TABLE IF NOT EXISTS order_payments (
  order_id TEXT NOT NULL,
  payment_sequential INTEGER NOT NULL,
  payment_type TEXT,
  payment_installments INTEGER,
  payment_value REAL,
  PRIMARY KEY (order_id, payment_sequential)
);




/*
==> order_review_dataset.csv <==
review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp,timestamp_field_7
15197aa66ff4d0650b5434f1b46cda19,b18dcdf73be66366873cd26c5724d1dc,1,,,2018-04-13 00:00:00,2018-04-16T00:39:37Z,
9a0abbb668bafb95a6d2b05db43284c4,d7bd0e4afdf94846eb73642b4e3e75c3,3,,,2017-04-30 00:00:00,2017-05-03T00:02:22Z,
fdbdb2629a7cde0f66657acc92084e7f,70a752414a13d09cc1f2b437b914b28e,3,,,2017-09-29 00:00:00,2017-10-02T01:12:49Z,
7bc2406110b926393aa56f80a40eba40,73fc7af87114b39712e6da79b0a377eb,4,,,2018-01-18 00:00:00,2018-01-18T21:46:59Z,
23f75a37effc35d9a915b4e1ad483793,2eaf8e099d871cd5c22b83b5ea8f6e0e,4,,,2018-03-28 00:00:00,2018-03-30T15:10:55Z,
a2ff510ca4e059c3fefc7a7866571f6f,a9953b2f0b1665ac7586cc5a6ac8f58c,4,,,2017-10-06 00:00:00,2017-10-08T22:36:05Z,
bf566b3910c328733baf7fca7d2be041,a59a15e4b6085c752d338431dc68d464,4,,,2017-11-01 00:00:00,2017-11-01T20:25:30Z,
80e641a11e56f04c1ad469d5645fdfde,a548910a1c6147796b98fdf73dbeba33,5,,,2018-03-10 00:00:00,2018-03-11T03:05:13Z,
228ce5500dc1d8e020d8d1322874b6f0,f9e4b658b201a9f2ecdecbb34bed034b,5,,,2018-02-17 00:00:00,2018-02-18T14:36:24Z,
*/

CREATE TABLE IF NOT EXISTS order_review (
  review_id TEXT NOT NULL PRIMARY KEY,
  order_id TEXT,
  review_score INTEGER,
  review_comment_title TEXT,
  review_comment_message TEXT,
  review_creation_date TEXT,
  review_answer_timestamp TEXT,
  timestamp_field_7 TEXT,
  FOREIGN KEY(order_id) REFERENCES orders(order_id)
);




/*
==> orders_dataset.csv <==
"order_id","customer_id","order_status","order_purchase_timestamp","order_approved_at","order_delivered_carrier_date","order_delivered_customer_date","order_estimated_delivery_date"
e481f51cbdc54678b7cc49136f2d6af7,"9ef432eb6251297304e76186b10a928d",delivered,2017-10-02 10:56:33,2017-10-02 11:07:15,2017-10-04 19:55:00,2017-10-10 21:25:13,2017-10-18 00:00:00
"53cdb2fc8bc7dce0b6741e2150273451",b0830fb4747a6c6d20dea0b8c802d7ef,delivered,2018-07-24 20:41:37,2018-07-26 03:24:27,2018-07-26 14:31:00,2018-08-07 15:27:45,2018-08-13 00:00:00
"47770eb9100c2d0c44946d9cf07ec65d","41ce2a54c0b03bf3443c3d931a367089",delivered,2018-08-08 08:38:49,2018-08-08 08:55:23,2018-08-08 13:50:00,2018-08-17 18:06:29,2018-09-04 00:00:00
"949d5b44dbf5de918fe9c16f97b45f8a",f88197465ea7920adcdbec7375364d82,delivered,2017-11-18 19:28:06,2017-11-18 19:45:59,2017-11-22 13:39:59,2017-12-02 00:28:42,2017-12-15 00:00:00
ad21c59c0840e6cb83a9ceb5573f8159,"8ab97904e6daea8866dbdbc4fb7aad2c",delivered,2018-02-13 21:18:39,2018-02-13 22:20:29,2018-02-14 19:46:34,2018-02-16 18:17:02,2018-02-26 00:00:00
a4591c265e18cb1dcee52889e2d8acc3,"503740e9ca751ccdda7ba28e9ab8f608",delivered,2017-07-09 21:57:05,2017-07-09 22:10:13,2017-07-11 14:58:04,2017-07-26 10:57:55,2017-08-01 00:00:00
"136cce7faa42fdb2cefd53fdc79a6098",ed0271e0b7da060a393796590e7b737a,invoiced,2017-04-11 12:22:08,2017-04-13 13:25:17,,,2017-05-09 00:00:00
"6514b8ad8028c9f2cc2374ded245783f","9bdf08b4b3b52b5526ff42d37d47f222",delivered,2017-05-16 13:10:30,2017-05-16 13:22:11,2017-05-22 10:07:46,2017-05-26 12:55:51,2017-06-07 00:00:00
"76c6e866289321a7c93b82b54852dc33",f54a9f0e6b351c431402b8461ea51999,delivered,2017-01-23 18:29:09,2017-01-25 02:50:47,2017-01-26 14:16:31,2017-02-02 14:08:10,2017-03-06 00:00:00
*/

CREATE TABLE IF NOT EXISTS orders (
  order_id TEXT NOT NULL PRIMARY KEY,
  customer_id TEXT,
  order_status TEXT,
  order_purchase_timestamp TEXT,
  order_approved_at TEXT,
  order_delivered_carrier_date TEXT,
  order_delivered_customer_date TEXT,
  order_estimated_delivery_date TEXT,
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);




/*
==> product_category_name_translation_dataset.csv <==
product_category_name,product_category_name_english
beleza_saude,health_beauty
informatica_acessorios,computers_accessories
automotivo,auto
cama_mesa_banho,bed_bath_table
moveis_decoracao,furniture_decor
esporte_lazer,sports_leisure
perfumaria,perfumery
utilidades_domesticas,housewares
telefonia,telephony
*/

CREATE TABLE IF NOT EXISTS product_category_name_translations (
  product_category_name TEXT NOT NULL PRIMARY KEY,
  product_category_name_english TEXT
);




/*
==> products_dataset.csv <==
"product_id","product_category_name","product_name_lenght","product_description_lenght","product_photos_qty","product_weight_g","product_length_cm","product_height_cm","product_width_cm"
"1e9e8ef04dbcff4541ed26657ea517e5",perfumaria,40,287,1,225,16,10,14
"3aa071139cb16b67ca9e5dea641aaa2f",artes,44,276,1,1000,30,18,20
"96bd76ec8810374ed1b65e291975717f",esporte_lazer,46,250,1,154,18,9,15
cef67bcfe19066a932b7673e239eb23d,bebes,27,261,1,371,26,4,26
"9dc1a7de274444849c219cff195d0b71",utilidades_domesticas,37,402,4,625,20,17,13
"41d3672d4792049fa1779bb35283ed13",instrumentos_musicais,60,745,1,200,38,5,11
"732bd381ad09e530fe0a5f457d81becb",cool_stuff,56,1272,4,18350,70,24,44
"2548af3e6e77a690cf3eb6368e9ab61e",moveis_decoracao,56,184,2,900,40,8,40
"37cc742be07708b53a98702e77a21a02",eletrodomesticos,57,163,1,400,27,13,17
*/

CREATE TABLE IF NOT EXISTS products (
  product_id TEXT NOT NULL PRIMARY KEY,
  product_category_name TEXT,
  product_name_lenght INTEGER,
  product_description_lenght INTEGER,
  product_photos_qty INTEGER,
  product_weight_g INTEGER,
  product_length_cm INTEGER,
  product_height_cm INTEGER,
  product_width_cm INTEGER,
  FOREIGN KEY(product_category_name) REFERENCES product_category_name_translations(state)
);




/*
==> sellers_dataset.csv <==
"seller_id","seller_zip_code_prefix","seller_city","seller_state"
"3442f8959a84dea7ee197c632cb2df15","13023",campinas,SP
d1b65fc7debc3361ea86b5f14c68d2e2,"13844",mogi guacu,SP
ce3ad9de960102d0677a81f5d0bb7b2d,"20031",rio de janeiro,RJ
c0f3eea2e14555b6faeea3dd58c1b1c3,"04195",sao paulo,SP
"51a04a8a6bdcb23deccc82b0b80742cf","12914",braganca paulista,SP
c240c4061717ac1806ae6ee72be3533b,"20920",rio de janeiro,RJ
e49c26c3edfa46d227d5121a6b6e4d37,"55325",brejao,PE
"1b938a7ec6ac5061a66a3766e0e75f90","16304",penapolis,SP
"768a86e36ad6aae3d03ee3c6433d61df","01529",sao paulo,SP
*/

CREATE TABLE IF NOT EXISTS sellers (
  seller_id TEXT NOT NULL PRIMARY KEY,
  seller_zip_code_prefix TEXT,
  seller_city TEXT,
  seller_state TEXT
);




/*
==> state_name_dataset.csv <==
state,state_name
AC,Acre
AL,Alagoas
AP,Amapá
AM,Amazonas
BA,Bahia
CE,Ceará
DF,Distrito Federal
ES,Espírito Santo
GO,Goiás
*/

CREATE TABLE IF NOT EXISTS state_name (
  state TEXT NOT NULL PRIMARY KEY,
  state_name TEXT
);
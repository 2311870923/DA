CREATE EXTERNAL TABLE iuniLogOfDay (
  timestamp BIGINT,
  host STRING,
  method STRING,
  url STRING,
  protocal STRING,
  adId STRING,
  referer STRING,
  country STRING,
  area STRING,
  region STRING,
  city STRING,
  couty STRING,
  isp STRING,
  time_local STRING,
  connection INT,
  connection_requests INT,
  request_time FLOAT,
  remote_addr STRING,
  remote_user STRING,
  server_name STRING,
  request STRING,
  status STRING,
  body_bytes_sent INT,
  bytes_sent INT,
  sent_http_content_length INT,
  http_referer STRING,
  http_user_agent STRING,
  http_x_forwarded_for STRING,
  http_cookie STRING,
  http_via STRING,
  cookie_vk STRING,
  cookie_uid STRING,
  cookie_sessionid STRING
)
PARTITIONED BY (time INT)
ROW FORMAT DELIMITED
LOCATION '/flume/logs/use=usefull';

ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150301);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150302);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150303);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150304);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150305);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150306);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150307);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150308);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150309);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150310);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150311);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150312);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150313);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150314);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150315);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150316);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150317);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150318);
ALTER TABLE iuniLogOfDay ADD PARTITION (time=20150319);

CREATE EXTERNAL TABLE iuniLogOfHour (
  timestamp BIGINT,
  host STRING,
  method STRING,
  url STRING,
  protocal STRING,
  adId STRING,
  referer STRING,
  country STRING,
  area STRING,
  region STRING,
  city STRING,
  couty STRING,
  isp STRING,
  time_local STRING,
  connection INT,
  connection_requests INT,
  request_time FLOAT,
  remote_addr STRING,
  remote_user STRING,
  server_name STRING,
  request STRING,
  status STRING,
  body_bytes_sent INT,
  bytes_sent INT,
  sent_http_content_length INT,
  http_referer STRING,
  http_user_agent STRING,
  http_x_forwarded_for STRING,
  http_cookie STRING,
  http_via STRING,
  cookie_vk STRING,
  cookie_uid STRING,
  cookie_sessionid STRING
)
PARTITIONED BY (time INT)
ROW FORMAT DELIMITED
LOCATION '/flume/logs/use=usefull';

ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030100);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030200);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030300);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030400);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030500);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030600);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030700);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030800);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030900);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031000);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031100);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031200);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031300);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031400);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031500);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031600);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031700);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031800);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031900);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030101);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030201);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030301);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030401);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030501);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030601);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030701);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030801);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030901);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031001);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031101);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031201);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031301);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031401);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031501);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031601);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031701);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031801);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030102);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030202);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030302);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030402);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030502);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030602);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030702);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030802);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030902);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031002);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031102);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031202);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031302);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031402);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031502);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031602);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031702);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031802);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030103);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030203);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030303);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030403);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030503);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030603);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030703);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030803);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030903);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031003);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031103);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031203);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031303);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031403);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031503);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031603);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031703);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031803);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030104);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030204);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030304);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030404);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030504);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030604);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030704);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030804);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030904);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031004);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031104);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031204);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031304);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031404);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031504);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031604);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031704);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031804);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030105);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030205);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030305);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030405);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030505);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030605);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030705);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030805);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030905);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031005);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031105);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031205);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031305);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031405);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031505);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031605);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031705);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031805);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030106);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030206);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030306);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030406);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030506);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030606);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030706);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030806);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030906);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031006);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031106);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031206);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031306);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031406);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031506);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031606);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031706);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031806);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030107);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030207);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030307);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030407);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030507);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030607);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030707);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030807);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030907);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031007);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031107);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031207);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031307);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031407);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031507);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031607);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031707);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031807);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030108);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030208);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030308);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030408);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030508);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030608);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030708);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030808);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030908);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031008);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031108);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031208);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031308);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031408);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031508);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031608);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031708);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031808);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030109);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030209);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030309);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030409);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030509);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030609);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030709);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030809);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030909);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031009);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031109);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031209);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031309);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031409);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031509);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031609);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031709);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031809);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030110);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030210);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030310);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030410);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030510);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030610);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030710);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030810);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030910);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031010);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031110);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031210);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031310);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031410);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031510);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031610);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031710);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031810);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030111);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030211);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030311);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030411);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030511);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030611);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030711);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030811);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030911);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031011);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031111);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031211);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031311);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031411);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031511);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031611);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031711);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031811);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030112);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030212);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030312);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030412);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030512);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030612);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030712);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030812);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030912);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031012);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031112);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031212);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031312);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031412);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031512);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031612);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031712);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031812);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030113);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030213);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030313);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030413);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030513);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030613);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030713);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030813);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030913);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031013);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031113);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031213);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031313);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031413);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031513);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031613);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031713);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031813);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030114);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030214);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030314);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030414);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030514);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030614);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030714);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030814);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030914);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031014);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031114);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031214);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031314);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031414);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031514);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031614);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031714);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031814);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030115);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030215);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030315);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030415);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030515);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030615);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030715);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030815);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030915);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031015);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031115);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031215);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031315);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031415);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031515);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031615);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031715);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031815);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030116);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030216);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030316);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030416);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030516);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030616);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030716);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030816);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030916);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031016);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031116);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031216);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031316);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031416);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031516);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031616);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031716);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031816);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030117);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030217);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030317);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030417);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030517);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030617);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030717);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030817);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030917);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031017);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031117);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031217);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031317);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031417);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031517);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031617);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031717);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031817);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030118);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030218);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030318);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030418);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030518);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030618);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030718);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030818);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030918);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031018);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031118);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031218);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031318);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031418);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031518);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031618);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031718);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031818);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030119);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030219);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030319);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030419);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030519);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030619);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030719);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030819);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030919);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031019);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031119);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031219);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031319);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031419);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031519);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031619);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031719);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031819);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030120);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030220);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030320);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030420);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030520);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030620);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030720);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030820);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030920);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031020);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031120);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031220);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031320);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031420);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031520);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031620);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031720);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031820);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030121);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030221);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030321);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030421);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030521);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030621);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030721);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030821);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030921);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031021);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031121);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031221);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031321);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031421);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031521);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031621);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031721);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031821);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030122);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030222);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030322);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030422);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030522);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030622);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030722);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030822);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030922);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031022);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031122);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031222);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031322);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031422);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031522);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031622);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031722);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031822);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030123);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030223);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030323);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030423);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030523);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030623);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030723);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030823);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015030923);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031023);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031123);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031223);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031323);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031423);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031523);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031623);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031723);
ALTER TABLE iuniLogOfHour ADD PARTITION (time=2015031823);


=== query of day
select count(1) from iunilogofday where time=20150301;
select count(1) from iunilogofday where time=20150301 and `timestamp` < 1425873600000 and `timestamp` > 1425873660000;
select adId, url, count(*) from iunilogofday where time=20150301 and `timestamp` < 1425873600000 and `timestamp` > 1425873660000 group by adId, url;
select adId, url, count(distinct cookie_vk) from iunilogofday where time=20150301 and `timestamp` < 1425873600000 and `timestamp` > 1425873660000 group by adId, url;

=== query of hour
select count(1) from iunilogofhour where time=2015030100;
select count(1) from iunilogofhour where time=2015030100 and `timestamp` < 1425873600000 and `timestamp` > 1425873660000;    
select adId, url, count(*) from iunilogofhour where time=2015030100 and `timestamp` < 1425873600000 and `timestamp` > 1425873660000 group by adId, url;
select adId, url, count(distinct cookie_vk) from iunilogofhour where time=2015030100 and `timestamp` < 1425873600000 and `timestamp` > 1425873660000 group by adId, url;




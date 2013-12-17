a:764:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"This is a list of every function that needs to be implemented by layer";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:72;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"SQL Stored Functions";i:1;i:2;i:2;i:72;}i:2;i:72;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:72;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:103;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"create_random_hash(bits INT UNSIGNED)";i:1;i:3;i:2;i:103;}i:2;i:103;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:103;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:103;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"create_random_hash is used to generate unique identifiers";}i:2;i:149;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:206;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:208;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:208;}i:2;i:208;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:208;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:220;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"bits INT UNSIGNED";i:1;i:5;i:2;i:220;}i:2;i:220;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:5;}i:2;i:220;}i:18;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:241;}i:19;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:241;}i:20;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:241;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" bits ";}i:2;i:245;}i:22;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:251;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" bit is used to define how long the random string needs to be.";}i:2;i:253;}i:24;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:315;}i:25;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:315;}i:26;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:315;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:317;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:317;}i:2;i:317;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:317;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:317;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Output is the newly generated hash.";}i:2;i:330;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:365;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:367;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:367;}i:2;i:367;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:367;}i:36;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:861:"
DELIMITER $$

DROP FUNCTION IF EXISTS create_random_hash$$
CREATE FUNCTION create_random_hash (bits INT UNSIGNED)

RETURNS TEXT
DETERMINISTIC

  BEGIN
  
  DECLARE output TEXT DEFAULT '';
  
  IF bits > 7 THEN BEGIN
     
	DECLARE counter INT UNSIGNED;
	DECLARE newcharacter CHAR(1);
    
	SET counter = 0;
    
	WHILE counter < bits DO

	  SET newcharacter = (SELECT ELT(1 + FLOOR(RAND() * 63), 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','u','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9' ));
	  SET output = CONCAT(output,newcharacter);
	  SET counter = counter + 1;
	  
	END WHILE;
      END;
  ELSE
      BEGIN
	SET output = '-1';
      END;
  END IF;
  
  RETURN output;
  
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:22:"create_random_hash.sql";}i:2;i:383;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1281;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"create_wwuserid";i:1;i:3;i:2;i:1281;}i:2;i:1281;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1281;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1281;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"This safely creates a new unique user in the system.  Must wrap in a write lock.";}i:2;i:1305;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1385;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:67:"
LOCK TABLES users WRITE;
SELECT create_wwuserid();
UNLOCK TABLES;
";i:1;s:3:"sql";i:2;N;}i:2;i:1392;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1473;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:1473;}i:2;i:1473;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1473;}i:47;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1484;}i:48;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1484;}i:49;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1484;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:" Nothing";}i:2;i:1488;}i:51;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1496;}i:52;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1496;}i:53;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1496;}i:54;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1498;}i:55;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:1498;}i:2;i:1498;}i:56;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1498;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1498;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Returns valid new WWUSERID.";}i:2;i:1511;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1538;}i:60;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1540;}i:61;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:1540;}i:2;i:1540;}i:62;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1540;}i:63;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:858:"
-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP FUNCTION IF EXISTS create_wwuserid$$
CREATE FUNCTION create_wwuserid ()

RETURNS VARCHAR(255)
DETERMINISTIC

  BEGIN
  
  DECLARE output VARCHAR(255);
  DECLARE done_bool BOOL;
  DECLARE count_test INT UNSIGNED;
    
  SET @username = (SELECT create_random_hash(32));
  SET output = '-1';
  SET done_bool = FALSE;
  
  WHILE done_bool = FALSE DO
    SET done_bool = TRUE;
    SET @hash = (SELECT create_random_hash(255));
    IF (SELECT count((SELECT WWUSERID FROM users WHERE WWUSERID = @hash))) = 0 THEN 
      BEGIN
      -- Try to create it
	INSERT INTO users SET WWUSERID = @hash, nickname = @username;
      END;
    ELSE
      BEGIN
      -- Back around the loop
      SET done_bool = FALSE;
      END;
    END IF;
      
  END WHILE;
  
  RETURN hash;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:19:"create_wwuserid.sql";}i:2;i:1556;}i:64;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2448;}i:65;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"set_password (username VARCHAR(32), pass VARCHAR(128))";i:1;i:3;i:2;i:2448;}i:2;i:2448;}i:66;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2448;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2448;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Use this to set a users password.";}i:2;i:2511;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2544;}i:70;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2546;}i:71;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:2546;}i:2;i:2546;}i:72;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2546;}i:73;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2557;}i:74;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2557;}i:75;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2557;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:" username VARCHAR(32) nickname of user";}i:2;i:2561;}i:77;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2599;}i:78;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2599;}i:79;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2599;}i:80;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2599;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" pass VARCHAR(128) password of user";}i:2;i:2603;}i:82;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2638;}i:83;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2638;}i:84;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2638;}i:85;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2640;}i:86;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:2640;}i:2;i:2640;}i:87;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2640;}i:88;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2640;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:2653;}i:90;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2660;}i:91;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2662;}i:92;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:2662;}i:2;i:2662;}i:93;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2662;}i:94;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:214:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_password$$

CREATE PROCEDURE set_password (uid CHAR(255), pass VARCHAR(128))

BEGIN
  UPDATE users SET password = SHA2(pass,512) WHERE WWUSERID = uid;
END$$

DELIMITER ;
";i:1;s:3:"sql";i:2;s:16:"set_password.sql";}i:2;i:2678;}i:95;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2923;}i:96;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"validate_user(username VARCHAR(32), pass VARCHAR(128))";i:1;i:3;i:2;i:2923;}i:2;i:2923;}i:97;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2923;}i:98;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2923;}i:99;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Verify that a user gave us the valid password.";}i:2;i:2986;}i:100;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3032;}i:101;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3034;}i:102;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:3034;}i:2;i:3034;}i:103;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3034;}i:104;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3045;}i:105;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3045;}i:106;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3045;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:" username VARCHAR(32) nickname of user";}i:2;i:3049;}i:108;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3087;}i:109;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3087;}i:110;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3087;}i:111;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3087;}i:112;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" pass VARCHAR(128) password of user";}i:2;i:3091;}i:113;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3126;}i:114;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3126;}i:115;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3126;}i:116;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3128;}i:117;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:3128;}i:2;i:3128;}i:118;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3128;}i:119;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3128;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Return WWUSERID or -1 if failed";}i:2;i:3141;}i:121;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3172;}i:122;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3174;}i:123;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:3174;}i:2;i:3174;}i:124;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3174;}i:125;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:464:"
DELIMITER $$

DROP FUNCTION IF EXISTS validate_user$$

CREATE FUNCTION validate_user (uid CHAR(255), pass VARCHAR(128))

RETURNS VARCHAR(255)
DETERMINISTIC

BEGIN
  DECLARE p_hash VARCHAR(128);
  DECLARE t_hash VARCHAR(128);
  SET @my_uid = uid;
    
  SET p_hash = (SELECT password FROM users WHERE WWUSERID = @my_uid);
  SET t_hash = SHA2(pass,512);
  
  IF STRCMP(p_hash,t_hash) = 0 THEN 
    RETURN uid;
  ELSE
   RETURN '-1';
  END IF;
  
END$$

DELIMITER ;
";i:1;s:3:"sql";i:2;s:17:"validate_user.sql";}i:2;i:3190;}i:126;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3686;}i:127;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"query_user(uid CHAR(255))";i:1;i:3;i:2;i:3686;}i:2;i:3686;}i:128;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3686;}i:129;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3686;}i:130;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"Get the basic information of a user.";}i:2;i:3720;}i:131;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3756;}i:132;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3758;}i:133;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:3758;}i:2;i:3758;}i:134;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3758;}i:135;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3769;}i:136;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3769;}i:137;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3769;}i:138;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" Users UID";}i:2;i:3773;}i:139;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3783;}i:140;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3783;}i:141;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3783;}i:142;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3785;}i:143;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:3785;}i:2;i:3785;}i:144;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3785;}i:145;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3797;}i:146;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3797;}i:147;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3797;}i:148;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" email";}i:2;i:3801;}i:149;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3807;}i:150;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3807;}i:151;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3807;}i:152;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3807;}i:153;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" nickname";}i:2;i:3811;}i:154;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3820;}i:155;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3820;}i:156;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3820;}i:157;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3820;}i:158;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" first name";}i:2;i:3824;}i:159;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3835;}i:160;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3835;}i:161;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3835;}i:162;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3835;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" last name";}i:2;i:3839;}i:164;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3849;}i:165;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3849;}i:166;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3849;}i:167;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3849;}i:168;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" short description";}i:2;i:3853;}i:169;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3871;}i:170;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3871;}i:171;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3871;}i:172;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3871;}i:173;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:" long description";}i:2;i:3875;}i:174;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3892;}i:175;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3892;}i:176;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3892;}i:177;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3894;}i:178;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:3894;}i:2;i:3894;}i:179;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3894;}i:180;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:248:"
DELIMITER $$

DROP PROCEDURE IF EXISTS query_user$$
CREATE PROCEDURE query_user (uid CHAR(255))
  BEGIN
    SELECT email, nickname, first_name, last_name, short_description, long_description FROM users WHERE WWUSERID = uid;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"query_user.sql";}i:2;i:3910;}i:181;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4187;}i:182;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:49:"set_user_email(uid CHAR(255), eemail VARCHAR(96))";i:1;i:3;i:2;i:4187;}i:2;i:4187;}i:183;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4187;}i:184;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4187;}i:185;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Change a users email.";}i:2;i:4245;}i:186;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4266;}i:187;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4268;}i:188;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:4268;}i:2;i:4268;}i:189;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4268;}i:190;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:4279;}i:191;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4279;}i:192;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4279;}i:193;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" WWUSERID  ";}i:2;i:4283;}i:194;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:4294;}i:195;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" World wide userid";}i:2;i:4296;}i:196;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4314;}i:197;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4314;}i:198;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4314;}i:199;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4314;}i:200;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" email ";}i:2;i:4318;}i:201;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:4325;}i:202;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" New email address";}i:2;i:4327;}i:203;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4345;}i:204;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4345;}i:205;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:4345;}i:206;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4348;}i:207;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:4348;}i:2;i:4348;}i:208;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4348;}i:209;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4348;}i:210;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:4361;}i:211;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4368;}i:212;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4370;}i:213;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:4370;}i:2;i:4370;}i:214;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4370;}i:215;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:215:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_email$$
CREATE PROCEDURE set_user_email (uid CHAR(255), eemail VARCHAR(96))
  BEGIN
    UPDATE users SET email = eemail WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:18:"set_user_email.sql";}i:2;i:4386;}i:216;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4633;}i:217;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"set_user_nickname(uid CHAR(255), nickname VARCHAR(32))";i:1;i:3;i:2;i:4633;}i:2;i:4633;}i:218;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4633;}i:219;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4633;}i:220;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Change a users nickname.";}i:2;i:4696;}i:221;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4720;}i:222;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4722;}i:223;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:4722;}i:2;i:4722;}i:224;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4722;}i:225;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:4733;}i:226;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4733;}i:227;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4733;}i:228;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:4737;}i:229;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4746;}i:230;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4746;}i:231;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4746;}i:232;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4746;}i:233;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" new nickname";}i:2;i:4750;}i:234;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4763;}i:235;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4763;}i:236;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:4763;}i:237;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4765;}i:238;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:4765;}i:2;i:4765;}i:239;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4765;}i:240;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4765;}i:241;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:4778;}i:242;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4785;}i:243;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4787;}i:244;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:4787;}i:2;i:4787;}i:245;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4787;}i:246;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:230:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_nickname$$
CREATE PROCEDURE set_user_nickname (uid CHAR(255), nnickname VARCHAR(32))
  BEGIN
    UPDATE users SET nickname = nnickname WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:21:"set_user_nickname.sql";}i:2;i:4803;}i:247;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5069;}i:248;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:58:"set_user_first_name(uid CHAR(255), first_name VARCHAR(32))";i:1;i:3;i:2;i:5069;}i:2;i:5069;}i:249;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5069;}i:250;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5069;}i:251;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Change a user's first name.";}i:2;i:5136;}i:252;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5163;}i:253;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5165;}i:254;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:5165;}i:2;i:5165;}i:255;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5165;}i:256;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5176;}i:257;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5176;}i:258;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5176;}i:259;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:5180;}i:260;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5189;}i:261;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5189;}i:262;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5189;}i:263;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5189;}i:264;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" New First name";}i:2;i:5193;}i:265;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5208;}i:266;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5208;}i:267;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5208;}i:268;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5210;}i:269;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:5210;}i:2;i:5210;}i:270;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5210;}i:271;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5210;}i:272;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:5223;}i:273;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5230;}i:274;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5232;}i:275;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:5232;}i:2;i:5232;}i:276;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5232;}i:277;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:239:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_first_name$$
CREATE PROCEDURE set_user_first_name (uid CHAR(255), ffirst_name VARCHAR(32))
  BEGIN
    UPDATE users SET last_name = ffirst_name WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:23:"set_user_first_name.sql";}i:2;i:5248;}i:278;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5525;}i:279;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"set_user_last_name(uid CHAR(255), last_name VARCHAR(32))";i:1;i:3;i:2;i:5525;}i:2;i:5525;}i:280;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5525;}i:281;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5525;}i:282;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Change a user's last name.";}i:2;i:5590;}i:283;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5616;}i:284;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5618;}i:285;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:5618;}i:2;i:5618;}i:286;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5618;}i:287;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5629;}i:288;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5629;}i:289;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5629;}i:290;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:5633;}i:291;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5642;}i:292;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5642;}i:293;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5642;}i:294;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5642;}i:295;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:" New Last name";}i:2;i:5646;}i:296;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5660;}i:297;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5660;}i:298;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5660;}i:299;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5662;}i:300;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:5662;}i:2;i:5662;}i:301;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5662;}i:302;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5662;}i:303;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:5675;}i:304;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5682;}i:305;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5684;}i:306;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:5684;}i:2;i:5684;}i:307;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5684;}i:308;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:235:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_last_name$$
CREATE PROCEDURE set_user_last_name (uid CHAR(255), llast_name VARCHAR(32))
  BEGIN
    UPDATE users SET last_name = llast_name WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:22:"set_user_last_name.sql";}i:2;i:5700;}i:309;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5972;}i:310;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:68:"set_user_short_descr(uid CHAR(255), short_description VARCHAR(1024))";i:1;i:3;i:2;i:5972;}i:2;i:5972;}i:311;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5972;}i:312;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5972;}i:313;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"Change a user's short description.";}i:2;i:6049;}i:314;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6083;}i:315;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6085;}i:316;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:6085;}i:2;i:6085;}i:317;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6085;}i:318;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6096;}i:319;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6096;}i:320;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6096;}i:321;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:6100;}i:322;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6109;}i:323;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6109;}i:324;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6109;}i:325;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6109;}i:326;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" short description";}i:2;i:6113;}i:327;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6131;}i:328;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6131;}i:329;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6131;}i:330;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6133;}i:331;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:6133;}i:2;i:6133;}i:332;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6133;}i:333;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6133;}i:334;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:6146;}i:335;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6153;}i:336;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6155;}i:337;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:6155;}i:2;i:6155;}i:338;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6155;}i:339;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:253:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_short_descr$$
CREATE PROCEDURE set_user_short_descr (uid CHAR(255), sshort_descr VARCHAR(1024))
  BEGIN
    UPDATE users SET short_description = sshort_descr WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:24:"set_user_short_descr.sql";}i:2;i:6171;}i:340;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6462;}i:341;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:58:"set_user_long_descr(uid CHAR(255), llong_description TEXT)";i:1;i:3;i:2;i:6462;}i:2;i:6462;}i:342;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6462;}i:343;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6462;}i:344;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Change a user's long description.";}i:2;i:6529;}i:345;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6562;}i:346;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6564;}i:347;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:6564;}i:2;i:6564;}i:348;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6564;}i:349;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6575;}i:350;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6575;}i:351;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6575;}i:352;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:6579;}i:353;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6588;}i:354;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6588;}i:355;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6588;}i:356;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6588;}i:357;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" New long description";}i:2;i:6592;}i:358;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6613;}i:359;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6613;}i:360;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6613;}i:361;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6615;}i:362;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:6615;}i:2;i:6615;}i:363;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6615;}i:364;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6615;}i:365;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:6628;}i:366;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6635;}i:367;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6637;}i:368;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:6637;}i:2;i:6637;}i:369;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6637;}i:370;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:251:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_long_descr$$
CREATE PROCEDURE set_user_long_descr (uid CHAR(255), llong_description TEXT)
  BEGIN
    UPDATE users SET long_description = llong_description WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:23:"set_user_long_descr.sql";}i:2;i:6653;}i:371;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6941;}i:372;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"delete_user(uid CHAR(255))";i:1;i:3;i:2;i:6941;}i:2;i:6941;}i:373;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6941;}i:374;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6941;}i:375;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Delete a user from the system";}i:2;i:6976;}i:376;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7005;}i:377;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7007;}i:378;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:7007;}i:2;i:7007;}i:379;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7007;}i:380;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:7018;}i:381;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7018;}i:382;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7018;}i:383;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:7022;}i:384;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7031;}i:385;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7031;}i:386;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7031;}i:387;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7033;}i:388;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:7033;}i:2;i:7033;}i:389;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7033;}i:390;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7033;}i:391;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:7046;}i:392;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7053;}i:393;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7055;}i:394;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:7055;}i:2;i:7055;}i:395;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7055;}i:396;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:175:"
DELIMITER $$

DROP PROCEDURE IF EXISTS delete_user$$
CREATE PROCEDURE delete_user (uid CHAR(255))
  BEGIN
    DELETE FROM users WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:15:"delete_user.sql";}i:2;i:7071;}i:397;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7276;}i:398;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"get_current_file(uid CHAR(255))";i:1;i:3;i:2;i:7276;}i:2;i:7276;}i:399;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7276;}i:400;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7276;}i:401;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"Get a users top song from their active playlist";}i:2;i:7316;}i:402;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7363;}i:403;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7365;}i:404;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:7365;}i:2;i:7365;}i:405;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7365;}i:406;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:7376;}i:407;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7376;}i:408;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7376;}i:409;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:7380;}i:410;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7389;}i:411;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7389;}i:412;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7389;}i:413;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7391;}i:414;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:7391;}i:2;i:7391;}i:415;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7391;}i:416;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:7403;}i:417;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7403;}i:418;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7403;}i:419;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWSONGID";}i:2;i:7407;}i:420;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7416;}i:421;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7416;}i:422;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7416;}i:423;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7418;}i:424;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:7418;}i:2;i:7418;}i:425;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7418;}i:426;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:361:"
DELIMITER $$

DROP FUNCTION IF EXISTS get_current_file$$
CREATE FUNCTION get_current_file (uid CHAR(255))

RETURNS CHAR(255)
DETERMINISTIC

  BEGIN
  
    RETURN (SELECT WWSONGID FROM playlists WHERE WWUSERID = uid AND playlist_number = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid ) AND order_number = 0);

  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:20:"get_current_file.sql";}i:2;i:7434;}i:427;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7829;}i:428;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:67:"set_current_playlist(uid CHAR(255)), pplaylist_number INT UNSIGNED)";i:1;i:3;i:2;i:7829;}i:2;i:7829;}i:429;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7829;}i:430;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7829;}i:431;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Set a users current playlist.";}i:2;i:7905;}i:432;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7934;}i:433;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7936;}i:434;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:7936;}i:2;i:7936;}i:435;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7936;}i:436;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:7947;}i:437;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7947;}i:438;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7947;}i:439;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:7951;}i:440;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7960;}i:441;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7960;}i:442;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7960;}i:443;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7960;}i:444;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:" new playlist number";}i:2;i:7964;}i:445;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7984;}i:446;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7984;}i:447;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7984;}i:448;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7985;}i:449;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:7985;}i:2;i:7985;}i:450;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7985;}i:451;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7985;}i:452;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:7998;}i:453;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8005;}i:454;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8007;}i:455;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:8007;}i:2;i:8007;}i:456;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8007;}i:457;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:325:"
DELIMITER $$

DROP FUNCTION IF EXISTS set_current_playlist$$
DROP PROCEDURE IF EXISTS set_current_playlist$$
CREATE PROCEDURE set_current_playlist (uid CHAR(255), pplaylist_number INT UNSIGNED)
  BEGIN
  
    UPDATE users_current_playlist SET playlist_number = pplaylist_number WHERE WWUSERID = uid;

  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:24:"set_current_playlist.sql";}i:2;i:8023;}i:458;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8387;}i:459;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:58:"get_playlist(uid CHAR(255), pplaylist_number INT UNSIGNED)";i:1;i:3;i:2;i:8387;}i:2;i:8387;}i:460;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8387;}i:461;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8387;}i:462;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Get a users current playlist.";}i:2;i:8454;}i:463;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8483;}i:464;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8485;}i:465;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:8485;}i:2;i:8485;}i:466;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8485;}i:467;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:8496;}i:468;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8496;}i:469;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8496;}i:470;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:8500;}i:471;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8509;}i:472;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8509;}i:473;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8509;}i:474;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8509;}i:475;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:" new playlist number";}i:2;i:8513;}i:476;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8533;}i:477;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8533;}i:478;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:8533;}i:479;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8535;}i:480;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:8535;}i:2;i:8535;}i:481;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8535;}i:482;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8535;}i:483;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Songs in current playlist";}i:2;i:8548;}i:484;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8573;}i:485;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8575;}i:486;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:8575;}i:2;i:8575;}i:487;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8575;}i:488;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:322:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_playlist$$
CREATE PROCEDURE get_playlist (uid CHAR(255), pplaylist_number INT UNSIGNED)
  BEGIN
 
    SELECT WWSONGID FROM playlists WHERE WWUSERID = uid AND playlist_number = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
 
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:16:"get_playlist.sql";}i:2;i:8591;}i:489;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8943;}i:490;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"get_avatar(uid CHAR(255))";i:1;i:3;i:2;i:8943;}i:2;i:8943;}i:491;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8943;}i:492;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8943;}i:493;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Get a user's avatar.";}i:2;i:8977;}i:494;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8997;}i:495;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8999;}i:496;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:8999;}i:2;i:8999;}i:497;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8999;}i:498;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9010;}i:499;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9010;}i:500;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9010;}i:501;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:9014;}i:502;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9023;}i:503;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9023;}i:504;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9023;}i:505;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9025;}i:506;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:9025;}i:2;i:9025;}i:507;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9025;}i:508;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9037;}i:509;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9037;}i:510;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9037;}i:511;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" Binary Blob ";}i:2;i:9041;}i:512;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9054;}i:513;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9054;}i:514;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9054;}i:515;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9054;}i:516;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:9058;}i:517;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9063;}i:518;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9063;}i:519;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9063;}i:520;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9065;}i:521;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:9065;}i:2;i:9065;}i:522;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9065;}i:523;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:197:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_avatar$$
CREATE PROCEDURE get_avatar (uid CHAR(255))
  BEGIN
    SELECT avatar_blob, avatar_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"get_avatar.sql";}i:2;i:9081;}i:524;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9306;}i:525;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"get_sprite(uid CHAR(255))";i:1;i:3;i:2;i:9306;}i:2;i:9306;}i:526;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9306;}i:527;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9306;}i:528;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Get a user's sprite.";}i:2;i:9340;}i:529;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9360;}i:530;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9362;}i:531;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:9362;}i:2;i:9362;}i:532;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9362;}i:533;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9373;}i:534;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9373;}i:535;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9373;}i:536;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:9377;}i:537;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9386;}i:538;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9386;}i:539;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9386;}i:540;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9388;}i:541;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:9388;}i:2;i:9388;}i:542;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9388;}i:543;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9400;}i:544;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9400;}i:545;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9400;}i:546;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:9404;}i:547;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9416;}i:548;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9416;}i:549;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9416;}i:550;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9416;}i:551;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:9420;}i:552;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9425;}i:553;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9425;}i:554;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9425;}i:555;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9427;}i:556;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:9427;}i:2;i:9427;}i:557;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9427;}i:558;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:197:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_sprite$$
CREATE PROCEDURE get_sprite (uid CHAR(255))
  BEGIN
    SELECT sprite_blob, sprite_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"get_sprite.sql";}i:2;i:9443;}i:559;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9668;}i:560;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"get_model(uid CHAR(255))";i:1;i:3;i:2;i:9668;}i:2;i:9668;}i:561;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9668;}i:562;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9668;}i:563;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Get a user's model.";}i:2;i:9701;}i:564;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9720;}i:565;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9722;}i:566;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:9722;}i:2;i:9722;}i:567;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9722;}i:568;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9733;}i:569;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9733;}i:570;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9733;}i:571;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:9737;}i:572;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9746;}i:573;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9746;}i:574;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9746;}i:575;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9748;}i:576;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:9748;}i:2;i:9748;}i:577;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9748;}i:578;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9760;}i:579;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9760;}i:580;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9760;}i:581;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:9764;}i:582;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9776;}i:583;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9776;}i:584;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9776;}i:585;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9776;}i:586;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:9780;}i:587;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9785;}i:588;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9785;}i:589;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9785;}i:590;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9787;}i:591;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:9787;}i:2;i:9787;}i:592;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9787;}i:593;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:193:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_model$$
CREATE PROCEDURE get_model (uid CHAR(255))
  BEGIN
    SELECT model_blob, model_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:13:"get_model.sql";}i:2;i:9803;}i:594;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10023;}i:595;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"set_avatar(uid CHAR(255), bdata BLOB, type INT UNSIGNED)";i:1;i:3;i:2;i:10023;}i:2;i:10023;}i:596;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10023;}i:597;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10023;}i:598;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Set a user's avatar.";}i:2;i:10088;}i:599;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10108;}i:600;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10110;}i:601;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:10110;}i:2;i:10110;}i:602;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10110;}i:603;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10121;}i:604;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10121;}i:605;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10121;}i:606;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:10125;}i:607;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10134;}i:608;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10134;}i:609;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10134;}i:610;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10134;}i:611;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:10138;}i:612;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10150;}i:613;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10150;}i:614;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10150;}i:615;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10150;}i:616;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:10154;}i:617;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10159;}i:618;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10159;}i:619;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10159;}i:620;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10161;}i:621;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:10161;}i:2;i:10161;}i:622;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10161;}i:623;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10161;}i:624;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:10174;}i:625;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10181;}i:626;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10183;}i:627;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:10183;}i:2;i:10183;}i:628;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10183;}i:629;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:242:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_avatar$$
CREATE PROCEDURE set_avatar (uid CHAR(255), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET avatar_blob = bdata, avatar_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"set_avatar.sql";}i:2;i:10199;}i:630;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10469;}i:631;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"set_sprite(uid CHAR(255), bdata BLOB, type INT UNSIGNED)";i:1;i:3;i:2;i:10469;}i:2;i:10469;}i:632;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10469;}i:633;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10469;}i:634;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Set a user's sprite.";}i:2;i:10534;}i:635;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10554;}i:636;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10556;}i:637;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:10556;}i:2;i:10556;}i:638;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10556;}i:639;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10567;}i:640;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10567;}i:641;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10567;}i:642;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:10571;}i:643;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10580;}i:644;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10580;}i:645;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10580;}i:646;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10580;}i:647;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:10584;}i:648;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10596;}i:649;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10596;}i:650;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10596;}i:651;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10596;}i:652;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:10600;}i:653;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10605;}i:654;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10605;}i:655;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10605;}i:656;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10607;}i:657;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:10607;}i:2;i:10607;}i:658;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10607;}i:659;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10607;}i:660;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:10620;}i:661;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10627;}i:662;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10629;}i:663;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:10629;}i:2;i:10629;}i:664;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10629;}i:665;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:242:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_sprite$$
CREATE PROCEDURE set_sprite (uid CHAR(255), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET sprite_blob = bdata, sprite_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"set_sprite.sql";}i:2;i:10645;}i:666;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10915;}i:667;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:55:"set_model(uid CHAR(255), bdata BLOB, type INT UNSIGNED)";i:1;i:3;i:2;i:10915;}i:2;i:10915;}i:668;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10915;}i:669;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10915;}i:670;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Set a user's model.";}i:2;i:10979;}i:671;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10998;}i:672;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11000;}i:673;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:11000;}i:2;i:11000;}i:674;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11000;}i:675;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:11011;}i:676;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11011;}i:677;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11011;}i:678;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:11015;}i:679;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11024;}i:680;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11024;}i:681;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11024;}i:682;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11024;}i:683;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:11028;}i:684;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11040;}i:685;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11040;}i:686;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11040;}i:687;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11040;}i:688;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:11044;}i:689;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11049;}i:690;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11049;}i:691;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:11049;}i:692;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11051;}i:693;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:11051;}i:2;i:11051;}i:694;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11051;}i:695;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11051;}i:696;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:11064;}i:697;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11071;}i:698;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11073;}i:699;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:11073;}i:2;i:11073;}i:700;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11073;}i:701;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:238:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_model$$
CREATE PROCEDURE set_model (uid CHAR(255), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET model_blob = bdata, model_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:13:"set_model.sql";}i:2;i:11089;}i:702;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11354;}i:703;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:105:"rearrange_playlist(uid CHAR(255), playlist_number INT UNSIGNED, pl_from INT UNSIGNED, pl_to INT UNSIGNED)";i:1;i:3;i:2;i:11354;}i:2;i:11354;}i:704;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:11354;}i:705;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11354;}i:706;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"Re-arrange a users playlist order.";}i:2;i:11468;}i:707;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11502;}i:708;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11504;}i:709;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:11504;}i:2;i:11504;}i:710;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11504;}i:711;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:11515;}i:712;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11515;}i:713;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11515;}i:714;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:11519;}i:715;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11528;}i:716;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11528;}i:717;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11528;}i:718;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11528;}i:719;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:" playlist_number";}i:2;i:11532;}i:720;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11548;}i:721;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11548;}i:722;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11548;}i:723;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11548;}i:724;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" order_number from";}i:2;i:11552;}i:725;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11570;}i:726;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11570;}i:727;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11570;}i:728;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11570;}i:729;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:" order_number to";}i:2;i:11574;}i:730;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11590;}i:731;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11590;}i:732;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:11590;}i:733;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11592;}i:734;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:11592;}i:2;i:11592;}i:735;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11592;}i:736;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11592;}i:737;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:11605;}i:738;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11612;}i:739;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11614;}i:740;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:11614;}i:2;i:11614;}i:741;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11614;}i:742;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:298:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS rearrange_playlist$$
CREATE PROCEDURE rearrange_playlist(uid CHAR(255), playlist_number INT UNSIGNED, pl_from INT UNSIGNED, pl_to INT UNSIGNED)
  BEGIN
    UPDATE users SET avatar_blob = bdata, avatar_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:22:"rearrange_playlist.sql";}i:2;i:11630;}i:743;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11964;}i:744;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"template";i:1;i:3;i:2;i:11964;}i:2;i:11964;}i:745;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:11964;}i:746;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11982;}i:747;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:11982;}i:2;i:11982;}i:748;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11982;}i:749;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11995;}i:750;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:11995;}i:2;i:11995;}i:751;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11995;}i:752;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12009;}i:753;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:12009;}i:2;i:12009;}i:754;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:12009;}i:755;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1:"
";i:1;s:3:"sql";i:2;s:12:"template.sql";}i:2;i:12025;}i:756;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12053;}i:757;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"PHP API Functions";i:1;i:2;i:2;i:12053;}i:2;i:12053;}i:758;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:12053;}i:759;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12081;}i:760;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"HTTP Public Functions";i:1;i:2;i:2;i:12081;}i:2;i:12081;}i:761;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:12081;}i:762;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12112;}i:763;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:12112;}}
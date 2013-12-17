a:1057:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"This is a list of every function that needs to be implemented by layer";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:72;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"SQL Stored Functions";i:1;i:2;i:2;i:72;}i:2;i:72;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:72;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:103;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"create_random_hash(bits INT UNSIGNED)";i:1;i:3;i:2;i:103;}i:2;i:103;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:103;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:103;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"create_random_hash is used to generate unique identifiers";}i:2;i:149;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:206;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:208;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:208;}i:2;i:208;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:208;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:220;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"bits INT UNSIGNED";i:1;i:5;i:2;i:220;}i:2;i:220;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:5;}i:2;i:220;}i:18;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:241;}i:19;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:241;}i:20;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:241;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" bits ";}i:2;i:245;}i:22;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:251;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" bit is used to define how long the random string needs to be.";}i:2;i:253;}i:24;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:315;}i:25;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:315;}i:26;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:315;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:317;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:317;}i:2;i:317;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:317;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:317;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Output is the newly generated hash.";}i:2;i:330;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:365;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:367;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:367;}i:2;i:367;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:367;}i:36;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:861:"
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
";i:1;s:3:"sql";i:2;s:22:"create_random_hash.sql";}i:2;i:383;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1281;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"create_wwuserid()";i:1;i:3;i:2;i:1281;}i:2;i:1281;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1281;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1281;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"This safely creates a new unique user in the system.  Must wrap in a write lock.";}i:2;i:1307;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1387;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:67:"
LOCK TABLES users WRITE;
SELECT create_wwuserid();
UNLOCK TABLES;
";i:1;s:3:"sql";i:2;N;}i:2;i:1394;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1475;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:1475;}i:2;i:1475;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1475;}i:47;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1486;}i:48;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1486;}i:49;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1486;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:" Nothing";}i:2;i:1490;}i:51;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1498;}i:52;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1498;}i:53;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1498;}i:54;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1500;}i:55;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:1500;}i:2;i:1500;}i:56;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1500;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1500;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Returns valid new WWUSERID.";}i:2;i:1513;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1540;}i:60;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1542;}i:61;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:1542;}i:2;i:1542;}i:62;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1542;}i:63;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:859:"
-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP FUNCTION IF EXISTS create_wwuserid$$
CREATE FUNCTION create_wwuserid ()

RETURNS VARCHAR(128)
DETERMINISTIC

  BEGIN
  
  DECLARE output VARCHAR(128);
  DECLARE done_bool BOOL;
  DECLARE count_test INT UNSIGNED;
    
  SET @username = (SELECT create_random_hash(32));
  SET output = '-1';
  SET done_bool = FALSE;
  
  WHILE done_bool = FALSE DO
    SET done_bool = TRUE;
    SET @hash = (SELECT create_random_hash(128));
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
  
  RETURN @hash;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:19:"create_wwuserid.sql";}i:2;i:1558;}i:64;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2451;}i:65;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"set_user_nickname(uid CHAR(128), nickname VARCHAR(32))";i:1;i:3;i:2;i:2451;}i:2;i:2451;}i:66;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2451;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2451;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Change a users nickname.";}i:2;i:2514;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2538;}i:70;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2540;}i:71;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:2540;}i:2;i:2540;}i:72;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2540;}i:73;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:169:"
call set_user_nickname('0ZeLcsOBaC4bdCuqEXpM7PU3esLsGSNIF8qY8ufan3lSuhkTzMhDpHo0VKxeBuY0DwsPFsTZDFP9PNUAEUaGRFmu5XFSPV5qjyWVnFmu5XGawnxJWTdYjplCWpQUzMe1','ValidUser');
";i:1;N;i:2;N;}i:2;i:2559;}i:74;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2738;}i:75;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:2738;}i:2;i:2738;}i:76;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2738;}i:77;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2749;}i:78;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2749;}i:79;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2749;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:2753;}i:81;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2762;}i:82;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2762;}i:83;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2762;}i:84;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2762;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" new nickname";}i:2;i:2766;}i:86;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2779;}i:87;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2779;}i:88;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2779;}i:89;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2781;}i:90;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:2781;}i:2;i:2781;}i:91;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2781;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2781;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:2794;}i:94;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2801;}i:95;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2803;}i:96;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:2803;}i:2;i:2803;}i:97;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2803;}i:98;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:393:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_nickname$$
CREATE PROCEDURE set_user_nickname (uid CHAR(128), nnickname VARCHAR(32))
  BEGIN
    IF ((SELECT COUNT(nickname) FROM users where nickname = nnickname) = 0) THEN
      BEGIN
      UPDATE users SET nickname = nnickname WHERE WWUSERID = uid;
      SELECT "1";
      END;
    ELSE
      SELECT "-1";
    END IF;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:21:"set_user_nickname.sql";}i:2;i:2819;}i:99;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3247;}i:100;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:47:"set_password (uid CHAR(128), pass VARCHAR(128))";i:1;i:3;i:2;i:3247;}i:2;i:3247;}i:101;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3247;}i:102;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3247;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Use this to set a users password.";}i:2;i:3303;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3336;}i:105;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3338;}i:106;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:3338;}i:2;i:3338;}i:107;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3338;}i:108;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:168:"
call set_password('YFSNLQuAw5PeoxFB2RxJUMAdQ7AHnswsPFsTZFNziLS2jMPqnGmu6eiU81cnwBusXqPMRxJYcGKgDvp82g5EmyOs5cdBrbD7oUtuOGwmu3MUDTVyDx0yjU84lOZUY7oT','ValidPassword');
";i:1;N;i:2;N;}i:2;i:3357;}i:109;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3535;}i:110;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:3535;}i:2;i:3535;}i:111;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3535;}i:112;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3546;}i:113;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3546;}i:114;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3546;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" uid CHAR(128) uid of user";}i:2;i:3550;}i:116;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3576;}i:117;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3576;}i:118;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3576;}i:119;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3576;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" pass VARCHAR(128) password of user";}i:2;i:3580;}i:121;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3615;}i:122;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3615;}i:123;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3615;}i:124;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3617;}i:125;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:3617;}i:2;i:3617;}i:126;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3617;}i:127;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3617;}i:128;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:3630;}i:129;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3637;}i:130;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3639;}i:131;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:3639;}i:2;i:3639;}i:132;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3639;}i:133;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:214:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_password$$

CREATE PROCEDURE set_password (uid CHAR(128), pass VARCHAR(128))

BEGIN
  UPDATE users SET password = SHA2(pass,512) WHERE WWUSERID = uid;
END$$

DELIMITER ;
";i:1;s:3:"sql";i:2;s:16:"set_password.sql";}i:2;i:3655;}i:134;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3899;}i:135;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"validate_user(username VARCHAR(32), pass VARCHAR(128))";i:1;i:3;i:2;i:3899;}i:2;i:3899;}i:136;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3899;}i:137;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3899;}i:138;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Verify that a user gave us the valid password.";}i:2;i:3962;}i:139;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4008;}i:140;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4010;}i:141;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:4010;}i:2;i:4010;}i:142;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4010;}i:143;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:53:"
select validate_user('ValidUser', 'ValidPassword');
";i:1;N;i:2;N;}i:2;i:4029;}i:144;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4092;}i:145;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:4092;}i:2;i:4092;}i:146;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4092;}i:147;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:4103;}i:148;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4103;}i:149;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4103;}i:150;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:" username VARCHAR(32) nickname of user";}i:2;i:4107;}i:151;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4145;}i:152;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4145;}i:153;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4145;}i:154;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4145;}i:155;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" pass VARCHAR(128) password of user";}i:2;i:4149;}i:156;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4184;}i:157;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4184;}i:158;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:4184;}i:159;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4186;}i:160;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:4186;}i:2;i:4186;}i:161;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4186;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4186;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Return WWUSERID or -1 if failed";}i:2;i:4199;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4230;}i:165;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4232;}i:166;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:4232;}i:2;i:4232;}i:167;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4232;}i:168;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:453:"
DELIMITER $$

DROP FUNCTION IF EXISTS validate_user$$

CREATE FUNCTION validate_user (nnickname VARCHAR(32), pass VARCHAR(128))

RETURNS VARCHAR(128)
DETERMINISTIC

BEGIN
  DECLARE p_hash VARCHAR(128);
  DECLARE t_hash VARCHAR(128);
    
  SET p_hash = (SELECT password FROM users WHERE nickname = nnickname);
  SET t_hash = SHA2(pass,512);
  
  IF STRCMP(p_hash,t_hash) = 0 THEN 
    RETURN uid;
  ELSE
   RETURN '-1';
  END IF;
  
END$$

DELIMITER ;
";i:1;s:3:"sql";i:2;s:17:"validate_user.sql";}i:2;i:4248;}i:169;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4732;}i:170;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"query_user(uid CHAR(128))";i:1;i:3;i:2;i:4732;}i:2;i:4732;}i:171;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4732;}i:172;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4732;}i:173;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"Get the basic information of a user.";}i:2;i:4766;}i:174;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4802;}i:175;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4804;}i:176;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:4804;}i:2;i:4804;}i:177;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4804;}i:178;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:72:"
call query_user((select validate_user('ValidUser', 'ValidPassword')));
";i:1;N;i:2;N;}i:2;i:4825;}i:179;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4907;}i:180;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:4907;}i:2;i:4907;}i:181;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4907;}i:182;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:4918;}i:183;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4918;}i:184;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4918;}i:185;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" Users UID";}i:2;i:4922;}i:186;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4932;}i:187;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4932;}i:188;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:4932;}i:189;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4934;}i:190;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:4934;}i:2;i:4934;}i:191;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4934;}i:192;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:4946;}i:193;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4946;}i:194;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4946;}i:195;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" email";}i:2;i:4950;}i:196;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4956;}i:197;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4956;}i:198;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4956;}i:199;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4956;}i:200;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" nickname";}i:2;i:4960;}i:201;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4969;}i:202;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4969;}i:203;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4969;}i:204;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4969;}i:205;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" first name";}i:2;i:4973;}i:206;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4984;}i:207;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4984;}i:208;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4984;}i:209;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4984;}i:210;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" last name";}i:2;i:4988;}i:211;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4998;}i:212;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4998;}i:213;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4998;}i:214;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4998;}i:215;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" short description";}i:2;i:5002;}i:216;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5020;}i:217;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5020;}i:218;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5020;}i:219;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5020;}i:220;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:" long description";}i:2;i:5024;}i:221;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5041;}i:222;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5041;}i:223;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5041;}i:224;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5043;}i:225;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:5043;}i:2;i:5043;}i:226;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5043;}i:227;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:248:"
DELIMITER $$

DROP PROCEDURE IF EXISTS query_user$$
CREATE PROCEDURE query_user (uid CHAR(128))
  BEGIN
    SELECT email, nickname, first_name, last_name, short_description, long_description FROM users WHERE WWUSERID = uid;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"query_user.sql";}i:2;i:5059;}i:228;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5335;}i:229;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:49:"set_user_email(uid CHAR(128), eemail VARCHAR(96))";i:1;i:3;i:2;i:5335;}i:2;i:5335;}i:230;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5335;}i:231;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5335;}i:232;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Change a users email.";}i:2;i:5393;}i:233;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5414;}i:234;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5416;}i:235;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:5416;}i:2;i:5416;}i:236;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5416;}i:237;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:97:"
call set_user_email((select validate_user('ValidUser', 'ValidPassword')), 'someone@gmail.com');
";i:1;N;i:2;N;}i:2;i:5435;}i:238;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5542;}i:239;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:5542;}i:2;i:5542;}i:240;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5542;}i:241;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5553;}i:242;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5553;}i:243;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5553;}i:244;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" WWUSERID  ";}i:2;i:5557;}i:245;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:5568;}i:246;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" World wide userid";}i:2;i:5570;}i:247;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5588;}i:248;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5588;}i:249;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5588;}i:250;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5588;}i:251;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" email ";}i:2;i:5592;}i:252;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:5599;}i:253;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" New email address";}i:2;i:5601;}i:254;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5619;}i:255;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5619;}i:256;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5619;}i:257;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5622;}i:258;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:5622;}i:2;i:5622;}i:259;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5622;}i:260;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5622;}i:261;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:5635;}i:262;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5642;}i:263;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5644;}i:264;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:5644;}i:2;i:5644;}i:265;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5644;}i:266;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:215:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_email$$
CREATE PROCEDURE set_user_email (uid CHAR(128), eemail VARCHAR(96))
  BEGIN
    UPDATE users SET email = eemail WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:18:"set_user_email.sql";}i:2;i:5660;}i:267;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5907;}i:268;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:59:"set_user_first_name(uid CHAR(128), ffirst_name VARCHAR(32))";i:1;i:3;i:2;i:5907;}i:2;i:5907;}i:269;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5907;}i:270;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5907;}i:271;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Change a user's first name.";}i:2;i:5975;}i:272;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6002;}i:273;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6004;}i:274;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:6004;}i:2;i:6004;}i:275;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6004;}i:276;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:95:"
call set_user_first_name((select validate_user('ValidUser', 'ValidPass')), 'ValidFirstName');
";i:1;N;i:2;N;}i:2;i:6023;}i:277;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6128;}i:278;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:6128;}i:2;i:6128;}i:279;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6128;}i:280;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6139;}i:281;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6139;}i:282;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6139;}i:283;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:6143;}i:284;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6152;}i:285;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6152;}i:286;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6152;}i:287;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6152;}i:288;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" New First name";}i:2;i:6156;}i:289;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6171;}i:290;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6171;}i:291;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6171;}i:292;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6173;}i:293;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:6173;}i:2;i:6173;}i:294;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6173;}i:295;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6173;}i:296;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:6186;}i:297;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6193;}i:298;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6195;}i:299;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:6195;}i:2;i:6195;}i:300;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6195;}i:301;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:240:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_first_name$$
CREATE PROCEDURE set_user_first_name (uid CHAR(128), ffirst_name VARCHAR(32))
  BEGIN
    UPDATE users SET first_name = ffirst_name WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:23:"set_user_first_name.sql";}i:2;i:6211;}i:302;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6489;}i:303;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"set_user_last_name(uid CHAR(128), last_name VARCHAR(32))";i:1;i:3;i:2;i:6489;}i:2;i:6489;}i:304;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6489;}i:305;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6489;}i:306;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Change a user's last name.";}i:2;i:6554;}i:307;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6580;}i:308;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6582;}i:309;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:6582;}i:2;i:6582;}i:310;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6582;}i:311;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:93:"
call set_user_last_name((select validate_user('ValidUser', 'ValidPass')), 'ValidLastName');
";i:1;N;i:2;N;}i:2;i:6601;}i:312;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6704;}i:313;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:6704;}i:2;i:6704;}i:314;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6704;}i:315;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6715;}i:316;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6715;}i:317;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6715;}i:318;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:6719;}i:319;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6728;}i:320;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6728;}i:321;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6728;}i:322;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6728;}i:323;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:" New Last name";}i:2;i:6732;}i:324;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6746;}i:325;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6746;}i:326;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6746;}i:327;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6748;}i:328;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:6748;}i:2;i:6748;}i:329;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6748;}i:330;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6748;}i:331;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:6761;}i:332;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6768;}i:333;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6770;}i:334;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:6770;}i:2;i:6770;}i:335;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6770;}i:336;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:235:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_last_name$$
CREATE PROCEDURE set_user_last_name (uid CHAR(128), llast_name VARCHAR(32))
  BEGIN
    UPDATE users SET last_name = llast_name WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:22:"set_user_last_name.sql";}i:2;i:6786;}i:337;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7057;}i:338;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:68:"set_user_short_descr(uid CHAR(128), short_description VARCHAR(1024))";i:1;i:3;i:2;i:7057;}i:2;i:7057;}i:339;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7057;}i:340;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7057;}i:341;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"Change a user's short description.";}i:2;i:7134;}i:342;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7168;}i:343;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7170;}i:344;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:7170;}i:2;i:7170;}i:345;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7170;}i:346;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:88:"
call set_user_short_descr((select validate_user('ValidUser', 'ValidPass')), 'Hi Der');
";i:1;N;i:2;N;}i:2;i:7189;}i:347;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7287;}i:348;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:7287;}i:2;i:7287;}i:349;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7287;}i:350;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:7298;}i:351;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7298;}i:352;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7298;}i:353;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:7302;}i:354;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7311;}i:355;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7311;}i:356;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7311;}i:357;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7311;}i:358;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" short description";}i:2;i:7315;}i:359;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7333;}i:360;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7333;}i:361;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7333;}i:362;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7335;}i:363;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:7335;}i:2;i:7335;}i:364;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7335;}i:365;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7335;}i:366;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:7348;}i:367;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7355;}i:368;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7357;}i:369;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:7357;}i:2;i:7357;}i:370;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7357;}i:371;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:253:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_short_descr$$
CREATE PROCEDURE set_user_short_descr (uid CHAR(128), sshort_descr VARCHAR(1024))
  BEGIN
    UPDATE users SET short_description = sshort_descr WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:24:"set_user_short_descr.sql";}i:2;i:7373;}i:372;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7664;}i:373;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:58:"set_user_long_descr(uid CHAR(128), llong_description TEXT)";i:1;i:3;i:2;i:7664;}i:2;i:7664;}i:374;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7664;}i:375;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7664;}i:376;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Change a user's long description.";}i:2;i:7731;}i:377;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7764;}i:378;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7766;}i:379;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:7766;}i:2;i:7766;}i:380;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7766;}i:381;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:87:"
call set_user_long_descr((select validate_user('ValidUser', 'ValidPass')), 'Hi Der');
";i:1;N;i:2;N;}i:2;i:7785;}i:382;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7882;}i:383;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:7882;}i:2;i:7882;}i:384;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7882;}i:385;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:7893;}i:386;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7893;}i:387;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7893;}i:388;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:7897;}i:389;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7906;}i:390;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7906;}i:391;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7906;}i:392;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7906;}i:393;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" New long description";}i:2;i:7910;}i:394;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7931;}i:395;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7931;}i:396;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7931;}i:397;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7933;}i:398;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:7933;}i:2;i:7933;}i:399;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7933;}i:400;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7933;}i:401;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:7946;}i:402;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7953;}i:403;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7955;}i:404;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:7955;}i:2;i:7955;}i:405;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:7955;}i:406;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:251:"
DELIMITER $$

DROP PROCEDURE IF EXISTS set_user_long_descr$$
CREATE PROCEDURE set_user_long_descr (uid CHAR(128), llong_description TEXT)
  BEGIN
    UPDATE users SET long_description = llong_description WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:23:"set_user_long_descr.sql";}i:2;i:7971;}i:407;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8259;}i:408;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"delete_user(uid CHAR(128))";i:1;i:3;i:2;i:8259;}i:2;i:8259;}i:409;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8259;}i:410;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8259;}i:411;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Delete a user from the system";}i:2;i:8294;}i:412;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8324;}i:413;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8324;}i:414;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Example";i:1;i:4;i:2;i:8324;}i:2;i:8324;}i:415;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8324;}i:416;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:69:"
call delete_user((select validate_user('ValidUser', 'ValidPass')));
";i:1;N;i:2;N;}i:2;i:8343;}i:417;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8422;}i:418;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:8422;}i:2;i:8422;}i:419;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8422;}i:420;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:8433;}i:421;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8433;}i:422;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8433;}i:423;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:8437;}i:424;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8446;}i:425;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8446;}i:426;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:8446;}i:427;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8448;}i:428;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:8448;}i:2;i:8448;}i:429;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8448;}i:430;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8448;}i:431;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:8461;}i:432;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8468;}i:433;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8470;}i:434;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:8470;}i:2;i:8470;}i:435;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8470;}i:436;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:175:"
DELIMITER $$

DROP PROCEDURE IF EXISTS delete_user$$
CREATE PROCEDURE delete_user (uid CHAR(128))
  BEGIN
    DELETE FROM users WHERE WWUSERID = uid; 
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:15:"delete_user.sql";}i:2;i:8486;}i:437;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8690;}i:438;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"get_avatar(uid CHAR(128))";i:1;i:3;i:2;i:8690;}i:2;i:8690;}i:439;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8690;}i:440;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8690;}i:441;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Get a user's avatar.";}i:2;i:8724;}i:442;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8744;}i:443;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8746;}i:444;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:8746;}i:2;i:8746;}i:445;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8746;}i:446;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:8757;}i:447;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8757;}i:448;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8757;}i:449;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:8761;}i:450;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8770;}i:451;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8770;}i:452;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:8770;}i:453;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8772;}i:454;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:8772;}i:2;i:8772;}i:455;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8772;}i:456;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:8784;}i:457;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8784;}i:458;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8784;}i:459;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" Binary Blob ";}i:2;i:8788;}i:460;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8801;}i:461;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8801;}i:462;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8801;}i:463;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8801;}i:464;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:8805;}i:465;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8810;}i:466;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8810;}i:467;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:8810;}i:468;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8812;}i:469;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:8812;}i:2;i:8812;}i:470;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:8812;}i:471;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:197:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_avatar$$
CREATE PROCEDURE get_avatar (uid CHAR(128))
  BEGIN
    SELECT avatar_blob, avatar_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"get_avatar.sql";}i:2;i:8828;}i:472;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9053;}i:473;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"get_sprite(uid CHAR(128))";i:1;i:3;i:2;i:9053;}i:2;i:9053;}i:474;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9053;}i:475;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9053;}i:476;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Get a user's sprite.";}i:2;i:9087;}i:477;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9107;}i:478;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9109;}i:479;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:9109;}i:2;i:9109;}i:480;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9109;}i:481;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9120;}i:482;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9120;}i:483;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9120;}i:484;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:9124;}i:485;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9133;}i:486;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9133;}i:487;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9133;}i:488;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9135;}i:489;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:9135;}i:2;i:9135;}i:490;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9135;}i:491;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9147;}i:492;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9147;}i:493;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9147;}i:494;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:9151;}i:495;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9163;}i:496;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9163;}i:497;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9163;}i:498;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9163;}i:499;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:9167;}i:500;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9172;}i:501;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9172;}i:502;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9172;}i:503;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9174;}i:504;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:9174;}i:2;i:9174;}i:505;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9174;}i:506;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:197:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_sprite$$
CREATE PROCEDURE get_sprite (uid CHAR(128))
  BEGIN
    SELECT sprite_blob, sprite_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"get_sprite.sql";}i:2;i:9190;}i:507;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9415;}i:508;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"get_model(uid CHAR(128))";i:1;i:3;i:2;i:9415;}i:2;i:9415;}i:509;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9415;}i:510;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9415;}i:511;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Get a user's model.";}i:2;i:9448;}i:512;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9467;}i:513;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9469;}i:514;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:9469;}i:2;i:9469;}i:515;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9469;}i:516;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9480;}i:517;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9480;}i:518;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9480;}i:519;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:9484;}i:520;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9493;}i:521;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9493;}i:522;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9493;}i:523;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9495;}i:524;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:9495;}i:2;i:9495;}i:525;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9495;}i:526;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9507;}i:527;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9507;}i:528;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9507;}i:529;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:9511;}i:530;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9523;}i:531;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9523;}i:532;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9523;}i:533;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9523;}i:534;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:9527;}i:535;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9532;}i:536;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9532;}i:537;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9532;}i:538;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9534;}i:539;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:9534;}i:2;i:9534;}i:540;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9534;}i:541;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:193:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_model$$
CREATE PROCEDURE get_model (uid CHAR(128))
  BEGIN
    SELECT model_blob, model_type FROM users WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:13:"get_model.sql";}i:2;i:9550;}i:542;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9771;}i:543;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"set_avatar(uid CHAR(128), bdata BLOB, type INT UNSIGNED)";i:1;i:3;i:2;i:9771;}i:2;i:9771;}i:544;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9771;}i:545;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9771;}i:546;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Set a user's avatar.";}i:2;i:9836;}i:547;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9856;}i:548;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9858;}i:549;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:9858;}i:2;i:9858;}i:550;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9858;}i:551;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:9869;}i:552;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9869;}i:553;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9869;}i:554;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:9873;}i:555;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9882;}i:556;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9882;}i:557;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9882;}i:558;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9882;}i:559;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:9886;}i:560;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9898;}i:561;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9898;}i:562;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:9898;}i:563;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:9898;}i:564;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:9902;}i:565;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:9907;}i:566;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:9907;}i:567;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:9907;}i:568;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9909;}i:569;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:9909;}i:2;i:9909;}i:570;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9909;}i:571;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9909;}i:572;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:9922;}i:573;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9929;}i:574;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9931;}i:575;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:9931;}i:2;i:9931;}i:576;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:9931;}i:577;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:242:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_avatar$$
CREATE PROCEDURE set_avatar (uid CHAR(128), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET avatar_blob = bdata, avatar_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"set_avatar.sql";}i:2;i:9947;}i:578;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10217;}i:579;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"set_sprite(uid CHAR(128), bdata BLOB, type INT UNSIGNED)";i:1;i:3;i:2;i:10217;}i:2;i:10217;}i:580;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10217;}i:581;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10217;}i:582;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Set a user's sprite.";}i:2;i:10282;}i:583;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10302;}i:584;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10304;}i:585;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:10304;}i:2;i:10304;}i:586;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10304;}i:587;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10315;}i:588;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10315;}i:589;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10315;}i:590;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:10319;}i:591;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10328;}i:592;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10328;}i:593;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10328;}i:594;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10328;}i:595;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:10332;}i:596;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10344;}i:597;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10344;}i:598;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10344;}i:599;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10344;}i:600;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:10348;}i:601;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10353;}i:602;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10353;}i:603;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10353;}i:604;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10355;}i:605;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:10355;}i:2;i:10355;}i:606;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10355;}i:607;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10355;}i:608;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:10368;}i:609;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10375;}i:610;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10377;}i:611;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:10377;}i:2;i:10377;}i:612;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10377;}i:613;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:242:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_sprite$$
CREATE PROCEDURE set_sprite (uid CHAR(128), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET sprite_blob = bdata, sprite_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:14:"set_sprite.sql";}i:2;i:10393;}i:614;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10663;}i:615;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:55:"set_model(uid CHAR(128), bdata BLOB, type INT UNSIGNED)";i:1;i:3;i:2;i:10663;}i:2;i:10663;}i:616;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10663;}i:617;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10663;}i:618;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Set a user's model.";}i:2;i:10727;}i:619;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10746;}i:620;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10748;}i:621;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:10748;}i:2;i:10748;}i:622;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10748;}i:623;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10759;}i:624;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10759;}i:625;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10759;}i:626;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:10763;}i:627;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10772;}i:628;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10772;}i:629;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10772;}i:630;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10772;}i:631;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" Binary Blob";}i:2;i:10776;}i:632;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10788;}i:633;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10788;}i:634;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10788;}i:635;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10788;}i:636;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" Type";}i:2;i:10792;}i:637;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10797;}i:638;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10797;}i:639;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10797;}i:640;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10799;}i:641;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:10799;}i:2;i:10799;}i:642;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10799;}i:643;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10799;}i:644;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:10812;}i:645;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10819;}i:646;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10821;}i:647;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:10821;}i:2;i:10821;}i:648;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:10821;}i:649;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:238:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_model$$
CREATE PROCEDURE set_model (uid CHAR(128), bdata BLOB, type INT UNSIGNED)
  BEGIN
    UPDATE users SET model_blob = bdata, model_type = type WHERE WWUSERID = uid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:13:"set_model.sql";}i:2;i:10837;}i:650;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11103;}i:651;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"create_wwfileid()";i:1;i:3;i:2;i:11103;}i:2;i:11103;}i:652;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:11103;}i:653;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11103;}i:654;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:85:"This safely creates a new unique file in the system.  Must wrap call in a write lock.";}i:2;i:11129;}i:655;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11214;}i:656;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:67:"
LOCK TABLES files WRITE;
SELECT create_wwfileid();
UNLOCK TABLES;
";i:1;s:3:"sql";i:2;N;}i:2;i:11221;}i:657;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11302;}i:658;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:11302;}i:2;i:11302;}i:659;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11302;}i:660;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:11313;}i:661;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11313;}i:662;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11313;}i:663;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:" Nothing";}i:2;i:11317;}i:664;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11325;}i:665;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11325;}i:666;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:11325;}i:667;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11327;}i:668;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:11327;}i:2;i:11327;}i:669;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11327;}i:670;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11327;}i:671;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Returns valid new WWFILEID.";}i:2;i:11340;}i:672;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11367;}i:673;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11369;}i:674;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:11369;}i:2;i:11369;}i:675;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:11369;}i:676;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:838:"
-- MUST WRITE LOCK USERS BEFORE ISSUING THIS COMMAND!

DELIMITER $$

DROP FUNCTION IF EXISTS create_wwfileid$$
CREATE FUNCTION create_wwfileid ()

RETURNS VARCHAR(128)
DETERMINISTIC

  BEGIN
  
  DECLARE output VARCHAR(128);
  DECLARE done_bool BOOL;
  DECLARE count_test INT UNSIGNED;
    
  SET @username = (SELECT create_random_hash(32));
  SET output = '-1';
  SET done_bool = FALSE;
  
  WHILE done_bool = FALSE DO
    SET done_bool = TRUE;
    SET @hash = (SELECT create_random_hash(128));
    IF (SELECT count((SELECT WWFILEID FROM files WHERE WWFILEID = @hash))) = 0 THEN 
      BEGIN
      -- Try to create it
  INSERT INTO files SET WWFILEID = @hash;
      END;
    ELSE
      BEGIN
      -- Back around the loop
      SET done_bool = FALSE;
      END;
    END IF;
      
  END WHILE;
  
  RETURN @hash;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:19:"create_wwfileid.sql";}i:2;i:11385;}i:677;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12257;}i:678;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:160:"add_file_network(nnetwork_name VARCHAR(384), nnetwork_info_url VARCHAR(384), ccontact_name VARCHAR(384), ccontact_email VARCHAR(384), ccontact_url VARCHAR(384))";i:1;i:3;i:2;i:12257;}i:2;i:12257;}i:679;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:12257;}i:680;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12257;}i:681;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Create a network";}i:2;i:12426;}i:682;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12442;}i:683;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12444;}i:684;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:96:"prepend_song_to_playlist(uid CHAR(128), sid CHAR(128), playlist INT UNSIGNED, fnid INT UNSIGNED)";i:1;i:3;i:2;i:12444;}i:2;i:12444;}i:685;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:12444;}i:686;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12444;}i:687;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"Prepend a WWFILEID to playlist number for WWUSERID.";}i:2;i:12549;}i:688;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12600;}i:689;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12602;}i:690;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:12602;}i:2;i:12602;}i:691;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:12602;}i:692;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:12613;}i:693;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12613;}i:694;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12613;}i:695;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:12617;}i:696;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12626;}i:697;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12626;}i:698;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12626;}i:699;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12626;}i:700;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWFILEID";}i:2;i:12630;}i:701;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12639;}i:702;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12639;}i:703;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12639;}i:704;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12639;}i:705;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" playlist";}i:2;i:12643;}i:706;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12652;}i:707;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12652;}i:708;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:12652;}i:709;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12654;}i:710;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:12654;}i:2;i:12654;}i:711;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:12654;}i:712;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:12666;}i:713;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12666;}i:714;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12666;}i:715;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" 1 if good";}i:2;i:12670;}i:716;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12680;}i:717;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12680;}i:718;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12680;}i:719;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12680;}i:720;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" -1 if already exists";}i:2;i:12684;}i:721;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12705;}i:722;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12705;}i:723;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:12705;}i:724;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12707;}i:725;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:12707;}i:2;i:12707;}i:726;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:12707;}i:727;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1575:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS prepend_song_to_playlist$$
CREATE PROCEDURE prepend_song_to_playlist(uid CHAR(128), fid CHAR(128), playlist INT UNSIGNED, fnid INT UNSIGNED)
BEGIN
 IF ((SELECT COUNT(WWFILEID) FROM playlists WHERE WWUSERID = uid AND WWFILEID = fid AND playlist_number = playlist) = 0) THEN
      BEGIN
        CREATE TEMPORARY TABLE my_playlist LIKE playlists;
        
        INSERT INTO my_playlist(WWFILEID, WWUSERID, playlist_number, order_number, file_network) select WWFILEID, WWUSERID, playlist_number, order_number, file_network from playlists WHERE WWUSERID=uid AND playlist_number = playlist;
 		
 		UPDATE my_playlist SET order_number = (order_number*10)+1;

 		INSERT INTO my_playlist(WWFILEID, WWUSERID, playlist_number, order_number, file_network) VALUES( fid, uid, playlist, '0', fnid );

        ALTER TABLE my_playlist ADD new_order_number INT UNSIGNED;
 
        SET @counter = 1;
 
        UPDATE my_playlist SET new_order_number = @counter := @counter + 1 ORDER BY order_number;

        ALTER TABLE my_playlist DROP order_number;
        
        ALTER TABLE my_playlist CHANGE new_order_number order_number INT UNSIGNED;
 
        DELETE FROM playlists WHERE WWUSERID=uid AND playlist_number = playlist;
 
        INSERT INTO playlists(WWFILEID, WWUSERID, playlist_number, order_number, file_network) select WWFILEID, WWUSERID, playlist_number, order_number, file_network from my_playlist;
        
        DROP TABLE my_playlist;
      
      SELECT "1";
      END;
    ELSE
      SELECT "-1";
    END IF;
END$$
 
DELIMITER ;

";i:1;s:3:"sql";i:2;s:28:"prepend_file_to_playlist.sql";}i:2;i:12723;}i:728;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14340;}i:729;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"get_current_file(uid CHAR(128))";i:1;i:3;i:2;i:14340;}i:2;i:14340;}i:730;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:14340;}i:731;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14340;}i:732;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"Get a users top song from their active playlist";}i:2;i:14380;}i:733;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14427;}i:734;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14429;}i:735;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:14429;}i:2;i:14429;}i:736;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:14429;}i:737;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:14440;}i:738;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:14440;}i:739;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:14440;}i:740;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:14444;}i:741;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14453;}i:742;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14453;}i:743;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:14453;}i:744;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14455;}i:745;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:14455;}i:2;i:14455;}i:746;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:14455;}i:747;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:14467;}i:748;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:14467;}i:749;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:14467;}i:750;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWSONGID";}i:2;i:14471;}i:751;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14480;}i:752;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14480;}i:753;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:14480;}i:754;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14482;}i:755;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:14482;}i:2;i:14482;}i:756;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:14482;}i:757;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:361:"
DELIMITER $$

DROP FUNCTION IF EXISTS get_current_file$$
CREATE FUNCTION get_current_file (uid CHAR(128))

RETURNS CHAR(128)
DETERMINISTIC

  BEGIN
  
    RETURN (SELECT WWSONGID FROM playlists WHERE WWUSERID = uid AND playlist_number = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid ) AND order_number = 0);

  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:20:"get_current_file.sql";}i:2;i:14498;}i:758;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14894;}i:759;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:67:"set_current_playlist(uid CHAR(128)), pplaylist_number INT UNSIGNED)";i:1;i:3;i:2;i:14894;}i:2;i:14894;}i:760;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:14894;}i:761;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14894;}i:762;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Set a users current playlist.";}i:2;i:14970;}i:763;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14999;}i:764;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15001;}i:765;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:15001;}i:2;i:15001;}i:766;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:15001;}i:767;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:15012;}i:768;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15012;}i:769;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15012;}i:770;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:15016;}i:771;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15025;}i:772;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15025;}i:773;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15025;}i:774;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15025;}i:775;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:" new playlist number";}i:2;i:15029;}i:776;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15049;}i:777;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15049;}i:778;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:15049;}i:779;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15050;}i:780;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:15050;}i:2;i:15050;}i:781;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:15050;}i:782;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15050;}i:783;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:15063;}i:784;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15070;}i:785;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15072;}i:786;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:15072;}i:2;i:15072;}i:787;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:15072;}i:788;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:325:"
DELIMITER $$

DROP FUNCTION IF EXISTS set_current_playlist$$
DROP PROCEDURE IF EXISTS set_current_playlist$$
CREATE PROCEDURE set_current_playlist (uid CHAR(128), pplaylist_number INT UNSIGNED)
  BEGIN
  
    UPDATE users_current_playlist SET playlist_number = pplaylist_number WHERE WWUSERID = uid;

  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:24:"set_current_playlist.sql";}i:2;i:15088;}i:789;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15452;}i:790;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:58:"get_playlist(uid CHAR(128), pplaylist_number INT UNSIGNED)";i:1;i:3;i:2;i:15452;}i:2;i:15452;}i:791;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:15452;}i:792;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15452;}i:793;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Get a users current playlist.";}i:2;i:15519;}i:794;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15548;}i:795;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15550;}i:796;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:15550;}i:2;i:15550;}i:797;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:15550;}i:798;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:15561;}i:799;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15561;}i:800;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15561;}i:801;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:15565;}i:802;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15574;}i:803;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15574;}i:804;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15574;}i:805;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15574;}i:806;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:" new playlist number";}i:2;i:15578;}i:807;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15598;}i:808;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15598;}i:809;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:15598;}i:810;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15600;}i:811;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:15600;}i:2;i:15600;}i:812;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:15600;}i:813;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15600;}i:814;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Songs in current playlist";}i:2;i:15613;}i:815;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15638;}i:816;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15640;}i:817;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:15640;}i:2;i:15640;}i:818;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:15640;}i:819;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:322:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_playlist$$
CREATE PROCEDURE get_playlist (uid CHAR(128), pplaylist_number INT UNSIGNED)
  BEGIN
 
    SELECT WWSONGID FROM playlists WHERE WWUSERID = uid AND playlist_number = ( SELECT playlist_number FROM users_current_playlist WHERE WWUSERID = uid );
 
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:16:"get_playlist.sql";}i:2;i:15656;}i:820;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16009;}i:821;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"get_file_info(fid CHAR(128))";i:1;i:3;i:2;i:16009;}i:2;i:16009;}i:822;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:16009;}i:823;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16009;}i:824;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"Get the Metadata for a file.";}i:2;i:16046;}i:825;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16074;}i:826;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16076;}i:827;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:16076;}i:2;i:16076;}i:828;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:16076;}i:829;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:16087;}i:830;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16087;}i:831;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16087;}i:832;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWFILEID";}i:2;i:16091;}i:833;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16100;}i:834;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16100;}i:835;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:16100;}i:836;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16102;}i:837;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:16102;}i:2;i:16102;}i:838;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:16102;}i:839;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:16114;}i:840;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16114;}i:841;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16114;}i:842;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" File row";}i:2;i:16118;}i:843;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16127;}i:844;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16127;}i:845;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:16127;}i:846;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16129;}i:847;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:16129;}i:2;i:16129;}i:848;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:16129;}i:849;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:229:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS get_file_info$$
CREATE PROCEDURE get_file_info (fid CHAR(128))
  BEGIN
    SELECT title, artist, album, year, url, md5, sha1, sha512 FROM files WHERE WWFILEID = fid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:17:"get_file_info.sql";}i:2;i:16145;}i:850;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16407;}i:851;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:175:"set_file_info (fid CHAR(128), ttitle VARCHAR(256), aartist VARCHAR(256), aalbum VARCHAR(256), yyear DATE, uurl VARCHAR(384), mmd5 CHAR(32), ssha1 CHAR(160), ssha512 CHAR(128))";i:1;i:3;i:2;i:16407;}i:2;i:16407;}i:852;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:16407;}i:853;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16407;}i:854;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"Set the Metadata for a file.";}i:2;i:16591;}i:855;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16619;}i:856;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16621;}i:857;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:16621;}i:2;i:16621;}i:858;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:16621;}i:859;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:16632;}i:860;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16632;}i:861;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16632;}i:862;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWFILEID";}i:2;i:16636;}i:863;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16645;}i:864;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16645;}i:865;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16645;}i:866;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16645;}i:867;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" title";}i:2;i:16649;}i:868;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16655;}i:869;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16655;}i:870;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16655;}i:871;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16655;}i:872;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" artist";}i:2;i:16659;}i:873;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16666;}i:874;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16666;}i:875;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16666;}i:876;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16666;}i:877;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" album";}i:2;i:16670;}i:878;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16676;}i:879;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16676;}i:880;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16676;}i:881;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16676;}i:882;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" year";}i:2;i:16680;}i:883;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16685;}i:884;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16685;}i:885;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16685;}i:886;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16685;}i:887;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" url";}i:2;i:16689;}i:888;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16693;}i:889;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16693;}i:890;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16693;}i:891;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16693;}i:892;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" md5";}i:2;i:16697;}i:893;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16701;}i:894;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16701;}i:895;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16701;}i:896;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16701;}i:897;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" sha1";}i:2;i:16705;}i:898;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16710;}i:899;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16710;}i:900;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16710;}i:901;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16710;}i:902;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" sha512";}i:2;i:16714;}i:903;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16721;}i:904;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16721;}i:905;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:16721;}i:906;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16723;}i:907;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:16723;}i:2;i:16723;}i:908;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:16723;}i:909;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16723;}i:910;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:16736;}i:911;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16743;}i:912;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16745;}i:913;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:16745;}i:2;i:16745;}i:914;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:16745;}i:915;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:442:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS set_file_info$$
CREATE PROCEDURE set_file_info (fid CHAR(128), ttitle VARCHAR(256), aartist VARCHAR(256), aalbum VARCHAR(256), yyear DATE, uurl VARCHAR(384), mmd5 CHAR(32), ssha1 CHAR(160), ssha512 CHAR(128))
  BEGIN
    UPDATE files SET title = ttitle, artist = aartist, album = aalbum, year = yyear, url = uurl, md5 = mmd5, sha1 = ssha1, sha512 = ssha512 WHERE WWFILEID = fid;
  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:17:"set_file_info.sql";}i:2;i:16761;}i:916;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17235;}i:917;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:35:"get_file_server_list(fid CHAR(128))";i:1;i:3;i:2;i:17235;}i:2;i:17235;}i:918;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:17235;}i:919;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17235;}i:920;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Change a user's first name.";}i:2;i:17279;}i:921;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17306;}i:922;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17308;}i:923;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:17308;}i:2;i:17308;}i:924;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:17308;}i:925;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:17319;}i:926;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:17319;}i:927;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:17319;}i:928;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWFILEID";}i:2;i:17323;}i:929;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:17332;}i:930;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:17332;}i:931;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:17332;}i:932;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17334;}i:933;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:17334;}i:2;i:17334;}i:934;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:17334;}i:935;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:17346;}i:936;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:17346;}i:937;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:17346;}i:938;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:" List of Server urls with the file in question";}i:2;i:17350;}i:939;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:17396;}i:940;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:17396;}i:941;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:17396;}i:942;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17398;}i:943;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:17398;}i:2;i:17398;}i:944;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:17398;}i:945;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:205:"
DELIMITER $$

DROP PROCEDURE IF EXISTS get_file_server_list$$
CREATE PROCEDURE get_file_server_list(fid CHAR(128))
  BEGIN
    SELECT url from file_to_servers where WWFILEID = fid;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:24:"get_file_server_list.sql";}i:2;i:17414;}i:946;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17658;}i:947;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:57:"add_server_to_file_list(fid CHAR(128), uurl VARCHAR(384))";i:1;i:3;i:2;i:17658;}i:2;i:17658;}i:948;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:17658;}i:949;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17658;}i:950;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"Add a file server's url to the a WWFILEID's server list";}i:2;i:17724;}i:951;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17779;}i:952;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17781;}i:953;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:17781;}i:2;i:17781;}i:954;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:17781;}i:955;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:17792;}i:956;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:17792;}i:957;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:17792;}i:958;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWFILEID";}i:2;i:17796;}i:959;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:17805;}i:960;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:17805;}i:961;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:17805;}i:962;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:17805;}i:963;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" url";}i:2;i:17809;}i:964;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:17813;}i:965;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:17813;}i:966;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:17813;}i:967;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17815;}i:968;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:17815;}i:2;i:17815;}i:969;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:17815;}i:970;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17815;}i:971;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:17828;}i:972;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17835;}i:973;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17837;}i:974;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:17837;}i:2;i:17837;}i:975;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:17837;}i:976;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:262:"
DELIMITER $$

DROP PROCEDURE IF EXISTS add_server_to_file_list$$
CREATE PROCEDURE add_server_to_file_list(fid CHAR(128), uurl VARCHAR(384))
  BEGIN

    INSERT into file_to_servers SET WWFIELDID = fid, url = uurl, last_verified = NOW();

  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:27:"add_server_to_file_list.sql";}i:2;i:17853;}i:977;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18156;}i:978;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:62:"delete_server_from_file_list(fid CHAR(128), uurl VARCHAR(384))";i:1;i:3;i:2;i:18156;}i:2;i:18156;}i:979;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:18156;}i:980;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18156;}i:981;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"Remove a bunk url from a files available server list";}i:2;i:18227;}i:982;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18279;}i:983;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18281;}i:984;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:18281;}i:2;i:18281;}i:985;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:18281;}i:986;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:18292;}i:987;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18292;}i:988;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18292;}i:989;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWFILEID";}i:2;i:18296;}i:990;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18305;}i:991;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18305;}i:992;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18305;}i:993;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18305;}i:994;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" url";}i:2;i:18309;}i:995;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18313;}i:996;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18313;}i:997;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:18313;}i:998;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18315;}i:999;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:18315;}i:2;i:18315;}i:1000;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:18315;}i:1001;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18315;}i:1002;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:18328;}i:1003;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18335;}i:1004;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18337;}i:1005;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:18337;}i:2;i:18337;}i:1006;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:18337;}i:1007;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:252:"
DELIMITER $$

DROP PROCEDURE IF EXISTS delete_server_from_file_list$$
CREATE PROCEDURE delete_server_from_file_list(fid CHAR(128), uurl VARCHAR(384))
  BEGIN
    DELETE FROM file_to_servers WHERE WWFIELDID = fid AND url = uurl;
  END$$
  
DELIMITER ;
";i:1;s:3:"sql";i:2;s:32:"delete_server_from_file_list.sql";}i:2;i:18353;}i:1008;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18651;}i:1009;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:105:"rearrange_playlist(uid CHAR(128), playlist_number INT UNSIGNED, pl_from INT UNSIGNED, pl_to INT UNSIGNED)";i:1;i:3;i:2;i:18651;}i:2;i:18651;}i:1010;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:18651;}i:1011;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18651;}i:1012;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"Re-arrange a users playlist order.";}i:2;i:18765;}i:1013;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18799;}i:1014;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18801;}i:1015;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Input";i:1;i:4;i:2;i:18801;}i:2;i:18801;}i:1016;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:18801;}i:1017;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:18812;}i:1018;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18812;}i:1019;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18812;}i:1020;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" WWUSERID";}i:2;i:18816;}i:1021;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18825;}i:1022;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18825;}i:1023;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18825;}i:1024;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18825;}i:1025;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:" playlist_number";}i:2;i:18829;}i:1026;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18845;}i:1027;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18845;}i:1028;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18845;}i:1029;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18845;}i:1030;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" order_number from";}i:2;i:18849;}i:1031;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18867;}i:1032;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18867;}i:1033;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18867;}i:1034;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18867;}i:1035;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:" order_number to";}i:2;i:18871;}i:1036;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18887;}i:1037;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18887;}i:1038;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:18887;}i:1039;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18889;}i:1040;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Output";i:1;i:4;i:2;i:18889;}i:2;i:18889;}i:1041;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:18889;}i:1042;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18889;}i:1043;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Nothing";}i:2;i:18902;}i:1044;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18909;}i:1045;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18911;}i:1046;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Code";i:1;i:4;i:2;i:18911;}i:2;i:18911;}i:1047;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:18911;}i:1048;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:216:"
DELIMITER $$
 
DROP PROCEDURE IF EXISTS rearrange_playlist$$
CREATE PROCEDURE rearrange_playlist(uid CHAR(128), playlist_number INT UNSIGNED, pl_from INT UNSIGNED, pl_to INT UNSIGNED)
  BEGIN

  END$$
 
DELIMITER ;
";i:1;s:3:"sql";i:2;s:22:"rearrange_playlist.sql";}i:2;i:18927;}i:1049;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19180;}i:1050;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"PHP API Functions";i:1;i:2;i:2;i:19180;}i:2;i:19180;}i:1051;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:19180;}i:1052;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19208;}i:1053;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"HTTP Public Functions";i:1;i:2;i:2;i:19208;}i:2;i:19208;}i:1054;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:19208;}i:1055;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19239;}i:1056;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:19239;}}
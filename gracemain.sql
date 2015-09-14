-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 09 月 14 日 17:51
-- 服务器版本: 5.5.40
-- PHP 版本: 5.4.33

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `gracemain`
--

-- --------------------------------------------------------

--
-- 表的结构 `dy_user`
--

CREATE TABLE IF NOT EXISTS `dy_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) NOT NULL,
  `tname` varchar(32) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `groupid` int(11) DEFAULT '0',
  `authkey` varchar(64) DEFAULT NULL,
  `accessToken` varchar(64) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `logip` varchar(32) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '1',
  `regtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `enable` (`enable`),
  KEY `groupid` (`groupid`),
  KEY `uname` (`uname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `dy_user`
--

INSERT INTO `dy_user` (`uid`, `uname`, `tname`, `pwd`, `groupid`, `authkey`, `accessToken`, `logtime`, `logip`, `enable`, `regtime`) VALUES
(16, 'irones', '杨俊', 'irones', 0, '', '', 192168, '192.168.1.200', 1, 1438588854),
(17, 'iron123', '', 'iron2es', 0, '', '', 0, '', 1, 1436146751),
(18, 'Avatarar', '', 'avatarar', 0, '', '', 1436322516, '192.168.1.200', 1, 1436147014),
(19, 'irones2', '洋洋2', 'irones2', 0, NULL, NULL, NULL, NULL, 1, NULL),
(20, '12', '12', '123123123', 0, NULL, NULL, NULL, NULL, 1, NULL),
(21, '12123', '12', '123123123', 0, NULL, NULL, NULL, NULL, 1, NULL),
(28, 'tetetete', 'tetetete23333', 'tetetete', 34, NULL, NULL, NULL, NULL, 1, NULL),
(29, 'tetetete2', 'tetetete2', 'tetetete', 33, NULL, NULL, NULL, NULL, 1, NULL),
(30, '123123123', NULL, '123123123', 999, NULL, NULL, NULL, NULL, 1, 1438766218);

-- --------------------------------------------------------

--
-- 表的结构 `g_accessrules`
--

CREATE TABLE IF NOT EXISTS `g_accessrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(64) NOT NULL,
  `rid` int(11) NOT NULL,
  `deny` int(2) NOT NULL,
  `allow` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uname` (`uname`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `g_accessrules`
--

INSERT INTO `g_accessrules` (`id`, `uname`, `rid`, `deny`, `allow`) VALUES
(1, 'irones', 1, 1, 1),
(2, '2', 2, 2, 0),
(3, '2', 2, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `g_basicmsg`
--

CREATE TABLE IF NOT EXISTS `g_basicmsg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NO` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `SEX` char(1) DEFAULT 'F',
  `AGE` tinyint(3) DEFAULT '0',
  `FLAG` tinyint(4) DEFAULT '0',
  `starttime` datetime DEFAULT '2000-01-01 00:00:01',
  `stoptime` datetime DEFAULT '2000-01-01 00:00:01',
  `allbeat` int(11) DEFAULT '0',
  `maxHR` smallint(3) DEFAULT '0',
  `minHR` smallint(3) DEFAULT '0',
  `meanHR` smallint(3) DEFAULT '0',
  `validbeat` int(11) DEFAULT '0',
  `invalidbeat` int(11) DEFAULT '0',
  `diag1` int(11) DEFAULT '0',
  `diag2` int(11) DEFAULT '0',
  `diag3` int(11) DEFAULT '0',
  `diag4` int(11) DEFAULT '0',
  `diag5` int(11) DEFAULT '0',
  `diag6` int(11) DEFAULT '0',
  `diag7` int(11) DEFAULT '0',
  `diag8` int(11) DEFAULT '0',
  `diag9` int(11) DEFAULT '0',
  `diag10` int(11) DEFAULT '0',
  `diag11` int(11) DEFAULT '0',
  `diag12` int(11) DEFAULT '0',
  `diag13` int(11) DEFAULT '0',
  `diag14` int(11) DEFAULT '0',
  `diag15` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `g_basicmsg`
--

INSERT INTO `g_basicmsg` (`ID`, `NO`, `NAME`, `SEX`, `AGE`, `FLAG`, `starttime`, `stoptime`, `allbeat`, `maxHR`, `minHR`, `meanHR`, `validbeat`, `invalidbeat`, `diag1`, `diag2`, `diag3`, `diag4`, `diag5`, `diag6`, `diag7`, `diag8`, `diag9`, `diag10`, `diag11`, `diag12`, `diag13`, `diag14`, `diag15`) VALUES
(1, 1111111, 'wang', 'F', 33, 100, '2015-07-16 01:01:01', '2015-07-18 01:01:01', 200000, 111, 44, 77, 190000, 10000, 44, 6, 7, 4, 44, 44, 55, 88, 8, 9, 1, 3, 4, 4, 6),
(2, 2222222, 'li', 'M', 22, 1, '2015-07-16 01:01:01', '2015-07-16 21:01:01', 80000, 222, 33, 55, 70000, 10000, 5, 7, 9, 0, 7, 5, 7, 7, 7, 7, 7, 7, 7, 7, 7),
(3, 2222223, 'ZHAO', 'M', 22, 1, '2015-07-16 01:01:01', '2015-07-16 21:01:01', 80000, 222, 33, 55, 70000, 10000, 5, 7, 9, 0, 7, 5, 7, 7, 7, 7, 7, 7, 7, 7, 7),
(4, 2222224, 'Cccc', 'M', 22, 1, '2015-07-16 01:01:01', '2015-07-16 21:01:01', 80000, 222, 33, 55, 70000, 10000, 5, 7, 9, 0, 7, 5, 7, 7, 7, 7, 7, 7, 7, 7, 7),
(5, 333333, 'Cccc', 'F', 0, 0, '2000-01-01 00:00:01', '2000-01-01 00:00:01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `g_book`
--

CREATE TABLE IF NOT EXISTS `g_book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(16) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bookid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `g_book`
--

INSERT INTO `g_book` (`bookid`, `bookname`, `enable`) VALUES
(1, '基础', 1),
(2, 'Grace', 1),
(3, '构架', 1),
(4, 'Pyramid', 1);

-- --------------------------------------------------------

--
-- 表的结构 `g_booknode`
--

CREATE TABLE IF NOT EXISTS `g_booknode` (
  `nodeid` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) DEFAULT NULL,
  `preid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `nr` text,
  `nrcode` text,
  `type` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`nodeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `g_booknode`
--

INSERT INTO `g_booknode` (`nodeid`, `bookid`, `preid`, `title`, `nr`, `nrcode`, `type`, `sort`, `enable`) VALUES
(1, 1, 0, '开发环境', '<p>关于开发环境的部分说明</p>\r\n\r\n<p>本机设置了</p>\r\n\r\n<ul>\r\n	<li>固定ip 192.168.0.10</li>\r\n	<li>主调试地址 : http://m.so</li>\r\n</ul>\r\n\r\n<p>开发环境的相关账号</p>\r\n\r\n<ul>\r\n	<li>Mysql : gracemain / gracemain</li>\r\n	<li>Mysqlroot : root / root</li>\r\n	<li>后台登录地址 :</li>\r\n</ul>\r\n', '关于开发环境的部分说明', 'con', 99, 1),
(27, 2, 29, '版本', '<p>版本</p>\r\n', '版本', 'con', 9, 1),
(28, 2, 29, '版权', '<p>版权</p>\r\n', '版权', 'con', 9, 1),
(29, 2, 0, '概要', '<p>为适应敏捷开发和快速开发所开发的一套框架</p>\r\n\r\n<p>特点</p>\r\n\r\n<ul>\r\n	<li>简单</li>\r\n	<li>丰富的控制器扩展</li>\r\n	<li>抛弃前端模板,嵌入php语句</li>\r\n	<li>分层规划明确</li>\r\n	<li>代码优雅</li>\r\n</ul>\r\n', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'cla', 123, 1),
(2, 1, 15, '对象', '<p>发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方发多少法伤的发生大事的发生地方</p>\r\n', '>PSR-0 autoloader\r\n\r\n    public static function registerAutoloader()\r\n    {\r\n        spl_autoload_register(__NAMESPACE__ . "\\\\Seter::autoload");\r\n    }\r\n\r\n    public static function autoload($className)\r\n    {\r\n        $thisClass = str_replace(__NAMESPACE__ . ''\\\\'', '''', __CLASS__);\r\n        $baseDir = __DIR__;\r\n        if (substr($baseDir, -strlen($thisClass)) === $thisClass) {\r\n            $baseDir = substr($baseDir, 0, -strlen($thisClass));\r\n        }\r\n        $className = ltrim($className, ''\\\\'');\r\n        $fileName = $baseDir;\r\n        $namespace = '''';\r\n        if ($lastNsPos = strripos($className, ''\\\\'')) {\r\n            $namespace = substr($className, 0, $lastNsPos);\r\n            $className = substr($className, $lastNsPos + 1);\r\n            $fileName .= str_replace(''\\\\'', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;\r\n        }\r\n        $fileName .= str_replace(''_'', DIRECTORY_SEPARATOR, $className) . ''.php'';\r\n        if (file_exists($fileName)) {\r\n            require $fileName;\r\n        }\r\n    }\r\n\r\n>调用\r\n\r\n    \\Seter\\Seter::registerAutoloader();     //PSR-0', 'con', 0, 1),
(3, 1, 16, '数据存储', '<ul>\r\n	<li>Mysql</li>\r\n	<li>Mongodb</li>\r\n</ul>\r\n', '    Mysql\r\n    Mongodb', 'con', 0, 1),
(4, 1, 16, '框架选型', '<ul>\r\n	<li>YII框架</li>\r\n	<li>CI框架</li>\r\n</ul>\r\n', '    YII框架\r\n    CI框架', 'con', 0, 1),
(5, 1, 16, '组件安装', '<ul>\r\n	<li>PEAR</li>\r\n	<li>XCACHE</li>\r\n</ul>\r\n', '    PEAR\r\n    XCACHE', 'con', 0, 1),
(6, 1, 16, 'Php配置', '<p>开启模块 :</p>\r\n\r\n<p>&nbsp;</p>\r\n', '开启模块 :\r\n\r\n', 'con', 0, 1),
(7, 1, 16, 'PhpStudy', '<p>开发环境用PhpStudy快速搭建</p>\r\n\r\n<p>下载地址 :http://www.phpstudy.net/</p>\r\n\r\n<p>版本选择 Apache + PHP5.4n</p>\r\n\r\n<p>&nbsp;</p>\r\n', '开发环境用PhpStudy快速搭建', 'con', 0, 1),
(8, 1, 1, 'PhpStudy', '<p>PhpStudy</p>\r\n\r\n<p>站点</p>\r\n\r\n<p>http://www.phpstudy.net/</p>\r\n', 'PhpStudy', 'con', 0, 1),
(9, 1, 1, '其他相关工具', '<ul>\r\n	<li>Git</li>\r\n	<li>Onenote</li>\r\n</ul>', ' Git\r\n Onenote\r\n\r\n ', 'con', 0, 1),
(10, 1, 1, 'IDE', '<p>Editplus v3.50</p>\r\n\r\n<p>PhpStorm 9.0</p>\r\n\r\n<p>Dreamweaver 12.0</p>\r\n\r\n<p>Office 2010</p>\r\n', 'Editplus v3.50\r\n\r\nPhpStorm 9.0\r\n\r\nDreamweaver 12.0\r\n\r\nOffice 2010', 'con', 0, 1),
(11, 1, 1, 'Markdown', '<p>本系统采用markdown语法</p>\r\n\r\n<p>详细markdown语法请参考 <a href="http://baike.baidu.com/view/2311114.htm">http://baike.baidu.com/view/2311114.htm</a></p>\r\n', '####本系统采用markdown语法\r\n\r\n\r\n详细markdown语法请参考 \r\nhttp://baike.baidu.com/view/2311114.htm', 'fun', 1, 1),
(12, 2, 29, '相关', '', '', 'con', 7, 1),
(13, 2, 29, '参考', '<p>参考</p>\r\n', '参考', 'con', 8, 1),
(14, 2, 26, '路由', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(15, 1, 0, '其他', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(16, 1, 0, 'PHP环境', '<p>版本要求</p>\r\n\r\n<p>PHP 5.4+</p>\r\n', '##版本要求\r\n\r\nPHP 5.4+', 'con', 0, 1),
(17, 2, 0, 'Seter容器', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(18, 2, 26, '配置', '', '', 'con', 0, 1),
(19, 2, 29, '目录结构', '<h1>目录结构</h1>\r\n', '目录结构', 'con', 1, 1),
(20, 2, 29, 'Hello Word', '', '123code', 'con', 0, 1),
(21, 2, 26, '数据库表', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(22, 2, 26, '控制器', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(23, 2, 26, '视图', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(24, 2, 26, '数据库', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(25, 2, 0, '进阶', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(26, 2, 0, '基础', '<p>123nr</p>\r\n', '123code', 'con', 0, 1),
(30, 2, 25, '控制器扩展2', '9', '9', 'con', 9, 1),
(31, 2, 25, '路由扩展', '', '', 'con', 0, 1),
(32, 2, 25, '内部对象', '', '', 'con', 0, 1),
(33, 2, 26, '自动加载', '', '', 'con', 0, 1),
(50, 4, 0, 'PSR规范', '<p>PSR原本有四个规范，分别是：</p>\r\n\r\n<ul>\r\n	<li>PSR-0 自动加载</li>\r\n	<li>PSR-1 基本代码规范</li>\r\n	<li>PSR-2 代码样式</li>\r\n	<li>PSR-3 日志接口</li>\r\n</ul>\r\n\r\n<p>2013年底，新出了第5个规范&mdash;&mdash;PSR-4。</p>\r\n', '', NULL, 0, 1),
(51, 4, 50, 'PSR-0 自动加载 [作废]', '<p>&gt; **已弃用** - 截止到2014年10月21日，PSR-0已被弃用。 推荐替代使用[PSR-4](http://www.php-fig.org/psr/psr-4/)。</p>\r\n\r\n<p>下文描述了若要使用一个通用的自动加载器(autoloader)，你所需要遵守的规范：</p>\r\n\r\n<p><br />\r\n规范<br />\r\n---------</p>\r\n\r\n<p>* 一个完全标准的命名空间(namespace)和类(class)的结构是这样的：<br />\r\n`\\\\(\\)*`<br />\r\n* 每个命名空间(namespace)都必须有一个顶级的空间名(namespace)(&quot;组织名(Vendor Name)&quot;)。<br />\r\n* 每个命名空间(namespace)中可以根据需要使用任意数量的子命名空间(sub-namespace)。<br />\r\n* 从文件系统中加载源文件时，空间名(namespace)中的分隔符将被转换为 DIRECTORY_SEPARATOR。<br />\r\n* 类名(class name)中的每个下划线_都将被转换为一个DIRECTORY_SEPARATOR。下划线_在空间名(namespace)中没有什么特殊的意义。<br />\r\n* 完全标准的命名空间(namespace)和类(class)从文件系统加载源文件时将会加上.php后缀。<br />\r\n* 组织名(vendor name)，空间名(namespace)，类名(class name)都由大小写字母组合而成。</p>\r\n\r\n<p>&nbsp;</p>\r\n', '\r\n\r\n\r\n\r\n\r\n示例\r\n--------\r\n\r\n	* \\Doctrine\\Common\\IsolatedClassLoader => /path/to/project/lib/vendor/Doctrine/Common/IsolatedClassLoader.php\r\n	* \\Symfony\\Core\\Request => /path/to/project/lib/vendor/Symfony/Core/Request.php\r\n	* \\Zend\\Acl => /path/to/project/lib/vendor/Zend/Acl.php\r\n	* \\Zend\\Mail\\Message => /path/to/project/lib/vendor/Zend/Mail/Message.php\r\n    \r\n\r\n空间名(namespace)和类名(class name)中的下划线\r\n\r\n-----------------------------------------\r\n\r\n	* \\namespace\\package\\Class_Name` => /path/to/project/lib/vendor/namespace/package/Class/Name.php\r\n	* \\namespace\\package_name\\Class_Name` => /path/to/project/lib/vendor/namespace/package_name/Class/Name.php\r\n\r\n以上是我们为实现通用的自动加载而制定的最低标准。你可以利用能够自动加载PHP 5.3类的SplClassLoader来测试你的代码是否符合这些标准。\r\n\r\n\r\n实例\r\n----------------------\r\n\r\n下面是一个怎样利用上述标准来实现自动加载的示例函数。\r\n\r\n```php\r\n	<?php\r\n\r\n	function autoload($className)\r\n	{\r\n	    $className = ltrim($className, ''\\\\'');\r\n	    $fileName  = '''';\r\n	    $namespace = '''';\r\n	    if ($lastNsPos = strrpos($className, ''\\\\'')) {\r\n		$namespace = substr($className, 0, $lastNsPos);\r\n		$className = substr($className, $lastNsPos + 1);\r\n		$fileName  = str_replace(''\\\\'', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;\r\n	    }\r\n	    $fileName .= str_replace(''_'', DIRECTORY_SEPARATOR, $className) . ''.php'';\r\n\r\n	    require $fileName;\r\n	}\r\n```\r\n\r\n\r\n`SplClassLoader`实现\r\n\r\n-----------------------------\r\n\r\n下面的gist是一个按照上面建议的标准来自动加载类的SplClassLoader实例。这是依据这些标准来加载PHP 5.3类的推荐方案。\r\n\r\n* [http://gist.github.com/221634](http://gist.github.com/221634)\r\n\r\n\r\n', NULL, 9, 1),
(52, 4, 50, 'PSR-1 基本代码规范', '<p>基本代码规范<br />\r\n=====================</p>\r\n\r\n<p>本节我们将会讨论一些基本的代码规范问题，以此作为将来讨论更高级别的代码分享和技术互用的基础。</p>\r\n\r\n<p>[RFC 2119][]中的`必须(MUST)`，`不可(MUST NOT)`，`建议(SHOULD)`，`不建议(SHOULD NOT)`，`可以/可能(MAY)`等关键词将在本节用来做一些解释性的描述。</p>\r\n\r\n<p>[RFC 2119]: http://www.ietf.org/rfc/rfc2119.txt<br />\r\n[PSR-0]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-0.md</p>\r\n', '基本代码规范\r\n=====================\r\n\r\n本节我们将会讨论一些基本的代码规范问题，以此作为将来讨论更高级别的代码分享和技术互用的基础。\r\n\r\n[RFC 2119][]中的必须(MUST)，不可(MUST NOT)，建议(SHOULD)，不建议(SHOULD NOT)，可以/可能(MAY)等关键词将在本节用来做一些解释性的描述。\r\n\r\n[RFC 2119]: http://www.ietf.org/rfc/rfc2119.txt\r\n[PSR-0]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-0.md\r\n\r\n\r\n1. 概述\r\n-----------\r\n\r\n- 源文件必须只使用 <?php 和 <?= 这两种标签。\r\n\r\n- 源文件中php代码的编码格式必须只使用不带字节顺序标记(BOM)的UTF-8。\r\n\r\n- 一个源文件建议只用来做声明（类(class)，函数(function)，常量(constant)等）或者只用来做一些引起副作用的操作（例如：输出信息，修改.ini配置等）,但不建议同时做这两件事。\r\n\r\n- 命名空间(namespace)和类(class)必须遵守[PSR-0][]标准。\r\n\r\n- 类名(class name)必须使用骆驼式(StudlyCaps)写法 (译者注：驼峰式(cameCase)的一种变种，后文将直接用StudlyCaps表示)。\r\n\r\n- 类(class)中的常量必须只由大写字母和下划线(_)组成。\r\n\r\n- 方法名(method name)必须使用驼峰式(cameCase)写法(译者注：后文将直接用camelCase表示)。\r\n\r\n\r\n2. 文件\r\n--------\r\n\r\n## 2.1. PHP标签\r\n\r\nPHP代码必须只使用长标签(<?php ?>)或者短输出式标签(<?= ?>)；而不可使用其他标签。\r\n\r\n## 2.2. 字符编码\r\n\r\nPHP代码的编码格式必须只使用不带字节顺序标记(BOM)的UTF-8。\r\n\r\n## 2.3. 副作用\r\n\r\n一个源文件建议只用来做声明（类(class)，函数(function)，常量(constant)等）或者只用来做一些引起副作用的操作（例如：输出信息，修改.ini配置等）,但不建议同时做这两件事。\r\n\r\n短语副作用(side effects)的意思是 *在包含文件时* 所执行的逻辑与所声明的类(class)，函数(function)，常量(constant)等没有直接的关系。\r\n\r\n副作用(side effects)包含但不局限于：产生输出，显式地使用require或include，连接外部服务，修改ini配置，触发错误或异常，修改全局或者静态变量，读取或修改文件等等\r\n\r\n下面是一个既包含声明又有副作用的示例文件；即应避免的例子：\r\n\r\n```php\r\n\r\n	<?php\r\n	// 副作用：修改了ini配置\r\n	ini_set(''error_reporting'', E_ALL);\r\n\r\n	// 副作用：载入了文件\r\n	include "file.php";\r\n\r\n	// 副作用：产生了输出\r\n	echo "<html>\\n";\r\n\r\n	// 声明\r\n	function foo()\r\n	{\r\n	    // 函数体\r\n	}\r\n```\r\n\r\n下面是一个仅包含声明的示例文件；即应提倡的例子：\r\n\r\n```php\r\n\r\n	<?php\r\n	// 声明\r\n	function foo()\r\n	{\r\n	    // 函数体\r\n	}\r\n\r\n	// 条件式声明不算做是副作用\r\n	if (! function_exists(''bar'')) {\r\n	    function bar()\r\n	    {\r\n		// 函数体\r\n	    }\r\n	}\r\n    \r\n```\r\n\r\n\r\n\r\n3. 空间名(namespace)和类名(class name)\r\n----------------------------\r\n\r\n命名空间(namespace)和类(class)必须遵守 [PSR-0][].\r\n\r\n这意味着一个源文件中只能有一个类(class)，并且每个类(class)至少要有一级空间名（namespace）：即一个顶级的组织名(vendor name)。\r\n\r\n类名(class name)必须使用StudlyCaps写法。\r\n\r\nPHP5.3之后的代码必须使用正式的命名空间(namespace)\r\n例子：\r\n\r\n```php\r\n\r\n	<?php\r\n	// PHP 5.3 及之后:\r\n	namespace Vendor\\Model;\r\n\r\n	class Foo\r\n	{\r\n	}\r\n    \r\n```\r\n\r\n\r\nPHP5.2.x之前的代码建议用伪命名空间Vendor_作为类名(class name)的前缀\r\n\r\n```php\r\n\r\n	<?php\r\n	// PHP 5.2.x 及之前:\r\n	class Vendor_Model_Foo\r\n	{\r\n	}\r\n    \r\n```\r\n\r\n4. 类的常量、属性和方法\r\n-------------------------------------------\r\n\r\n术语类(class)指所有的类(class)，接口(interface)和特性(trait)`\r\n\r\n## 4.1. 常量\r\n\r\n类常量必须只由大写字母和下划线(_)组成。\r\n例子：\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Model;\r\n\r\n	class Foo\r\n	{\r\n	    const VERSION = ''1.0'';\r\n	    const DATE_APPROVED = ''2012-06-01'';\r\n	}\r\n    \r\n```\r\n\r\n## 4.2. 属性\r\n\r\n本指南中故意不对$StulyCaps，$camelCase或者$unser_score中的某一种风格作特别推荐，完全由读者依据个人喜好决定属性名的命名风格。\r\n\r\n但是不管你如何定义属性名，建议在一个合理的范围内保持一致。这个范围可能是组织(vendor)级别的，包(package)级别的，类(class)级别的，或者方法(method)级别的。\r\n\r\n##4.3. 方法\r\n\r\n方法名则必须使用camelCase()风格来声明。\r\n', NULL, 8, 1),
(53, 4, 50, 'PSR-2 代码风格指南', '', '代码风格指南\r\n==================\r\n\r\n本手册是基础代码规范([PSR-1][])的继承和扩展。\r\n\r\n为了尽可能的提升阅读其他人代码时的效率，下面例举了一系列的通用规则，特别是有关于PHP代码风格的。\r\n\r\n各个成员项目间的共性组成了这组代码规范。当开发者们在多个项目中合作时，本指南将会成为所有这些项目中共用的一组代码规范。 因此，本指南的益处不在于这些规则本身，而在于在所有项目中共用这些规则。\r\n\r\n[RFC 2119][]中的必须(MUST)，不可(MUST NOT)，建议(SHOULD)，不建议(SHOULD NOT)，可以/可能(MAY)等关键词将在本节用来做一些解释性的描述。\r\n\r\n[RFC 2119]: http://www.ietf.org/rfc/rfc2119.txt\r\n[PSR-0]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-0.md\r\n[PSR-1]: https://github.com/hfcorriez/fig-standards/blob/zh_CN/接受/PSR-1-basic-coding-standard.md\r\n\r\n\r\n1. 概述\r\n-----------\r\n\r\n- 代码必须遵守 [PSR-1][]。\r\n\r\n- 代码必须使用4个空格来进行缩进，而不是用制表符。\r\n\r\n- 一行代码的长度不建议有硬限制；软限制必须为120个字符，建议每行代码80个字符或者更少。\r\n\r\n- 在命名空间(namespace)的声明下面必须有一行空行，并且在导入(use)的声明下面也必须有一行空行。\r\n\r\n- 类(class)的左花括号必须放到其声明下面自成一行，右花括号则必须放到类主体下面自成一行。\r\n\r\n- 方法(method)的左花括号必须放到其声明下面自成一行，右花括号则必须放到方法主体的下一行。\r\n\r\n- 所有的属性(property)和方法(method) 必须有可见性声明；抽象(abstract)和终结(final)声明必须在可见性声明之前；而静态(static)声明必须在可见性声明之后。\r\n\r\n- 在控制结构关键字的后面必须有一个空格；而方法(method)和函数(function)的关键字的后面不可有空格。\r\n\r\n- 控制结构的左花括号必须跟其放在同一行，右花括号必须放在该控制结构代码主体的下一行。\r\n\r\n- 控制结构的左括号之后不可有空格，右括号之前也不可有空格。\r\n\r\n## 1.1. 示例\r\n\r\n这个示例中简单展示了上文中提到的一些规则：\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	use FooInterface;\r\n	use BarClass as Bar;\r\n	use OtherVendor\\OtherPackage\\BazClass;\r\n\r\n	class Foo extends Bar implements FooInterface\r\n	{\r\n	    public function sampleFunction($a, $b = null)\r\n	    {\r\n		if ($a === $b) {\r\n		    bar();\r\n		} elseif ($a > $b) {\r\n		    $foo->bar($arg1);\r\n		} else {\r\n		    BazClass::bar($arg2, $arg3);\r\n		}\r\n	    }\r\n\r\n	    final public static function bar()\r\n	    {\r\n		// 方法主体\r\n	    }\r\n	}\r\n\r\n```\r\n\r\n2. 通则\r\n----------\r\n\r\n## 2.1 基础代码规范\r\n\r\n代码必须遵守 [PSR-1][] 中的所有规则。\r\n\r\n## 2.2 源文件\r\n\r\n所有的PHP源文件必须使用Unix LF(换行)作为行结束符。\r\n\r\n所有PHP源文件必须以一个空行结束。\r\n\r\n纯PHP代码源文件的关闭标签?> 必须省略。\r\n\r\n## 2.3. 行\r\n\r\n行长度不可有硬限制。\r\n\r\n行长度的软限制必须是120个字符；对于软限制，代码风格检查器必须警告但不可报错。\r\n\r\n一行代码的长度不建议超过80个字符；较长的行建议拆分成多个不超过80个字符的子行。\r\n\r\n在非空行后面不可有空格。\r\n\r\n空行可以用来增强可读性和区分相关代码块。\r\n\r\n一行不可多于一个语句。\r\n\r\n## 2.4. 缩进\r\n\r\n代码必须使用4个空格，且不可使用制表符来作为缩进。\r\n\r\n> 注意：代码中只使用空格，且不和制表符混合使用，将会对避免代码差异，补丁，历史和注解中的一些问题有帮助。空格的使用还可以使通过调整细微的缩进来改进行间对齐变得更加的简单。\r\n\r\n## 2.5. 关键字和 True/False/Null\r\n\r\nPHP关键字([keywords][])必须使用小写字母。\r\n\r\nPHP常量true, false和null 必须使用小写字母。\r\n\r\n[keywords]: http://php.net/manual/en/reserved.keywords.php\r\n\r\n\r\n3. 命名空间(Namespace)和导入(Use)声明\r\n---------------------------------\r\n\r\n命名空间(namespace)的声明后面必须有一行空行。\r\n\r\n所有的导入(use)声明必须放在命名空间(namespace)声明的下面。\r\n\r\n一句声明中，必须只有一个导入(use)关键字。\r\n\r\n在导入(use)声明代码块后面必须有一行空行。\r\n\r\n示例：\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	use FooClass;\r\n	use BarClass as Bar;\r\n	use OtherVendor\\OtherPackage\\BazClass;\r\n\r\n	// ... 其它PHP代码 ...\r\n\r\n```\r\n\r\n\r\n4. 类(class)，属性(property)和方法(method)\r\n-----------------------------------\r\n\r\n术语“类”指所有的类(class)，接口(interface)和特性(trait)。\r\n\r\n## 4.1. 扩展(extend)和实现(implement)\r\n\r\n一个类的扩展(extend)和实现(implement)关键词必须和类名(class name)在同一行。\r\n\r\n类(class)的左花括号必须放在下面自成一行；右花括号必须放在类(class)主体的后面自成一行。\r\n\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	use FooClass;\r\n	use BarClass as Bar;\r\n	use OtherVendor\\OtherPackage\\BazClass;\r\n\r\n	class ClassName extends ParentClass implements \\ArrayAccess, \\Countable\r\n	{\r\n	    // 常量、属性、方法\r\n	}\r\n\r\n```\r\n\r\n实现(implement)列表可以被拆分为多个缩进了一次的子行。如果要拆成多个子行，列表的第一项必须要放在下一行，并且每行必须只有一个接口(interface)。\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	use FooClass;\r\n	use BarClass as Bar;\r\n	use OtherVendor\\OtherPackage\\BazClass;\r\n\r\n	class ClassName extends ParentClass implements\r\n	    \\ArrayAccess,\r\n	    \\Countable,\r\n	    \\Serializable\r\n	{\r\n	    // 常量、属性、方法\r\n	}\r\n\r\n```\r\n\r\n## 4.2. 属性(property)\r\n\r\n所有的属性(property)都必须声明其可见性。\r\n\r\n变量(var)关键字不可用来声明一个属性(property)。\r\n\r\n一条语句不可声明多个属性(property)。\r\n\r\n属性名(property name) 不推荐用单个下划线作为前缀来表明其保护(protected)或私有(private)的可见性。\r\n\r\n一个属性(property)声明看起来应该像下面这样。\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	class ClassName\r\n	{\r\n	    public $foo = null;\r\n	}\r\n\r\n```\r\n\r\n## 4.3. 方法(method)\r\n\r\n所有的方法(method)都必须声明其可见性。\r\n\r\n方法名(method name) 不推荐用单个下划线作为前缀来表明其保护(protected)或私有(private)的可见性。\r\n\r\n方法名(method name)在其声明后面不可有空格跟随。其左花括号必须放在下面自成一行，且右花括号必须放在方法主体的下面自成一行。左括号后面不可有空格，且右括号前面也不可有空格。\r\n\r\n一个方法(method)声明看来应该像下面这样。 注意括号，逗号，空格和花括号的位置：\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	class ClassName\r\n	{\r\n	    public function fooBarBaz($arg1, &$arg2, $arg3 = [])\r\n	    {\r\n		// 方法主体部分\r\n	    }\r\n	}\r\n\r\n```\r\n\r\n## 4.4. 方法(method)的参数\r\n\r\n在参数列表中，逗号之前不可有空格，而逗号之后则必须要有一个空格。\r\n\r\n方法(method)中有默认值的参数必须放在参数列表的最后面。\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	class ClassName\r\n	{\r\n	    public function foo($arg1, &$arg2, $arg3 = [])\r\n	    {\r\n		// 方法主体部分\r\n	    }\r\n	}\r\n\r\n```\r\n\r\n参数列表可以被拆分为多个缩进了一次的子行。如果要拆分成多个子行，参数列表的第一项必须放在下一行，并且每行必须只有一个参数。\r\n\r\n当参数列表被拆分成多个子行，右括号和左花括号之间必须又一个空格并且自成一行。\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	class ClassName\r\n	{\r\n	    public function aVeryLongMethodName(\r\n		ClassTypeHint $arg1,\r\n		&$arg2,\r\n		array $arg3 = []\r\n	    ) {\r\n		// 方法主体部分\r\n	    }\r\n	}\r\n\r\n```\r\n\r\n## 4.5. 抽象(abstract)，终结(final)和 静态(static)\r\n\r\n当用到抽象(abstract)和终结(final)来做类声明时，它们必须放在可见性声明的前面。\r\n\r\n而当用到静态(static)来做类声明时，则必须放在可见性声明的后面。\r\n\r\n```php\r\n\r\n	<?php\r\n	namespace Vendor\\Package;\r\n\r\n	abstract class ClassName\r\n	{\r\n	    protected static $foo;\r\n\r\n	    abstract protected function zim();\r\n\r\n	    final public static function bar()\r\n	    {\r\n		// 方法主体部分\r\n	    }\r\n	}\r\n\r\n```\r\n\r\n## 4.6. 调用方法和函数\r\n\r\n调用一个方法或函数时，在方法名或者函数名和左括号之间不可有空格，左括号之后不可有空格，右括号之前也不可有空格。参数列表中，逗号之前不可有空格，逗号之后则必须有一个空格。\r\n\r\n```php\r\n\r\n	<?php\r\n	bar();\r\n	$foo->bar($arg1);\r\n	Foo::bar($arg2, $arg3);\r\n\r\n```\r\n\r\n参数列表可以被拆分成多个缩进了一次的子行。如果拆分成子行，列表中的第一项必须放在下一行，并且每一行必须只能有一个参数。\r\n\r\n```php\r\n\r\n	<?php\r\n	$foo->bar(\r\n	    $longArgument,\r\n	    $longerArgument,\r\n	    $muchLongerArgument\r\n	);\r\n\r\n```\r\n\r\n5. 控制结构\r\n---------------------\r\n\r\n下面是对于控制结构代码风格的概括：\r\n\r\n- 控制结构的关键词之后必须有一个空格。\r\n- 控制结构的左括号之后不可有空格。\r\n- 控制结构的右括号之前不可有空格。\r\n- 控制结构的右括号和左花括号之间必须有一个空格。\r\n- 控制结构的代码主体必须进行一次缩进。\r\n- 控制结构的右花括号必须主体的下一行。\r\n\r\n每个控制结构的代码主体必须被括在花括号里。这样可是使代码看上去更加标准化，并且加入新代码的时候还可以因此而减少引入错误的可能性。\r\n\r\n## 5.1. if，elseif，else\r\n\r\n下面是一个if条件控制结构的示例，注意其中括号，空格和花括号的位置。同时注意else和elseif要和前一个条件控制结构的右花括号在同一行。\r\n\r\n```php\r\n\r\n	<?php\r\n	if ($expr1) {\r\n	    // if body\r\n	} elseif ($expr2) {\r\n	    // elseif body\r\n	} else {\r\n	    // else body;\r\n	}\r\n\r\n```\r\n\r\n推荐用elseif来替代else if，以保持所有的条件控制关键字看起来像是一个单词。\r\n\r\n\r\n## 5.2. switch，case\r\n\r\n下面是一个switch条件控制结构的示例，注意其中括号，空格和花括号的位置。case语句必须要缩进一级，而break关键字（或其他中止关键字）必须和case结构的代码主体在同一个缩进层级。如果一个有主体代码的case结构故意的继续向下执行则必须要有一个类似于// no break的注释。\r\n\r\n```php\r\n\r\n	<?php\r\n	switch ($expr) {\r\n	    case 0:\r\n		echo ''First case, with a break'';\r\n		break;\r\n	    case 1:\r\n		echo ''Second case, which falls through'';\r\n		// no break\r\n	    case 2:\r\n	    case 3:\r\n	    case 4:\r\n		echo ''Third case, return instead of break'';\r\n		return;\r\n	    default:\r\n		echo ''Default case'';\r\n		break;\r\n	}\r\n\r\n```\r\n\r\n\r\n## 5.3. while，do while\r\n\r\n下面是一个while循环控制结构的示例，注意其中括号，空格和花括号的位置。\r\n\r\n```php\r\n\r\n	<?php\r\n	while ($expr) {\r\n	    // structure body\r\n\r\n	}\r\n\r\n```\r\n\r\n下面是一个do while循环控制结构的示例，注意其中括号，空格和花括号的位置。\r\n\r\n```php\r\n\r\n	<?php\r\n	do {\r\n	    // structure body;\r\n	} while ($expr);\r\n\r\n```\r\n\r\n## 5.4. for\r\n\r\n下面是一个for循环控制结构的示例，注意其中括号，空格和花括号的位置。\r\n\r\n```php\r\n\r\n	<?php\r\n	for ($i = 0; $i < 10; $i++) {\r\n	    // for body\r\n	}\r\n\r\n```\r\n\r\n## 5.5. foreach\r\n\r\n下面是一个foreach循环控制结构的示例，注意其中括号，空格和花括号的位置。\r\n\r\n```php\r\n\r\n	<?php\r\n	foreach ($iterable as $key => $value) {\r\n	    // foreach body\r\n	}\r\n\r\n```\r\n\r\n## 5.6. try, catch\r\n\r\n下面是一个try catch异常处理控制结构的示例，注意其中括号，空格和花括号的位置。\r\n\r\n```php\r\n\r\n	<?php\r\n	try {\r\n	    // try body\r\n	} catch (FirstExceptionType $e) {\r\n	    // catch body\r\n	} catch (OtherExceptionType $e) {\r\n	    // catch body\r\n	}\r\n\r\n```\r\n\r\n6. 闭包\r\n-----------\r\n\r\n声明闭包时所用的function关键字之后必须要有一个空格，而use关键字的前后都要有一个空格。\r\n\r\n闭包的左花括号必须跟其在同一行，而右花括号必须在闭包主体的下一行。\r\n\r\n闭包的参数列表和变量列表的左括号后面不可有空格，右括号的前面也不可有空格。\r\n\r\n闭包的参数列表和变量列表中逗号前面不可有空格，而逗号后面则必须有空格。\r\n\r\n闭包的参数列表中带默认值的参数必须放在参数列表的结尾部分。\r\n\r\n下面是一个闭包的示例。注意括号，空格和花括号的位置。\r\n\r\n```php\r\n\r\n	<?php\r\n	$closureWithArgs = function ($arg1, $arg2) {\r\n	    // body\r\n	};\r\n\r\n	$closureWithArgsAndVars = function ($arg1, $arg2) use ($var1, $var2) {\r\n	    // body\r\n	};\r\n\r\n```\r\n\r\n参数列表和变量列表可以被拆分成多个缩进了一级的子行。如果要拆分成多个子行，列表中的第一项必须放在下一行，并且每一行必须只放一个参数或变量。\r\n\r\n当列表（不管是参数还是变量）最终被拆分成多个子行，右括号和左花括号之间必须要有一个空格并且自成一行。\r\n\r\n下面是一个参数列表和变量列表被拆分成多个子行的示例。\r\n\r\n```php\r\n\r\n	<?php\r\n	$longArgs_noVars = function (\r\n	    $longArgument,\r\n	    $longerArgument,\r\n	    $muchLongerArgument\r\n	) {\r\n	   // body\r\n	};\r\n\r\n	$noArgs_longVars = function () use (\r\n	    $longVar1,\r\n	    $longerVar2,\r\n	    $muchLongerVar3\r\n	) {\r\n	   // body\r\n	};\r\n\r\n	$longArgs_longVars = function (\r\n	    $longArgument,\r\n	    $longerArgument,\r\n	    $muchLongerArgument\r\n	) use (\r\n	    $longVar1,\r\n	    $longerVar2,\r\n	    $muchLongerVar3\r\n	) {\r\n	   // body\r\n	};\r\n\r\n	$longArgs_shortVars = function (\r\n	    $longArgument,\r\n	    $longerArgument,\r\n	    $muchLongerArgument\r\n	) use ($var1) {\r\n	   // body\r\n	};\r\n\r\n	$shortArgs_longVars = function ($arg) use (\r\n	    $longVar1,\r\n	    $longerVar2,\r\n	    $muchLongerVar3\r\n	) {\r\n	   // body\r\n	};\r\n\r\n```\r\n\r\n把闭包作为一个参数在函数或者方法中调用时，依然要遵守上述规则。\r\n\r\n```php\r\n\r\n	<?php\r\n	$foo->bar(\r\n	    $arg1,\r\n	    function ($arg2) use ($var1) {\r\n		// body\r\n	    },\r\n	    $arg3\r\n	);\r\n\r\n```\r\n\r\n\r\n7. 结论\r\n--------------\r\n\r\n本指南有意的省略了许多元素的代码风格。主要包括：\r\n\r\n- 全局变量和全局常量的声明\r\n\r\n- 函数声明\r\n\r\n- 操作符和赋值\r\n\r\n- 行间对齐\r\n\r\n- 注释和文档块\r\n\r\n- 类名的前缀和后缀\r\n\r\n- 最佳实践\r\n\r\n以后的代码规范中可能会修正或扩展本指南中规定的代码风格。\r\n\r\n附录A 调查\r\n------------------\r\n\r\n为了写这个风格指南，我们调查了各个项目以最终确定通用的代码风格。并把这次调查在这里公布出来。\r\n\r\n## A.1. 调查数据\r\n\r\n    url,http://www.horde.org/apps/horde/docs/CODING_STANDARDS,http://pear.php.net/manual/en/standards.php,http://solarphp.com/manual/appendix-standards.style,http://framework.zend.com/manual/en/coding-standard.html,http://symfony.com/doc/2.0/contributing/code/standards.html,http://www.ppi.io/docs/coding-standards.html,https://github.com/ezsystems/ezp-next/wiki/codingstandards,http://book.cakephp.org/2.0/en/contributing/cakephp-coding-conventions.html,https://github.com/UnionOfRAD/lithium/wiki/Spec%3A-Coding,http://drupal.org/coding-standards,http://code.google.com/p/sabredav/,http://area51.phpbb.com/docs/31x/coding-guidelines.html,https://docs.google.com/a/zikula.org/document/edit?authkey=CPCU0Us&hgd=1&id=1fcqb93Sn-hR9c0mkN6m_tyWnmEvoswKBtSc0tKkZmJA,http://www.chisimba.com,n/a,https://github.com/Respect/project-info/blob/master/coding-standards-sample.php,n/a,Object Calisthenics for PHP,http://doc.nette.org/en/coding-standard,http://flow3.typo3.org,https://github.com/propelorm/Propel2/wiki/Coding-Standards,http://developer.joomla.org/coding-standards.html\r\n    voting,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,no,no,no,?,yes,no,yes\r\n    indent_type,4,4,4,4,4,tab,4,tab,tab,2,4,tab,4,4,4,4,4,4,tab,tab,4,tab\r\n    line_length_limit_soft,75,75,75,75,no,85,120,120,80,80,80,no,100,80,80,?,?,120,80,120,no,150\r\n    line_length_limit_hard,85,85,85,85,no,no,no,no,100,?,no,no,no,100,100,?,120,120,no,no,no,no\r\n    class_names,studly,studly,studly,studly,studly,studly,studly,studly,studly,studly,studly,lower_under,studly,lower,studly,studly,studly,studly,?,studly,studly,studly\r\n    class_brace_line,next,next,next,next,next,same,next,same,same,same,same,next,next,next,next,next,next,next,next,same,next,next\r\n    constant_names,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper,upper\r\n    true_false_null,lower,lower,lower,lower,lower,lower,lower,lower,lower,upper,lower,lower,lower,upper,lower,lower,lower,lower,lower,upper,lower,lower\r\n    method_names,camel,camel,camel,camel,camel,camel,camel,camel,camel,camel,camel,lower_under,camel,camel,camel,camel,camel,camel,camel,camel,camel,camel\r\n    method_brace_line,next,next,next,next,next,same,next,same,same,same,same,next,next,same,next,next,next,next,next,same,next,next\r\n    control_brace_line,same,same,same,same,same,same,next,same,same,same,same,next,same,same,next,same,same,same,same,same,same,next\r\n    control_space_after,yes,yes,yes,yes,yes,no,yes,yes,yes,yes,no,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes,yes\r\n    always_use_control_braces,yes,yes,yes,yes,yes,yes,no,yes,yes,yes,no,yes,yes,yes,yes,no,yes,yes,yes,yes,yes,yes\r\n    else_elseif_line,same,same,same,same,same,same,next,same,same,next,same,next,same,next,next,same,same,same,same,same,same,next\r\n    case_break_indent_from_switch,0/1,0/1,0/1,1/2,1/2,1/2,1/2,1/1,1/1,1/2,1/2,1/1,1/2,1/2,1/2,1/2,1/2,1/2,0/1,1/1,1/2,1/2\r\n    function_space_after,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no,no\r\n    closing_php_tag_required,no,no,no,no,no,no,no,no,yes,no,no,no,no,yes,no,no,no,no,no,yes,no,no\r\n    line_endings,LF,LF,LF,LF,LF,LF,LF,LF,?,LF,?,LF,LF,LF,LF,?,,LF,?,LF,LF,LF\r\n    static_or_visibility_first,static,?,static,either,either,either,visibility,visibility,visibility,either,static,either,?,visibility,?,?,either,either,visibility,visibility,static,?\r\n    control_space_parens,no,no,no,no,no,no,yes,no,no,no,no,no,no,yes,?,no,no,no,no,no,no,no\r\n    blank_line_after_php,no,no,no,no,yes,no,no,no,no,yes,yes,no,no,yes,?,yes,yes,no,yes,no,yes,no\r\n    class_method_control_brace,next/next/same,next/next/same,next/next/same,next/next/same,next/next/same,same/same/same,next/next/next,same/same/same,same/same/same,same/same/same,same/same/same,next/next/next,next/next/same,next/same/same,next/next/next,next/next/same,next/next/same,next/next/same,next/next/same,same/same/same,next/next/same,next/next/next\r\n\r\n## A.2. 调查说明\r\n\r\n`indent_type`:\r\n缩进类型。 tab = "使用制表符"，2 or 4 = "空格数量"\r\n\r\n`line_length_limit_soft`:\r\n行长度的“软”限制，用字符。 `?` = 不表示或者数字 `no` 意为不限制.\r\n\r\n`line_length_limit_hard`:\r\n行长度的"硬"限制，用字符。 `?` = 不表示或者数字, `no` 意为不限制.\r\n\r\n`class_names`:\r\n类名如何命名 `lower` = 只是小写, `lower_under` = 小写加下划线, `studly` = 骆驼型.\r\n\r\n`class_brace_line`:\r\n类的左花括号是放在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`constant_names`:\r\n类常量如何命名？`upper` = 大写加下划线分隔符。\r\n\r\n`true_false_null`:\r\n全小写或者全大写？\r\n\r\n`method_names`:\r\n方法名如何命名？`camel` = `驼峰式`, `lower_under` = 小写加下划线分隔符。\r\n\r\n`method_brace_line`:\r\n方法的左花括号在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`control_brace_line`:\r\n控制结构的左花括号在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`control_space_after`:\r\n控制结构关键词后是否有空格？\r\n\r\n`always_use_control_braces`:\r\n控制结构总是使用花括号？\r\n\r\n`else_elseif_line`:\r\n当使用`else`和`elseif`，是否放在同(`same`)一行还是在下(`next`)一行？\r\n\r\n`case_break_indent_from_switch`:\r\n`case`和`break`分别从`swith`语句处缩进多少次？\r\n\r\n`function_space_after`:\r\n函数调用的函数名和左括号是否有空格？\r\n\r\n`closing_php_tag_required`:\r\n如过是纯PHP文件，关闭标签`?>`是否需要？\r\n\r\n`line_endings`:\r\n使用何种的行结束符？\r\n\r\n`static_or_visibility_first`:\r\n在定义方法的时候`static`和可见性谁在前面？\r\n\r\n`control_space_parens`:\r\n在控制结构表达式中，左括号后面和右括号前面是否要有一个空格？yes = if ( $expr ), no = if ($expr).\r\n\r\n`blank_line_after_php`:\r\nPHP的开始标签后面是否需要一个空行？\r\n\r\n`class_method_control_brace`:\r\n左花括号在类，方法和控制结构中的位置。\r\n\r\n## A.3. 调查结果\r\n\r\n    indent_type:\r\n        tab: 7\r\n        2: 1\r\n        4: 14\r\n    line_length_limit_soft:\r\n        ?: 2\r\n        no: 3\r\n        75: 4\r\n        80: 6\r\n        85: 1\r\n        100: 1\r\n        120: 4\r\n        150: 1\r\n    line_length_limit_hard:\r\n        ?: 2\r\n        no: 11\r\n        85: 4\r\n        100: 3\r\n        120: 2\r\n    class_names:\r\n        ?: 1\r\n        lower: 1\r\n        lower_under: 1\r\n        studly: 19\r\n    class_brace_line:\r\n        next: 16\r\n        same: 6\r\n    constant_names:\r\n        upper: 22\r\n    true_false_null:\r\n        lower: 19\r\n        upper: 3\r\n    method_names:\r\n        camel: 21\r\n        lower_under: 1\r\n    method_brace_line:\r\n        next: 15\r\n        same: 7\r\n    control_brace_line:\r\n        next: 4\r\n        same: 18\r\n    control_space_after:\r\n        no: 2\r\n        yes: 20\r\n    always_use_control_braces:\r\n        no: 3\r\n        yes: 19\r\n    else_elseif_line:\r\n        next: 6\r\n        same: 16\r\n    case_break_indent_from_switch:\r\n        0/1: 4\r\n        1/1: 4\r\n        1/2: 14\r\n    function_space_after:\r\n        no: 22\r\n    closing_php_tag_required:\r\n        no: 19\r\n        yes: 3\r\n    line_endings:\r\n        ?: 5\r\n        LF: 17\r\n    static_or_visibility_first:\r\n        ?: 5\r\n        either: 7\r\n        static: 4\r\n        visibility: 6\r\n    control_space_parens:\r\n        ?: 1\r\n        no: 19\r\n        yes: 2\r\n    blank_line_after_php:\r\n        ?: 1\r\n        no: 13\r\n        yes: 8\r\n    class_method_control_brace:\r\n        next/next/next: 4\r\n        next/next/same: 11\r\n        next/same/same: 1\r\n        same/same/same: 6\r\n', NULL, 7, 1),
(54, 4, 50, 'PSR-3', '', '', NULL, 0, 1),
(55, 4, 50, 'PSR-4', '', '', NULL, 0, 1),
(34, 3, 40, 'SVN', '<p>在内网开发环境,SVN地址为: https://192.168.0.10/svn/m.so/</p>\r\n', '用户名 irones\r\n\r\n密码 irones', 'con', -1, 1),
(35, 3, 46, 'Mysql', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;hostname&quot;&nbsp; =&gt;&nbsp; &#39;127.0.0.1&#39;,<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;username&quot;&nbsp; =&gt;&nbsp; &#39;gracemain&#39;,<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;password&quot;&nbsp; =&gt;&nbsp; &#39;gracemain&#39;,<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;database&quot;&nbsp; =&gt;&nbsp; &#39;gracemain&#39;,</p>\r\n\r\n<p>在程序中默认调用的是default库</p>\r\n\r\n<p>可采用的或者预留采用的数据库技术包括</p>\r\n\r\n<ol>\r\n	<li>索引</li>\r\n	<li>分库</li>\r\n	<li>读写分离</li>\r\n	<li>分布式</li>\r\n	<li>集群</li>\r\n	<li>分表</li>\r\n	<li>索引</li>\r\n	<li>缓存</li>\r\n</ol>\r\n', '    ''mysql''=>[\r\n        ''default2''=>[\r\n            "hostname"  =>  ''rdsoyq134we31od4l8uwi.mysql.rds.aliyuncs.com'',\r\n            "username"  =>  ''nsv1'',\r\n            "password"  =>  ''nsv1nsv1'',\r\n            "database"  =>  ''rvfjbvj6il30zoiq'',\r\n            "charset"   =>  ''utf8'',\r\n            "pconnect"  =>  0,\r\n            "quiet"     =>  0\r\n        ],\r\n        ''default''=>[\r\n            "hostname"  =>  ''127.0.0.1'',\r\n            "username"  =>  ''gracemain'',\r\n            "password"  =>  ''gracemain'',\r\n            "database"  =>  ''gracemain'',\r\n            "charset"   =>  ''utf8'',\r\n            "pconnect"  =>  0,\r\n            "quiet"     =>  0\r\n        ],\r\n    ],\r\n    \r\n\r\n####路线图\r\n\r\n    单库索引\r\n    缓存\r\n    分库\r\n    读写分离\r\n    分表\r\n    分布式\r\n    集群\r\n    \r\n    分表有不同的策略,要根据需要进行选择和使用', NULL, 0, 1),
(36, 3, 46, 'Memcache', '<p><strong>Memcache分布式</strong></p>\r\n\r\n<ol>\r\n	<li>检查客户端的请求数据是否在memcached中，如有，直接把请求数据返回，不再对数据库进行任何操作，路径操作为①②③⑦。</li>\r\n	<li>如果请求的数据不在memcached中，就去查数据库，把从数据库中获取的数据返回给客户端，同时把数据缓存一份到memcached中（memcached客户端不负责，需要程序明确实现），路径操作为①②④⑤⑦⑥。</li>\r\n	<li>每次更新数据库的同时更新memcached中的数据，保证一致性。</li>\r\n	<li>当分配给memcached内存空间用完之后，会使用LRU（Least Recently Used，最近最少使用）策略加上到期失效策略，失效数据首先被替换，然后再替换掉最近未使用的数据。</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Memcached的分布式</strong></p>\r\n\r\n<p><br />\r\n当向memcached集群存入/取出key/value时，memcached客户端程序根据一定的算法计算存入哪台服务器，然后再把key/value值存到此服务器中。也就是说，存取数据分二步走，第一步，选择服务器，第二步存取数据。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>分布式算法(Consistent Hashing)：</strong><br />\r\n<br />\r\n选择服务器算法有两种，一种是根据余数来计算分布，另一种是根据散列算法来计算分布。<br />\r\n<strong>余数算法：</strong><br />\r\n先求得键的整数散列值，再除以服务器台数，根据余数确定存取服务器，这种方法计算简单，高效，但在memcached服务器增加或减少时，几乎所有的缓存都会失效。<br />\r\n<strong>散列算法：</strong><br />\r\n先 算出memcached服务器的散列值，并将其分布到0到2的32次方的圆上，然后用同样的方法算出存储数据的键的散列值并映射至圆上，最后从数据映射到 的位置开始顺时针查找，将数据保存到查找到的第一个服务器上，如果超过2的32次方，依然找不到服务器，就将数据保存到第一台memcached服务器 上。如果添加了一台memcached服务器，只在圆上增加服务器的逆时针方向的第一台服务器上的键会受到影响。</p>\r\n', '##Memcache分布式\r\n\r\n![](/Upload/20120918153149100.jpg)\r\n\r\n##Memcache分布式\r\n\r\n![](/Upload/20120918153149105.jpg)\r\n\r\n##Memcached的分布式算法\r\n\r\n![](/Upload/20120918153149106.jpg)\r\n\r\n\r\n', NULL, 0, 1),
(37, 3, 46, 'Mongodb', '<p>分布式Mongodb部署和使用</p>\r\n\r\n<p>&nbsp;</p>\r\n', '分布式Mongodb部署和使用\r\n\r\n\r\n', NULL, 0, 1),
(38, 3, 46, '文档系统', '', '', NULL, 0, 1),
(39, 3, 0, 'PHP扩展和模块', '<p>xcache</p>\r\n', '    xcache', NULL, 0, 1),
(40, 3, 0, '版本控制和发布', '', '', NULL, 0, 1),
(41, 3, 0, '前端', '', '', NULL, 0, 1),
(42, 3, 46, 'Redis', '<p><a href="http://blog.chinaunix.net/uid-790245-id-3766268.html">Redis安装部署</a></p>\r\n', '', NULL, 0, 1),
(43, 3, 40, 'Apache', '', '', NULL, 0, 1),
(44, 3, 40, 'Nginx', '', '', NULL, 0, 1),
(45, 3, 40, 'Github', '<p>https://github.com/shampeak/m.so/</p>\r\n', '', NULL, -1, 1),
(46, 3, 0, '数据存储', '<p>数据存储</p>\r\n', '', NULL, -1, 1),
(47, 3, 41, 'A目录', '', '', NULL, 0, 1),
(48, 3, 0, '问题', '<p>Mongodb 和 Mysql 的区别</p>\r\n\r\n<p>Mysql 索引的原理</p>\r\n\r\n<p>两个的深入理解<br />\r\n&nbsp;</p>\r\n', '', NULL, -2, 1),
(49, 3, 0, '框架内部署', '<ol>\r\n	<li>路由router</li>\r\n	<li>配置config</li>\r\n	<li>request</li>\r\n	<li>application</li>\r\n	<li>cache</li>\r\n	<li>db</li>\r\n	<li>user</li>\r\n	<li>rbac</li>\r\n</ol>\r\n', '    路由router\r\n    配置config\r\n    request\r\n    application\r\n    cache\r\n    db\r\n    user\r\n    rbac', NULL, -9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `g_group`
--

CREATE TABLE IF NOT EXISTS `g_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(32) DEFAULT NULL,
  `groupchr` varchar(16) DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `g_group`
--

INSERT INTO `g_group` (`groupid`, `groupname`, `groupchr`, `sort`, `enable`) VALUES
(33, '12224', '12324', 12424, 1),
(34, '管理员组', 'admin', 99, 1);

-- --------------------------------------------------------

--
-- 表的结构 `g_log`
--

CREATE TABLE IF NOT EXISTS `g_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT '0',
  `msg` varchar(16) DEFAULT NULL,
  `controller` varchar(16) DEFAULT NULL,
  `action` varchar(16) DEFAULT NULL,
  `time` text,
  `_GET` text,
  `_POST` text,
  `_FILE` text,
  `router` text,
  `sign` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- 转存表中的数据 `g_log`
--

INSERT INTO `g_log` (`id`, `code`, `msg`, `controller`, `action`, `time`, `_GET`, `_POST`, `_FILE`, `router`, `sign`) VALUES
(38, '', '', 'friend', 'search', 'a:2:{s:6:"timebe";d:1438758289.3618391;s:6:"timecu";i:1438758289;}', 'a:0:{}', 'a:2:{s:8:"username";s:6:"user02";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:6:"friend";s:6:"Action";s:6:"search";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/friend/search";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(39, '', '', 'friend', 'search', 'a:2:{s:6:"timebe";d:1438758291.0909369;s:6:"timecu";i:1438758291;}', 'a:0:{}', 'a:2:{s:8:"username";s:6:"user02";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:6:"friend";s:6:"Action";s:6:"search";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/friend/search";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(40, '', '', 'friend', 'search', 'a:2:{s:6:"timebe";d:1438758395.745923;s:6:"timecu";i:1438758395;}', 'a:0:{}', 'a:2:{s:8:"username";s:6:"user02";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:6:"friend";s:6:"Action";s:6:"search";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/friend/search";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(41, '', '', 'friend', 'search', 'a:2:{s:6:"timebe";d:1438759490.9473841;s:6:"timecu";i:1438759490;}', 'a:0:{}', 'a:2:{s:8:"username";s:6:"user02";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:6:"friend";s:6:"Action";s:6:"search";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/friend/search";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(42, '', '', 'friend', 'search', 'a:2:{s:6:"timebe";d:1438759491.91944;s:6:"timecu";i:1438759491;}', 'a:0:{}', 'a:2:{s:8:"username";s:6:"user02";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:6:"friend";s:6:"Action";s:6:"search";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/friend/search";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(43, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764629.070668;s:6:"timecu";i:1438764629;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(44, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764651.0927739;s:6:"timecu";i:1438764651;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(45, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764654.8132401;s:6:"timecu";i:1438764654;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(46, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764659.9646339;s:6:"timecu";i:1438764659;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(47, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764664.1258719;s:6:"timecu";i:1438764664;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(48, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764675.247508;s:6:"timecu";i:1438764675;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(49, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764689.2773099;s:6:"timecu";i:1438764689;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(50, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764717.437921;s:6:"timecu";i:1438764717;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(51, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764740.898263;s:6:"timecu";i:1438764740;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(52, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764744.1494491;s:6:"timecu";i:1438764744;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(53, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764761.8394611;s:6:"timecu";i:1438764761;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(54, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764779.7744861;s:6:"timecu";i:1438764779;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(55, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764823.8300059;s:6:"timecu";i:1438764823;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(56, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438764835.469672;s:6:"timecu";i:1438764835;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(57, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765020.0232279;s:6:"timecu";i:1438765020;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(58, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765030.3028159;s:6:"timecu";i:1438765030;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(59, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765041.847476;s:6:"timecu";i:1438765041;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(60, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765048.1328361;s:6:"timecu";i:1438765048;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(61, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765134.996959;s:6:"timecu";i:1438765134;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(62, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765634.6302791;s:6:"timecu";i:1438765634;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(63, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765650.1180811;s:6:"timecu";i:1438765650;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(64, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765653.555932;s:6:"timecu";i:1438765653;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(65, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765712.397841;s:6:"timecu";i:1438765712;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(66, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765729.5117011;s:6:"timecu";i:1438765729;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(67, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765790.990726;s:6:"timecu";i:1438765790;}', 'a:0:{}', 'a:3:{s:8:"username";s:0:"";s:3:"pwd";s:0:"";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(68, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438765817.7203071;s:6:"timecu";i:1438765817;}', 'a:0:{}', 'a:3:{s:8:"username";s:9:"123123123";s:3:"pwd";s:9:"123123123";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}'),
(69, '', '', 'user', 'register', 'a:2:{s:6:"timebe";d:1438766218.4196351;s:6:"timecu";i:1438766218;}', 'a:0:{}', 'a:3:{s:8:"username";s:9:"123123123";s:3:"pwd";s:9:"123123123";s:8:"type_cv1";s:16:"javascript_debug";}', 'a:0:{}', 'a:7:{s:6:"Module";s:1:"v";s:10:"Controller";s:4:"user";s:6:"Action";s:8:"register";s:10:"Action_ext";s:4:"post";s:6:"ispost";s:4:"post";s:5:"_path";s:15:"v/user/register";s:7:"params_";s:0:"";}', 'a:6:{s:4:"salt";s:4:"SALT";s:9:"timestamp";N;s:8:"deviceid";N;s:9:"signature";N;s:4:"user";N;s:4:"sign";b:0;}');

-- --------------------------------------------------------

--
-- 表的结构 `g_mea`
--

CREATE TABLE IF NOT EXISTS `g_mea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tm` int(11) NOT NULL,
  `user` varchar(32) NOT NULL,
  `fname` varchar(64) NOT NULL,
  `enable` int(1) NOT NULL DEFAULT '1',
  `jx` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `g_mea`
--

INSERT INTO `g_mea` (`id`, `tm`, `user`, `fname`, `enable`, `jx`) VALUES
(10, 1438239955, 'miss', './A/upload/v6/miss/201507/1438239955.mea', 1, 0),
(11, 1438239966, 'zhaiyingpeng', './A/upload/v6/zhaiyingpeng/201507/1438239966.mea', 1, 0),
(8, 1437542521, 'Cccc', './A/upload//v6/Cccc/201507/1437542521.mea', 1, 1),
(9, 1437542563, 'Cccc', './A/upload/v6/Cccc/201507/1437542563.mea', 1, 0),
(12, 1438246644, 'zhaiyingpeng', './A/upload/v6/zhaiyingpeng/201507/1438246644.mea', 1, 0),
(13, 1438394810, 'zhaiyingpeng', './A/upload/v6/zhaiyingpeng/201508/1438394810.mea', 1, 0),
(14, 1438757485, 'zhaiyingpeng', './A/upload/v6/zhaiyingpeng/201508/1438757485.mea', 1, 0),
(15, 1438758553, 'zhaiyingpeng', './A/upload/v6/zhaiyingpeng/201508/1438758553.mea', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `g_relation`
--

CREATE TABLE IF NOT EXISTS `g_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname1` varchar(11) NOT NULL,
  `uname2` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uname1` (`uname1`),
  KEY `uname2` (`uname2`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `g_relation`
--

INSERT INTO `g_relation` (`id`, `uname1`, `uname2`) VALUES
(1, 'Cccc', 'Cccc'),
(7, 'Cccc', 'Bbbb'),
(11, 'user01', 'user02'),
(12, 'Xxxx', 'Bbbb'),
(13, 'Bbbb', 'Kkkkk'),
(14, 'Cccc', 'Mmmm'),
(15, 'Baba', 'Cccc'),
(16, 'Cccc', 'Lp'),
(17, 'Lp', 'Ml'),
(18, 'Ml', 'Kl'),
(19, 'Lz', 'Cccc'),
(20, 'user01', 'user02'),
(21, '123', 'Yanmin'),
(22, 'Bbbb', 'Fffff'),
(23, 'dog', 'Cccc'),
(24, 'Zp', 'Cccc'),
(25, 'Zp', 'Lz'),
(26, 'Lz', 'Mmmm'),
(27, 'Cccc', 'Aq'),
(28, 'Cccc', 'Aq'),
(29, 'Cccc', 'Aq'),
(30, 'Aq', 'Cccc'),
(31, 'Aq', 'Cccc'),
(32, 'Rr', 'Cccc'),
(33, 'Ti', 'Ty'),
(34, 'Cccc', 'Ti'),
(35, 'Ti', 'Mmmm'),
(36, 'Ti', 'Mmmm'),
(37, 'Ti', 'Mmmm'),
(38, 'Ti', 'Mmmm'),
(39, 'Mmmm', 'Ti'),
(40, 'Ti', 'Mmmm'),
(41, 'Ti', 'Mmmm'),
(42, 'Ti', 'Mmmm'),
(43, 'Ti', 'Mmmm'),
(44, 'Ti', 'Mmmm'),
(45, 'Wangquan', 'Cccc'),
(46, 'user01', 'user02'),
(47, 'user01', 'user02');

-- --------------------------------------------------------

--
-- 表的结构 `g_rulelib`
--

CREATE TABLE IF NOT EXISTS `g_rulelib` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_group` varchar(64) NOT NULL,
  `rule_name` varchar(64) NOT NULL,
  `rule_dis` text,
  `rule_module` varchar(64) NOT NULL,
  `rule_controller` varchar(64) NOT NULL,
  `rule_action` varchar(64) NOT NULL,
  `sort` int(3) NOT NULL DEFAULT '0',
  `enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `g_rulelib`
--

INSERT INTO `g_rulelib` (`rule_id`, `rule_group`, `rule_name`, `rule_dis`, `rule_module`, `rule_controller`, `rule_action`, `sort`, `enable`) VALUES
(1, '', '', NULL, 's', 'home', 'main', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `g_userapi`
--

CREATE TABLE IF NOT EXISTS `g_userapi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `v` varchar(32) DEFAULT NULL,
  `api` varchar(128) DEFAULT NULL,
  `dis` varchar(256) DEFAULT NULL,
  `request` text,
  `response` text,
  `enable` tinyint(1) NOT NULL,
  `debug` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `g_userapi`
--

INSERT INTO `g_userapi` (`id`, `name`, `v`, `api`, `dis`, `request`, `response`, `enable`, `debug`, `sort`, `type`) VALUES
(1, '查找好友', 'v', 'friend/search', '模块: 查找好友\n说明 :用户根据用户id查找好友，返回具有改id的用户\n参数 :username用户名\n成功 :\n失败 :', '{\n    "username": "user02"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": {\n        "username": "li",\n        "userid": "li",\n        "portrait": "http://hebei.sinaimg.cn/2013/0104/U7459P1275DT20130104173656.jpg"\n    }\n}', 1, 0, 9999, 'GET'),
(2, '添加好友', 'v', 'friend/add', '模块 :添加好友\n说明 :\n参数 :targetid将要添加的好友的id,message添加好友附加的内容\n成功 :如果该好友列表中没有这个好友则发出好友添加请求，并反馈“添加好友请求发送成功”，否则其他提醒内容\n失败 :', '{"username":"user01",\n    "targetname":"user02"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": "添加好友请求发送成功"\n}', 0, 0, 9999, 'GET'),
(3, '获取好友列表', 'v', 'friend/getfriends', '模块 :获取好友列表\n说明 :\n参数 :\n成功 :\n失败 :', '{\n    "username": "user01"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n         {\n            "userid": "zhang",\n            "username": "zhang",\n            "portrait": "http://img.zjolcdn.com/pic/0/06/58/52/6585256_962155.jpg"\n        },\n        {\n            "userid": "user03",\n            "username": "王五",\n            "portrait": "http://img.zjolcdn.com/pic/0/06/58/52/6585256_962155.jpg"\n        },\n        {\n            "userid": "user04",\n            "username": "麻子",\n            "portrait": "http://img.zjolcdn.com/pic/0/06/58/52/6585255_749157.jpg"\n        },\n        {\n            "userid": "user05",\n            "username": "高雷",\n            "portrait": "http://pic.159.com/desk/user/2012/10/26/Jiker201295211551156.jpg"\n        },\n        {\n            "userid": "user06",\n            "username": "苏醒",\n            "portrait": "http://img2.3lian.com/2014/f4/201/d/85.jpg"\n        },\n        {\n            "userid": "user07",\n            "username": "沙宝亮",\n            "portrait": "http://img.dapixie.com/uploads/allimg/111211/1-111211141406.jpg"\n        }\n    ]\n}', 1, 0, 9999, 'GET'),
(4, '获取用户token值', 'v', 'user/gettoken', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '{\n    "username": "user01"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n      "token": "nd787DeXGtYlJG9hc4enUQPdsFArjkVwRsE5q/VVOWVrtOYDQ0sqxJZogb1+7GEeueYpEnn25Dw="\n    \n}', 1, 1, 9, 'GET'),
(5, '用户获取消息队列', 'v', 'user/getmessage', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "msgtype": "1",\n            "username": "李四",\n            "userid": "user02",\n            "portrait": "http://dmimg.5054399.com/allimg/xztuku/130924007.jpg"\n        }\n    ]\n}', 1, 0, 9, 'GET'),
(6, 'friend.test', 'v', 'friend/test', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '', '{"code":4104,"msg":"ok: wait for design ","data":"","getpost":{}}', 1, 1, -999, 'POST'),
(7, '请求对应科室的医生数据', 'v', 'docnav/hos_spec', '模块 :求医导航\n说明 :求医导航具体医院的专科医生信息\n参数 :hos_id医院id,spec_id专科id\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": {\n"id":"0",\n"doc":[{"name":"张三","job":"专家","url":"xxxx"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"},{"name":"李四","job":"专家","url":"zzz"}]\n}\n    \n    \n}', 1, 1, -9, 'GET'),
(8, '获取专科医院排名的科室索引', 'v', 'docnav/special_list', '模块 :求医问药\n说明 :求医问药模块专科排行榜的科室索引\n参数 :\n成功 :\n失败 :', '', '{\n"code":200,\n"msg":"succeed",\n"data":{\n"department":["aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc",\n"aa","bb","cc"]\n}\n}', 1, 1, -9, 'GET'),
(9, '获取对应科室的详细数据', 'v', 'docnav/spec_detail', '模块 :求医导航\n说明 :求医导航模块专科排名的对应科室的详细数据\n参数 :index表示对应科室的id\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": {\n        "last": {\n            "id": "11",\n            "hospital_name": [\n                "北京大学附属肿瘤医院",\n                "第三医院"\n            ],\n            "hospital_rank": "11"\n        },\n        "rank": [\n            {\n                "id": "0",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "1",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "2",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "2",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "2",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "3",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "5",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "6",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            },\n            {\n                "id": "1",\n                "hospital_name": "复旦大学附属肿瘤医院",\n                "hospital_rank": "2",\n                "hospital_state": "不变",\n                "hospital_score": "8.8888"\n            }\n        ]\n    }\n}', 1, 1, -9, 'GET'),
(10, '获取最佳医院排名', 'v', 'docnav/best_hosptail_list', '模块 :求医导航模块\n说明 :获取最佳医院排名及对应医院的科室排名\n参数 :缺省为获取最佳医院排名\n成功 :\n失败 :', '', '{\n"code":200,\n"msg":"succeed",\n"data":\n\n[{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"1",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n},\n{\n"id":"0",\n"hospital_name":"复旦大学附属肿瘤医院",\n"hospital_rank":"2",\n"hospital_spec":"5.5",\n"hospital_edu":"11",\n"hospital_score":"8.8888"\n}]\n}', 1, 1, -9, 'GET'),
(11, '请求某个最佳医院的详细信息', 'v', 'docnav/best_hosptail', '模块 :求医导航\n说明 :请求某个医院的详细信息.\n参数 :spec_index,为发起请求的医院id\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": {\n        "id": "0",\n        "content": [\n            {\n                "rank_name": "第一名",\n                "rank_content": [\n                    "风湿病",\n                    "妇产科",\n                    "普通外科"\n                ]\n            },\n            {\n                "rank_name": "第二名",\n                "rank_content": [\n                    "病理科",\n                    "呼吸科",\n                    "麻醉科",\n                    "内分泌科"\n                ]\n            }\n        ]\n    }\n}', 1, 1, -9, 'GET'),
(12, '求医问药问题库', 'v', 'docnav/ask/', '模块 :求医问药\n说明 :求医问药模块问题库按照疾病名字请求数据\n参数 :diseaseName,疾病名称\n成功 :\n失败 :', '', '{\n"code":200,\n"msg":"succeed",\n"data":{\n"name":"青春痘",\n"symptom":"起了好多痘痘",\n"cause":"年青",\n"prevented":"变老",\n"asked":[\n{"question":"如何治疗0",\n"to":"不要放弃治疗0"\n},{"question":"如何治疗1",\n"to":"不要放弃治疗1"\n},{"question":"如何治疗2",\n"to":"不要放弃治疗2"\n},{"question":"如何治疗3",\n"to":"不要放弃治疗3"\n}\n]\n}\n}', 1, 1, -9, 'GET'),
(13, '院内导诊获取所有医院名字', 'v', 'docnav/hospitalguidelist', '模块 :求医导航之院内导诊\n说明 :获取所有有导航数据的医院的名字\n参数 :\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "name": "1北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "2北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "3北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "4北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "5北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "6北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "7北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "8北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "2北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "3北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "4北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "5北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "6北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "7北京人民医院",\n            "id": "1"\n        },\n        {\n            "name": "8北京人民医院",\n            "id": "1"\n        },\n\n        {\n            "name": "北京人民医院",\n            "id": "1"\n        }, {\n            "name": "人民医院",\n            "id": "1"\n        }\n    ]\n}', 1, 1, -9, 'GET'),
(14, '获取院区分布图', 'v', 'docnav/hospitalmap', '模块 :求医导航院内导诊\n说明 :获取院区分布图\n参数 ::name医院名称\n成功 :\n失败 :', '', '{\n"code":200,\n"msg":"succeed",\n"data":{"route":"从南到北方","image":"http:192.168.0.200/mm"}\n}', 1, 1, -9, 'GET'),
(15, '获取门诊分布图', 'v', 'docnav/outpatientmap', '模块 :求医导航院内导诊\n说明 :获取门诊分布图\n参数 ::name医院名称\n成功 :\n失败 :', '', '{\n"code":200,\n"msg":"succeed",\n"data":{"route":"从南到北方","image":"http:192.168.0.200/mm"}\n}', 1, 1, -9, 'GET'),
(16, '登录', 'v', 'user/login', '模块 :登录模块\n说明 :\n参数 :username登录用户名,pwd用户密码\n成功 :\n失败 :', '{"username":"",\n"pwd":""\n}', '{\n"code":200,\n"msg":"succeed",\n"data":""\n}', 0, 0, 11111, 'GET'),
(17, '注册', 'v', 'user/register', '模块 :用户注册\n说明 :\n参数 :username用户名pwd用户密码\n成功 :\n失败 :', '{\n"username":"",\n"pwd":""\n\n}', '{"code":200,\n"msg":"succeed",\n"data":""\n}', 0, 0, 11111, 'GET'),
(18, '获取最新版本号', 'v', 'user/updateApp', '模块 :更新版本\n说明 :获取最新的app版本,url为最新版本的下载地址,version为最新版本号\n参数 :\n成功 :\n失败 :', '', '{"code":200,\n"msg":"succeed",\n"data":\n{\n"path":"http://gdown.baidu.com/data/wisegame/bd47bd249440eb5f/shenmiaotaowang2.apk",\n"version":"2.0",\n"description":"可以中大奖"\n}\n\n\n}', 1, 1, -999, 'GET'),
(19, '--------------------------------', 'v', '--------------------------------', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '{\n"name":"zhangbo",\n"age":"23"\n}', '{\n"code":300,\n"msg":"898998899",\n"data":{\n"name":"zhangbo",\n"age":"23"\n}\n}', 0, 1, 10000, 'GET'),
(20, '保存以及更新用户个人信息', 'v', 'user/updateUserInfo', '模块 :个人信息设置\n说明 :保存以及更新个人信息\n参数 :\n"nickname":昵称,\n"name":姓名\n"gender":性别,\n"birth":生日,记录年月日,\n"stature":身高(单位cm),\n"weight":体重(单位kg)\n"region":地区\n"address":地址\n\n成功 :\n失败 :', '{\n"nickname":"zhai",\n"name":"name",\n"gender":"nan",\n"birth":"24",\n"stature":"1",\n"weight":"1",\n"region":"d",\n"address":"z"\n\n\n}', '{"code":200,\n"msg":"succeed",\n"data":""\n}', 1, 1, 11111, 'GET'),
(21, '意见反馈', 'v', 'user/feedback', '模块 :设置模块\n说明 :设置模块中的意见反馈\n参数 :content:用户反馈的内容\n成功 :\n失败 :', '{\n"content":"山东省地发斯蒂芬"\n}', '{"code":200,\n"msg":"succeed",\n"data":""\n}', 1, 0, -99, 'GET'),
(22, '获取用户信息', 'v', 'getUserInfo', '模块: 个人信息设置\n说明 :获取个人信息\n参数 :username用户名\n成功 :\n失败 :', '{\n"username":"张三"\n}', '{\n"code":200,\n"msg":"succeed",\n"data":{\n"nickname":"李白",\n"gender":"男",\n"birth":"1992.05",\n"stature":"180",\n"weight":"88"\n}\n}', 1, 1, 99, 'GET'),
(23, '修改用户密码', 'v', 'user/changepassword', '模块 :设置模块修改密码\n说明 :\n参数 :"username":用户名,\n"orgpwd":原来密码,\n"newpwd":新密码\n成功 :\n失败 :', '{"username":"张三",\n"orgpwd":"123456",\n"newpwd":"abcdefg"\n}\n', '{\n"code":200,\n"msg":"修改成功",\n"data":""\n}', 0, 0, 9, 'GET'),
(24, '获取养生文章', 'v', 'comm/healthknowledge', '模块 :获取养生文章\n说明 :\n参数 :"page":代表获取的第几页\n成功 :\n失败 :', '{\n"page":"1"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "article_id": "0010101",\n            "article_title": "别轻乎9个小征兆恐是心脏病前兆",\n            "article_detail": "现今由于医疗发达，健康饮食教育也更加普及，死于心脏疾病的人数已较过去少",\n            "article_url": "http://yidianzixun.com/n/08emCWIg/?s=9",\n            "article_author": "温州二手网",\n            "article_time": "2015-01-01"\n        },\n        {\n            "article_id": "0010102",\n            "article_title": "给心脏上道“康复险”",\n            "article_detail": "年龄不是心脏康复的障碍",\n            "article_url": "http://192.168.1.200/xx",\n            "article_author": "39健康网",\n            "article_time": "2015-01-01"\n        },\n        {\n            "article_id": "0010103",\n            "article_title": "老人勤刷牙_巧防心脏病",\n            "article_detail": "英国科学家日前发觉，口腔卫生状况不佳也会增加罹患心脏病的风险",\n            "article_url": "http://192.168.1.200/xx",\n            "article_author": "红牛养生堂",\n            "article_time": "2015-01-01"\n        }\n    ]\n}', 1, 1, -9, 'GET'),
(25, '获取心脏疾病列表', 'v', 'comm/heartdiseaselist', '模块 :健康科普\n说明 :获取疾病名字等信息的列表\n参数 :\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "disease_id": "h_001",\n            "disease_name": "冠心病",\n            "disease_detail": "许多冠心病发作是可以预防的",\n            "disease_url": "http://192.168.1.200/v3/comm/diseaseitem"\n        },\n        {\n            "disease_id": "h_002",\n            "disease_name": "心律不齐",\n            "disease_detail": "心律不齐小问题大反应",\n            "disease_url": "http://192.168.1.200/xx"\n        },\n        {\n            "disease_id": "h_003",\n            "disease_name": "心肌炎",\n    "disease_detail": "心肌,生命力的关键",\n            "disease_url": "http://192.168.1.200/xx"\n        },\n        {\n            "disease_id": "h_004",\n            "disease_name": "心血管",\n"disease_detail": "生命流通的通道",\n            "disease_url": "http://192.168.1.200/xx"\n        }\n    ]\n}', 1, 1, -9, 'GET'),
(26, '获取疾病的子条目', 'v', 'comm/diseaseitem', '模块 :知识模块\n说明 :获取疾病的详细条目\n参数 :disease_id要获取的疾病的id\n成功 :\n失败 :', '{\n"disease_id":"0001"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": \n      [\n            {\n                "item_id": "01",\n                "item_title": "什么是冠心病发作？",\n                "item_url": "http://hao.360.cn/?a1004"\n            },\n            {\n                "item_id": "02",\n                "item_title": "引起冠心病发作和脑卒中的原因有哪些",\n                "item_url": "http://192.168.1.200"\n            },\n  {\n                "item_id": "02",\n                "item_title": "什么是冠心病发作的症状",\n                "item_url": "http://192.168.1.200"\n            }\n        ,\n{\n                "item_id": "02",\n                "item_title": "冠心病发作时怎样做",\n                "item_url": "http://192.168.1.200"\n            }\n        \n    ]\n}', 1, 1, -9, 'GET'),
(27, '获取糖尿病接口', 'v', 'comm/diabetes', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '{\n"page":"1"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "article_id": "0010101",\n            "article_title": "糖尿病的早期症状",\n            "article_detail": "糖尿病是一组以高血糖为特征的代谢性疾病。",\n            "article_url": "http://baike.baidu.com/link?url=gQWynIzi6YldjmgmdAvjNfYWuF8FxT9Kc-l7eDIK_Rsy3RnCtb9kVJ0mzJi0fbph#2",\n            "article_author": "百科名医网",\n            "article_time": "2015-01-01"\n        },\n        {\n            "article_id": "0010102",\n            "article_title": "糖尿病的饮食治疗",\n            "article_detail": "糖尿病的饮食是很重要的，这也是很多患者都知道的问题.",\n            "article_url": "http://tnb.xywy.com/zhiliao/698037.html",\n            "article_author": "寻医问药社区",\n            "article_time": "2015-01-01"\n        },\n        {\n            "article_id": "0010103",\n            "article_title": "糖尿病的自我疗法",\n            "article_detail": "糖尿病的发病原因是因为患者身体内血糖过高，胰岛素是身体内控制、消耗血糖的唯一有效激素。",\n            "article_url": "http://jingyan.baidu.com/article/375c8e19a2d33b25f3a22944.html",\n            "article_author": "糖尿病",\n            "article_time": "2015-01-01"\n        },\n {\n            "article_id": "0010104",\n            "article_title": "糖尿病的最佳疗法",\n            "article_detail": "糖尿病的发病原因是因为患者身体内血糖过高，胰岛素是身体内控制、消耗血糖的唯一有效激素。",\n            "article_url":"http://tnb.xywy.com/teseliaofa/808026.html",\n            "article_author": "糖尿病",\n            "article_time": "2015-01-01"\n        }\n    ]\n}', 1, 1, -9, 'GET'),
(28, '获取糖尿病专家建议', 'v', 'comm/expertdiabetes', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '{\n"page":"1"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "article_id": "0010101",\n            "article_title": "糖尿病并发症有哪些，怎么预防",\n            "article_detail": "关于糖尿病的危害可以说很多人都知道晚期的时候就很难治愈了，所以预防称为了糖尿病患者的主要活动项目。",\n            "article_url": "http://jingyan.baidu.com/article/e52e36158991b440c60c51f1.html",\n            "article_author": "保健养生",\n            "article_time": "2015-01-01"\n        },\n        {\n            "article_id": "0010102",\n            "article_title": "糖尿病酮症酸中毒 规范治疗五要点”",\n            "article_detail": "糖尿病酮症酸中毒是由于血糖控制差而发生的一种非常严重的情况，糖尿病患者能够充分认识到这一点，重视血糖的控制，是预防糖尿病酮症酸中毒发生的根本措施。",\n            "article_url": "http://www.haodf.com/jibing/zhuanti/tangniaobing.htm",\n            "article_author": "专家访谈",\n            "article_time": "2015-01-01"\n        },\n        {\n            "article_id": "0010103",\n            "article_title": "眼睛干涩 小心糖尿病视网膜病变",\n            "article_detail": "糖尿病视网膜病变（简称糖网）是糖尿病眼病中最严重的并发症，也是致盲的重要原因之一，在各种致盲眼病中约占8%",\n            "article_url": "http://www.haodf.com/jibing/zhuanti/tangniaobing/lable.htm?&page=2",\n            "article_author": "专家访谈",\n            "article_time": "2015-01-01"\n        }\n    ]\n}', 1, 1, -9, 'GET'),
(29, '登陆-电话', 'v', 'con/logintel', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '{\n"usertel":"1388069199",\n"password":"Zhangbo",\n"verify":"asdfasdf"\n}', '{\n"code":"200",\n"msg":"succeed"\n}', 1, 1, -99, 'GET'),
(30, '--------------------------------', 'v', '--------------------------------', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '', '', 0, 1, -1, 'GET'),
(31, '--------------------------------', 'v', '--------------------------------', '', '', '', 0, 1, 0, 'GET'),
(32, '知识页面获取疾病列表', 'v', 'comm/diseaselist', '模块 :知识模块\n说明 :获取知识页面的疾病列表\n参数 :\n成功 :\n失败 :', '', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "disease_id": "h_001",\n            "disease_name": "冠心病",\n          \n            "disease_url": "http://192.168.1.200/v3/comm/diseaseitem"\n        },\n        {\n            "disease_id": "h_002",\n            "disease_name": "糖尿病",\n         \n            "disease_url": "http://192.168.1.200/xx"\n        },\n        {\n            "disease_id": "h_003",\n            "disease_name": "痛风",\n        \n            "disease_url": "http://192.168.1.200/xx"\n        },\n        {\n            "disease_id": "h_004",\n            "disease_name": "高血压",\n          \n            "disease_url": "http://192.168.1.200/xx"\n        }\n    ]\n}', 1, 1, -9, 'GET'),
(33, '获取某疾病的一个条目', 'v', 'comm/diseasedetail', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '{"disease_id":"001"\n"item_id":"001"\n}', '{\n    "code": 200,\n    "msg": "succeed",\n    "data": [\n        {\n            "disease_id": "h_001",\n"item_id":"001",\n            "item_title": "冠心病形成原因",\n          "item_content":"冠心病的形成原因是冠心病的形成原因是冠心病的形成原因是冠心病的形成原因是"\n           \n        }\n       \n        \n    ]\n}', 1, 1, -9, 'GET'),
(34, '帮助', 'v', 'user/helps', '模块 :帮助和隐私中获取帮助\n说明 :data中返回帮助页面所在的url\n参数 :\n成功 :\n失败 :', '', '{ "code": 200,\n    "msg": "succeed",\n    "data": "http://"\n}', 1, 1, -99, 'GET'),
(35, '申明', 'v', 'user/declare', '模块 :隐私和帮助模块用户获取申明内容\n说明 :data中返回申明内容所在的url\n参数 :\n成功 :\n失败 :', '', '{ "code": 200,\n    "msg": "succeed",\n    "data": "http://"\n}', 1, 1, -99, 'GET'),
(36, '--------------------------------', 'v', '--------------------------------', '模块 :\n说明 :\n参数 :\n成功 :\n失败 :', '3', '4', 0, 1, -19, 'GET'),
(37, '--------------------------------', 'v', '--------------------------------', '模块 :\n说明 :\n参数 :\n成功 :5\n失败 :', '3', '4', 0, 1, 9000, 'GET'),
(38, '上传每次测量的原始数据 ', 'v', 'heart/measure', '模块 :使用心电设备\n说明 :上传每次测量的原始数据\n参数 :\n成功 :\n失败 :', '{\n"data":"xxxx"\n}', '{ "code": 200,\n    "msg": "succeed1"\n}', 1, 1, 99999, 'GET');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

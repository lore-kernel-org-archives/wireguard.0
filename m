Return-Path: porjo38@yahoo.com.au
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84cb10a3
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 07:16:39 +0000 (UTC)
Received: from sonic304-10.consmr.mail.bf2.yahoo.com
 (sonic304-10.consmr.mail.bf2.yahoo.com [74.6.128.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b88acfb5
 for <wireguard@lists.zx2c4.com>; Thu, 8 Feb 2018 07:16:39 +0000 (UTC)
Date: Thu, 8 Feb 2018 07:22:38 +0000 (UTC)
From: Ian B <porjo38@yahoo.com.au>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <1145047671.838361.1518074558036@mail.yahoo.com>
Subject: wg-quick save -brief unknown
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_838360_380314885.1518074558035"
References: <1145047671.838361.1518074558036.ref@mail.yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_838360_380314885.1518074558035
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When saving config on Centos7 I get this error to the console:
$ wg-quick save wg0
Option "-brief" is unknown, try "ip -help".
[#] wg showconf wg0
sync: ignoring all arguments
As a result, the 'Address =' line is missing from the config file.


------=_Part_838360_380314885.1518074558035
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div><div>When saving config on Centos7 I get this error to the console:</div><div><br></div><div>$ wg-quick save wg0<br>Option "-brief" is unknown, try "ip -help".<br>[#] wg showconf wg0<br>sync: ignoring all arguments</div><div><br></div><div>As a result, the 'Address =' line is missing from the config file.<br></div><br></div></div></body></html>
------=_Part_838360_380314885.1518074558035--

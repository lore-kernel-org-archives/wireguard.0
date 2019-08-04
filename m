Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B23C433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:57:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7091E216F4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=istream-today.20150623.gappssmtp.com header.i=@istream-today.20150623.gappssmtp.com header.b="s91FK5QA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7091E216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=istream.today
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7833544e;
	Mon, 5 Aug 2019 18:57:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56abdb7e
 for <wireguard@lists.zx2c4.com>; Sun, 4 Aug 2019 12:16:10 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc7124bd
 for <wireguard@lists.zx2c4.com>; Sun, 4 Aug 2019 12:16:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so81676824wrm.1
 for <wireguard@lists.zx2c4.com>; Sun, 04 Aug 2019 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=istream-today.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=GU9i4B7sY5nZ/6Ba7q4gapPh+0qIdvrM2CxpVPZzUpg=;
 b=s91FK5QA9CTW7Qv7iXWIgKm4VLg7ONztPf+JBwei00HggxSt7LyFNBBmtPKsxFUDoX
 NuFRAxF2ghJ5sLlzgjwpsF0r1PY5rhpAatnKSIF8L6zTRa7WOBweCyw6icxYSjOoAtS9
 ax4oqOUHD+mo4KKSpivgn0vzhCO7qjTPNdKniuphhV6waIwvDySSidh9ak5aVXdENC/k
 0fweMJqDVgYoy5uu1P/i7p9nCvNCX0SN2FGB+0jjx/Bz4maXhrrJ5boc5W+Dw2l/3Wen
 s93Wfzauk57pNlIfZ7AA4PnAeyhqs2ixQZIwMtosrrfOOU6h7ifb7uOR15f7zxTSNys0
 AX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=GU9i4B7sY5nZ/6Ba7q4gapPh+0qIdvrM2CxpVPZzUpg=;
 b=GdkvSvI7DpoUzQHNi6+557PuzW7Rjk0BDwvkEP7LRN5ujyokmugunSYO9aMmyT7hbD
 kJA8UVRO0r9wYcMj/4jqpru5U5G+qn2aFfFNcVnfbUk0NUcMuUbxi3BbxIqec0enHrIL
 8GjwyUGcvv6/bqGC4ZRhxBjVgxECG1AnZL+buUbNroWhnlnmcGBPgc5gmCO27wjgNw2O
 Tr99fsqpzF5S9VgPUNs6LnDmsjpeFJOnJQB/quoNT4OWyBU6ny70PtTjdyiDxUXEH7SS
 MVUtksgTBVHp54qnquyQx7iF6LhN3iMdLyqWcn4wVF4xJ3HhJvieFDPB46hU1J6MW9ed
 6Pjw==
X-Gm-Message-State: APjAAAXzxZ4UFsTrdzVkADfHhau1hfYWRI+GeiyznR3zgNWQ58hYUyZG
 8lm+6Lv09mXtEI+KP90tggn2rfnP
X-Google-Smtp-Source: APXvYqwyDTmxes3mNJP2Yu3Gl5wwuzbkuNr5BN9qH427cJzRPTwO/f/QluE0RI20ujyAC+02TZkIRA==
X-Received: by 2002:a05:6000:1007:: with SMTP id
 a7mr85681096wrx.172.1564920968859; 
 Sun, 04 Aug 2019 05:16:08 -0700 (PDT)
Received: from DESKTOPHPDKODH ([79.114.21.248])
 by smtp.gmail.com with ESMTPSA id l9sm63504671wmh.36.2019.08.04.05.16.08
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2019 05:16:08 -0700 (PDT)
From: <cristian.c@istream.today>
To: <wireguard@lists.zx2c4.com>
Subject: After I start the Wireguard service,
 VMs from same network are not reachable via local IP
Date: Sun, 4 Aug 2019 15:16:07 +0300
Message-ID: <06fc01d54abe$653f3320$2fbd9960$@istream.today>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdVKvmOVx45qXrL6QPCEDoP97xoMng==
Content-Language: en-us
X-Mailman-Approved-At: Mon, 05 Aug 2019 20:57:13 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1966937544903156560=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

--===============1966937544903156560==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_06FD_01D54AD7.8A8F2A40"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_06FD_01D54AD7.8A8F2A40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Guys,

 

    I have a very strange issue,  and I do not understand why is working
like this..

 

   I have 3 ( A,B ) VMs, 2 in the same network and 1( C ) outside of this
network.

 

 

   A:  Just a VM in the same network with B, not able to ping VM B when
Wireguard is UP on B..

 

3: ens192: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
UP group default qlen 1000

    link/ether 00:50:56:80:2d:e3 brd ff:ff:ff:ff:ff:ff

    inet 10.100.21.3/16 brd 10.100.21.255 scope global noprefixroute ens192

       valid_lft forever preferred_lft forever

    inet 10.100.20.3/16 brd 10.100.20.255 scope global noprefixroute ens192

       valid_lft forever preferred_lft forever

    inet6 fe80::8700:5c89:fbc7:3473/64 scope link noprefixroute

       valid_lft forever preferred_lft forever

 

 

   B : Where Wireguard is installed and connected to C, reachable from both
side over wireguard interface but not other interface, like : 10.100.21.4/16

 

3: ens192: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
UP group default qlen 1000

    link/ether 00:50:56:80:50:e5 brd ff:ff:ff:ff:ff:ff

    inet 10.100.21.4/16 brd 10.100.21.255 scope global noprefixroute ens192

       valid_lft forever preferred_lft forever

    inet 10.100.20.4/16 brd 10.100.20.255 scope global noprefixroute ens192

       valid_lft forever preferred_lft forever

    inet 172.11.0.251/24 brd 172.11.0.255 scope global noprefixroute ens192

       valid_lft forever preferred_lft forever

    inet6 fe80::1003:1bdb:46ee:e16f/64 scope link noprefixroute

       valid_lft forever preferred_lft forever

7: wg1: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN
group default qlen 1000

    link/none

    inet 10.100.20.1/16 scope global wg1

       valid_lft forever preferred_lft forever

    inet6 fe80::d4cf:f1cb:3e3a:dc19/64 scope link flags 800

       valid_lft forever preferred_lft forever

[root@usa-dns ~]#

 

 

C: The VM outside of network where A and B are located, this VM communicate
with B: over wireguard.

 

3: ens192: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
group default qlen 1000

    link/ether 00:50:56:80:00:71 brd ff:ff:ff:ff:ff:ff

    inet 172.11.0.3/24 brd 172.11.0.255 scope global noprefixroute ens192

       valid_lft forever preferred_lft forever

    inet 10.100.21.251/16 brd 10.100.21.255 scope global noprefixroute
ens192

       valid_lft forever preferred_lft forever

    inet6 fe80::250:56ff:fe80:71/64 scope link noprefixroute

       valid_lft forever preferred_lft forever

7: wg1: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN
group default qlen 1000

    link/none

    inet 10.100.20.5/16 scope global wg1

       valid_lft forever preferred_lft forever

    inet6 fe80::cdc3:f783:5066:eb5e/64 scope link flags 800

       valid_lft forever preferred_lft forever

[root@canada-dns ~]#

 

 

 

  Question A: Why the VM A and B are not reachable anymore  via local IP
when Wireguard is turned on.?

 

  Question B: Is there a way to make B and C reachable over any other
interface when the wireguard is enabled? I do not want only via Wireguard
interface 10.100.0.0/16

 

 

Thank you.

Cristian

 

 


------=_NextPart_000_06FD_01D54AD7.8A8F2A40
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hi Guys,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; I have a very strange issue, =
&nbsp;and I do not understand why is working like =
this&#8230;.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; I have 3 ( A,B ) VMs, 2 in the same =
network and 1( C ) outside of this network.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; =
A:&nbsp; Just a VM in the same network with B, not able to ping VM B =
when Wireguard is UP on B..<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>3: ens192: =
&lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state =
UP group default qlen 1000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; link/ether 00:50:56:80:2d:e3 brd =
ff:ff:ff:ff:ff:ff<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; =
inet 10.100.21.3/16 brd 10.100.21.255 scope global noprefixroute =
ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 10.100.20.3/16 brd =
10.100.20.255 scope global noprefixroute ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet6 fe80::8700:5c89:fbc7:3473/64 =
scope link noprefixroute<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;valid_lft forever preferred_lft =
forever<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; =
B : Where Wireguard is installed and connected to C, reachable from both =
side over wireguard interface but not other interface, like : =
10.100.21.4/16<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>3: ens192: =
&lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state =
UP group default qlen 1000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; link/ether 00:50:56:80:50:e5 brd =
ff:ff:ff:ff:ff:ff<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; =
inet 10.100.21.4/16 brd 10.100.21.255 scope global noprefixroute =
ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 10.100.20.4/16 brd =
10.100.20.255 scope global noprefixroute ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 172.11.0.251/24 brd =
172.11.0.255 scope global noprefixroute ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet6 fe80::1003:1bdb:46ee:e16f/64 =
scope link noprefixroute<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p class=3DMsoNormal>7: wg1: =
&lt;POINTOPOINT,NOARP,UP,LOWER_UP&gt; mtu 1420 qdisc noqueue state =
UNKNOWN group default qlen 1000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; link/none<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 10.100.20.1/16 scope global =
wg1<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet6 fe80::d4cf:f1cb:3e3a:dc19/64 =
scope link flags 800<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p class=3DMsoNormal>[root@usa-dns =
~]#<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>C: The VM =
outside of network where A and B are located, this VM communicate with =
B: over wireguard.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>3: ens192: =
&lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP group =
default qlen 1000<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; =
link/ether 00:50:56:80:00:71 brd ff:ff:ff:ff:ff:ff<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 172.11.0.3/24 brd 172.11.0.255 =
scope global noprefixroute ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 10.100.21.251/16 brd =
10.100.21.255 scope global noprefixroute ens192<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet6 fe80::250:56ff:fe80:71/64 =
scope link noprefixroute<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p class=3DMsoNormal>7: wg1: =
&lt;POINTOPOINT,NOARP,UP,LOWER_UP&gt; mtu 1420 qdisc noqueue state =
UNKNOWN group default qlen 1000<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; link/none<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet 10.100.20.5/16 scope global =
wg1<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; inet6 fe80::cdc3:f783:5066:eb5e/64 =
scope link flags 800<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_lft forever =
preferred_lft forever<o:p></o:p></p><p =
class=3DMsoNormal>[root@canada-dns ~]#<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
Question A: Why the VM A and B are not reachable anymore &nbsp;via local =
IP when Wireguard is turned on.?<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
Question B: Is there a way to make B and C reachable over any other =
interface when the wireguard is enabled? I do not want only via =
Wireguard interface 10.100.0.0/16<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Thank =
you.<o:p></o:p></p><p class=3DMsoNormal>Cristian<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_06FD_01D54AD7.8A8F2A40--


--===============1966937544903156560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1966937544903156560==--


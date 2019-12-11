Return-Path: <SRS0=vHM2=2B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88FEC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Dec 2019 07:14:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE35B2053B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Dec 2019 07:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=istream-today.20150623.gappssmtp.com header.i=@istream-today.20150623.gappssmtp.com header.b="bwkkIyBr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE35B2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=istream.today
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57a9d433;
	Wed, 11 Dec 2019 07:14:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c314c717
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 07:14:33 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7fae842
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 07:14:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b6so22822011wrq.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 23:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=istream-today.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:content-language
 :thread-index; bh=mW+9UQTqosNadsPpjEOhhZyuYWr3plMNt3FltNmeh4U=;
 b=bwkkIyBrsOKOogutWIGNoQ0FjYcEevZIwzjeSyrwDrtnwdm/Wmk6Mks7tOe/uLoJi2
 kCTzy1FrYCE3Cr6kc7w8kuM6OsZmR/7bBuN7E2NkdRW1PkY1Q9X4VXMW7xBTsboyR9pY
 a40Ke08ueKBZAbqKA5eTPgWUJ2zjE2Ry9a0raYMD2dqOfarKDvTOHTdM/wfN2KUhKHqS
 aB+yuA9ZoNfhak7bforUsJpTQG307viUrz0Of8TQ36XHDY8oyJkfiNpBk9frKDrnRaYn
 6wzcBwXtjLYvtHGjThZ+eF5f/FgK+5bMgrqkdnrbMdJZLAmwSTrFpBC7F+r0uRbUuLpf
 nHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-language:thread-index;
 bh=mW+9UQTqosNadsPpjEOhhZyuYWr3plMNt3FltNmeh4U=;
 b=cdk2Orvzo0EmUrk/jTwX1jSowVsAKsDi4c/AkopRLRma1xWh0WI44eDzlmo0PqhNxa
 3YhdF9TrJEB8GxnN6zY7OlKRo/DMRRAnVpwO2qnYmNgv0/vCKJkSAdKcgPJpO0cp75PR
 Scz0cFF1E5F7sUT8SgRRwRvszvQtepZT1VvgfTqHTy4XyiasPnX1CjPFUzUG6bsdvBLD
 sFRuHBjxC/iHVGP2X2DmSjm6tVaNOJIclcMnFWn9UAy7Fixhxmajve5S6sQaXJX87WEJ
 3f1k0loyBXfBxsPrr0hFd1CXks3M07eCLF8Y7GlnfxWd23rUTAsRt1IMlZDzKeemyI+9
 g/8Q==
X-Gm-Message-State: APjAAAXo0l5yRbhEPfytzVUyuYLYdzI/waOKa5O728UPrjsTRAnLA6KZ
 N+8QMMmtFhXNp/m1FmerCwS/kHtZ1qA=
X-Google-Smtp-Source: APXvYqzPJKJRYAa/vBeBr3grzMLj60gi5XNZm8VZSGacyt7T0maY+/XtHLzsBb+/jJYf2UeDoHTpHg==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr1968840wrn.5.1576048471711;
 Tue, 10 Dec 2019 23:14:31 -0800 (PST)
Received: from DESKTOPHPDKODH ([188.241.118.162])
 by smtp.gmail.com with ESMTPSA id k4sm1231309wmk.26.2019.12.10.23.14.30
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 23:14:31 -0800 (PST)
From: <cristian.c@istream.today>
To: <wireguard@lists.zx2c4.com>
Subject: Limited speed 100Mbps Down 200Mbps UP
Date: Wed, 11 Dec 2019 09:14:29 +0200
Message-ID: <000a01d5aff2$a17d7d80$e4787880$@istream.today>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdWv8qDnK2T2w2P9T7iUxbGdZPV3LQ==
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
Content-Type: multipart/mixed; boundary="===============0359688400079604598=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

--===============0359688400079604598==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01D5B003.6506E9C0"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_000B_01D5B003.6506E9C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

   I have installed Wireguard on multiple location, servers, on each of this
server I have 1Gbps link, my problem is that I'm not able to get more that
~100-120Mbps for download and ~200Mbps Upload, any idea why?

 

  As a server I use CentOS 7 as for "client" I use Windows 10 with latest
Wireguard client..

 

Thank you in advance,

Cristian

  


------=_NextPart_000_000B_01D5B003.6506E9C0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
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
class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; =
I have installed Wireguard on multiple location, servers, on each of =
this server I have 1Gbps link, my problem is that I&#8217;m not able to =
get more that ~100-120Mbps for download and ~200Mbps Upload, any idea =
why?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; As a server I use CentOS 7 as for =
&#8220;client&#8221; I use Windows 10 with latest Wireguard =
client..<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thank you in advance,<o:p></o:p></p><p =
class=3DMsoNormal>Cristian<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
<o:p></o:p></p></div></body></html>
------=_NextPart_000_000B_01D5B003.6506E9C0--


--===============0359688400079604598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0359688400079604598==--


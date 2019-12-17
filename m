Return-Path: <SRS0=T0jl=2H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1AAC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Dec 2019 12:51:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4127B2072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Dec 2019 12:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=event-datacontact.com header.i=@event-datacontact.com header.b="drfGRk3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4127B2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=event-datacontact.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0166fc37;
	Tue, 17 Dec 2019 12:51:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7d47916
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 12:51:49 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 609fc4b0
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 12:51:49 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id az3so6050042plb.11
 for <wireguard@lists.zx2c4.com>; Tue, 17 Dec 2019 04:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=event-datacontact.com; s=google;
 h=return-receipt-to:from:to:subject:date:message-id:mime-version
 :thread-index:content-language:importance
 :disposition-notification-to;
 bh=MYMMUYnUwsdLV4Xueans1kJpdXY0QTMplCfa1H6XTNI=;
 b=drfGRk3gqxjrbk6+rGO6l7suZG130y6PSZRISlZK/DWJ5765T/ojW1zoatVARjS2Bf
 yNs03JZbMPoj/FOmj5EhvQQM2n/MrBaPg9pCQZBMQ96O/nuKnmcdjXovUHrwti2CiEeu
 J7/qy5PfvV7ayI8NcXsVEQ6Q0M0/WShptb9Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:return-receipt-to:from:to:subject:date
 :message-id:mime-version:thread-index:content-language:importance
 :disposition-notification-to;
 bh=MYMMUYnUwsdLV4Xueans1kJpdXY0QTMplCfa1H6XTNI=;
 b=L7ULHRsgrdonM57/deDN92FDNU3+Cd0BbHgh6s3SGp/7cIc4tDMl3jD3HftOxoar5e
 2r1NW5tSa58XRLGn913DcDcDBRIv0N6mVPE7Ar0uvWlhbezljjnemvHFvzwWJEvecvGq
 Er+ua12xx3Kj4W1frkZbW+poVNNugmBIWTvhCryHZ4t4EG8ARdb6lXtNnMcZmYYqC3t1
 r9AIYLpeyQqYLVsYp9Y55wrrriHBxO7a7mMe8MwlQGfz13jvxjyRJ98sDsdplb9O9B6D
 1ZAVQZMW+vk2KG+oCazm6zUSLA1y5fxUdYQd9N9ZgehZuT41GZKCKug92QT6PGGiIDT1
 CBLg==
X-Gm-Message-State: APjAAAXGLHzTYDpNkJcZdatLeQtbbtpxaC2EaI1eJsLW5WmdPjjMbV6A
 7PX2zsMrEDciyAgZO4dvOw/JOaTPQnU=
X-Google-Smtp-Source: APXvYqxlAkLG1X1oMlXAzsqCGPXP+mKlvkrqtFRYGFso70qw1RmNJO7YMa8zrc3aiIFnEE6M5JOZGw==
X-Received: by 2002:a17:902:6b0a:: with SMTP id
 o10mr21725253plk.15.1576587107607; 
 Tue, 17 Dec 2019 04:51:47 -0800 (PST)
Received: from DESKTOP09TOJCP ([122.171.184.158])
 by smtp.gmail.com with ESMTPSA id k9sm3370460pje.26.2019.12.17.04.51.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 04:51:47 -0800 (PST)
From: "Claire James" <claire.james@event-datacontact.com>
To: <wireguard@lists.zx2c4.com>
Subject: NAHB International Builder's Show visitor database
Date: Tue, 17 Dec 2019 18:21:44 +0530
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAACvD9O/mB6ZNqEFRdavyiffCgAAAGAAAAAAAAAArw/Tv5gemTahBUXWr8on3RDdDAAEAAAAA@event-datacontact.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdW02Lw1AtOQdj20SKmhCF9OKItAcQ==
Content-Language: en-in
Importance: High
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
Content-Type: multipart/mixed; boundary="===============2143826504358843157=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

--===============2143826504358843157==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_49A0_01D5B506.D7A4F140"
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_49A0_01D5B506.D7A4F140
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Would be interested in acquiring the Attendees list?

 

Our list contains Contact Name, Contact Emails, Company Name, Website,
Tittles and Physical Mailing Address.

 

Name: NAHB International Builders' Show 2020

Event: Las Vegas, USA

Date: 21 - 23 Jan 2020   

 

Please let me know your thoughts so that I can send you the cost and further
details.

 

Awaiting your reply

 

Regards

Claire James / Market Researcher 

 


------=_NextPart_000_49A0_01D5B506.D7A4F140
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 14 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
p.xm-8042616826374809676msonospacing, =
li.xm-8042616826374809676msonospacing, =
div.xm-8042616826374809676msonospacing
	{mso-style-name:xm-8042616826374809676msonospacing;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Hi,</span><o:p=
></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Would be =
interested in acquiring the Attendees list?</span><o:p></o:p></p><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Our list =
contains Contact Name, Contact Emails, Company Name, Website, Tittles =
and Physical Mailing Address.</span><o:p></o:p></p><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><b><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Name</span></b=
><span lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>:</span><span =
lang=3DEN-US> </span><span lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>NAHB =
International Builders' Show&nbsp;2020</span><o:p></o:p></p><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><b><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Event</span></=
b><span lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>: Las =
Vegas,&nbsp;USA</span><o:p></o:p></p><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><b><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Date</span></b=
><span lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>: 21 - 23 Jan =
2020&nbsp;&nbsp;&nbsp;</span><o:p></o:p></p><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Please let me =
know your thoughts so that I can send you the cost and further =
details<b>.</b></span><o:p></o:p></p><p =
class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Awaiting your =
reply</span><o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><b><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
/b><o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><b><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Regards</span>=
</b><o:p></o:p></p><p class=3Dxm-8042616826374809676msonospacing =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white'><b><span =
lang=3DEN-US =
style=3D'font-family:"Calibri","sans-serif";color:#244061'>Claire James =
/ Market Researcher </span></b><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_49A0_01D5B506.D7A4F140--


--===============2143826504358843157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2143826504358843157==--


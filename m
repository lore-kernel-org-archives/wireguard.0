Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E75C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25161206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="vKkyXyk3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25161206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfe32229;
	Sun, 25 Aug 2019 15:31:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aae02fab
 for <wireguard@lists.zx2c4.com>; Sun, 4 Aug 2019 12:15:37 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61161c76
 for <wireguard@lists.zx2c4.com>; Sun, 4 Aug 2019 12:15:36 +0000 (UTC)
Received: from LenovoE540 (unknown [192.168.177.65])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: news@lindenberg.one)
 by mailarchive.lindenberg.one (Postfix) with ESMTPSA id 2C731280080
 for <wireguard@lists.zx2c4.com>; Sun,  4 Aug 2019 14:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1564920936;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=ukk9FRcEeEhh6Cmb7IOVHI6jiWynTaGHPAa7utnde2s=;
 b=vKkyXyk3CYqmWgP+MRXSsgrunYbwBRZ6JvHO/F8VltN8ulaAABmevNOpBT2oVBjLX6Fm5U
 bn9nDzmx0IT1H+STd9GCGvSpAh/xZ1ZsYc8hpTgU+kF6HgmPtbVykmQa0ZjC+BfFYqroaq
 XYMGs+Tw9rtRZ0ClDbE6Gu0SNLH2t6LctlpUtnvoXJWJV0fbV90NeiryXhWe93c3AUPCZA
 PfBVXAHsB5nMK6QzMjspWwFzYKvQu48J3wNxJTO7JktDGSPpGYtIUiCv0Rk71EIM8oA8F0
 ibCx7rrY9iw53cDlF4nB6RJJ3cKLCu4joLeCzvJy1fnripPeBQqC12kErhGZiQ==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: <wireguard@lists.zx2c4.com>
Subject: Hyper-V 2019: unable to create wintun device: no interfaces found
Date: Sun, 4 Aug 2019 14:15:25 +0200
Message-ID: <036a01d54abe$4c049cb0$e40dd610$@lindenberg.one>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHCdzYSWm3rA/qwVxwaU3bHRf11SQ==
Content-Language: de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one; 
 s=dkim180429; t=1564920936;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=ukk9FRcEeEhh6Cmb7IOVHI6jiWynTaGHPAa7utnde2s=;
 b=ePpdFdE2tERlMiPKT4wKymr8mDZ8+9EHO6B7fKfDHfpnhiUHnOQbqHXl7Nmf1hpYJQRANq
 ykpsxxAjIXoITcTWGmjtsikC4zimIVjy0qMNgXxw2VNkJx8QqaSDn/EztcSAqWHWUo4Vfe
 eiZtLSyG4WxnWgIP8rBTKAR9T4SbO8dJHkEjbHwVdjou1JIFaNbZzzILrkCRropSGjWi5u
 QnDVonbzv/7l6pl9NADz8giWjRIDDJ8p3WAB2VuI2GuOg9aeAII12Gk9rmc8Hbhh6g6lkI
 KwQJPcOPktQWL8/fDarNwVj5KwMzTsmv5EO2hKGxT0oiwZtj8mpBza4cOtycOQ==
ARC-Seal: i=1; s=dkim180429; d=lindenberg.one; t=1564920936; a=rsa-sha256;
 cv=none;
 b=q5VlDFqk2xJCgtOFKYDR7wCrYlYiL6JDJW2bzbUCETbc7/VYSY3ExdmWrXJn6Heck6E5xdZ+j/rY7MosC8DuyB2QIkDLLy3XbyOLRAaJL9azB7P5Ny88sjTctj4bYMPfBwSqRE3STgwADf6tnuZMiZOptKLItsBEH+YlTCqkguc7B8HARaO50L977ClZ7e5OKbelDCoS+apQAnU64778Oa27myDqfxvu5uucAUYz+QL+RJfXnRcq5U6a36NRYO+WOPKHa3Mn8gq+niy6PR36mw5WZMSSfv92AnBzlKLCv7usUBnGq91R5+EjYf5PxVdjVe6IQc5DXCTtMODRP5HOtw==
ARC-Authentication-Results: i=1; auth=pass smtp.auth=news@lindenberg.one
 smtp.mailfrom=news@lindenberg.one
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:31:49 +0200
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
Content-Type: multipart/mixed; boundary="===============1232640661730699349=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

--===============1232640661730699349==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_036B_01D54ACF.0F8FDDB0"
Content-Language: de

This is a multipart message in MIME format.

------=_NextPart_000_036B_01D54ACF.0F8FDDB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am using Wireguard for quite some time on Ubuntu, and am now trying to =
use
it on Hyper-V 2019 as well. My goal is to set up a VPN between two =
Hyper-V
systems and allow connections between the virtual machines hosted =
(including
Samba AD DCs).

I downloaded and installed Wireguard for Windows, and created a tunnel
configuration on server and client. However when I try to activate any =
of
these, I get the message =93Unable to create Wintun device: no =
interfaces
found=94 on both sides.

To me it doesn=B4t look  like an issue with the configuration but more =
likely
WinTun is missing (tried to download separately, but as it is a .msm I
assume that is included in wireguard installation) or does not work with
Hyper-V 2019.

Any suggestion?

Thanks, Joachim


------=_NextPart_000_036B_01D54ACF.0F8FDDB0
Content-Type: text/html;
	boundary="----=_NextPart_000_0364_01D54AC9.86C3F9D0";
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1"><meta name=3DGenerator content=3D"Microsoft Word =
15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.E-MailFormatvorlage18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DDE =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-US>I am using Wireguard for quite some time on Ubuntu, and am =
now trying to use it on Hyper-V 2019 as well. My goal is to set up a VPN =
between two Hyper-V systems and allow connections between the virtual =
machines hosted (including Samba AD DCs).<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>I downloaded and installed =
Wireguard for Windows, and created a tunnel configuration on server and =
client. However when I try to activate any of these, I get the message =
&#8220;Unable to create Wintun device: no interfaces found&#8221; on =
both sides.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>To me it doesn=B4t look&nbsp; like an issue with the =
configuration but more likely WinTun is missing (tried to download =
separately, but as it is a .msm I assume that is included in wireguard =
installation) or does not work with Hyper-V =
2019.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Any =
suggestion?<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Thanks, Joachim<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_036B_01D54ACF.0F8FDDB0--


--===============1232640661730699349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1232640661730699349==--


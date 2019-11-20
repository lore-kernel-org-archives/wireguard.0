Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55860C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:45:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF82C20678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="tpaZ9Nde"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF82C20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 217df751;
	Wed, 27 Nov 2019 09:45:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc203d56
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Nov 2019 19:04:19 +0000 (UTC)
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b38f138
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Nov 2019 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1574276658; bh=Q0KoZGuEHvRDwMYmbzg12mfGXmM7bj8Hu6JzZQhqXOM=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=tpaZ9NdeWArG2qLzepp6UE87PE3BWv8JZQL0Bzewwm0UmxA6WkVi5C1CwLYzJa+oa0ft/EHOT6dqa4AbleHr89T/QnNPEGMklovPV4GK8K8QUXiDJ0ssayYyaFmquZaaDDInkkkZziuX159zYAOhPrYo8Yq/3p1uDc/gnSVXnlWDmKToVg9O9yXvY88WFtWllMshHpsKZQSsC4ewuZ+rFr0GcS8yXtvTcld1MIP2ejMy254XMOQxFOjrJMfs4floKzYA7o5Jlihl2cgatdMOyYyqOAxOzpAlBoFvtVquHDkttRHD38qr1eADIpIVObm0WSTk5nxk/4YFMp8YQpD7Pg==
X-YMail-OSG: gMOUjboVM1kuAmvD8SDiR1sCQ1.uFu93Eh6ARzkwtrPV4EXIJIxgMLQ4mP4CNbv
 i6meoSDMHzc_f8iTvJBFpdoNoXv8lZkVF7Vn3ldkZQToEAqYf2Y2Jl.3PSKHUKl_EINSliECmitC
 bIV.yY5G8Ub5ixRXy_YPycAfyZlsQOJXgvT_BfXI4nW1KxI6qhEXSYwKoBqe4j3G.lCbc1XeinXh
 nrn5Q7lMC3PE6HDMwihhD5UUDN1yF4gFcH3V1kAZXqziUmjQeCFmoRhCPi3zm3pYeCA0LtGqSOpY
 e.SdpTBGrnTdAcP7F98Tm2EbLNAaCBy3DSIrx8hF3rlaUIWAwDr_vi7Kp8spTzCUqPlrp96r.yLT
 y9ZVixRjT_CqnA9tgU3u191Uq7ZpZXFvS9SjJT8sd_wB4b50Ok.7UOKu5X5n5KHFumG_J3q4o99g
 yWoou2.TUOywfPWZJtM9lqZ3kXf.SztHzfRmlHXv4rYeNTx9f6aFNtBL6VewTUR3muVfls5KHCXK
 V3bLGVkZmweCztnA65SeETD5778Jb6IDjxba3c27aPmj6t1EZOZoXWUKjRacatRuZN4LJiEmTXoa
 D7wSQlTJo37nAUDYiac..4uCZVGn40Lk6I4q81w3SQgX6xYJXzjEKv0m13V4qYvDmugbKSz_vlME
 lsa3b1p1uWQyiN9m_ob_Obw1jC1Q7.idLPOsObyKkNqeZVX8RdW7NG7V_trIRQX6.bwEjzXEoIIq
 yZvrzOfuZ61KDnFWnCjmBgFqOpiGWtzs07aYo1KpIeHGeCNDR7ENWByh4FKpPv5QjFDsyoYuufu5
 .7n_ch07N_A4KVacwl6sJymOqC.2eoE10Tdh1V8U410kxzNSTU07ek4TQgZnnQvBqNIdaJOeaohj
 mtn64SJbgC9FrZTlnKarCr.LqAjRUoVxJYBan_B1g5rQX6tH2Y4w7bfZMaGjiGAqbTW.mGHaawpS
 w7HrhD_GEvgxFSgfckC36.TnSVMl3DQ4qGQyR5_xCiXe9MehcKxXnNLx1pM2uPOhuvyY_gzFIX6e
 b5RmUGvsxndISona7QC3awoTgL5MIagjN_51jEzGVHg_QCT0SIuQ4jHOSWFMqvVW1K9xSGuAmQ4Y
 4Wd3OjPKqCp3EtlzFbmFYJtVcDLbHdn7bERdEaf_6aWo18gaCtfCnvamOyCkoDCkokNDkvI_Tghm
 j7UpWmhtzo910m1L2ZxMRYzQ.6TGyUdnIOmbAmHDzxgflmhNJ7L7aQ6bHX85yZgjH8_QjFUP3eOF
 XeJsU2PBE2jmnqOj80EJsMb4iTt6ARqv3IMuoP3uMs7A0kUj2kq63tgoblSiZksxcdNefM5mbNa_
 Wf8W.E6Cl1YQ5HkGyZ36U2h4SmJZXmegbJC03
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 20 Nov 2019 19:04:18 +0000
Date: Wed, 20 Nov 2019 19:04:16 +0000 (UTC)
From: Mark Nichols <mnichols62@yahoo.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <860712054.4029860.1574276656913@mail.yahoo.com>
Subject: Unable to create Wintun Interface
MIME-Version: 1.0
References: <860712054.4029860.1574276656913.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14728 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:70.0) Gecko/20100101 Firefox/70.0
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:45:52 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Mark Nichols <mnichols62@yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3169929956944028692=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3169929956944028692==
Content-Type: multipart/alternative; 
	boundary="----=_Part_4029859_1482565554.1574276656912"
Content-Length: 3092

------=_Part_4029859_1482565554.1574276656912
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I've just installed Wireguard on Windows 10 64-bit using the msi installer. When I create a tunnel and try to connect, I get:
Unable to create Wintun interface: Error creating interface: Unable to set name of Wintun interface: NciSetConnectionName failed: The requested operation was made in the context of a transaction that is no longer active.
I have uninstalled and reinstalled from the command prompt as the administrator.

I have validated the tunnel works with the configured parameters on a Mac. 

Any suggestions?

Mark Nichols
Discrimination, oppression, and injustice are challenges to be overcome, tools to sharpen our determination, and reflections on the poor character of the oppressor. Lack of opportunity is a calling to create something new and better. If we choose to see circumstances as something to overcome on our way to success instead of allowing them to define us as a victim, we retain the power to pursue our highest destiny. 

------=_Part_4029859_1482565554.1574276656912
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp8578fc45yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">I've just installed Wireguar=
d on Windows 10 64-bit using the msi installer. When I create a tunnel and =
try to connect, I get:</div><div dir=3D"ltr" data-setdir=3D"false"><br></di=
v><div dir=3D"ltr" data-setdir=3D"false"><span>Unable to create Wintun inte=
rface: Error creating interface: Unable to set name of Wintun interface: Nc=
iSetConnectionName failed: The requested operation was made in the context =
of a transaction that is no longer active.</span></div><div dir=3D"ltr" dat=
a-setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data-setdir=3D"f=
alse"><span>I have uninstalled and reinstalled from the command prompt as t=
he administrator.<br></span></div><div dir=3D"ltr" data-setdir=3D"false"><b=
r></div><div dir=3D"ltr" data-setdir=3D"false">I have validated the tunnel =
works with the configured parameters on a Mac. <br></div><div dir=3D"ltr" d=
ata-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Any s=
uggestions?<br></div><div><br></div><div class=3D"ydp8578fc45signature"><di=
v style=3D"font-size:16px;">Mark Nichols<br>






<i><span style=3D"font-size:9.0pt;line-height:107%;font-family:Calibri;">Di=
scrimination, oppression, and injustice are challenges to be overcome, tool=
s to sharpen our determination, and reflections on the poor character of th=
e oppressor. Lack of opportunity is a calling to create something new and b=
etter. If we choose to see circumstances as something to overcome on our wa=
y to success instead of allowing them to define us as a victim, we retain t=
he power to pursue our highest destiny.</span></i> <br></div></div></div></=
div></body></html>
------=_Part_4029859_1482565554.1574276656912--

--===============3169929956944028692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3169929956944028692==--

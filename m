Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A76C43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:39:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E10720678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="cRvXqV+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E10720678
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c823c0a;
	Wed, 27 Nov 2019 09:38:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6271b4b
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Nov 2019 04:38:24 +0000 (UTC)
Received: from sonic305-1.consmr.mail.bf2.yahoo.com
 (sonic305-1.consmr.mail.bf2.yahoo.com [74.6.133.40])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 530d055f
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Nov 2019 04:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1573533503; bh=u9LRMejViL4OZkzhEW5J24J3KzijcgaMR7WHNWeBeLk=;
 h=Date:From:To:Subject:References:From:Subject;
 b=cRvXqV+KQtk1QIxUqpcwlFWn7BzPIHgsPLOJ6BLI9XzK8St2YLMXLpEsVtAyePVypn/BUPKjJyYkrj4iNTKumH0JqRJtLggefsohVxihkQ09MFpc219IUbidqBL+wmerLUc4aJ3YWOGpew8g+fz/JZq0Rwi2ARLv8LUnGaV5VLq/JcyRcpNaOnT2wU/FhGJK6yFHySdPyJtQN1M9LrXU2O/NnqUw6Ic3vqqwUoNAt2sOIKF3PxcCi7GfYJheNi0Zj4Nqo/OMl1WCkoGV3XhJGjGqmiHKdOwe/HFaji3RVYTInUmmmdKuTU8BGs1cQMh5ppFudesFgreDh9FSgorojw==
X-YMail-OSG: 5EyJmjcVM1lN2PVD7LI5wV46w8NUtMtOen3MWUdtG9kqMni3gTnYg3nvMMdfHd2
 _E7CBD3.76pI0sEEkhKdJfIGRsj_C1ff4Tdpa4dQbdWEBhA_Md3w8dwEQtr3vaN8Oi.hgM2tING2
 MP4QSIKFioCrVf6IsfNQ.rxfL46wqXZunDKYu2MTVeJGqq0GaAyKwfE4T_oH5BU6oO_hUNDolC0C
 UbFaRNTiQjyiQ2BPA2SvhMdbT_QToxjP9bnsoE37oa474spwvJ2u4YIxulFDvEM9YWKNCUXbM8Q2
 sSI_SmE9KD6HBFGDmkI3qH..K6YN7Jfe8pxXCY1QqcwlVHcuzljDzh2tEoEl8kDfFL2PrVfezhq1
 3FbHNdmuc3TTk.8moHgouXIrPydPAmyDfJJeB8IahEgOo7xg6yhJqsdQZ6guITQNC4djXd8UgZPz
 9TWruaZbG.tznV8jeBxdzKPURVH3vPAhtlFVNe4SyGwiHrs4JGDgc1.AMM9gx9r3l1tiAQigOiLj
 h.V95fOCe8eZNko8Oa17Ms3lxnK1t5fyCU04cedFO8_kpkMXolkGO2fs58EY.7anR0VI4YK8WiZ.
 N0gDA5gRe3eLqvAQL.oSZ72qpxU06bbAHetoEGM6bjCZg_7og_NLWUqZPNOoJsKsjYpOYDQ9Jgp9
 sO6sOO.MgRvfoqUl72uQ_ByoWuHjBaGSaOj2XORhxU0P1ouIRU8c4ZGerIs.zW8qsCe.zSiP3Ch4
 o_cDKEWdew3HWi5VybmLh2MKPhPUZ8aPf.RDjxLL.77iLI.8nTzHyeF9jpKhdLd_UGWFo9huJVlI
 _YYwBhJpFGZ9a6b4vEyNgJ9hUzmNfs.TMdB9PuTTCZSc2jUs0WF7S1Sp.RPr75eAnXxY0rp3ksYt
 Tj6JJ_wJCzhCk5KjJCx1jI076LiY7xjf9OB.DhQDmynLdQCxWJ_A_zuPqnbOyvNJmsQhaHZdp837
 zIB.8ZulUdn0g3QUK.KVB1wxuXn5tKgL9okPtVwgkCmGw.jIraCk0erhpx62kyginpqoPi.HuHLD
 F.Exr32ahRUDJZsno2X0P.fehsylj2_IyTKDV8zOFdOp9y0MydO44nFIdFt9EVtMBsFmoazTgSg7
 FzWRL2M86hw8VMX8TFMpcbVT.rVCtOah_zAG32R4j.f5IAo9eDzX3rkVqIJLfi4xHRe7bx3ts9A.
 Ugkk0Sb3sX.PtHWugwcs8vkV6YAgR6.Tc9KdcUYYvJwFLMVB.CLyr1sMDfrhP68n9fe4s6s0YSIx
 rj178V9Nr0sk9XEzeN_dfg2oYox388ArGm.P807qVKt5VqmzWP5yF2sUB1UVN51Z66js_WVqnmWo
 pUZPCliB6iiy6VCj7VlEfU9VSDFnV7Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.bf2.yahoo.com with HTTP; Tue, 12 Nov 2019 04:38:23 +0000
Date: Tue, 12 Nov 2019 04:38:22 +0000 (UTC)
From: Richard Reiner <rreiner3@yahoo.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <2078146812.1909563.1573533502212@mail.yahoo.com>
Subject: Windows client "Unable to create Wintun device"
MIME-Version: 1.0
References: <2078146812.1909563.1573533502212.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14680 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97
 Safari/537.36
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:38:54 +0100
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
Content-Type: multipart/mixed; boundary="===============6651516960042618669=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6651516960042618669==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1909562_1610028748.1573533502211"
Content-Length: 3976

------=_Part_1909562_1610028748.1573533502211
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On one of my machines, the Wireguard Windows client 0.0.35 was previously=
=C2=A0working well, but as of today whenever attempting to activate any tun=
nel it generates errors with log messages like:
=C2=A0 2019-11-11 17:32:48.033: [TUN] [tun22] Unable to create Wintun devic=
e: Unable to create Wintun interface: GetStringValueWait(NetCfgInstanceId) =
failed: Timeout waiting for registry value
An uninstall - reboot - reinstall has not corrected this/

The affected machine has received some Windows 10 updates recently as well =
as a VMware Player update.But another machine with the same software instal=
led works fine.
Any thoughts=C2=A0or suggestions?


------=_Part_1909562_1610028748.1573533502211
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp6836c165yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div dir=3D"ltr" data-setdir=3D"false"><div><div class=3D"ydpd9bbaf35adn=
 ydpd9bbaf35ads" data-message-id=3D"#msg-a:r-1579899094284406921" data-lega=
cy-message-id=3D"16e5dc0f2704ef04" style=3D"border-left: none; padding: 0px=
; color: rgb(34, 34, 34); font-family: Roboto, RobotoDraft, Helvetica, Aria=
l, sans-serif; font-size: medium;"><div class=3D"ydpd9bbaf35gs" style=3D"ma=
rgin: 0px; padding: 0px 0px 20px; width: 1084.57px;"><div><div class=3D"ydp=
d9bbaf35ii ydpd9bbaf35gt" style=3D"direction: ltr; margin: 8px 0px 0px; pad=
ding: 0px; position: relative;"><div class=3D"ydpd9bbaf35a3s ydpd9bbaf35aXj=
CH" style=3D"font-stretch: normal; font-size: small; line-height: 1.5; font=
-family: Arial, Helvetica, sans-serif;"><div dir=3D"ltr"><div>On one of my =
machines, the Wireguard Windows client 0.0.35 was previously&nbsp;working w=
ell, but as of today whenever attempting to activate any tunnel it generate=
s errors with log messages like:</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr"><div>&nbsp; 2019-11-11 17:32:48.033: [TUN] [tun22] Unable to creat=
e Wintun device: Unable to create Wintun interface: GetStringValueWait(NetC=
fgInstanceId) failed: Timeout waiting for registry value</div><div><br styl=
e=3D"color: rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, Arial, sa=
ns-serif; font-size: 16px;"></div><div></div><div>An uninstall - reboot - r=
einstall has not corrected this/<br></div><div><br></div><div>The affected =
machine has received some Windows 10 updates recently as well as a VMware P=
layer update.</div><div>But another machine with the same software installe=
d works fine.</div><div><br></div><div>Any thoughts&nbsp;or suggestions?</d=
iv><div class=3D"ydpd9bbaf35yj6qo"></div><div class=3D"ydpd9bbaf35adL"><br>=
</div></div></div><div class=3D"ydpd9bbaf35adL"></div></div></div><div clas=
s=3D"ydpd9bbaf35hi" style=3D"border-bottom-left-radius: 1px; border-bottom-=
right-radius: 1px; padding: 0px; width: auto; background: rgb(242, 242, 242=
); margin: 0px;"></div></div></div><div class=3D"ydpd9bbaf35ajx" style=3D"c=
lear: both;"></div></div><div class=3D"ydpd9bbaf35gA ydpd9bbaf35gt ydpd9bba=
f35acV" style=3D"padding: 0px; width: auto; border-bottom-left-radius: 0px;=
 border-bottom-right-radius: 0px; border-top: none; margin: 0px; background=
-image: initial; background-position: initial; background-size: initial; ba=
ckground-repeat: initial; background-attachment: initial; background-origin=
: initial; background-clip: initial; color: rgb(34, 34, 34); font-family: R=
oboto, RobotoDraft, Helvetica, Arial, sans-serif;"><div class=3D"ydpd9bbaf3=
5gB ydpd9bbaf35xu" style=3D"border-top: 0px; padding: 0px;"><div class=3D"y=
dpd9bbaf35ip ydpd9bbaf35iq" style=3D"clear: both; margin: 0px; padding: 16p=
x 0px; border-top: none;"></div></div></div></div><br></div></div></body></=
html>
------=_Part_1909562_1610028748.1573533502211--

--===============6651516960042618669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6651516960042618669==--

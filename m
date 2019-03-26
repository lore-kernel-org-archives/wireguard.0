Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F906C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:02:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3673C2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBXurwsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3673C2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2efb508b;
	Sat, 6 Apr 2019 12:00:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 672e6653
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2019 21:20:15 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c29989c7
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Mar 2019 21:20:15 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 67so11115945oif.10
 for <wireguard@lists.zx2c4.com>; Tue, 26 Mar 2019 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3Cw925yLUoIFRGTCArL9z2zTDlROqt5Zp5XiGNsltnU=;
 b=UBXurwsBJdN6mXqONzDa1Uwn4BRmhhIB6IXNlVgKNVoKY+D26uxu0CH19H1Mn1I1mq
 dP8+eArwZKE2AbWTlgC8V+XIITFzgKu0W5iMG4570qb4Nlc+qNlLJNO+JQMbI7YKT6fe
 xBwhgwT0OxYmUM4Nw5Up3+OlUidFnibW42g7kNmJTkjkHfmusE/xFrb3RXsbpX+2WEtU
 5E75tlIZs5715bYLY3SpRtTVa4tU50ZDitMN2R+EG00RE0Dp5I6iGeStJGx1Kpmw5ZjT
 wI/Keiywwr8YXHAcXg7rnIyxh3VncOGMz3Sv+oDtA3NYUXP7CKsJCXHrNNM6idQmiPrw
 ngTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3Cw925yLUoIFRGTCArL9z2zTDlROqt5Zp5XiGNsltnU=;
 b=oWO3D+MO0wFnGYEHf/hH/1bwsVfsyvSKRhcwWGOvL8y++RwLOg63GTWynE0+ch45Wy
 smKjpsf3eyhHNbW8Rg9jtEWgU5JM3X8dXrtyRtYcQmNpg+5WFr6wKiOhEkeQHeKQLFdo
 XK88Axd8rXVIjZgFl+RAWCWzKPS4MG8QSGoITh/SdQ8Xf32vTm/McqgqqFnrY4ppSeor
 +q4b/JxC60FA/3R78D7gRjHESibFn9+gLGfGEe7tjWEHqWWLe8EbUe6nKvtAs/afuVU9
 ocGeks27U/A6vU1Dm99J+gVIpqMSEQL1VzLqk9+/c3Dn31S1oxZo0bbKwASqQ2r4Bae+
 1A7A==
X-Gm-Message-State: APjAAAXpjEHr47mztdEg9AWwibP+hbx3L0imEpjuLECpJ0f0zyRIkxrx
 p27m1uZktVUFpxomc1UK91yhsT1BQraHpR7Iqx7AD1Z+
X-Google-Smtp-Source: APXvYqwx3Fx6+gPL5/Hb/OTeDCzg4QRpHYFZP8y2hoz4zgJnARMMbsXTy0/YqbDHg6V00knyBQ0m2kQnWSADt7q++2U=
X-Received: by 2002:aca:378a:: with SMTP id
 e132mr15456794oia.171.1553635280791; 
 Tue, 26 Mar 2019 14:21:20 -0700 (PDT)
MIME-Version: 1.0
From: Robert Ross <rpross3@gmail.com>
Date: Tue, 26 Mar 2019 16:21:09 -0500
Message-ID: <CAGGGmFFSDwPGrfdvBOR_toubEpZG6nrtUk4oMO+FjRWpWSX-aA@mail.gmail.com>
Subject: Wireguard on PiZeroW
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 06 Apr 2019 14:00:28 +0200
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
Content-Type: multipart/mixed; boundary="===============1043804827470883358=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1043804827470883358==
Content-Type: multipart/alternative; boundary="00000000000005ac5e058505e78e"

--00000000000005ac5e058505e78e
Content-Type: text/plain; charset="UTF-8"

Details:
PiZeroW
Linux XXX 4.14.98+ #1200 Tue Feb 12 20:11:02 GMT 2019 armv6l GNU/Linux
Latest kernel-headers
Added rpi-source

I get this error compiling on PiZeroW

~/WireGuard/src# make
  CC [M]  /root/WireGuard/src/main.o
  CC [M]  /root/WireGuard/src/noise.o
  CC [M]  /root/WireGuard/src/device.o
/root/WireGuard/src/device.c: In function 'wg_xmit':
/root/WireGuard/src/device.c:165:3: error: implicit declaration of function
'skb_mark_not_on_list' [-Werror=implicit-function-declaration]
   skb_mark_not_on_list(skb);
   ^~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
scripts/Makefile.build:326: recipe for target
'/root/WireGuard/src/device.o' failed
make[2]: *** [/root/WireGuard/src/device.o] Error 1
Makefile:1535: recipe for target '_module_/root/WireGuard/src' failed
make[1]: *** [_module_/root/WireGuard/src] Error 2
Makefile:37: recipe for target 'module' failed
make: *** [module] Error 2

TIA for any insights. Robert

--00000000000005ac5e058505e78e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Details:</div><div>PiZer=
oW</div><div>Linux XXX 4.14.98+ #1200 Tue Feb 12 20:11:02 GMT 2019 armv6l G=
NU/Linux<br></div><div>Latest kernel-headers</div><div>Added rpi-source</di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">I get this error compiling on=
 PiZeroW<div><br></div><div><div>~/WireGuard/src# make</div><div>=C2=A0 CC =
[M]=C2=A0 /root/WireGuard/src/main.o</div><div>=C2=A0 CC [M]=C2=A0 /root/Wi=
reGuard/src/noise.o</div><div>=C2=A0 CC [M]=C2=A0 /root/WireGuard/src/devic=
e.o</div><div>/root/WireGuard/src/device.c: In function &#39;wg_xmit&#39;:<=
/div><div>/root/WireGuard/src/device.c:165:3: error: implicit declaration o=
f function &#39;skb_mark_not_on_list&#39; [-Werror=3Dimplicit-function-decl=
aration]</div><div>=C2=A0 =C2=A0skb_mark_not_on_list(skb);</div><div>=C2=A0=
 =C2=A0^~~~~~~~~~~~~~~~~~~~</div><div>cc1: some warnings being treated as e=
rrors</div><div>scripts/Makefile.build:326: recipe for target &#39;/root/Wi=
reGuard/src/device.o&#39; failed</div><div>make[2]: *** [/root/WireGuard/sr=
c/device.o] Error 1</div><div>Makefile:1535: recipe for target &#39;_module=
_/root/WireGuard/src&#39; failed</div><div>make[1]: *** [_module_/root/Wire=
Guard/src] Error 2</div><div>Makefile:37: recipe for target &#39;module&#39=
; failed</div><div>make: *** [module] Error 2</div></div><div><br></div><di=
v>TIA for any insights. Robert</div></div></div></div>

--00000000000005ac5e058505e78e--

--===============1043804827470883358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1043804827470883358==--

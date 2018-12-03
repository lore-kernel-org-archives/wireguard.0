Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3230FC04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 03:52:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01B62084C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 03:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR78QuT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01B62084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa229bf7;
	Wed, 5 Dec 2018 03:44:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3563a3d6
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 07:20:45 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f76b96cc
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 07:20:45 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y56so9783655edd.11
 for <wireguard@lists.zx2c4.com>; Sun, 02 Dec 2018 23:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TpHmQqVTDHIG9Z76MxIEkSkmXAuPrBqgsy4EBUbu/sA=;
 b=SR78QuT3dLYxqoVmthDM/XkhUipGZDxusznopV9gF3XrfVyBmv2RW+gX2pkt+GkGqo
 FAR3WUARBQtq+XvekatHV6qt8X3vhZxdQ7k1d3UQhTivVT9UwsG7+QShPt5Z5+bM91vV
 Is0fVBx5FKDW+XLsXJaY9I5YNNecXfxYpFV+Zhz1pVXtCdOzGTVkv1W7CKmAr8GOYQsL
 HhdciO7Q3dmIsfv7uOuhAT8L7XwsbDzbFdgzunXdSSAYsntAmy6DvoICFmQlVRbT+naU
 EMT0BVscWC+LSboV5FkROoqN2y7ZH5WdyuSYdqcGnfSch6u6ucCloXGBa95tyONhdxz6
 tDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TpHmQqVTDHIG9Z76MxIEkSkmXAuPrBqgsy4EBUbu/sA=;
 b=mvDPWrZOZZWrrqY9knZiHzhtvfJKC+Csgsh3FRifHLbuF0Q67dFnNdQhvIYTK0xX7I
 azzTgPY/DKNKrjQv7y5cEsgVzRluesTIKwJRhtkk5ZTCiKcI+O1B2/TCIylIQjnH/6g5
 uqUEVeEWSh33mrjPjNw0ULti5rdO185tFjXDx36VHyle/I3QLqsq2cHcdHuafIWlzS8n
 /OV7ir9hhzYY9KBaThHkF3CgDMoSmr3HoySDmw58A7i7KF7SDcZ5Qx706XMpclHD10or
 tLPTwUviaIoC/E4fcSJ0/8Pnz3zbtHDkO5iMu1Y8C0TTUnMRNiKr7DAkY7mPKt2TXQoK
 KD2g==
X-Gm-Message-State: AA+aEWaXA0XCkat+CNZXFgYFBLSMahAVmuI058BZJTnTwiwy6U07JcXL
 5T9oefYk89M5I1xBanFo6k8YvPqZgaqDVbEr8rnpljHm
X-Google-Smtp-Source: AFSGD/WCO0NjhLvhFHF8fcZFCTsmCLSmeSIQkGgT6HRZTUP3LwnDPmhiZwAEE39X9dOh2q2bnSNeO3nLBTzu3ympDZ0=
X-Received: by 2002:a17:906:c401:: with SMTP id
 u1-v6mr12006369ejz.196.1543822108060; 
 Sun, 02 Dec 2018 23:28:28 -0800 (PST)
MIME-Version: 1.0
From: Du Felix <boost.subscribing@gmail.com>
Date: Mon, 3 Dec 2018 15:28:16 +0800
Message-ID: <CAMbARA6yEQvHEL+X-1+pfOPePu_1ULLLZdr81wC7SW65j=ep+w@mail.gmail.com>
Subject: sysctl of Alpine standard 3.8.1 doesn't support option -r.
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 05 Dec 2018 04:44:17 +0100
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
Content-Type: multipart/mixed; boundary="===============2014948402588944369=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2014948402588944369==
Content-Type: multipart/alternative; boundary="00000000000058f512057c1918a6"

--00000000000058f512057c1918a6
Content-Type: text/plain; charset="UTF-8"

I use alpine standard 3.8.1, which has kernel 4.14.82-0-vanilla.
When I start wireguard as client peer with *wg-quick up client*, It says:


> [#] ip link add client type wireguard
> [#] wg setconf client /dev/fd/63
> [#] ip address add 10.0.0.4/24 dev client
> [#] ip link set mtu 1420 dev client
> [#] ip link set client up
> [#] resolvconf -a client -m 0 -x
> [#] wg set client fwmark 51820
> [#] ip -4 route add 0.0.0.0/0 dev client table 51820
> [#] ip -4 rule add not fwmark 51820 table 51820
> [#] ip -4 rule add table main suppress_prefixlength 0
> sysctl: unrecognized option: r
> BusyBox v1.29.3 (2018-11-21 11:45:56 UTC) multi-call binary.
>
> Usage: sysctl -p [-enq] [FILE...] / [-enqaw] [KEY[=VALUE]]...
>
> Show/set kernel parameters
>
>     -p    Set values from FILEs (default /etc/sysctl.conf)
>     -e    Don't warn about unknown keys
>     -n    Don't show key names
>     -q      Quiet
>     -a    Show all values
>     -w    Set values
>

The client peer cannot ping server peer.

--00000000000058f512057c1918a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I use alpine standard 3.8.1, which h=
as kernel 4.14.82-0-vanilla.</div><div>When I start wireguard as client pee=
r with <b>wg-quick up client</b>, It says:</div><div>=C2=A0</div><div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">[#] ip link add client type wi=
reguard<br>[#] wg setconf client /dev/fd/63<br>[#] ip address add <a href=
=3D"http://10.0.0.4/24">10.0.0.4/24</a> dev client<br>[#] ip link set mtu 1=
420 dev client<br>[#] ip link set client up<br>[#] resolvconf -a client -m =
0 -x<br>[#] wg set client fwmark 51820<br>[#] ip -4 route add <a href=3D"ht=
tp://0.0.0.0/0">0.0.0.0/0</a> dev client table 51820<br>[#] ip -4 rule add =
not fwmark 51820 table 51820<br>[#] ip -4 rule add table main suppress_pref=
ixlength 0<br>sysctl: unrecognized option: r<br>BusyBox v1.29.3 (2018-11-21=
 11:45:56 UTC) multi-call binary.<br><br>Usage: sysctl -p [-enq] [FILE...] =
/ [-enqaw] [KEY[=3DVALUE]]...<br><br>Show/set kernel parameters<br><br>=C2=
=A0=C2=A0=C2=A0 -p=C2=A0=C2=A0=C2=A0 Set values from FILEs (default /etc/sy=
sctl.conf)<br>=C2=A0=C2=A0=C2=A0 -e=C2=A0=C2=A0=C2=A0 Don&#39;t warn about =
unknown keys<br>=C2=A0=C2=A0=C2=A0 -n=C2=A0=C2=A0=C2=A0 Don&#39;t show key =
names<br>=C2=A0=C2=A0=C2=A0 -q=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Quiet<br>=C2=
=A0=C2=A0=C2=A0 -a=C2=A0=C2=A0=C2=A0 Show all values<br>=C2=A0=C2=A0=C2=A0 =
-w=C2=A0=C2=A0=C2=A0 Set values<br></blockquote><div>=C2=A0</div><div>The c=
lient peer cannot ping server peer.<br></div><br></div></div></div>

--00000000000058f512057c1918a6--

--===============2014948402588944369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2014948402588944369==--

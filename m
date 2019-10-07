Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB72FC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:38:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557ED20678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfALCCzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557ED20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98bf7333;
	Wed, 27 Nov 2019 09:38:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b86f07dc
 for <wireguard@lists.zx2c4.com>; Mon, 7 Oct 2019 10:27:14 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3f7dbbb
 for <wireguard@lists.zx2c4.com>; Mon, 7 Oct 2019 10:27:14 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id z6so10510330otb.2
 for <wireguard@lists.zx2c4.com>; Mon, 07 Oct 2019 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DKQLkHFy54OAICf15F7B37usRGaBMtwx2RiemQp7bKw=;
 b=YfALCCzqfd/E1Zn4CYK5JU6128jyrMcCYUJX8P6iTA+uw3lWCNHalk9EHnc/Uu1iyS
 iyLU55NNampboHs8IE6YIhyOO1c22OewSnkpceRb4SnqGe5KoiwHwQWM8R25ibwsToHJ
 +uwVkAsqH42AyDLO6F111tSxM+ClEifrFpCVA7LRk1wj83Xi+4XLgCtZO/2TALJl0gvP
 ucozLYaEkctMnz5lb5Xk0SDrp67tP0EE91UDZbOZ4NQqFmqS5ixBDUsKVCcz3TcW7W44
 ktVx92/LPZ998psXISI+TW37O6ZDviOKHTIlTLqq6N0q3r14nWGvLCmEkwZ7ZC3iVnXc
 wWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DKQLkHFy54OAICf15F7B37usRGaBMtwx2RiemQp7bKw=;
 b=FO1iG6zbsYukKX+SAjSsPu0jpr+wkRtWoRP8Iq7nH+i8XZk7k0mo6PmECja2w9M2NR
 iY0hI31z7UFqp9Z9+EfF9Fj4G5Sw290ObYVSAogPxRqba4GyFc1DEmE3pm3uOZOwWxau
 Ulxsk5A3x9SkRzjLVIcFruxRkStAqgKyfZOHdNXm9KAK1GYzBtcJHiKBcdSaOQVzRF++
 4ede+6JfimqM0iYX+bOc/PHL7wLFUCe+818i7PVh8GYw/ntLwqJbkBsatm/diGN9C1OM
 vub/E6UZ+HTvaSxzxyIDsQm9JEcUAuKyXJ41SO8kCaCP4vPtqhFOWqSARi6S4r3S3c5l
 /RYg==
X-Gm-Message-State: APjAAAXhLn2GPmzK9dRolgn7SxlHRuARl088J79cqWxtF0mMbz78RWdr
 kqWIRmpV9rNILbOmN57UwBlSF75TgPH9k2CF9DYAWSzg
X-Google-Smtp-Source: APXvYqzJTI+pV0lpkXpHWmvTWLRV/joN7GaS8cDTUnRKM6dbUvszagnJ7AGD+/iGyUVb+Mwbt/tdEjXurDtlVGC+2Xs=
X-Received: by 2002:a9d:7dd0:: with SMTP id k16mr7324117otn.53.1570444034217; 
 Mon, 07 Oct 2019 03:27:14 -0700 (PDT)
MIME-Version: 1.0
From: Unnamed Road <semenenvy@gmail.com>
Date: Mon, 7 Oct 2019 13:27:04 +0300
Message-ID: <CAKHog22jaZrMKjf6Gd9pKNxvDATtv4EHoDehbLSUVgVBJY7oeg@mail.gmail.com>
Subject: Wireguard changes the IP address of the destination after a while and
 the session breaks.
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:38:01 +0100
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
Content-Type: multipart/mixed; boundary="===============6989588555112750854=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6989588555112750854==
Content-Type: multipart/alternative; boundary="000000000000cc9b2c05944f7ed2"

--000000000000cc9b2c05944f7ed2
Content-Type: text/plain; charset="UTF-8"

Hello to all!

I encountered a problem while using Wireguard. Here is my traffic dump

tcpdump -vnr wg_02-10-2019_03-17-03.pcap | grep 10.10.10.12 | head -n 10
reading from file wg_02-10-2019_03-17-03.pcap, link-type EN10MB (Ethernet)
    10.10.10.225.49267 > 10.10.10.12.https: UDP, length 96
    10.10.10.12.https > 10.10.10.225.49267: UDP, length 96
    10.10.10.225.49267 > 10.10.10.12.https: UDP, length 96
    10.10.10.12.https > 10.10.10.225.49267: UDP, length 96
    10.10.10.12.https > 10.10.10.225.49267: UDP, length 96

tcpdump -vnr wg_02-10-2019_03-47-03.pcap | grep 10.10.10.10 | head -n 10
reading from file wg_02-10-2019_03-47-03.pcap, link-type EN10MB (Ethernet)
    10.10.10.10.https > 10.10.10.225.49267: UDP, length 148
    10.10.10.10.https > 10.10.10.225.49267: UDP, length 96
    10.10.10.10.https > 10.10.10.225.49267: UDP, length 96
    10.10.10.10.https > 10.10.10.225.49267: UDP, length 148
    10.10.10.10.https > 10.10.10.225.49267: UDP, length 96
    10.10.10.10.https > 10.10.10.225.49267: UDP, length 96

In this place (02-10-2019_03-47-03) where the address in the dump changes
on 10.10.10.10 and my session breaks.

Where is the IP address 10.10.10.12/32 in lo interface (CentOS7) and
10.10.10.10/30 is enp0s25 and i am using OSPF and p2p session with another
IP / 30 (ASBR)

 netstat -puntal | grep 443

udp        0      0 0.0.0.0:443             0.0.0.0:*
    -
udp6       0      0 :::443                  :::*
     -

10.10.10.225  - client with Windows 7 and settings
[Peer]
PublicKey = key
AllowedIPs = 0.0.0.0/1, 128.0.0.0/1
EndPoint = 10.10.10.12:443
PersistentKeepAlive = 30

What am I doing wrong? Why does the destination address change?

--000000000000cc9b2c05944f7ed2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello to all!<br><br>I encountered a problem while using W=
ireguard. Here is my traffic dump<div><br><div>tcpdump -vnr wg_02-10-2019_0=
3-17-03.pcap | grep 10.10.10.12 | head -n 10<br>reading from file wg_02-10-=
2019_03-17-03.pcap, link-type EN10MB (Ethernet)<br>=C2=A0 =C2=A0 10.10.10.2=
25.49267 &gt; 10.10.10.12.https: UDP, length 96<br>=C2=A0 =C2=A0 10.10.10.1=
2.https &gt; 10.10.10.225.49267: UDP, length 96<br>=C2=A0 =C2=A0 10.10.10.2=
25.49267 &gt; 10.10.10.12.https: UDP, length 96<br>=C2=A0 =C2=A0 10.10.10.1=
2.https &gt; 10.10.10.225.49267: UDP, length 96<br>=C2=A0 =C2=A0 10.10.10.1=
2.https &gt; 10.10.10.225.49267: UDP, length 96<br><br>tcpdump -vnr wg_02-1=
0-2019_03-47-03.pcap | grep 10.10.10.10 | head -n 10<br>reading from file w=
g_02-10-2019_03-47-03.pcap, link-type EN10MB (Ethernet)<br>=C2=A0 =C2=A0 10=
.10.10.10.https &gt; 10.10.10.225.49267: UDP, length 148<br>=C2=A0 =C2=A0 1=
0.10.10.10.https &gt; 10.10.10.225.49267: UDP, length 96<br>=C2=A0 =C2=A0 1=
0.10.10.10.https &gt; 10.10.10.225.49267: UDP, length 96<br>=C2=A0 =C2=A0 1=
0.10.10.10.https &gt; 10.10.10.225.49267: UDP, length 148<br>=C2=A0 =C2=A0 =
10.10.10.10.https &gt; 10.10.10.225.49267: UDP, length 96<br>=C2=A0 =C2=A0 =
10.10.10.10.https &gt; 10.10.10.225.49267: UDP, length 96<br></div><div><br=
></div><div>In this place (02-10-2019_03-47-03) where the address in the du=
mp changes on 10.10.10.10 and my session breaks.</div><div><br></div><div>W=
here is the IP address=C2=A0<a href=3D"http://10.10.10.12/32" target=3D"_bl=
ank">10.10.10.12/32</a>=C2=A0in=C2=A0lo interface (CentOS7) and=C2=A0<a hre=
f=3D"http://10.10.10.10/30" target=3D"_blank">10.10.10.10/30</a>=C2=A0is=C2=
=A0enp0s25 and i am using OSPF and p2p session with another IP / 30 (ASBR)<=
br></div><div><br></div><div>=C2=A0netstat -puntal | grep 443<br></div><div=
><br></div><div>udp =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A00=C2=
=A0<a href=3D"http://0.0.0.0:443/" target=3D"_blank">0.0.0.0:443</a>=C2=A0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.0.0.0:* =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>=
udp6 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A00 :::443 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:::* =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-<br></div><div><br></div><div>10.10.10.225=C2=A0 -=C2=A0clien=
t with Windows 7 and settings</div><div>[Peer]<br></div><div>PublicKey =3D =
key</div><div>AllowedIPs =3D=C2=A0<a href=3D"http://0.0.0.0/1" target=3D"_b=
lank">0.0.0.0/1</a>,=C2=A0<a href=3D"http://128.0.0.0/1" target=3D"_blank">=
128.0.0.0/1</a></div><div>EndPoint =3D=C2=A0<a href=3D"http://10.10.10.12:4=
43/" target=3D"_blank">10.10.10.12:443</a></div><div>PersistentKeepAlive =
=3D 30</div><div><br></div><div>What am I doing wrong? Why does the destina=
tion address change?</div></div></div>

--000000000000cc9b2c05944f7ed2--

--===============6989588555112750854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6989588555112750854==--

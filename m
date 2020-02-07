Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C3CC35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:30:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E170722522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVpTZLFl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E170722522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc232eff;
	Sat, 8 Feb 2020 21:25:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 955f1786
 for <WireGuard@lists.zx2c4.com>; Fri, 7 Feb 2020 14:51:59 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f774538a
 for <WireGuard@lists.zx2c4.com>; Fri, 7 Feb 2020 14:51:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g19so2634923eds.11
 for <WireGuard@lists.zx2c4.com>; Fri, 07 Feb 2020 06:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=PnRD0jQrEqnmd9Pv4mGhz6SlmO5KZKSUEanUbRi2dYY=;
 b=LVpTZLFlEMym+DnW6xlY0vx8Ju2kj9yOAfBnTnHs/4co8+F2apXEOp9w3etwx4XWo1
 sE+1RX++aWwskfzIKxGn7HyiiXZbSuPqK925LtrluCcgG9TjCn0RvoBID/hkG6moXaJn
 S+bY9UOwPVobxyjcOlSF2uakpBPjsMwYWovPq/qJpr2PoBqPbaRJ76vdWv7npVt0wIMo
 qYq/boK27wJfMmOTuGCr0uhbZulvhf68M2sx2Q/sQGp7yHPsKPDYNAm2UijBlctvpR84
 kfRU0RMBAicRQhEBEUWoBNkcCRm7cz7rx8cWAwZ8WtvxCWw06Oz/IMdyJLM3BvV7tg+9
 o1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=PnRD0jQrEqnmd9Pv4mGhz6SlmO5KZKSUEanUbRi2dYY=;
 b=S3OR3yY6JNzguKi1jm4spjsvCzNZhshLbF2vnkpE6epn55Gny9p/e4ffnqQQWVD8Vu
 iZvLsQHPuIdviLRvxpqlUbBLQQPDtYSaVDyQ6xv4YxgRhOmDWUTAvZlFtnL/Z8MXlHxI
 1s2SAeSwRoOQnuQFK50L5nvHZS1UbHEErx9+KdRWfGuyqsqJm7YRrFHCU79f1xOraxpe
 xjSsh9MJsyDBSYD5ix8rN82p/GH/zz/MpdiAhHl7Bv7/w01czN10suIJEpdYYCuyHx2J
 ZcSgghFjWrXgWhvHequWoRTn8p/qXdmQ13KO7ZT8uGFfqHSARje4F3gKa/n+JHZa0F3P
 pp+A==
X-Gm-Message-State: APjAAAWq9VNxOJ6boi2NUYbXp0kk01wHcZsMpFOBqADi1qZH1Dqx5wbK
 ZB3VBXPCH8TWfdopaoe2YFMoZRlIfDC5miIYuUgadAuH4g==
X-Google-Smtp-Source: APXvYqwC2R8g9vNloTrzP5pS4pomCdRdZK1aVZzPVyJOUwEXehz1OV7IJBKs8sTymB//5MxPUTAtxAHQEVQk10bzPZo=
X-Received: by 2002:a05:6402:74a:: with SMTP id
 p10mr7800247edy.377.1581087190076; 
 Fri, 07 Feb 2020 06:53:10 -0800 (PST)
MIME-Version: 1.0
From: Kunal Shah <kunalv.shah@gmail.com>
Date: Fri, 7 Feb 2020 20:22:33 +0530
Message-ID: <CAMK_KHiuWijzbna+tBpZfZm9MixXXy5iEXoVh0r3oNmrqC-Ccg@mail.gmail.com>
Subject: wireguard looses internet connection intermittently.
To: WireGuard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:25:32 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kunalv.shah@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3815507595333934457=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3815507595333934457==
Content-Type: multipart/alternative; boundary="00000000000052d0f1059dfd8cc4"

--00000000000052d0f1059dfd8cc4
Content-Type: text/plain; charset="UTF-8"

Hello All,

Just started with wireguard and installation went smoothly. I am planning
to setup wireguard on gcp linux server and connect my ubuntu laptop to use
GCP server as vpn server. Primary requirement is to use GCP server as vpn
server while traveling.

I have got partial success with my setup. I am able to browse few sites and
not able to browse few more. They are very popular sites. For example, I am
able to go to www.yahoo.com but gmail.google.com I get error message that
site took too long to respond.

I have opened udp port 51840 inbound to my GCP server.

My client side (ubuntu laptop)

[Interface]
PrivateKey = <ubuntu laptop privkey>
Address = 192.168.1.2
DNS = 8.8.8.8
[Peer]
PublicKey = <gcp server pubkey>ystemctl start wg-quick@wg0
Endpoint = <gcp server's public ip>:51840
AllowedIPs = 0.0.0.0/0, ::/0

PersistentKeepalive = 25

My server (GCP)

[Interface]
Address = 192.168.1.1
SaveConfig = true
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j
ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i
-j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE
ListenPort = 51840
PrivateKey = <gcp server priv key>

[Peer]
PublicKey = <ubuntu laptop public key>
AllowedIPs = 192.168.1.2/32

with this configuration if I start wireguard on both system using systemctl
start wg-quick@wg0 , I am able to ping 192.168.1.1 from 192.168.1.2 without
any packet drop. However, if I browse through chrome or firefox, for few
sites it gives me error like site took too long to respond. On the same
browser if I try few more sites, they work. Same time when it does not work
from browser, if I ping the site, I get the dns resolved and response for
the ping.

I am not able to troubleshoot further., Are there any other logs I can
refer to? Any idea what could have gone wrong? Has anyone faced this issue
before?

Thanks in advanced for the help.

Kunal Shah

--00000000000052d0f1059dfd8cc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hello All,</div><div class=3D"gmail_default" style=3D"font-fami=
ly:verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:verdana,sans-serif">Just started with wireguard and installation we=
nt smoothly. I am planning to setup wireguard on gcp linux server and conne=
ct my ubuntu laptop to use GCP server as vpn server. Primary requirement is=
 to use GCP server as vpn server while traveling.</div><div class=3D"gmail_=
default" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"g=
mail_default" style=3D"font-family:verdana,sans-serif">I have got partial s=
uccess with my setup. I am able to browse few sites and not able to browse =
few more. They are very popular sites. For example, I am able to go to <a h=
ref=3D"http://www.yahoo.com">www.yahoo.com</a> but <a href=3D"http://gmail.=
google.com">gmail.google.com</a> I get error message that site took too lon=
g to respond.</div><div class=3D"gmail_default" style=3D"font-family:verdan=
a,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:v=
erdana,sans-serif">I have opened udp port 51840 inbound to my GCP server.<b=
r></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f"><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans=
-serif">My client side (ubuntu laptop)</div><div class=3D"gmail_default" st=
yle=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif">[Interface]<br>PrivateKey =3D &=
lt;ubuntu laptop privkey&gt;<br>Address =3D 192.168.1.2<br>DNS =3D 8.8.8.8<=
br>[Peer]<br>PublicKey =3D &lt;gcp server pubkey&gt;ystemctl start wg-quick=
@wg0<br>Endpoint =3D &lt;gcp server&#39;s public ip&gt;:51840<br>AllowedIPs=
 =3D <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>, ::/0<br><br>PersistentKeep=
alive =3D 25</div><div class=3D"gmail_default" style=3D"font-family:verdana=
,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ve=
rdana,sans-serif">My server (GCP)</div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_default" =
style=3D"font-family:verdana,sans-serif">[Interface]<br>Address =3D 192.168=
.1.1<br>SaveConfig =3D true<br>PostUp =3D iptables -A FORWARD -i %i -j ACCE=
PT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o =
ens4 -j MASQUERADE<br>PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; ipt=
ables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j=
 MASQUERADE<br>ListenPort =3D 51840<br>PrivateKey =3D &lt;gcp server priv k=
ey&gt;<br><br>[Peer]<br>PublicKey =3D &lt;ubuntu laptop public key&gt;<br>A=
llowedIPs =3D <a href=3D"http://192.168.1.2/32">192.168.1.2/32</a></div><di=
v class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">wit=
h this configuration if I start wireguard on both system using systemctl st=
art wg-quick@wg0 , I am able to ping 192.168.1.1 from 192.168.1.2 without a=
ny packet drop. However, if I browse through chrome or firefox, for few sit=
es it gives me error like site took too long to respond. On the same browse=
r if I try few more sites, they work. Same time when it does not work from =
browser, if I ping the site, I get the dns resolved and response for the pi=
ng.<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans=
-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:verdana=
,sans-serif">I am not able to troubleshoot further., Are there any other lo=
gs I can refer to? Any idea what could have gone wrong? Has anyone faced th=
is issue before?</div><div class=3D"gmail_default" style=3D"font-family:ver=
dana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-famil=
y:verdana,sans-serif">Thanks in advanced for the help.</div><div class=3D"g=
mail_default" style=3D"font-family:verdana,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif">Kunal Shah<br><=
/div></div>

--00000000000052d0f1059dfd8cc4--

--===============3815507595333934457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3815507595333934457==--

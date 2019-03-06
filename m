Return-Path: <SRS0=xbiu=RJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA0EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 08:41:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C86A2064A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 08:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgxpBC91"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C86A2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07065477;
	Wed, 6 Mar 2019 08:30:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05994f95
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 08:30:34 +0000 (UTC)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 110a7355
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 08:30:34 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id y15so6334666qki.8
 for <wireguard@lists.zx2c4.com>; Wed, 06 Mar 2019 00:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0y54EiFrYvtviF6y0u7R3sr5WuSl3e7a/kDszJAfv4Y=;
 b=mgxpBC91bg8jSGnWwweUhMpttCEpr2mCffyZQSxSNed46LbratjG8zE/qjmrb7SyAy
 NUM13LJivt2ukdeOqB9aSmdXxcUr0KWVRC8OrHkZdojqWXI/QEMUrkQJ4nkKFXnr5NoN
 smxGgNS04wzEbNvMj+xQP4LDLIRd43fW+1I+VEZPQLXV5laQnonvsErZyezLUGIJ6q0V
 WDa6QDn/FakWLaVB3YR/6RaDOtc54BMBOX60EZI4N5bUZeBlorojWsaXdcbEkLyZVpzK
 BE1vqv/dF8wgcBSEMDTCb2c5TmJe7kbi/R4GsUfGkS/F0h8F14GgAiXT4Sou0ydNsfDi
 Ha1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0y54EiFrYvtviF6y0u7R3sr5WuSl3e7a/kDszJAfv4Y=;
 b=IuNS76fXxAyJR+DDbYJpD9Gso1js0nd/DNzIROwJtp07gKYGDurXYkC8puzGGu0ub6
 xXc+P8bs9zf6j0K9F32WNKQEPcp5HreBGMkvn1R8MaXMpUAm/syPdPghWcAC3E4Fc+t5
 3QQExLCWwdGATjSn80qpIvfITyHkKt+jdxgV6wuMf2wQ8wDmzmmGlame2rHTD5P1pLXg
 cq1utO5uvk2ky2leamx1F3XYPMsqtDxMUhkMB+osgz7VBhKO66Cypeo7kg0d5q2Q6wFY
 Tn3vki3RFUcupYGNj/fvBExd8HLk/lKDecM4ycQUuWt5pDm2TaTQCihzJ+GmqYFtvNz9
 2YUw==
X-Gm-Message-State: APjAAAW/AClOO6MpPuYY+YNd2BHL0oqaKv60lhqsoNeIImL02ceXFvft
 eFsDxOHCgOtCOsLg/rXjVoxeLhrI0oYZMnTMYc9lqRQdfkg=
X-Google-Smtp-Source: APXvYqz6aKu3KFdeS4Yle7ltOJ3ChqJ9O7vA4rR7xhGJbYljvWZpua42CvMQ8z8eIYUswJHempXzi4oknehL26UIz/g=
X-Received: by 2002:a05:620a:1194:: with SMTP id
 b20mr4951371qkk.258.1551861660249; 
 Wed, 06 Mar 2019 00:41:00 -0800 (PST)
MIME-Version: 1.0
From: Arpit Gupta <g.arpit@gmail.com>
Date: Wed, 6 Mar 2019 08:40:48 +0000
Message-ID: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
Subject: cant connect to wireguard when router connected to a vpn service
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7282312917267392472=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7282312917267392472==
Content-Type: multipart/alternative; boundary="000000000000fff114058368f261"

--000000000000fff114058368f261
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All

A novice user here and looking for some pointers on how i could fix this
issue.

I had been successfully using wireguard to get access to my local network.
Recently i started looking into a VPN service that i could connect to my
router. So i started playing with mullvad vpn and setup my router to have a
vpn client so all my network traffic goes via vpn. I followed the following
guide https://mullvad.net/en/guides/asus-merlin-and-mullvad-vpn/

Ever since i enabled this i am not able to connect to wireguard from
outside my home network. What is interesting is that when i check the
status of the connections on the server the endpoint entry has the correct
ip but the latest handshake time does not get updated and i no longer have
access to my internal network.

peer: xxxx
  endpoint: 73.xx.xx.xx:1543
  allowed ips: 192.168.100.x/32
  latest handshake: 21 minutes, 24 seconds ago
  transfer: 1.24 MiB received, 5.46 MiB sent

Logs from the wireguard client on my android phone have the following:

03-06 00:23:51.800 28912 17051 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Starting...
03-06 00:23:51.800 28912 28935 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Routine: sequential receiver - started
03-06 00:23:51.800 28912 28935 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Routine: nonce worker - started
03-06 00:23:51.800 28912 28935 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Routine: sequential sender - started
03-06 00:23:51.800 28912 17051 I WireGuard/GoBackend/wg0: Device started
03-06 00:23:52.551 28912 10784 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Sending handshake initiation
03-06 00:23:52.567 28912 10784 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Awaiting keypair
03-06 00:23:57.557 28912 15089 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Sending handshake initiation
03-06 00:24:02.561 28912 10784 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Handshake did not complete after 5 seconds, retrying (try 2)
03-06 00:24:02.561 28912 10784 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=
=A6wCDs) -
Sending handshake initiation


I can connect to my network using ISP or VPN IP. The above issue is what i
am running into when i use the isp ip address to talk to wireguard.

I tried using VPN IP to talk to wireguard but i could not get port
forwarding to work.  I have confirmed port forwarding via mullvad is
working as i am using it for other services. As per the mullvad guide i had
added the following rule to forward the port to wireguard.

#iptables -t nat -A PREROUTING -i tun+ -p udp --dport 9934 -j DNAT
--to-destination 192.168.1.63:54930


So i am not sure if there are additional forwarding rules required and/or
policy rules for the vpn client to get this setup working.

On my server my conf is

[Interface]
Address =3D 192.168.100.1/32
PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -=
j
ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i
-j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort =3D 54930
PrivateKey =3D xxxxx

[Peer]
PublicKey =3D xxxx
AllowedIPs =3D 192.168.100.2/32


on my client my config is

[Interface]
Address =3D 192.168.100.2
PrivateKey =3D xxxxx
ListenPort =3D 21841
DNS =3D 192.168.1.63

[Peer]
PublicKey =3D xxxx
Endpoint =3D ddns:xxx
AllowedIPs =3D 192.168.1.0/24

# This is for if you're behind a NAT and
# want the connection to be kept alive.
PersistentKeepalive =3D 25

--
Arpit

--000000000000fff114058368f261
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi All<br></div><div><br><=
/div><div>A novice user here and looking for some pointers on how i could f=
ix this issue.</div><div><br></div><div>I had been successfully using wireg=
uard to get access to my local network. Recently i started looking into a V=
PN service that i could connect to my router. So i started playing with mul=
lvad vpn and setup my router to have a vpn client so all my network traffic=
 goes via vpn. I followed the following guide <a href=3D"https://mullvad.ne=
t/en/guides/asus-merlin-and-mullvad-vpn/">https://mullvad.net/en/guides/asu=
s-merlin-and-mullvad-vpn/</a></div><div><br></div><div>Ever since i enabled=
 this i am not able to connect to wireguard from outside my home network. W=
hat is interesting is that when i check the status of the connections on th=
e server the endpoint entry has the correct ip but the latest handshake tim=
e does not get updated and i no longer have access to my internal network.<=
br></div><div><br></div><div>peer: xxxx<br>=C2=A0 endpoint: 73.xx.xx.xx:154=
3<br>=C2=A0 allowed ips: 192.168.100.x/32<br>=C2=A0 latest handshake: 21 mi=
nutes, 24 seconds ago<br>=C2=A0 transfer: 1.24 MiB received, 5.46 MiB sent<=
/div><div><br></div><div>Logs from the wireguard client on my android phone=
 have the following:</div><div><br></div><div>03-06 00:23:51.800 28912 1705=
1 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=A6wCDs) - Starting...<br>03-06=
 00:23:51.800 28912 28935 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=A6wCDs=
) - Routine: sequential receiver - started<br>03-06 00:23:51.800 28912 2893=
5 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=A6wCDs) - Routine: nonce worke=
r - started<br>03-06 00:23:51.800 28912 28935 D WireGuard/GoBackend/wg0: pe=
er(vDK2=E2=80=A6wCDs) - Routine: sequential sender - started<br>03-06 00:23=
:51.800 28912 17051 I WireGuard/GoBackend/wg0: Device started<br>03-06 00:2=
3:52.551 28912 10784 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=A6wCDs) - S=
ending handshake initiation<br>03-06 00:23:52.567 28912 10784 D WireGuard/G=
oBackend/wg0: peer(vDK2=E2=80=A6wCDs) - Awaiting keypair<br>03-06 00:23:57.=
557 28912 15089 D WireGuard/GoBackend/wg0: peer(vDK2=E2=80=A6wCDs) - Sendin=
g handshake initiation<br>03-06 00:24:02.561 28912 10784 D WireGuard/GoBack=
end/wg0: peer(vDK2=E2=80=A6wCDs) - Handshake did not complete after 5 secon=
ds, retrying (try 2)<br>03-06 00:24:02.561 28912 10784 D WireGuard/GoBacken=
d/wg0: peer(vDK2=E2=80=A6wCDs) - Sending handshake initiation</div><div><br=
></div><div><br></div><div>I can connect to my network using ISP or VPN IP.=
 The above issue is what i am running into when i use the isp ip address to=
 talk to wireguard.</div><div><br></div><div>I tried using VPN IP to talk t=
o wireguard but i could not get port forwarding to work.=C2=A0 I have confi=
rmed port forwarding via mullvad is working as i am using it for other serv=
ices. As per the mullvad guide i had added the following rule to forward th=
e port to wireguard.<br></div><div><br></div><div>#iptables -t nat -A PRERO=
UTING -i tun+ -p udp --dport 9934 -j DNAT --to-destination <a href=3D"http:=
//192.168.1.63:54930">192.168.1.63:54930</a></div><div><br></div><div><br><=
/div><div>So i am not sure if there are additional forwarding rules require=
d and/or policy rules for the vpn client to get this setup working.<br></di=
v><div><br></div>On my server my conf is<div><br></div><div>[Interface]<br>=
Address =3D <a href=3D"http://192.168.100.1/32">192.168.100.1/32</a><br>Pos=
tUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j A=
CCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<br>PostDown =3D=
 iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; =
iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE<br>ListenPort =3D 5493=
0<br>PrivateKey =3D xxxxx<br><br>[Peer]<br>PublicKey =3D xxxx<br>AllowedIPs=
 =3D <a href=3D"http://192.168.100.2/32">192.168.100.2/32</a></div><div><br=
></div><div><br></div><div>on my client my config is</div><div><br></div><d=
iv>[Interface]<br>Address =3D 192.168.100.2<br>PrivateKey =3D xxxxx<br>List=
enPort =3D 21841<br>DNS =3D 192.168.1.63<br><br>[Peer]<br>PublicKey =3D xxx=
x<br>Endpoint =3D ddns:xxx</div><div>AllowedIPs =3D <a href=3D"http://192.1=
68.1.0/24">192.168.1.0/24</a><br><br># This is for if you&#39;re behind a N=
AT and<br># want the connection to be kept alive.<br>PersistentKeepalive =
=3D 25<br></div><div><br></div></div><div dir=3D"ltr"><div><div><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div></=
div></div></div></div></div></div></div></div></div></div>

--000000000000fff114058368f261--

--===============7282312917267392472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7282312917267392472==--

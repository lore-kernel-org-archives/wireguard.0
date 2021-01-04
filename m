Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89794C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 10:05:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B23224F9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 10:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B23224F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ies.univ-montp2.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c284edfd;
	Tue, 5 Jan 2021 09:54:33 +0000 (UTC)
Received: from mailhub-out4.univ-montp2.fr (mailhub-out4.univ-montp2.fr
 [162.38.101.227])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 616783b6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 21:39:04 +0000 (UTC)
Received: from nodus.ies.univ-montp2.fr (nodus.ies.univ-montp2.fr
 [162.38.134.8])
 by mailhub-out4.univ-montp2.fr (8.15.1/8.15.1) with ESMTP id 104LnunG016365;
 Mon, 4 Jan 2021 22:49:56 +0100
Received: from mauka.ies.univ-montp2.fr (mauka.ies.univ-montp2.fr
 [162.38.134.64])
 by nodus.ies.univ-montp2.fr (Postfix) with ESMTP id 40EDD400B3FC;
 Mon,  4 Jan 2021 22:49:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mauka.ies.univ-montp2.fr (Postfix) with ESMTP id 3EE0E817D2;
 Mon,  4 Jan 2021 22:49:56 +0100 (CET)
Authentication-Results: mauka.ies.univ-montp2.fr (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=ies.univ-montp2.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 ies.univ-montp2.fr; h=subject:subject:message-id:from:from
 :x-mailer:content-transfer-encoding:content-type:content-type
 :date:date:mime-version:received:received; s=mail; t=1609796996;
 x=1611611397; bh=/DSHijBTDaOGJSAoji8qd8YtzNjqdwgJUVwIbE1Rvoo=; b=
 xSWK/KS6XLKAMWTMB+kFEcHZ53O/4k934BJA+d/Y5yNtqwB7lq03rYbadOIPwhPx
 wCOCHEf3MOfyTYGgcnjm3vSI+0BM0jnheWj8HY/2nCpYcG2OzW6bkNFLNaTxoEMq
 gIoGwXI3ZHdIb232ibdDiQC74IQWjxzFalMLIxJc8PA=
X-Virus-Scanned: clamav-milter 0.101.2 at mailhub-out4.univ-montp2.fr
Received: from mauka.ies.univ-montp2.fr ([127.0.0.1])
 by localhost (mauka.ies.univ-montp2.fr [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8xjW_plrFXQN; Mon,  4 Jan 2021 22:49:56 +0100 (CET)
Received: from webmail.ies.univ-montp2.fr (localhost [127.0.0.1])
 by mauka.ies.univ-montp2.fr (Postfix) with ESMTPSA id F25AB817A2;
 Mon,  4 Jan 2021 22:49:55 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 04 Jan 2021 21:49:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From: "Philippe Camps" <philippe.camps@ies.univ-montp2.fr>
Message-ID: <b20148fb5d1e34fbb61b0b56511ae011@ies.univ-montp2.fr>
Subject: Wireguard connections are lost after a few minutes
To: Jason@zx2c4.com, wireguard@lists.zx2c4.com
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 05 Jan 2021 10:54:32 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Wireguard server installed on CentOS 4.18.0-240.1.1.el8_3.x86_64=0A=0Akmo=
d-wireguard-1.0.20201221-1.el8_3.elrepo.x86_64=0Awireguard-tools-1.0.2020=
0827-1.el8.x86_64=0A=0ASince the versions released in september ?, I can =
see that wireguard is unstable (before, it was working fine).=0A=0AThe co=
nnection is lost after a few minutes, as shown in Windows client logs.=0A=
=0AI tried to change the "PersistentKeepalive =3D 25" parameter with 15 o=
r 300, but it did not change the issue=0A=0A2021-01-03 20:06:16.582289: [=
TUN] [vpn-ies] Starting WireGuard/0.3.4 (Windows 10.0.19042; amd64)=0A202=
1-01-03 20:06:16.582289: [TUN] [vpn-ies] Watching network interfaces=0A20=
21-01-03 20:06:16.583305: [TUN] [vpn-ies] Resolving DNS names=0A2021-01-0=
3 20:06:16.583305: [TUN] [vpn-ies] Creating Wintun interface=0A2021-01-03=
 20:06:16.664991: [TUN] [vpn-ies] [Wintun] CreateAdapter: Creating adapte=
r=0A2021-01-03 20:06:16.837870: [TUN] [vpn-ies] Using Wintun/0.10=0A2021-=
01-03 20:06:16.837870: [TUN] [vpn-ies] Enabling firewall rules=0A2021-01-=
03 20:06:16.842192: [TUN] [vpn-ies] Dropping privileges=0A2021-01-03 20:0=
6:16.842192: [TUN] [vpn-ies] Creating interface instance=0A2021-01-03 20:=
06:16.842640: [TUN] [vpn-ies] Routine: encryption worker - started=0A2021=
-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: encryption worker - star=
ted=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: decryption wor=
ker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: hand=
shake worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Rout=
ine: encryption worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn=
-ies] Routine: decryption worker - started=0A2021-01-03 20:06:16.842640: =
[TUN] [vpn-ies] Routine: handshake worker - started=0A2021-01-03 20:06:16=
.842640: [TUN] [vpn-ies] Routine: handshake worker - started=0A2021-01-03=
 20:06:16.842640: [TUN] [vpn-ies] Routine: decryption worker - started=0A=
2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: encryption worker - =
started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: decryption=
 worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: =
handshake worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] =
Routine: encryption worker - started=0A2021-01-03 20:06:16.842640: [TUN] =
[vpn-ies] Routine: decryption worker - started=0A2021-01-03 20:06:16.8426=
40: [TUN] [vpn-ies] Routine: handshake worker - started=0A2021-01-03 20:0=
6:16.842640: [TUN] [vpn-ies] Routine: encryption worker - started=0A2021-=
01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: decryption worker - start=
ed=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: handshake worke=
r - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: encryp=
tion worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routi=
ne: event worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] =
Routine: decryption worker - started=0A2021-01-03 20:06:16.842640: [TUN] =
[vpn-ies] Routine: handshake worker - started=0A2021-01-03 20:06:16.84264=
0: [TUN] [vpn-ies] Routine: encryption worker - started=0A2021-01-03 20:0=
6:16.842640: [TUN] [vpn-ies] Routine: decryption worker - started=0A2021-=
01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: handshake worker - starte=
d=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: encryption worke=
r - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: decryp=
tion worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routi=
ne: handshake worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-i=
es] Routine: encryption worker - started=0A2021-01-03 20:06:16.842640: [T=
UN] [vpn-ies] Routine: decryption worker - started=0A2021-01-03 20:06:16.=
842640: [TUN] [vpn-ies] Routine: handshake worker - started=0A2021-01-03 =
20:06:16.842640: [TUN] [vpn-ies] Routine: encryption worker - started=0A2=
021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: decryption worker - s=
tarted=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: handshake w=
orker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Routine: en=
cryption worker - started=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] R=
outine: decryption worker - started=0A2021-01-03 20:06:16.842640: [TUN] [=
vpn-ies] Routine: handshake worker - started=0A2021-01-03 20:06:16.842640=
: [TUN] [vpn-ies] Routine: TUN reader - started=0A2021-01-03 20:06:16.842=
640: [TUN] [vpn-ies] Setting interface configuration=0A2021-01-03 20:06:1=
6.842640: [TUN] [vpn-ies] UAPI: Updating private key=0A2021-01-03 20:06:1=
6.842640: [TUN] [vpn-ies] UAPI: Removing all peers=0A2021-01-03 20:06:16.=
842640: [TUN] [vpn-ies] UAPI: Transition to peer configuration=0A2021-01-=
03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Creat=
ed=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) =
- UAPI: Updating endpoint=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] p=
eer(Ok2I=E2=80=A6slxw) - UAPI: Updating persistent keepalive interval=0A2=
021-01-03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI=
: Removing all allowedips=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] p=
eer(Ok2I=E2=80=A6slxw) - UAPI: Adding allowedip=0A2021-01-03 20:06:16.842=
640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Adding allowedip=0A2=
021-01-03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI=
: Adding allowedip=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2=
I=E2=80=A6slxw) - UAPI: Adding allowedip=0A2021-01-03 20:06:16.842640: [T=
UN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Adding allowedip=0A2021-01-=
03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Addin=
g allowedip=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - UAPI: Adding allowedip=0A2021-01-03 20:06:16.842640: [TUN] [vp=
n-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Adding allowedip=0A2021-01-03 20:0=
6:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Adding allow=
edip=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw=
) - UAPI: Adding allowedip=0A2021-01-03 20:06:16.842640: [TUN] [vpn-ies] =
peer(Ok2I=E2=80=A6slxw) - UAPI: Adding allowedip=0A2021-01-03 20:06:16.84=
2640: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - UAPI: Adding allowedip=0A=
2021-01-03 20:06:16.842640: [TUN] [vpn-ies] Bringing peers up=0A2021-01-0=
3 20:06:16.844102: [TUN] [vpn-ies] Routine: receive incoming IPv6 - start=
ed=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies] Routine: receive incomin=
g IPv4 - started=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies] UDP bind h=
as been updated=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies] peer(Ok2I=
=E2=80=A6slxw) - Starting...=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies=
] peer(Ok2I=E2=80=A6slxw) - Routine: sequential receiver - started=0A2021=
-01-03 20:06:16.844102: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Routine=
: nonce worker - started=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies] pe=
er(Ok2I=E2=80=A6slxw) - Routine: sequential sender - started=0A2021-01-03=
 20:06:16.844102: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending keepa=
live packet=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies] Monitoring defa=
ult v6 routes=0A2021-01-03 20:06:16.844102: [TUN] [vpn-ies] Binding v6 so=
cket to interface 0 (blackhole=3Dfalse)=0A2021-01-03 20:06:16.844102: [TU=
N] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A202=
1-01-03 20:06:16.844665: [TUN] [vpn-ies] Setting device v6 addresses=0A20=
21-01-03 20:06:16.844665: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Await=
ing keypair=0A2021-01-03 20:06:16.885072: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - Received handshake response=0A2021-01-03 20:06:16.885072: [TUN=
] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Obtained awaited keypair=0A2021-01-=
03 20:06:16.910671: [TUN] [vpn-ies] Monitoring default v4 routes=0A2021-0=
1-03 20:06:16.910671: [TUN] [vpn-ies] Binding v4 socket to interface 13 (=
blackhole=3Dfalse)=0A2021-01-03 20:06:16.910671: [TUN] [vpn-ies] Setting =
device v4 addresses=0A2021-01-03 20:06:16.987609: [TUN] [vpn-ies] Listeni=
ng for UAPI requests=0A2021-01-03 20:06:16.987609: [TUN] [vpn-ies] Startu=
p complete=0A2021-01-03 20:06:44.507851: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - Sending keepalive packet=0A2021-01-03 20:08:17.256150: [TUN] [=
vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01=
-03 20:08:17.295819: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Received h=
andshake response=0A2021-01-03 20:08:17.295819: [TUN] [vpn-ies] peer(Ok2I=
=E2=80=A6slxw) - Sending keepalive packet=0A2021-01-03 20:10:17.788524: [=
TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2=
021-01-03 20:10:17.833181: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Rece=
ived handshake response=0A2021-01-03 20:10:17.833181: [TUN] [vpn-ies] pee=
r(Ok2I=E2=80=A6slxw) - Sending keepalive packet=0A2021-01-03 20:12:18.494=
856: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiati=
on=0A2021-01-03 20:12:18.536965: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) =
- Received handshake response=0A2021-01-03 20:12:18.536965: [TUN] [vpn-ie=
s] peer(Ok2I=E2=80=A6slxw) - Sending keepalive packet=0A2021-01-03 20:14:=
18.566158: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake in=
itiation=0A2021-01-03 20:14:18.605993: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6=
slxw) - Received handshake response=0A2021-01-03 20:14:18.605993: [TUN] [=
vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending keepalive packet=0A2021-01-03 =
20:15:53.280762: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Retrying hands=
hake because we stopped hearing back after 15 seconds=0A2021-01-03 20:15:=
53.280762: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake in=
itiation=0A2021-01-03 20:15:58.367027: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6=
slxw) - Handshake did not complete after 5 seconds, retrying (try 2)=0A20=
21-01-03 20:15:58.367027: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sendi=
ng handshake initiation=0A2021-01-03 20:16:03.462375: [TUN] [vpn-ies] pee=
r(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5 seconds, retryi=
ng (try 3)=0A2021-01-03 20:16:03.462375: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - Sending handshake initiation=0A2021-01-03 20:16:08.491157: [TU=
N] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5=
 seconds, retrying (try 4)=0A2021-01-03 20:16:08.491157: [TUN] [vpn-ies] =
peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20:16=
:13.789316: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not c=
omplete after 5 seconds, retrying (try 5)=0A2021-01-03 20:16:13.789316: [=
TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2=
021-01-03 20:16:14.228388: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Retr=
ying handshake because we stopped hearing back after 15 seconds=0A2021-01=
-03 20:16:18.857410: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake =
did not complete after 5 seconds, retrying (try 2)=0A2021-01-03 20:16:18.=
857410: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initi=
ation=0A2021-01-03 20:16:23.923212: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slx=
w) - Sending handshake initiation=0A2021-01-03 20:16:29.059729: [TUN] [vp=
n-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5 secon=
ds, retrying (try 2)=0A2021-01-03 20:16:29.059729: [TUN] [vpn-ies] peer(O=
k2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20:16:29.52=
8354: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Retrying handshake becaus=
e we stopped hearing back after 15 seconds=0A2021-01-03 20:16:34.197390: =
[TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete afte=
r 5 seconds, retrying (try 2)=0A2021-01-03 20:16:34.197390: [TUN] [vpn-ie=
s] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20=
:16:39.522215: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did no=
t complete after 5 seconds, retrying (try 2)=0A2021-01-03 20:16:39.522215=
: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=
=0A2021-01-03 20:16:44.841365: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - =
Handshake did not complete after 5 seconds, retrying (try 2)=0A2021-01-03=
 20:16:44.841365: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending hands=
hake initiation=0A2021-01-03 20:16:45.186791: [TUN] [vpn-ies] peer(Ok2I=
=E2=80=A6slxw) - Retrying handshake because we stopped hearing back after=
 15 seconds=0A2021-01-03 20:16:49.970248: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - Handshake did not complete after 5 seconds, retrying (try 2)=
=0A2021-01-03 20:16:49.970248: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - =
Sending handshake initiation=0A2021-01-03 20:16:55.295304: [TUN] [vpn-ies=
] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5 seconds, r=
etrying (try 2)=0A2021-01-03 20:16:55.295415: [TUN] [vpn-ies] peer(Ok2I=
=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20:17:00.47326=
0: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete a=
fter 5 seconds, retrying (try 2)=0A2021-01-03 20:17:00.473427: [TUN] [vpn=
-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03=
 20:17:02.246057: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Retrying hand=
shake because we stopped hearing back after 15 seconds=0A2021-01-03 20:17=
:05.797029: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not c=
omplete after 5 seconds, retrying (try 2)=0A2021-01-03 20:17:05.797029: [=
TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2=
021-01-03 20:17:10.871389: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Hand=
shake did not complete after 5 seconds, retrying (try 2)=0A2021-01-03 20:=
17:10.871389: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake=
 initiation=0A2021-01-03 20:17:16.193860: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - Handshake did not complete after 5 seconds, retrying (try 2)=
=0A2021-01-03 20:17:16.193860: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - =
Sending handshake initiation=0A2021-01-03 20:17:18.945461: [TUN] [vpn-ies=
] peer(Ok2I=E2=80=A6slxw) - Awaiting keypair=0A2021-01-03 20:17:19.103950=
: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Retrying handshake because we=
 stopped hearing back after 15 seconds=0A2021-01-03 20:17:21.267490: [TUN=
] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5 =
seconds, retrying (try 2)=0A2021-01-03 20:17:21.267490: [TUN] [vpn-ies] p=
eer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20:17:=
26.474817: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not co=
mplete after 5 seconds, retrying (try 2)=0A2021-01-03 20:17:26.474817: [T=
UN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A20=
21-01-03 20:17:31.804278: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Hands=
hake did not complete after 5 seconds, retrying (try 2)=0A2021-01-03 20:1=
7:31.804278: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake =
initiation=0A2021-01-03 20:17:37.034885: [TUN] [vpn-ies] peer(Ok2I=E2=80=
=A6slxw) - Handshake did not complete after 5 seconds, retrying (try 2)=
=0A2021-01-03 20:17:37.034885: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - =
Sending handshake initiation=0A2021-01-03 20:17:42.206524: [TUN] [vpn-ies=
] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5 seconds, r=
etrying (try 2)=0A2021-01-03 20:17:42.206546: [TUN] [vpn-ies] peer(Ok2I=
=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20:17:47.23986=
2: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete a=
fter 5 seconds, retrying (try 2)=0A2021-01-03 20:17:47.239862: [TUN] [vpn=
-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03=
 20:17:52.261473: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did=
 not complete after 5 seconds, retrying (try 2)=0A2021-01-03 20:17:52.261=
473: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiati=
on=0A2021-01-03 20:17:57.315497: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) =
- Handshake did not complete after 5 seconds, retrying (try 2)=0A2021-01-=
03 20:17:57.315497: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Sending han=
dshake initiation=0A2021-01-03 20:18:02.337395: [TUN] [vpn-ies] peer(Ok2I=
=E2=80=A6slxw) - Handshake did not complete after 5 seconds, retrying (tr=
y 2)=0A2021-01-03 20:18:02.337395: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw=
) - Sending handshake initiation=0A2021-01-03 20:18:07.538901: [TUN] [vpn=
-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete after 5 second=
s, retrying (try 2)=0A2021-01-03 20:18:07.538901: [TUN] [vpn-ies] peer(Ok=
2I=E2=80=A6slxw) - Sending handshake initiation=0A2021-01-03 20:18:12.833=
280: [TUN] [vpn-ies] peer(Ok2I=E2=80=A6slxw) - Handshake did not complete=
 after 5 seconds, retrying (try 2)=0A2021-01-03 20:18:12.833280: [TUN] [v=
pn-ies] peer(Ok2I=E2=80=A6slxw) - Sending handshake initiation=0A=0AAny h=
elp would be appreciate

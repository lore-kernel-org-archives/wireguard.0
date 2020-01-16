Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D84C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:51:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B1C24655
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKjHWdkh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B1C24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad0b56fa;
	Wed, 22 Jan 2020 19:48:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1f3aae1
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 19:40:16 +0000 (UTC)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d19a88bc
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 19:40:15 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id k188so13438382vsc.8
 for <wireguard@lists.zx2c4.com>; Thu, 16 Jan 2020 11:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bp0nrtOCkdHnDJFLPV5/aKsTciZINav3Ux19q1RrSdM=;
 b=lKjHWdkh7BrP6XIDpRsIrGyQHOodwxxFqoEHdU+LEcSnZs7aOtqwl5xq4ZNHjobiEf
 pTokhZxi82/kPO8QpejamYv/z2NxA4CNK74rELK9WkoN5lnquqwydj13WMvjbjV/oomZ
 rvDgv3J33ghU6VE3iWfM/rv5/LLWoB6g2tgjKbGcbxkU/sz5kicWy/yy83FOulDfd9tT
 lZ82SDNpLevn8XST5v5SWsWp9xLnmKzE6p7/RNHQSub3v4ecrXDo1RBwfWUA620/whfF
 TZSkujGFeNp8GsWQxQwuCI4w47E0AYgng7+H/ep21q1lhEeXYFFA2wcJDibA7eetiLix
 7yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bp0nrtOCkdHnDJFLPV5/aKsTciZINav3Ux19q1RrSdM=;
 b=UGi3av4JpWV2zoZmU8tDN/cGFNvCMoNDecTUenDz4cSDLRI6Lt5S4aCbw+kdbayyjp
 rNLcp/Gxi56q31m8GeEtogQHiSAWigQmf58MfwCY6FFXT0PbFziZG+8q3XSVWIO5GmrP
 GtR41fKGLVN/mem8II+DaQAQm3Kuv85cl558P5l3KSop3gYiD62WdUXLPkBefFHtVdBu
 06Ea11d1PBsK+w8DeTTQs84ARqgrxVkKp6hss3McB8DLPC7G8g4A/9aK3xfjWhYIXXBD
 QTaWdc2seY7Ozlxe7Gnti8xvNdV/2U9S448ktP+9xxIjEauhWtQFLroykNSIq5GKtPHB
 N4JA==
X-Gm-Message-State: APjAAAUdPc5YIEr4OxDkF1sU0yWHirpygo9kvRZMbt0e3lKAS5I2YmGC
 0mZbvx26WcGkxb9gbV/cWaCR3OUl6OjYL4ldnO0tLcSEHO4=
X-Google-Smtp-Source: APXvYqywTOt1Zsi/jsf+SGaUn/QdQTNuni/L+Q1mkIdsEBSghL0gtvHhhaqTcOBzzulSDe7gLJIB3giQaF51BcqeRhc=
X-Received: by 2002:a67:2fc4:: with SMTP id v187mr2734275vsv.186.1579203615134; 
 Thu, 16 Jan 2020 11:40:15 -0800 (PST)
MIME-Version: 1.0
From: Peter Selc <peter.selc@gmail.com>
Date: Thu, 16 Jan 2020 19:39:37 +0000
Message-ID: <CAPDdT2w3_t=sC=_FrcDX5OaTkT0vuPXKCtbFTB9O_Hq3frb4qA@mail.gmail.com>
Subject: After win2019 server reboot, Wireguard tunnel doesn't start
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:09 +0100
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
Content-Type: multipart/mixed; boundary="===============2579271910341938658=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2579271910341938658==
Content-Type: multipart/alternative; boundary="0000000000008215c8059c46febf"

--0000000000008215c8059c46febf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm running version 0.0.38 on Windows 2019 server. Admin user logs in,
starts the tunnel via GUI, disconnects from RDP session. Clients can
connect.

After the server is rebooted (windows updates), the tunnel doesn't come up
automatically as it should, error is:

2020-01-15 15:00:56.197: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending k=
eepalive
packet
2020-01-15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending k=
eepalive
packet
2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Receiving
keepalive packet
2020-01-15 15:01:49.729: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending k=
eepalive
packet
2020-01-15 15:09:43.727: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Removing =
all
keys, since we haven't received a new one in 540 seconds

-- reboot happens here--

2020-01-15 17:19:00.356: [MGR] Exited UI process for user
'admin_user@winserver' for session 2 with status 40010004
2020-01-15 17:19:01.417: [MGR] Starting UI process for user
=E2=80=98admin_user@winserver=E2=80=99 for session 2
2020-01-15 17:19:02.350: [MGR] Exited UI process for user
'admin_user@winserver' for session 2 with status 1
2020-01-15 17:19:46.142: [TUN] [Server] Device closing
2020-01-15 17:19:46.146: [TUN] [Server] Routine: TUN reader - stopped
2020-01-15 17:19:46.217: [TUN] [Server] Routine: event worker - stopped
2020-01-15 17:19:46.222: [TUN] [Server] Routine: receive incoming IPv4 -
stopped
2020-01-15 17:19:46.223: [TUN] [Server] Routine: receive incoming IPv6 -
stopped
2020-01-15 17:19:46.223: [TUN] [Server] Routine: decryption worker - stoppe=
d
2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stopping.=
..
2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine:
sequential receiver - stopped
2020-01-15 17:19:46.225: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine: =
nonce
worker - stopped
2020-01-15 17:19:46.225: [TUN] [Server] Routine: encryption worker - stoppe=
d
2020-01-15 17:19:46.225: [TUN] [Server] Routine: handshake worker - stopped
2020-01-15 17:19:46.226: [TUN] [Server] Routine: encryption worker - stoppe=
d
2020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker - stoppe=
d
2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake worker - stopped
2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine:
sequential sender - stopped
2020-01-15 17:19:46.229: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Stopping.=
..
2020-01-15 17:19:46.230: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine:
sequential receiver - stopped
2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine:
sequential sender - stopped
2020-01-15 17:19:46.280: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine: =
nonce
worker - stopped
2020-01-15 17:19:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stopping.=
..
2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine:
sequential receiver - stopped
2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine:
sequential sender - stopped
2020-01-15 17:19:46.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: =
nonce
worker - stopped
2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Stopping.=
..
2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine:
sequential receiver - stopped
2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine: =
nonce
worker - stopped
2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine:
sequential sender - stopped
2020-01-15 17:19:46.324: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Stopping.=
..
2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine:
sequential receiver - stopped
2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: =
nonce
worker - stopped
2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine:
sequential sender - stopped
2020-01-15 17:19:46.326: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Stopping.=
..
2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine:
sequential receiver - stopped
2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine:
sequential sender - stopped
2020-01-15 17:19:46.328: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine: =
nonce
worker - stopped
2020-01-15 17:19:46.328: [TUN] [Server] Interface closed
2020-01-15 17:19:46.328: [TUN] [Server] Shutting down
2020-01-15 17:21:00.637: [MGR] Starting WireGuard/0.0.38 (Windows Server
10.0.17763; amd64)
2020-01-15 17:21:00.637: [TUN] [Server] Starting WireGuard/0.0.38 (Windows
Server 10.0.17763; amd64)
2020-01-15 17:21:00.760: [TUN] [Server] SCM locked for 27s by .\NT Service
Control Manager, marking service as started
2020-01-15 17:21:00.784: [TUN] [Server] Watching network interfaces
2020-01-15 17:21:00.837: [TUN] [Server] Resolving DNS names
2020-01-15 17:21:01.033: [TUN] [Server] Creating Wintun interface
2020-01-15 17:21:08.159: [TUN] [Server] Unable to create Wintun interface:
Error creating interface: SetupDiCallClassInstaller(DIF_REGISTERDEVICE)
failed: winapi error #3758096907
2020-01-15 17:21:08.207: [TUN] [Server] Shutting down
2020-01-15 17:21:11.161: [MGR] Removing Wintun interface =E2=80=98Local Are=
a
Connection=E2=80=99 because determining tunnel service name failed: Tunnel =
name is
not valid

Is this some known behaviour with a known fix, or not supported yet?
Many thanks,

Peter

--0000000000008215c8059c46febf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div><br></div><div>I&#39;m running v=
ersion 0.0.38 on Windows 2019 server. Admin user logs in, starts the tunnel=
 via GUI, disconnects from RDP session. Clients can connect.</div><div><br>=
</div><div>After the server is rebooted (windows updates), the tunnel doesn=
&#39;t come up automatically as it should, error is:</div><div><br></div><d=
iv>2020-01-15 15:00:56.197: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendin=
g keepalive packet<br>2020-01-15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=
=80=A69iko) - Sending keepalive packet<br>2020-01-15 15:01:31.236: [TUN] [S=
erver] peer(SuXT=E2=80=A69iko) - Receiving keepalive packet<br>2020-01-15 1=
5:01:49.729: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending keepalive pac=
ket<br>2020-01-15 15:09:43.727: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Re=
moving all keys, since we haven&#39;t received a new one in 540 seconds<br>=
<br>-- reboot happens here--<br><br>2020-01-15 17:19:00.356: [MGR] Exited U=
I process for user &#39;admin_user@winserver&#39; for session 2 with status=
 40010004<br>2020-01-15 17:19:01.417: [MGR] Starting UI process for user =
=E2=80=98admin_user@winserver=E2=80=99 for session 2<br>2020-01-15 17:19:02=
.350: [MGR] Exited UI process for user &#39;admin_user@winserver&#39; for s=
ession 2 with status 1<br>2020-01-15 17:19:46.142: [TUN] [Server] Device cl=
osing<br>2020-01-15 17:19:46.146: [TUN] [Server] Routine: TUN reader - stop=
ped<br>2020-01-15 17:19:46.217: [TUN] [Server] Routine: event worker - stop=
ped<br>2020-01-15 17:19:46.222: [TUN] [Server] Routine: receive incoming IP=
v4 - stopped<br>2020-01-15 17:19:46.223: [TUN] [Server] Routine: receive in=
coming IPv6 - stopped<br>2020-01-15 17:19:46.223: [TUN] [Server] Routine: d=
ecryption worker - stopped<br>2020-01-15 17:19:46.224: [TUN] [Server] peer(=
1WB6=E2=80=A6G/xk) - Stopping...<br>2020-01-15 17:19:46.224: [TUN] [Server]=
 peer(1WB6=E2=80=A6G/xk) - Routine: sequential receiver - stopped<br>2020-0=
1-15 17:19:46.225: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine: nonce =
worker - stopped<br>2020-01-15 17:19:46.225: [TUN] [Server] Routine: encryp=
tion worker - stopped<br>2020-01-15 17:19:46.225: [TUN] [Server] Routine: h=
andshake worker - stopped<br>2020-01-15 17:19:46.226: [TUN] [Server] Routin=
e: encryption worker - stopped<br>2020-01-15 17:19:46.228: [TUN] [Server] R=
outine: decryption worker - stopped<br>2020-01-15 17:19:46.228: [TUN] [Serv=
er] Routine: handshake worker - stopped<br>2020-01-15 17:19:46.229: [TUN] [=
Server] peer(1WB6=E2=80=A6G/xk) - Routine: sequential sender - stopped<br>2=
020-01-15 17:19:46.229: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Stopping..=
.<br>2020-01-15 17:19:46.230: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Rout=
ine: sequential receiver - stopped<br>2020-01-15 17:19:46.268: [TUN] [Serve=
r] peer(akUl=E2=80=A6uaHM) - Routine: sequential sender - stopped<br>2020-0=
1-15 17:19:46.280: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine: nonce =
worker - stopped<br>2020-01-15 17:19:46.319: [TUN] [Server] peer(UUvS=E2=80=
=A6DwEo) - Stopping...<br>2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=
=E2=80=A6DwEo) - Routine: sequential receiver - stopped<br>2020-01-15 17:19=
:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: sequential sende=
r - stopped<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(UUvS=E2=80=A6Dw=
Eo) - Routine: nonce worker - stopped<br>2020-01-15 17:19:46.322: [TUN] [Se=
rver] peer(SuXT=E2=80=A69iko) - Stopping...<br>2020-01-15 17:19:46.322: [TU=
N] [Server] peer(SuXT=E2=80=A69iko) - Routine: sequential receiver - stoppe=
d<br>2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Rout=
ine: nonce worker - stopped<br>2020-01-15 17:19:46.323: [TUN] [Server] peer=
(SuXT=E2=80=A69iko) - Routine: sequential sender - stopped<br>2020-01-15 17=
:19:46.324: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Stopping...<br>2020-01=
-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: sequent=
ial receiver - stopped<br>2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=
=E2=80=A6401s) - Routine: nonce worker - stopped<br>2020-01-15 17:19:46.326=
: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: sequential sender - sto=
pped<br>2020-01-15 17:19:46.326: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - S=
topping...<br>2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xn=
c) - Routine: sequential receiver - stopped<br>2020-01-15 17:19:46.327: [TU=
N] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine: sequential sender - stopped<=
br>2020-01-15 17:19:46.328: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routin=
e: nonce worker - stopped<br>2020-01-15 17:19:46.328: [TUN] [Server] Interf=
ace closed<br>2020-01-15 17:19:46.328: [TUN] [Server] Shutting down<br>2020=
-01-15 17:21:00.637: [MGR] Starting WireGuard/0.0.38 (Windows Server 10.0.1=
7763; amd64)<br>2020-01-15 17:21:00.637: [TUN] [Server] Starting WireGuard/=
0.0.38 (Windows Server 10.0.17763; amd64)<br>2020-01-15 17:21:00.760: [TUN]=
 [Server] SCM locked for 27s by .\NT Service Control Manager, marking servi=
ce as started<br>2020-01-15 17:21:00.784: [TUN] [Server] Watching network i=
nterfaces<br>2020-01-15 17:21:00.837: [TUN] [Server] Resolving DNS names<br=
>2020-01-15 17:21:01.033: [TUN] [Server] Creating Wintun interface<br>2020-=
01-15 17:21:08.159: [TUN] [Server] Unable to create Wintun interface: Error=
 creating interface: SetupDiCallClassInstaller(DIF_REGISTERDEVICE) failed: =
winapi error #3758096907<br>2020-01-15 17:21:08.207: [TUN] [Server] Shuttin=
g down<br>2020-01-15 17:21:11.161: [MGR] Removing Wintun interface =E2=80=
=98Local Area Connection=E2=80=99 because determining tunnel service name f=
ailed: Tunnel name is not valid</div><div><br></div><div>Is this some known=
 behaviour with a known fix, or not supported yet?<br></div><div>Many thank=
s,</div><div><br></div><div>Peter<br></div></div>

--0000000000008215c8059c46febf--

--===============2579271910341938658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2579271910341938658==--

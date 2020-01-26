Return-Path: <SRS0=2alZ=3P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED62C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Jan 2020 10:57:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBCC2075D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Jan 2020 10:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h/IsaKHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBCC2075D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b890ef12;
	Sun, 26 Jan 2020 10:57:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 155aeb81
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 10:57:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 202e95f6
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 10:57:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c9108fb
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ZLjguUL7Cuz1hdAEsMUVdNuWlbU=; b=h/IsaK
 Hm6qmluIuPOSIUWcVpuOvGPPPX1Ui4+oe/GlytUUrBWmEPfDcoOLn+qZdFL9OPeo
 HleyBGJus+9WdbqGqvu9r3DFwfZb4kzUo73mMKQhMrtmOM8M5nZ1LqjKJR1giXAt
 p3OKaQj1sS8KXmwK8zGWPX4xwIcPsJmtJ8XypGKzEqeyY3X6cFUISvOlxAZ9GWYQ
 W9wEybQWm4Yvp6WpD41j1bS00/Y1u7KNJyY7dgo2l+UDYAfPH4OYiqo2ypnzAtbH
 VaCWxDUMfkbnB1Mbuln2Y1yC9j12VqoXsqwFft1Jwrv4Z28XJe81HIdnZrTWGiso
 F+kZv58lWmwESj4Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b05e0fd0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 09:55:49 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q81so4065209oig.0
 for <wireguard@lists.zx2c4.com>; Sun, 26 Jan 2020 02:57:24 -0800 (PST)
X-Gm-Message-State: APjAAAVCYp552CAihz8dDLqMeyGuIer3zuHx/rMX4nxh79HQL/e1WKBz
 aooQswtyWmUpLmu0xuSdyQRm/YnAyo8S7izqwKY=
X-Google-Smtp-Source: APXvYqwa8XC/wtSym6IS+1L+gKdKjyUtiOcCWo1BU09n3/V6uBwi8RCGG9h27vn9wnkVhfrRGB7kzhmZ0VwXP6C1eIM=
X-Received: by 2002:aca:815:: with SMTP id 21mr4715118oii.52.1580036243801;
 Sun, 26 Jan 2020 02:57:23 -0800 (PST)
MIME-Version: 1.0
References: <CAPDdT2w3_t=sC=_FrcDX5OaTkT0vuPXKCtbFTB9O_Hq3frb4qA@mail.gmail.com>
In-Reply-To: <CAPDdT2w3_t=sC=_FrcDX5OaTkT0vuPXKCtbFTB9O_Hq3frb4qA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 26 Jan 2020 11:57:12 +0100
X-Gmail-Original-Message-ID: <CAHmME9oZNrRoniYA_ReUGsFLmxo0gV3jM-E+DFB6duKSZtOuHw@mail.gmail.com>
Message-ID: <CAHmME9oZNrRoniYA_ReUGsFLmxo0gV3jM-E+DFB6duKSZtOuHw@mail.gmail.com>
Subject: Re: After win2019 server reboot, Wireguard tunnel doesn't start
To: Peter Selc <peter.selc@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8238641807784021770=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8238641807784021770==
Content-Type: multipart/alternative; boundary="0000000000000b4c12059d08db2c"

--0000000000000b4c12059d08db2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report. Is this reproducible every time you reboot your
system, or only that one time after Windows Update?

If the latter, do you have a list of what was being updated?

Thanks,
Jason

On Wed, Jan 22, 2020, 20:51 Peter Selc <peter.selc@gmail.com> wrote:

> Hello all,
>
> I'm running version 0.0.38 on Windows 2019 server. Admin user logs in,
> starts the tunnel via GUI, disconnects from RDP session. Clients can
> connect.
>
> After the server is rebooted (windows updates), the tunnel doesn't come u=
p
> automatically as it should, error is:
>
> 2020-01-15 15:00:56.197: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending
> keepalive packet
> 2020-01-15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending
> keepalive packet
> 2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Receivi=
ng
> keepalive packet
> 2020-01-15 15:01:49.729: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending
> keepalive packet
> 2020-01-15 15:09:43.727: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Removin=
g all
> keys, since we haven't received a new one in 540 seconds
>
> -- reboot happens here--
>
> 2020-01-15 17:19:00.356: [MGR] Exited UI process for user
> 'admin_user@winserver' for session 2 with status 40010004
> 2020-01-15 17:19:01.417: [MGR] Starting UI process for user
> =E2=80=98admin_user@winserver=E2=80=99 for session 2
> 2020-01-15 17:19:02.350: [MGR] Exited UI process for user
> 'admin_user@winserver' for session 2 with status 1
> 2020-01-15 17:19:46.142: [TUN] [Server] Device closing
> 2020-01-15 17:19:46.146: [TUN] [Server] Routine: TUN reader - stopped
> 2020-01-15 17:19:46.217: [TUN] [Server] Routine: event worker - stopped
> 2020-01-15 17:19:46.222: [TUN] [Server] Routine: receive incoming IPv4 -
> stopped
> 2020-01-15 17:19:46.223: [TUN] [Server] Routine: receive incoming IPv6 -
> stopped
> 2020-01-15 17:19:46.223: [TUN] [Server] Routine: decryption worker -
> stopped
> 2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stoppin=
g...
> 2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine=
:
> sequential receiver - stopped
> 2020-01-15 17:19:46.225: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine=
: nonce
> worker - stopped
> 2020-01-15 17:19:46.225: [TUN] [Server] Routine: encryption worker -
> stopped
> 2020-01-15 17:19:46.225: [TUN] [Server] Routine: handshake worker - stopp=
ed
> 2020-01-15 17:19:46.226: [TUN] [Server] Routine: encryption worker -
> stopped
> 2020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker -
> stopped
> 2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake worker - stopp=
ed
> 2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine=
:
> sequential sender - stopped
> 2020-01-15 17:19:46.229: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Stoppin=
g...
> 2020-01-15 17:19:46.230: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine=
:
> sequential receiver - stopped
> 2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine=
:
> sequential sender - stopped
> 2020-01-15 17:19:46.280: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine=
: nonce
> worker - stopped
> 2020-01-15 17:19:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stoppin=
g...
> 2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine=
:
> sequential receiver - stopped
> 2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine=
:
> sequential sender - stopped
> 2020-01-15 17:19:46.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine=
: nonce
> worker - stopped
> 2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Stoppin=
g...
> 2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine=
:
> sequential receiver - stopped
> 2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine=
: nonce
> worker - stopped
> 2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine=
:
> sequential sender - stopped
> 2020-01-15 17:19:46.324: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Stoppin=
g...
> 2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine=
:
> sequential receiver - stopped
> 2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine=
: nonce
> worker - stopped
> 2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine=
:
> sequential sender - stopped
> 2020-01-15 17:19:46.326: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Stoppin=
g...
> 2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine=
:
> sequential receiver - stopped
> 2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine=
:
> sequential sender - stopped
> 2020-01-15 17:19:46.328: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine=
: nonce
> worker - stopped
> 2020-01-15 17:19:46.328: [TUN] [Server] Interface closed
> 2020-01-15 17:19:46.328: [TUN] [Server] Shutting down
> 2020-01-15 17:21:00.637: [MGR] Starting WireGuard/0.0.38 (Windows Server
> 10.0.17763; amd64)
> 2020-01-15 17:21:00.637: [TUN] [Server] Starting WireGuard/0.0.38 (Window=
s
> Server 10.0.17763; amd64)
> 2020-01-15 17:21:00.760: [TUN] [Server] SCM locked for 27s by .\NT Servic=
e
> Control Manager, marking service as started
> 2020-01-15 17:21:00.784: [TUN] [Server] Watching network interfaces
> 2020-01-15 17:21:00.837: [TUN] [Server] Resolving DNS names
> 2020-01-15 17:21:01.033: [TUN] [Server] Creating Wintun interface
> 2020-01-15 17:21:08.159: [TUN] [Server] Unable to create Wintun interface=
:
> Error creating interface: SetupDiCallClassInstaller(DIF_REGISTERDEVICE)
> failed: winapi error #3758096907
> 2020-01-15 17:21:08.207: [TUN] [Server] Shutting down
> 2020-01-15 17:21:11.161: [MGR] Removing Wintun interface =E2=80=98Local A=
rea
> Connection=E2=80=99 because determining tunnel service name failed: Tunne=
l name is
> not valid
>
> Is this some known behaviour with a known fix, or not supported yet?
> Many thanks,
>
> Peter
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000000b4c12059d08db2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the report. Is this reproducible every time yo=
u reboot your system, or only that one time after Windows Update?<div dir=
=3D"auto"><br></div><div dir=3D"auto">If the latter, do you have a list of =
what was being updated?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks,</div><div dir=3D"auto">Jason</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 22, 2020, 20:51 Peter=
 Selc &lt;<a href=3D"mailto:peter.selc@gmail.com">peter.selc@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>He=
llo all,</div><div><br></div><div>I&#39;m running version 0.0.38 on Windows=
 2019 server. Admin user logs in, starts the tunnel via GUI, disconnects fr=
om RDP session. Clients can connect.</div><div><br></div><div>After the ser=
ver is rebooted (windows updates), the tunnel doesn&#39;t come up automatic=
ally as it should, error is:</div><div><br></div><div>2020-01-15 15:00:56.1=
97: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending keepalive packet<br>20=
20-01-15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending kee=
palive packet<br>2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A6=
9iko) - Receiving keepalive packet<br>2020-01-15 15:01:49.729: [TUN] [Serve=
r] peer(SuXT=E2=80=A69iko) - Sending keepalive packet<br>2020-01-15 15:09:4=
3.727: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Removing all keys, since we=
 haven&#39;t received a new one in 540 seconds<br><br>-- reboot happens her=
e--<br><br>2020-01-15 17:19:00.356: [MGR] Exited UI process for user &#39;a=
dmin_user@winserver&#39; for session 2 with status 40010004<br>2020-01-15 1=
7:19:01.417: [MGR] Starting UI process for user =E2=80=98admin_user@winserv=
er=E2=80=99 for session 2<br>2020-01-15 17:19:02.350: [MGR] Exited UI proce=
ss for user &#39;admin_user@winserver&#39; for session 2 with status 1<br>2=
020-01-15 17:19:46.142: [TUN] [Server] Device closing<br>2020-01-15 17:19:4=
6.146: [TUN] [Server] Routine: TUN reader - stopped<br>2020-01-15 17:19:46.=
217: [TUN] [Server] Routine: event worker - stopped<br>2020-01-15 17:19:46.=
222: [TUN] [Server] Routine: receive incoming IPv4 - stopped<br>2020-01-15 =
17:19:46.223: [TUN] [Server] Routine: receive incoming IPv6 - stopped<br>20=
20-01-15 17:19:46.223: [TUN] [Server] Routine: decryption worker - stopped<=
br>2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stoppi=
ng...<br>2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - =
Routine: sequential receiver - stopped<br>2020-01-15 17:19:46.225: [TUN] [S=
erver] peer(1WB6=E2=80=A6G/xk) - Routine: nonce worker - stopped<br>2020-01=
-15 17:19:46.225: [TUN] [Server] Routine: encryption worker - stopped<br>20=
20-01-15 17:19:46.225: [TUN] [Server] Routine: handshake worker - stopped<b=
r>2020-01-15 17:19:46.226: [TUN] [Server] Routine: encryption worker - stop=
ped<br>2020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker -=
 stopped<br>2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake work=
er - stopped<br>2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G=
/xk) - Routine: sequential sender - stopped<br>2020-01-15 17:19:46.229: [TU=
N] [Server] peer(akUl=E2=80=A6uaHM) - Stopping...<br>2020-01-15 17:19:46.23=
0: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine: sequential receiver - =
stopped<br>2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) =
- Routine: sequential sender - stopped<br>2020-01-15 17:19:46.280: [TUN] [S=
erver] peer(akUl=E2=80=A6uaHM) - Routine: nonce worker - stopped<br>2020-01=
-15 17:19:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stopping...<br>2=
020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: s=
equential receiver - stopped<br>2020-01-15 17:19:46.321: [TUN] [Server] pee=
r(UUvS=E2=80=A6DwEo) - Routine: sequential sender - stopped<br>2020-01-15 1=
7:19:46.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: nonce worker=
 - stopped<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69ik=
o) - Stopping...<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=
=A69iko) - Routine: sequential receiver - stopped<br>2020-01-15 17:19:46.32=
3: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine: nonce worker - stopped=
<br>2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routi=
ne: sequential sender - stopped<br>2020-01-15 17:19:46.324: [TUN] [Server] =
peer(JRsL=E2=80=A6401s) - Stopping...<br>2020-01-15 17:19:46.325: [TUN] [Se=
rver] peer(JRsL=E2=80=A6401s) - Routine: sequential receiver - stopped<br>2=
020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: n=
once worker - stopped<br>2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=
=E2=80=A6401s) - Routine: sequential sender - stopped<br>2020-01-15 17:19:4=
6.326: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Stopping...<br>2020-01-15 1=
7:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine: sequential r=
eceiver - stopped<br>2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=
=80=A6/Xnc) - Routine: sequential sender - stopped<br>2020-01-15 17:19:46.3=
28: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine: nonce worker - stoppe=
d<br>2020-01-15 17:19:46.328: [TUN] [Server] Interface closed<br>2020-01-15=
 17:19:46.328: [TUN] [Server] Shutting down<br>2020-01-15 17:21:00.637: [MG=
R] Starting WireGuard/0.0.38 (Windows Server 10.0.17763; amd64)<br>2020-01-=
15 17:21:00.637: [TUN] [Server] Starting WireGuard/0.0.38 (Windows Server 1=
0.0.17763; amd64)<br>2020-01-15 17:21:00.760: [TUN] [Server] SCM locked for=
 27s by .\NT Service Control Manager, marking service as started<br>2020-01=
-15 17:21:00.784: [TUN] [Server] Watching network interfaces<br>2020-01-15 =
17:21:00.837: [TUN] [Server] Resolving DNS names<br>2020-01-15 17:21:01.033=
: [TUN] [Server] Creating Wintun interface<br>2020-01-15 17:21:08.159: [TUN=
] [Server] Unable to create Wintun interface: Error creating interface: Set=
upDiCallClassInstaller(DIF_REGISTERDEVICE) failed: winapi error #3758096907=
<br>2020-01-15 17:21:08.207: [TUN] [Server] Shutting down<br>2020-01-15 17:=
21:11.161: [MGR] Removing Wintun interface =E2=80=98Local Area Connection=
=E2=80=99 because determining tunnel service name failed: Tunnel name is no=
t valid</div><div><br></div><div>Is this some known behaviour with a known =
fix, or not supported yet?<br></div><div>Many thanks,</div><div><br></div><=
div>Peter<br></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000000b4c12059d08db2c--

--===============8238641807784021770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8238641807784021770==--

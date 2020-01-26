Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D13DC33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:54:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D84206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQqWvkm3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D84206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d71e8cf9;
	Thu, 30 Jan 2020 01:53:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25c11a78
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 19:16:37 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f951931f
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 19:16:37 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id o42so2679764uad.10
 for <wireguard@lists.zx2c4.com>; Sun, 26 Jan 2020 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I10IWvCVJ8v5vvdPqP+iagDUOvKQaYCixJigSc1JbJo=;
 b=rQqWvkm34kPfBwLIXM8q+hgltKWp6vG4D8r7AX7s9c8Mz4A9phlBYA6S3gPGaPtFZC
 Vd9Pz8rYgVCZLJnSalX4pWiHJmO0cqZQB0a59dm9p1PuGHgddx/BIyOuv4PNikh/oyHB
 +Na8ECfvg4gzA5VVPHB6c8sSHXb8eTS2BUJlMhFWtHPGDIPIUefQJm+aT1cDkUSt7z9k
 1e/btqn2kiqt4iUbwRByLSqban0KK2CmYoeMHfCym0Cwu2y04BlUet8oF0qTCTb594du
 R7gnzIT8K2PjDoIkk933x3mD5zDuVnd45Z9OcQQY2buJa0mJ1I/GyHw4X1d47ZAs6W6O
 kZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I10IWvCVJ8v5vvdPqP+iagDUOvKQaYCixJigSc1JbJo=;
 b=bl6Va6ZOBEVoRvqB3/TWzcA95HWuwWQ2sass3tcbPzE+xxU6aVqCRvyMn9O5yUthGJ
 5lGpI2G4N11CxyMf/8B1bTuiAgvBl9XSfjN22iyWKvaTvfOtkEllf3jiSTq3WiMM9QNK
 b9gUik+m7of+As09BkVDcZnOdwgG6RTS8fMT18wXPzGt2l22er2MqgkbVzykBAAFaeYO
 /jq/rJH/P2+eItaBKnKOT6B4hO6JJYK1oo5E911Jhgvuo6OO5fDl2ezYlBRzAD53mR/Z
 mTqPxlKaGu/uaD9MzQogZyX9qklPuHjeJ+DAwLDmZgIE+5mW3bl4GB8Db4J2F1kUC3qc
 PnoQ==
X-Gm-Message-State: APjAAAUzibF714AN6CymbZhc7BbzvBnpeaRDPi8ucJ7aLnstaFWgxRUb
 8sNwZCdOZMTwrdNLXRVaUSN0ZC3FkKThzrVXbGnz1ERC
X-Google-Smtp-Source: APXvYqxFKMpCMS1hdzRTfiFDrTVJ5GvAyANPxWW/vaGmh4xLC/A4QezZZOV+PGNkuYXDCdZvWrXu+PkCowZypQrZH2g=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr8523941uae.89.1580066196912; 
 Sun, 26 Jan 2020 11:16:36 -0800 (PST)
MIME-Version: 1.0
References: <CAPDdT2w3_t=sC=_FrcDX5OaTkT0vuPXKCtbFTB9O_Hq3frb4qA@mail.gmail.com>
 <CAHmME9oZNrRoniYA_ReUGsFLmxo0gV3jM-E+DFB6duKSZtOuHw@mail.gmail.com>
In-Reply-To: <CAHmME9oZNrRoniYA_ReUGsFLmxo0gV3jM-E+DFB6duKSZtOuHw@mail.gmail.com>
From: Peter Selc <peter.selc@gmail.com>
Date: Sun, 26 Jan 2020 19:15:57 +0000
Message-ID: <CAPDdT2x2B-O+ga7_tvTjYLz-wyG-PyAaRRPXedo7moBfnBG4xA@mail.gmail.com>
Subject: Re: After win2019 server reboot, Wireguard tunnel doesn't start
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
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
Content-Type: multipart/mixed; boundary="===============8746470626407436062=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8746470626407436062==
Content-Type: multipart/alternative; boundary="000000000000637dbc059d0fd4d7"

--000000000000637dbc059d0fd4d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After normal server reboot (manual), the tunnel comes up automatically.
In past it happened several times, that suddenly clients were not able to
connect, I thought it was a bug and would be solved in next version, so I
didn't pay much attention to it.
Just after the recent incident, It happened to be right after the reboot
caused by windows updates and I started looking into the logs.

The last updates were:
- 2020-01 Cumulative Update for .NET
- 2020-01 Cumulative update for window server 2019 (1809)
- Windows malicious software removal tool x64 - january 2020

I will watch more closely and collect logs by the next occurrence.

Thanks
Peter

On Sun, 26 Jan 2020 at 10:57, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Thanks for the report. Is this reproducible every time you reboot your
> system, or only that one time after Windows Update?
>
> If the latter, do you have a list of what was being updated?
>
> Thanks,
> Jason
>
> On Wed, Jan 22, 2020, 20:51 Peter Selc <peter.selc@gmail.com> wrote:
>
>> Hello all,
>>
>> I'm running version 0.0.38 on Windows 2019 server. Admin user logs in,
>> starts the tunnel via GUI, disconnects from RDP session. Clients can
>> connect.
>>
>> After the server is rebooted (windows updates), the tunnel doesn't come
>> up automatically as it should, error is:
>>
>> 2020-01-15 15:00:56.197: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendin=
g
>> keepalive packet
>> 2020-01-15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendin=
g
>> keepalive packet
>> 2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Receiv=
ing
>> keepalive packet
>> 2020-01-15 15:01:49.729: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendin=
g
>> keepalive packet
>> 2020-01-15 15:09:43.727: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Removi=
ng all
>> keys, since we haven't received a new one in 540 seconds
>>
>> -- reboot happens here--
>>
>> 2020-01-15 17:19:00.356: [MGR] Exited UI process for user
>> 'admin_user@winserver' for session 2 with status 40010004
>> 2020-01-15 17:19:01.417: [MGR] Starting UI process for user
>> =E2=80=98admin_user@winserver=E2=80=99 for session 2
>> 2020-01-15 17:19:02.350: [MGR] Exited UI process for user
>> 'admin_user@winserver' for session 2 with status 1
>> 2020-01-15 17:19:46.142: [TUN] [Server] Device closing
>> 2020-01-15 17:19:46.146: [TUN] [Server] Routine: TUN reader - stopped
>> 2020-01-15 17:19:46.217: [TUN] [Server] Routine: event worker - stopped
>> 2020-01-15 17:19:46.222: [TUN] [Server] Routine: receive incoming IPv4 -
>> stopped
>> 2020-01-15 17:19:46.223: [TUN] [Server] Routine: receive incoming IPv6 -
>> stopped
>> 2020-01-15 17:19:46.223: [TUN] [Server] Routine: decryption worker -
>> stopped
>> 2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stoppi=
ng...
>> 2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routin=
e:
>> sequential receiver - stopped
>> 2020-01-15 17:19:46.225: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routin=
e: nonce
>> worker - stopped
>> 2020-01-15 17:19:46.225: [TUN] [Server] Routine: encryption worker -
>> stopped
>> 2020-01-15 17:19:46.225: [TUN] [Server] Routine: handshake worker -
>> stopped
>> 2020-01-15 17:19:46.226: [TUN] [Server] Routine: encryption worker -
>> stopped
>> 2020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker -
>> stopped
>> 2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake worker -
>> stopped
>> 2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routin=
e:
>> sequential sender - stopped
>> 2020-01-15 17:19:46.229: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Stoppi=
ng...
>> 2020-01-15 17:19:46.230: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e:
>> sequential receiver - stopped
>> 2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e:
>> sequential sender - stopped
>> 2020-01-15 17:19:46.280: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e: nonce
>> worker - stopped
>> 2020-01-15 17:19:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stoppi=
ng...
>> 2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routin=
e:
>> sequential receiver - stopped
>> 2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routin=
e:
>> sequential sender - stopped
>> 2020-01-15 17:19:46.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routin=
e: nonce
>> worker - stopped
>> 2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Stoppi=
ng...
>> 2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routin=
e:
>> sequential receiver - stopped
>> 2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routin=
e: nonce
>> worker - stopped
>> 2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routin=
e:
>> sequential sender - stopped
>> 2020-01-15 17:19:46.324: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Stoppi=
ng...
>> 2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routin=
e:
>> sequential receiver - stopped
>> 2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routin=
e: nonce
>> worker - stopped
>> 2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routin=
e:
>> sequential sender - stopped
>> 2020-01-15 17:19:46.326: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Stoppi=
ng...
>> 2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routin=
e:
>> sequential receiver - stopped
>> 2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routin=
e:
>> sequential sender - stopped
>> 2020-01-15 17:19:46.328: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routin=
e: nonce
>> worker - stopped
>> 2020-01-15 17:19:46.328: [TUN] [Server] Interface closed
>> 2020-01-15 17:19:46.328: [TUN] [Server] Shutting down
>> 2020-01-15 17:21:00.637: [MGR] Starting WireGuard/0.0.38 (Windows Server
>> 10.0.17763; amd64)
>> 2020-01-15 17:21:00.637: [TUN] [Server] Starting WireGuard/0.0.38
>> (Windows Server 10.0.17763; amd64)
>> 2020-01-15 17:21:00.760: [TUN] [Server] SCM locked for 27s by .\NT
>> Service Control Manager, marking service as started
>> 2020-01-15 17:21:00.784: [TUN] [Server] Watching network interfaces
>> 2020-01-15 17:21:00.837: [TUN] [Server] Resolving DNS names
>> 2020-01-15 17:21:01.033: [TUN] [Server] Creating Wintun interface
>> 2020-01-15 17:21:08.159: [TUN] [Server] Unable to create Wintun
>> interface: Error creating interface:
>> SetupDiCallClassInstaller(DIF_REGISTERDEVICE) failed: winapi error
>> #3758096907
>> 2020-01-15 17:21:08.207: [TUN] [Server] Shutting down
>> 2020-01-15 17:21:11.161: [MGR] Removing Wintun interface =E2=80=98Local =
Area
>> Connection=E2=80=99 because determining tunnel service name failed: Tunn=
el name is
>> not valid
>>
>> Is this some known behaviour with a known fix, or not supported yet?
>> Many thanks,
>>
>> Peter
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--000000000000637dbc059d0fd4d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>After normal server reboot (manual), the tunnel comes=
 up automatically.</div><div>In past it happened several times, that sudden=
ly clients were not able to connect, I thought it was a bug and would be so=
lved in next version, so I didn&#39;t pay much attention to it. <br></div><=
div>Just after the recent incident, It happened to be right after the reboo=
t caused by windows updates and I started looking into the logs.<br></div><=
div><br></div><div>The last updates were:</div><div>- 2020-01 Cumulative Up=
date for .NET</div><div>- 2020-01 Cumulative update for window server 2019 =
(1809)</div><div>- Windows malicious software removal tool x64 - january 20=
20<br></div><div><br></div><div>I will watch more closely and collect logs =
by the next occurrence.</div><div><br></div><div>Thanks</div><div>Peter<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sun, 26 Jan 2020 at 10:57, Jason A. Donenfeld &lt;<a href=3D"mailt=
o:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"auto">Thanks for the report. =
Is this reproducible every time you reboot your system, or only that one ti=
me after Windows Update?<div dir=3D"auto"><br></div><div dir=3D"auto">If th=
e latter, do you have a list of what was being updated?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Jason</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jan 22, 2020, 20:51 Peter Selc &lt;<a href=3D"mailto:peter.selc@gmai=
l.com" target=3D"_blank">peter.selc@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello al=
l,</div><div><br></div><div>I&#39;m running version 0.0.38 on Windows 2019 =
server. Admin user logs in, starts the tunnel via GUI, disconnects from RDP=
 session. Clients can connect.</div><div><br></div><div>After the server is=
 rebooted (windows updates), the tunnel doesn&#39;t come up automatically a=
s it should, error is:</div><div><br></div><div>2020-01-15 15:00:56.197: [T=
UN] [Server] peer(SuXT=E2=80=A69iko) - Sending keepalive packet<br>2020-01-=
15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending keepalive=
 packet<br>2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A69iko) =
- Receiving keepalive packet<br>2020-01-15 15:01:49.729: [TUN] [Server] pee=
r(SuXT=E2=80=A69iko) - Sending keepalive packet<br>2020-01-15 15:09:43.727:=
 [TUN] [Server] peer(SuXT=E2=80=A69iko) - Removing all keys, since we haven=
&#39;t received a new one in 540 seconds<br><br>-- reboot happens here--<br=
><br>2020-01-15 17:19:00.356: [MGR] Exited UI process for user &#39;admin_u=
ser@winserver&#39; for session 2 with status 40010004<br>2020-01-15 17:19:0=
1.417: [MGR] Starting UI process for user =E2=80=98admin_user@winserver=E2=
=80=99 for session 2<br>2020-01-15 17:19:02.350: [MGR] Exited UI process fo=
r user &#39;admin_user@winserver&#39; for session 2 with status 1<br>2020-0=
1-15 17:19:46.142: [TUN] [Server] Device closing<br>2020-01-15 17:19:46.146=
: [TUN] [Server] Routine: TUN reader - stopped<br>2020-01-15 17:19:46.217: =
[TUN] [Server] Routine: event worker - stopped<br>2020-01-15 17:19:46.222: =
[TUN] [Server] Routine: receive incoming IPv4 - stopped<br>2020-01-15 17:19=
:46.223: [TUN] [Server] Routine: receive incoming IPv6 - stopped<br>2020-01=
-15 17:19:46.223: [TUN] [Server] Routine: decryption worker - stopped<br>20=
20-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stopping...=
<br>2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routi=
ne: sequential receiver - stopped<br>2020-01-15 17:19:46.225: [TUN] [Server=
] peer(1WB6=E2=80=A6G/xk) - Routine: nonce worker - stopped<br>2020-01-15 1=
7:19:46.225: [TUN] [Server] Routine: encryption worker - stopped<br>2020-01=
-15 17:19:46.225: [TUN] [Server] Routine: handshake worker - stopped<br>202=
0-01-15 17:19:46.226: [TUN] [Server] Routine: encryption worker - stopped<b=
r>2020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker - stop=
ped<br>2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake worker - =
stopped<br>2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) =
- Routine: sequential sender - stopped<br>2020-01-15 17:19:46.229: [TUN] [S=
erver] peer(akUl=E2=80=A6uaHM) - Stopping...<br>2020-01-15 17:19:46.230: [T=
UN] [Server] peer(akUl=E2=80=A6uaHM) - Routine: sequential receiver - stopp=
ed<br>2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Rou=
tine: sequential sender - stopped<br>2020-01-15 17:19:46.280: [TUN] [Server=
] peer(akUl=E2=80=A6uaHM) - Routine: nonce worker - stopped<br>2020-01-15 1=
7:19:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stopping...<br>2020-0=
1-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: sequen=
tial receiver - stopped<br>2020-01-15 17:19:46.321: [TUN] [Server] peer(UUv=
S=E2=80=A6DwEo) - Routine: sequential sender - stopped<br>2020-01-15 17:19:=
46.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: nonce worker - st=
opped<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - =
Stopping...<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69i=
ko) - Routine: sequential receiver - stopped<br>2020-01-15 17:19:46.323: [T=
UN] [Server] peer(SuXT=E2=80=A69iko) - Routine: nonce worker - stopped<br>2=
020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine: s=
equential sender - stopped<br>2020-01-15 17:19:46.324: [TUN] [Server] peer(=
JRsL=E2=80=A6401s) - Stopping...<br>2020-01-15 17:19:46.325: [TUN] [Server]=
 peer(JRsL=E2=80=A6401s) - Routine: sequential receiver - stopped<br>2020-0=
1-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: nonce =
worker - stopped<br>2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=E2=80=
=A6401s) - Routine: sequential sender - stopped<br>2020-01-15 17:19:46.326:=
 [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Stopping...<br>2020-01-15 17:19:4=
6.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine: sequential receive=
r - stopped<br>2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/X=
nc) - Routine: sequential sender - stopped<br>2020-01-15 17:19:46.328: [TUN=
] [Server] peer(mWrq=E2=80=A6/Xnc) - Routine: nonce worker - stopped<br>202=
0-01-15 17:19:46.328: [TUN] [Server] Interface closed<br>2020-01-15 17:19:4=
6.328: [TUN] [Server] Shutting down<br>2020-01-15 17:21:00.637: [MGR] Start=
ing WireGuard/0.0.38 (Windows Server 10.0.17763; amd64)<br>2020-01-15 17:21=
:00.637: [TUN] [Server] Starting WireGuard/0.0.38 (Windows Server 10.0.1776=
3; amd64)<br>2020-01-15 17:21:00.760: [TUN] [Server] SCM locked for 27s by =
.\NT Service Control Manager, marking service as started<br>2020-01-15 17:2=
1:00.784: [TUN] [Server] Watching network interfaces<br>2020-01-15 17:21:00=
.837: [TUN] [Server] Resolving DNS names<br>2020-01-15 17:21:01.033: [TUN] =
[Server] Creating Wintun interface<br>2020-01-15 17:21:08.159: [TUN] [Serve=
r] Unable to create Wintun interface: Error creating interface: SetupDiCall=
ClassInstaller(DIF_REGISTERDEVICE) failed: winapi error #3758096907<br>2020=
-01-15 17:21:08.207: [TUN] [Server] Shutting down<br>2020-01-15 17:21:11.16=
1: [MGR] Removing Wintun interface =E2=80=98Local Area Connection=E2=80=99 =
because determining tunnel service name failed: Tunnel name is not valid</d=
iv><div><br></div><div>Is this some known behaviour with a known fix, or no=
t supported yet?<br></div><div>Many thanks,</div><div><br></div><div>Peter<=
br></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer" target=3D"_=
blank">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>
</blockquote></div>

--000000000000637dbc059d0fd4d7--

--===============8746470626407436062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8746470626407436062==--

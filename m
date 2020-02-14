Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFC3C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C4D2168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQS4tFaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C4D2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e528ce77;
	Fri, 14 Feb 2020 10:56:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38db6153
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 07:05:39 +0000 (UTC)
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 020e212f
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 07:05:39 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id n27so5655843vsa.0
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2020 23:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H3sszVJN9ogh53ZBJ22N+OWO+kxMpvGMfFVb4bGCbbQ=;
 b=uQS4tFaGK4pcFf4u7wih1G3N/IBxR/X9kghu8qazUKmxQd5Thqfs2JkET75zQIEgyC
 mZqXwXDMz7qV7DAFPO9U1HInYJORHa3Ucd6x6PEiLQIM1C9BmLYM/PED1rib7usKKA45
 5F32W1rsIIbBhNfw7WmH1pdLemmCT1qM5dh+zZBxzfAU6KRDINQ0LStbYRs6BuCIeiub
 lSoIVysuw9JnT93MkZQtAF2ARdO8yK8LntmZ8ae/hzPOUWfboDeR/B2Ki/x9xCs4GnNu
 181Tp4asu361Pvb1Ld6cEo6pdDTwiEs5hRFpqgMkMcdP90GiG5Ap644EnYYysV0mq/Wz
 mOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3sszVJN9ogh53ZBJ22N+OWO+kxMpvGMfFVb4bGCbbQ=;
 b=lDYCBjaUByHEG1QgLRaXZI4OVGcHvdK4jTycTaOmrkQx17h+17Wg8MkTt+gPIBNDIV
 Wn3psckCAkSRQewETkz9JLoB2QSmXqRTVPkVHuK8bagW64bBqY9PWxTIw6hxlL8h/szY
 Fcul4XwHoBqXjSfHwA9YdP64f/4ilVD6OAc2u6nhaIdwu3jO+uXSHZAnNdRAN3mohGEV
 uHERBg4gkvyVz45BYljf0zHMJ2YjqvyilMucl91l+oAxXphN5UI/wu88Sr1BB1hBNW6A
 EhC95jDuordVvyfffxaXGhBkqJal3XnNtJIJbxNebyQZ91wfekR+nn3zivDsRt+d+LBi
 bx3A==
X-Gm-Message-State: APjAAAU7jYVeR0X1bt59gKB4rlr/2IfUsqHqM3Y/MWmaiyfIioHFpwTH
 ToRgO4i6wEftTZOPFz8zGyWRXPUeDSZOIV8tqSg2YTyqJjA=
X-Google-Smtp-Source: APXvYqzS52FcQpBf0EPGSMZt/05OEOZ28YUn7lsXwyQ066mjsBHnRZyR6PA3l2fNT4qf0gOFcNdkknfFauK4XFgrv8M=
X-Received: by 2002:a67:f10c:: with SMTP id n12mr639262vsk.208.1581664062956; 
 Thu, 13 Feb 2020 23:07:42 -0800 (PST)
MIME-Version: 1.0
References: <CAPDdT2w3_t=sC=_FrcDX5OaTkT0vuPXKCtbFTB9O_Hq3frb4qA@mail.gmail.com>
 <CAHmME9oZNrRoniYA_ReUGsFLmxo0gV3jM-E+DFB6duKSZtOuHw@mail.gmail.com>
 <CAPDdT2x2B-O+ga7_tvTjYLz-wyG-PyAaRRPXedo7moBfnBG4xA@mail.gmail.com>
In-Reply-To: <CAPDdT2x2B-O+ga7_tvTjYLz-wyG-PyAaRRPXedo7moBfnBG4xA@mail.gmail.com>
From: Peter Selc <peter.selc@gmail.com>
Date: Fri, 14 Feb 2020 07:07:05 +0000
Message-ID: <CAPDdT2ztKwCpUq+FdpzrKVSmBMnCZdO0qg2hudytK_Nt_Swtvg@mail.gmail.com>
Subject: Re: After win2019 server reboot, Wireguard tunnel doesn't start
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:56:09 +0100
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
Content-Type: multipart/mixed; boundary="===============5400516111782367808=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5400516111782367808==
Content-Type: multipart/alternative; boundary="000000000000a068ce059e83dc9b"

--000000000000a068ce059e83dc9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

bellow is another occurance of the bug. At 17:19 server was rebooted
because of updates.

The process C:\windows\system32\svchost.exe (bserver) has initiated the
restart of computer bserver on behalf of user NT AUTHORITY\SYSTEM for the
following reason: Operating System: Service pack (Planned)
 Reason Code: 0x80020010
 Shutdown Type: restart
 Comment:

2020-02-11 14:13:29.084361: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendin=
g
keepalive packet
2020-02-11 14:13:39.080286: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Receiv=
ing
keepalive packet
2020-02-11 14:13:39.085654: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendin=
g
keepalive packet
2020-02-11 14:22:18.562874: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Removi=
ng all
keys, since we haven't received a new one in 540 seconds
2020-02-12 17:19:00.295842: [MGR] Exited UI process for user
'admin_user@bserver' for session 2 with status 40010004
2020-02-12 17:19:01.351433: [MGR] Starting UI process for user
=E2=80=98admin_user@bserver=E2=80=99 for session 2
2020-02-12 17:19:02.508881: [MGR] Exited UI process for user
'admin_user@bserver' for session 2 with status c000026b
2020-02-12 17:20:46.494769: [TUN] [Server] Device closing
2020-02-12 17:20:46.532011: [TUN] [Server] Routine: TUN reader - stopped
2020-02-12 17:20:46.574511: [TUN] [Server] Routine: event worker - stopped
2020-02-12 17:20:46.579359: [TUN] [Server] Routine: receive incoming IPv4 -
stopped
2020-02-12 17:20:46.626363: [TUN] [Server] Routine: receive incoming IPv6 -
stopped
2020-02-12 17:20:46.627376: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Stoppi=
ng...
2020-02-12 17:20:46.627376: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.628361: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.629361: [TUN] [Server] Routine: encryption worker -
stopped
2020-02-12 17:20:46.630362: [TUN] [Server] Routine: decryption worker -
stopped
2020-02-12 17:20:46.630362: [TUN] [Server] Routine: decryption worker -
stopped
2020-02-12 17:20:46.630362: [TUN] [Server] Routine: handshake worker -
stopped
2020-02-12 17:20:46.631382: [TUN] [Server] Routine: handshake worker -
stopped
2020-02-12 17:20:46.631382: [TUN] [Server] Routine: encryption worker -
stopped
2020-02-12 17:20:46.631382: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.631382: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Stoppi=
ng...
2020-02-12 17:20:46.632362: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.633361: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.633361: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.633361: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Stoppi=
ng...
2020-02-12 17:20:46.633361: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.634362: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.634362: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.635445: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Stoppi=
ng...
2020-02-12 17:20:46.635445: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.635445: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.636367: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.636367: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stoppi=
ng...
2020-02-12 17:20:46.636367: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.637416: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.638361: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.638361: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Stoppi=
ng...
2020-02-12 17:20:46.639378: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.639378: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.640362: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.640362: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stoppi=
ng...
2020-02-12 17:20:46.641361: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routin=
e:
sequential receiver - stopped
2020-02-12 17:20:46.641361: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routin=
e:
sequential sender - stopped
2020-02-12 17:20:46.641361: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routin=
e: nonce
worker - stopped
2020-02-12 17:20:46.641361: [TUN] [Server] Interface closed
2020-02-12 17:20:46.642361: [TUN] [Server] Shutting down
2020-02-12 17:21:56.974077: [TUN] [Server] Starting WireGuard/0.0.38
(Windows Server 10.0.17763; amd64)
2020-02-12 17:21:56.974077: [MGR] Starting WireGuard/0.0.38 (Windows Server
10.0.17763; amd64)
2020-02-12 17:21:57.199444: [TUN] [Server] SCM locked for 24s by .\NT
Service Control Manager, marking service as started
2020-02-12 17:21:57.203451: [TUN] [Server] Watching network interfaces
2020-02-12 17:21:57.223553: [TUN] [Server] Resolving DNS names
2020-02-12 17:21:57.272618: [TUN] [Server] Creating Wintun interface
2020-02-12 17:22:01.919561: [TUN] [Server] Unable to create Wintun
interface: Error creating interface:
SetupDiCallClassInstaller(DIF_REGISTERDEVICE) failed: winapi error
#3758096907
2020-02-12 17:22:01.920550: [TUN] [Server] Shutting down
2020-02-12 17:22:07.294542: [MGR] Removing Wintun interface =E2=80=98Local =
Area
Connection=E2=80=99 because determining tunnel service name failed: Tunnel =
name is
not valid
2020-02-14 07:56:43.399005: [MGR] Starting UI process for user
=E2=80=98admin_user@bserver=E2=80=99 for session 2

Thanks,
Peter

On Sun, 26 Jan 2020 at 19:15, Peter Selc <peter.selc@gmail.com> wrote:

> After normal server reboot (manual), the tunnel comes up automatically.
> In past it happened several times, that suddenly clients were not able to
> connect, I thought it was a bug and would be solved in next version, so I
> didn't pay much attention to it.
> Just after the recent incident, It happened to be right after the reboot
> caused by windows updates and I started looking into the logs.
>
> The last updates were:
> - 2020-01 Cumulative Update for .NET
> - 2020-01 Cumulative update for window server 2019 (1809)
> - Windows malicious software removal tool x64 - january 2020
>
> I will watch more closely and collect logs by the next occurrence.
>
> Thanks
> Peter
>
> On Sun, 26 Jan 2020 at 10:57, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>> Thanks for the report. Is this reproducible every time you reboot your
>> system, or only that one time after Windows Update?
>>
>> If the latter, do you have a list of what was being updated?
>>
>> Thanks,
>> Jason
>>
>> On Wed, Jan 22, 2020, 20:51 Peter Selc <peter.selc@gmail.com> wrote:
>>
>>> Hello all,
>>>
>>> I'm running version 0.0.38 on Windows 2019 server. Admin user logs in,
>>> starts the tunnel via GUI, disconnects from RDP session. Clients can
>>> connect.
>>>
>>> After the server is rebooted (windows updates), the tunnel doesn't come
>>> up automatically as it should, error is:
>>>
>>> 2020-01-15 15:00:56.197: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendi=
ng
>>> keepalive packet
>>> 2020-01-15 15:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendi=
ng
>>> keepalive packet
>>> 2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Recei=
ving
>>> keepalive packet
>>> 2020-01-15 15:01:49.729: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sendi=
ng
>>> keepalive packet
>>> 2020-01-15 15:09:43.727: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Remov=
ing all
>>> keys, since we haven't received a new one in 540 seconds
>>>
>>> -- reboot happens here--
>>>
>>> 2020-01-15 17:19:00.356: [MGR] Exited UI process for user
>>> 'admin_user@winserver' for session 2 with status 40010004
>>> 2020-01-15 17:19:01.417: [MGR] Starting UI process for user
>>> =E2=80=98admin_user@winserver=E2=80=99 for session 2
>>> 2020-01-15 17:19:02.350: [MGR] Exited UI process for user
>>> 'admin_user@winserver' for session 2 with status 1
>>> 2020-01-15 17:19:46.142: [TUN] [Server] Device closing
>>> 2020-01-15 17:19:46.146: [TUN] [Server] Routine: TUN reader - stopped
>>> 2020-01-15 17:19:46.217: [TUN] [Server] Routine: event worker - stopped
>>> 2020-01-15 17:19:46.222: [TUN] [Server] Routine: receive incoming IPv4 =
-
>>> stopped
>>> 2020-01-15 17:19:46.223: [TUN] [Server] Routine: receive incoming IPv6 =
-
>>> stopped
>>> 2020-01-15 17:19:46.223: [TUN] [Server] Routine: decryption worker -
>>> stopped
>>> 2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stopp=
ing...
>>> 2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routi=
ne:
>>> sequential receiver - stopped
>>> 2020-01-15 17:19:46.225: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routi=
ne: nonce
>>> worker - stopped
>>> 2020-01-15 17:19:46.225: [TUN] [Server] Routine: encryption worker -
>>> stopped
>>> 2020-01-15 17:19:46.225: [TUN] [Server] Routine: handshake worker -
>>> stopped
>>> 2020-01-15 17:19:46.226: [TUN] [Server] Routine: encryption worker -
>>> stopped
>>> 2020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker -
>>> stopped
>>> 2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake worker -
>>> stopped
>>> 2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routi=
ne:
>>> sequential sender - stopped
>>> 2020-01-15 17:19:46.229: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Stopp=
ing...
>>> 2020-01-15 17:19:46.230: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routi=
ne:
>>> sequential receiver - stopped
>>> 2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routi=
ne:
>>> sequential sender - stopped
>>> 2020-01-15 17:19:46.280: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routi=
ne: nonce
>>> worker - stopped
>>> 2020-01-15 17:19:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stopp=
ing...
>>> 2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routi=
ne:
>>> sequential receiver - stopped
>>> 2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routi=
ne:
>>> sequential sender - stopped
>>> 2020-01-15 17:19:46.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routi=
ne: nonce
>>> worker - stopped
>>> 2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Stopp=
ing...
>>> 2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routi=
ne:
>>> sequential receiver - stopped
>>> 2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routi=
ne: nonce
>>> worker - stopped
>>> 2020-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routi=
ne:
>>> sequential sender - stopped
>>> 2020-01-15 17:19:46.324: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Stopp=
ing...
>>> 2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routi=
ne:
>>> sequential receiver - stopped
>>> 2020-01-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routi=
ne: nonce
>>> worker - stopped
>>> 2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routi=
ne:
>>> sequential sender - stopped
>>> 2020-01-15 17:19:46.326: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Stopp=
ing...
>>> 2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routi=
ne:
>>> sequential receiver - stopped
>>> 2020-01-15 17:19:46.327: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routi=
ne:
>>> sequential sender - stopped
>>> 2020-01-15 17:19:46.328: [TUN] [Server] peer(mWrq=E2=80=A6/Xnc) - Routi=
ne: nonce
>>> worker - stopped
>>> 2020-01-15 17:19:46.328: [TUN] [Server] Interface closed
>>> 2020-01-15 17:19:46.328: [TUN] [Server] Shutting down
>>> 2020-01-15 17:21:00.637: [MGR] Starting WireGuard/0.0.38 (Windows Serve=
r
>>> 10.0.17763; amd64)
>>> 2020-01-15 17:21:00.637: [TUN] [Server] Starting WireGuard/0.0.38
>>> (Windows Server 10.0.17763; amd64)
>>> 2020-01-15 17:21:00.760: [TUN] [Server] SCM locked for 27s by .\NT
>>> Service Control Manager, marking service as started
>>> 2020-01-15 17:21:00.784: [TUN] [Server] Watching network interfaces
>>> 2020-01-15 17:21:00.837: [TUN] [Server] Resolving DNS names
>>> 2020-01-15 17:21:01.033: [TUN] [Server] Creating Wintun interface
>>> 2020-01-15 17:21:08.159: [TUN] [Server] Unable to create Wintun
>>> interface: Error creating interface:
>>> SetupDiCallClassInstaller(DIF_REGISTERDEVICE) failed: winapi error
>>> #3758096907
>>> 2020-01-15 17:21:08.207: [TUN] [Server] Shutting down
>>> 2020-01-15 17:21:11.161: [MGR] Removing Wintun interface =E2=80=98Local=
 Area
>>> Connection=E2=80=99 because determining tunnel service name failed: Tun=
nel name is
>>> not valid
>>>
>>> Is this some known behaviour with a known fix, or not supported yet?
>>> Many thanks,
>>>
>>> Peter
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>

--000000000000a068ce059e83dc9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>bell=
ow is another occurance of the bug. At 17:19 server was rebooted because of=
 updates.<br></div><div><br></div><div>The process C:\windows\system32\svch=
ost.exe (bserver) has initiated the restart of computer bserver on behalf o=
f user NT AUTHORITY\SYSTEM for the following reason: Operating System: Serv=
ice pack (Planned)<br>=C2=A0Reason Code: 0x80020010<br>=C2=A0Shutdown Type:=
 restart<br>=C2=A0Comment: </div><div><br></div><div>2020-02-11 14:13:29.08=
4361: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending keepalive packet<br>=
2020-02-11 14:13:39.080286: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Receiv=
ing keepalive packet<br>2020-02-11 14:13:39.085654: [TUN] [Server] peer(SuX=
T=E2=80=A69iko) - Sending keepalive packet<br>2020-02-11 14:22:18.562874: [=
TUN] [Server] peer(SuXT=E2=80=A69iko) - Removing all keys, since we haven&#=
39;t received a new one in 540 seconds<br>2020-02-12 17:19:00.295842: [MGR]=
 Exited UI process for user &#39;admin_user@bserver&#39; for session 2 with=
 status 40010004<br>2020-02-12 17:19:01.351433: [MGR] Starting UI process f=
or user =E2=80=98admin_user@bserver=E2=80=99 for session 2<br>2020-02-12 17=
:19:02.508881: [MGR] Exited UI process for user &#39;admin_user@bserver&#39=
; for session 2 with status c000026b<br>2020-02-12 17:20:46.494769: [TUN] [=
Server] Device closing<br>2020-02-12 17:20:46.532011: [TUN] [Server] Routin=
e: TUN reader - stopped<br>2020-02-12 17:20:46.574511: [TUN] [Server] Routi=
ne: event worker - stopped<br>2020-02-12 17:20:46.579359: [TUN] [Server] Ro=
utine: receive incoming IPv4 - stopped<br>2020-02-12 17:20:46.626363: [TUN]=
 [Server] Routine: receive incoming IPv6 - stopped<br>2020-02-12 17:20:46.6=
27376: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Stopping...<br>2020-02-12 1=
7:20:46.627376: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine: sequentia=
l sender - stopped<br>2020-02-12 17:20:46.628361: [TUN] [Server] peer(SuXT=
=E2=80=A69iko) - Routine: nonce worker - stopped<br>2020-02-12 17:20:46.629=
361: [TUN] [Server] Routine: encryption worker - stopped<br>2020-02-12 17:2=
0:46.630362: [TUN] [Server] Routine: decryption worker - stopped<br>2020-02=
-12 17:20:46.630362: [TUN] [Server] Routine: decryption worker - stopped<br=
>2020-02-12 17:20:46.630362: [TUN] [Server] Routine: handshake worker - sto=
pped<br>2020-02-12 17:20:46.631382: [TUN] [Server] Routine: handshake worke=
r - stopped<br>2020-02-12 17:20:46.631382: [TUN] [Server] Routine: encrypti=
on worker - stopped<br>2020-02-12 17:20:46.631382: [TUN] [Server] peer(SuXT=
=E2=80=A69iko) - Routine: sequential receiver - stopped<br>2020-02-12 17:20=
:46.631382: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Stopping...<br>2020-02=
-12 17:20:46.632362: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Routine: sequ=
ential receiver - stopped<br>2020-02-12 17:20:46.633361: [TUN] [Server] pee=
r(CbnY=E2=80=A6MhkI) - Routine: sequential sender - stopped<br>2020-02-12 1=
7:20:46.633361: [TUN] [Server] peer(CbnY=E2=80=A6MhkI) - Routine: nonce wor=
ker - stopped<br>2020-02-12 17:20:46.633361: [TUN] [Server] peer(JRsL=E2=80=
=A6401s) - Stopping...<br>2020-02-12 17:20:46.633361: [TUN] [Server] peer(J=
RsL=E2=80=A6401s) - Routine: sequential receiver - stopped<br>2020-02-12 17=
:20:46.634362: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: nonce work=
er - stopped<br>2020-02-12 17:20:46.634362: [TUN] [Server] peer(JRsL=E2=80=
=A6401s) - Routine: sequential sender - stopped<br>2020-02-12 17:20:46.6354=
45: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Stopping...<br>2020-02-12 17:2=
0:46.635445: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Routine: sequential r=
eceiver - stopped<br>2020-02-12 17:20:46.635445: [TUN] [Server] peer(nLK/=
=E2=80=A6f3mE) - Routine: nonce worker - stopped<br>2020-02-12 17:20:46.636=
367: [TUN] [Server] peer(nLK/=E2=80=A6f3mE) - Routine: sequential sender - =
stopped<br>2020-02-12 17:20:46.636367: [TUN] [Server] peer(1WB6=E2=80=A6G/x=
k) - Stopping...<br>2020-02-12 17:20:46.636367: [TUN] [Server] peer(1WB6=E2=
=80=A6G/xk) - Routine: sequential receiver - stopped<br>2020-02-12 17:20:46=
.637416: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine: nonce worker - s=
topped<br>2020-02-12 17:20:46.638361: [TUN] [Server] peer(1WB6=E2=80=A6G/xk=
) - Routine: sequential sender - stopped<br>2020-02-12 17:20:46.638361: [TU=
N] [Server] peer(akUl=E2=80=A6uaHM) - Stopping...<br>2020-02-12 17:20:46.63=
9378: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routine: sequential receiver=
 - stopped<br>2020-02-12 17:20:46.639378: [TUN] [Server] peer(akUl=E2=80=A6=
uaHM) - Routine: nonce worker - stopped<br>2020-02-12 17:20:46.640362: [TUN=
] [Server] peer(akUl=E2=80=A6uaHM) - Routine: sequential sender - stopped<b=
r>2020-02-12 17:20:46.640362: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stop=
ping...<br>2020-02-12 17:20:46.641361: [TUN] [Server] peer(UUvS=E2=80=A6DwE=
o) - Routine: sequential receiver - stopped<br>2020-02-12 17:20:46.641361: =
[TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: sequential sender - stopp=
ed<br>2020-02-12 17:20:46.641361: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - =
Routine: nonce worker - stopped<br>2020-02-12 17:20:46.641361: [TUN] [Serve=
r] Interface closed<br>2020-02-12 17:20:46.642361: [TUN] [Server] Shutting =
down<br>2020-02-12 17:21:56.974077: [TUN] [Server] Starting WireGuard/0.0.3=
8 (Windows Server 10.0.17763; amd64)<br>2020-02-12 17:21:56.974077: [MGR] S=
tarting WireGuard/0.0.38 (Windows Server 10.0.17763; amd64)<br>2020-02-12 1=
7:21:57.199444: [TUN] [Server] SCM locked for 24s by .\NT Service Control M=
anager, marking service as started<br>2020-02-12 17:21:57.203451: [TUN] [Se=
rver] Watching network interfaces<br>2020-02-12 17:21:57.223553: [TUN] [Ser=
ver] Resolving DNS names<br>2020-02-12 17:21:57.272618: [TUN] [Server] Crea=
ting Wintun interface<br>2020-02-12 17:22:01.919561: [TUN] [Server] Unable =
to create Wintun interface: Error creating interface: SetupDiCallClassInsta=
ller(DIF_REGISTERDEVICE) failed: winapi error #3758096907<br>2020-02-12 17:=
22:01.920550: [TUN] [Server] Shutting down<br>2020-02-12 17:22:07.294542: [=
MGR] Removing Wintun interface =E2=80=98Local Area Connection=E2=80=99 beca=
use determining tunnel service name failed: Tunnel name is not valid<br>202=
0-02-14 07:56:43.399005: [MGR] Starting UI process for user =E2=80=98admin_=
user@bserver=E2=80=99 for session 2</div><div><br></div><div>Thanks,<br></d=
iv><div>Peter<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, 26 Jan 2020 at 19:15, Peter Selc &lt;<a href=
=3D"mailto:peter.selc@gmail.com">peter.selc@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
After normal server reboot (manual), the tunnel comes up automatically.</di=
v><div>In past it happened several times, that suddenly clients were not ab=
le to connect, I thought it was a bug and would be solved in next version, =
so I didn&#39;t pay much attention to it. <br></div><div>Just after the rec=
ent incident, It happened to be right after the reboot caused by windows up=
dates and I started looking into the logs.<br></div><div><br></div><div>The=
 last updates were:</div><div>- 2020-01 Cumulative Update for .NET</div><di=
v>- 2020-01 Cumulative update for window server 2019 (1809)</div><div>- Win=
dows malicious software removal tool x64 - january 2020<br></div><div><br><=
/div><div>I will watch more closely and collect logs by the next occurrence=
.</div><div><br></div><div>Thanks</div><div>Peter<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 26 Jan 2=
020 at 10:57, Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" tar=
get=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"auto">Thanks for the report. Is t=
his reproducible every time you reboot your system, or only that one time a=
fter Windows Update?<div dir=3D"auto"><br></div><div dir=3D"auto">If the la=
tter, do you have a list of what was being updated?</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Jason</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Jan 22, 2020, 20:51 Peter Selc &lt;<a href=3D"mailto:peter.selc@gmail.co=
m" target=3D"_blank">peter.selc@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello all,</=
div><div><br></div><div>I&#39;m running version 0.0.38 on Windows 2019 serv=
er. Admin user logs in, starts the tunnel via GUI, disconnects from RDP ses=
sion. Clients can connect.</div><div><br></div><div>After the server is reb=
ooted (windows updates), the tunnel doesn&#39;t come up automatically as it=
 should, error is:</div><div><br></div><div>2020-01-15 15:00:56.197: [TUN] =
[Server] peer(SuXT=E2=80=A69iko) - Sending keepalive packet<br>2020-01-15 1=
5:01:06.198: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Sending keepalive pac=
ket<br>2020-01-15 15:01:31.236: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Re=
ceiving keepalive packet<br>2020-01-15 15:01:49.729: [TUN] [Server] peer(Su=
XT=E2=80=A69iko) - Sending keepalive packet<br>2020-01-15 15:09:43.727: [TU=
N] [Server] peer(SuXT=E2=80=A69iko) - Removing all keys, since we haven&#39=
;t received a new one in 540 seconds<br><br>-- reboot happens here--<br><br=
>2020-01-15 17:19:00.356: [MGR] Exited UI process for user &#39;admin_user@=
winserver&#39; for session 2 with status 40010004<br>2020-01-15 17:19:01.41=
7: [MGR] Starting UI process for user =E2=80=98admin_user@winserver=E2=80=
=99 for session 2<br>2020-01-15 17:19:02.350: [MGR] Exited UI process for u=
ser &#39;admin_user@winserver&#39; for session 2 with status 1<br>2020-01-1=
5 17:19:46.142: [TUN] [Server] Device closing<br>2020-01-15 17:19:46.146: [=
TUN] [Server] Routine: TUN reader - stopped<br>2020-01-15 17:19:46.217: [TU=
N] [Server] Routine: event worker - stopped<br>2020-01-15 17:19:46.222: [TU=
N] [Server] Routine: receive incoming IPv4 - stopped<br>2020-01-15 17:19:46=
.223: [TUN] [Server] Routine: receive incoming IPv6 - stopped<br>2020-01-15=
 17:19:46.223: [TUN] [Server] Routine: decryption worker - stopped<br>2020-=
01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Stopping...<br=
>2020-01-15 17:19:46.224: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - Routine:=
 sequential receiver - stopped<br>2020-01-15 17:19:46.225: [TUN] [Server] p=
eer(1WB6=E2=80=A6G/xk) - Routine: nonce worker - stopped<br>2020-01-15 17:1=
9:46.225: [TUN] [Server] Routine: encryption worker - stopped<br>2020-01-15=
 17:19:46.225: [TUN] [Server] Routine: handshake worker - stopped<br>2020-0=
1-15 17:19:46.226: [TUN] [Server] Routine: encryption worker - stopped<br>2=
020-01-15 17:19:46.228: [TUN] [Server] Routine: decryption worker - stopped=
<br>2020-01-15 17:19:46.228: [TUN] [Server] Routine: handshake worker - sto=
pped<br>2020-01-15 17:19:46.229: [TUN] [Server] peer(1WB6=E2=80=A6G/xk) - R=
outine: sequential sender - stopped<br>2020-01-15 17:19:46.229: [TUN] [Serv=
er] peer(akUl=E2=80=A6uaHM) - Stopping...<br>2020-01-15 17:19:46.230: [TUN]=
 [Server] peer(akUl=E2=80=A6uaHM) - Routine: sequential receiver - stopped<=
br>2020-01-15 17:19:46.268: [TUN] [Server] peer(akUl=E2=80=A6uaHM) - Routin=
e: sequential sender - stopped<br>2020-01-15 17:19:46.280: [TUN] [Server] p=
eer(akUl=E2=80=A6uaHM) - Routine: nonce worker - stopped<br>2020-01-15 17:1=
9:46.319: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Stopping...<br>2020-01-1=
5 17:19:46.321: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: sequentia=
l receiver - stopped<br>2020-01-15 17:19:46.321: [TUN] [Server] peer(UUvS=
=E2=80=A6DwEo) - Routine: sequential sender - stopped<br>2020-01-15 17:19:4=
6.322: [TUN] [Server] peer(UUvS=E2=80=A6DwEo) - Routine: nonce worker - sto=
pped<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69iko) - S=
topping...<br>2020-01-15 17:19:46.322: [TUN] [Server] peer(SuXT=E2=80=A69ik=
o) - Routine: sequential receiver - stopped<br>2020-01-15 17:19:46.323: [TU=
N] [Server] peer(SuXT=E2=80=A69iko) - Routine: nonce worker - stopped<br>20=
20-01-15 17:19:46.323: [TUN] [Server] peer(SuXT=E2=80=A69iko) - Routine: se=
quential sender - stopped<br>2020-01-15 17:19:46.324: [TUN] [Server] peer(J=
RsL=E2=80=A6401s) - Stopping...<br>2020-01-15 17:19:46.325: [TUN] [Server] =
peer(JRsL=E2=80=A6401s) - Routine: sequential receiver - stopped<br>2020-01=
-15 17:19:46.325: [TUN] [Server] peer(JRsL=E2=80=A6401s) - Routine: nonce w=
orker - stopped<br>2020-01-15 17:19:46.326: [TUN] [Server] peer(JRsL=E2=80=
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
</blockquote></div></div>

--000000000000a068ce059e83dc9b--

--===============5400516111782367808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5400516111782367808==--

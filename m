Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A283C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 08:57:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890CD61365
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 08:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 890CD61365
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f50214b;
	Mon, 12 Apr 2021 08:55:58 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93677b73
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 08:55:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id 12so20023531lfq.13
 for <wireguard@lists.zx2c4.com>; Mon, 12 Apr 2021 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w/ZfwG8x7uqUvSwr9bEam7UpBkeWfSiL5LF4e+uBgKs=;
 b=aND1IQZyX8xe3K5KoTx0WdLcJqPa2DkcgIx8H3uPIq+ewnQH/AGJeg0lKN8YLpyNS6
 WACP9yv8ga9DaRaHvZAdAs0mQ0za2RFWGaMnPXrm4L60TWoo2WM9czAg5KUWC5XkTNg3
 LcEIcrRk4pRvqmFTeB+J32+OMM2tRIrMek0ByySIT8a4Drqb1IphD+yG7zfDKBlPuSQ2
 E9Gw/f2tFpRwqehvjvPI8lnw1ikcxEyV3HNRVD4F4ofvBLDkDk+0On9IvYwZgoz9I9yS
 pBLvF+BqFkVfGvwJ4pMKKPKd3Et8AymWyTUel8CF0QdOWv79jER08F9g6butdZvJxvon
 eCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w/ZfwG8x7uqUvSwr9bEam7UpBkeWfSiL5LF4e+uBgKs=;
 b=MF/0AtxVV9UXHa130XgS7CvS1Kxzhxeb7MebT9OhGd9usO6wMSaCpw8X3Yk5aKoz/o
 sxRXvLebKY2oh3FtBO7gSTPA2XIttz468xMAKSZrFde2DorC/tYC/WtvllX6gaTRTPCt
 maWXqWXJNk2N/lLeNVHcmrua5er1+qnbMiv6uzxzxYXIu2eJNjA4Ks4kX0vHHNQ0fBzz
 sW7Zy3lHnA+07M1I1vGjDhUQof1a6dlGc13Nd5DAcJkf8d3ifIRoRSz7eSXT9fUcwOnc
 nSUVO1SOaHI0I9iuTaOqOXnJUOCyijOpqqqQxpFRR/buz8O3qHR/mFJkSD2VSq+z9JpB
 aZTQ==
X-Gm-Message-State: AOAM531pD0icokD8Wu6KUHc8cEoOWbRnAb3WNOAueSt/a/L8pVKgNf5F
 NODxMH8JZNz4a5cPQ3nkasZan0USCc4cloglqH0=
X-Google-Smtp-Source: ABdhPJxlFWC5mzwPmx+29yyhnSWT9nPZFAi69rgjGmDeUF45i/mRyCxLDAMSPIwbhl2jZv42DLTMqxk8XpQhLG5wtbo=
X-Received: by 2002:ac2:5591:: with SMTP id v17mr18800137lfg.82.1618217755515; 
 Mon, 12 Apr 2021 01:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
 <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
 <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
 <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
 <bbb619a3-b7aa-a80a-4e17-bf197d1e99f1@gmail.com>
In-Reply-To: <bbb619a3-b7aa-a80a-4e17-bf197d1e99f1@gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Mon, 12 Apr 2021 09:55:43 +0100
Message-ID: <CAN5wt5r3mtQzTrBs5ON4LmoA705SPdAhoV0WsM6hpPfS44R=ig@mail.gmail.com>
Subject: Re: WireGuard for Windows crash "panic: ring is full" since release
 of 0.3.10
To: Peter Whisker <peter.whisker@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

yeah, i have the same problem.  i gather your 'wg set' command didn't
used to hang, mine took effect on 0.3.9 but i always had to run it
manually and Ctrl-C it as it would never return.

On Mon, 12 Apr 2021 at 08:57, Peter Whisker <peter.whisker@gmail.com> wrote=
:
>
> It seems to be your suggested workaround for using Wireguard via a split
> tunnel:
>
> PostUp =3D wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
>
> which is causing the crash. It was great that this worked in earlier
> versions but I'm now back to square one.
>
> Peter
>
> On 12/04/2021 08:45, Peter Whisker wrote:
> > Hi
> >
> > Since the recent upgrade to 0.3.10 It now crashes bringing up my
> > tunnels - all was well with 0.3.9.
> >
> > Peter
> >
> > 2021-04-12 08:41:07.187: [TUN] [lhirisseccom01] Setting interface
> > configuration
> > 2021-04-12 08:41:07.187: [TUN] [lhirisseccom01] Routine: event worker
> > - started
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] UAPI: Updating private
> > key
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] UAPI: Removing all peer=
s
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Created
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Updating preshared key
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Updating endpoint
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Updating persistent keepalive interval
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Removing all allowedips
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Adding allowedip
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Adding allowedip
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Adding allowedip
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > UAPI: Adding allowedip
> > 2021-04-12 08:41:07.188: [TUN] [lhirisseccom01] Bringing peers up
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] UDP bind has been updat=
ed
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Routine: receive
> > incoming 0x292980 - started
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > Starting...
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > Sending keepalive packet
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > Sending handshake initiation
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Routine: receive
> > incoming 0x292a60 - started
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > Routine: sequential sender - started
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > Routine: sequential receiver - started
> > 2021-04-12 08:41:07.190: [TUN] [lhirisseccom01] Interface state was
> > Down, requested Up, now Up
> > 2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Monitoring default v6
> > routes
> > 2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Binding v6 socket to
> > interface 0 (blackhole=3Dfalse)
> > 2021-04-12 08:41:07.191: [TUN] [lhirisseccom01] Setting device v6
> > addresses
> > 2021-04-12 08:41:07.202: [TUN] [lhirisseccom01] Monitoring default v4
> > routes
> > 2021-04-12 08:41:07.210: [TUN] [lhirisseccom01] Binding v4 socket to
> > interface 10 (blackhole=3Dfalse)
> > 2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Setting device v4
> > addresses
> > 2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Listening for UAPI
> > requests
> > 2021-04-12 08:41:07.212: [TUN] [lhirisseccom01] Executing: `wg set
> > %WIREGUARD_TUNNEL_NAME% listen-port 0`
> > 2021-04-12 08:41:07.229: [TUN] [lhirisseccom01] peer(Qfjl=E2=80=A60V1w)=
 -
> > Received handshake response
> > 2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] UAPI: Updating listen
> > port
> > 2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] Routine: receive
> > incoming 0x292980 - stopped
> > 2021-04-12 08:41:07.404: [TUN] [lhirisseccom01] Routine: receive
> > incoming 0x292a60 - stopped
> > 2021-04-12 08:41:07.407: [TUN] [lhirisseccom01] cmd> Unable to modify
> > interface: Unknown error
> > 2021-04-12 08:41:07.410: [TUN] panic: ring is full
> > 2021-04-12 08:41:07.410: [TUN] goroutine 134 [running]:
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/conn.(*ringBuffer).Push(...)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind=
_windows.go:46
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/conn.(*afWinRingBind).InsertReceiveRequest(0=
xc000220000,
> > 0x0, 0x0)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind=
_windows.go:327
> > +0x7e
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/conn.(*WinRingBind).Open(0xc000220000, 0x0,
> > 0x0, 0x0, 0x0, 0xc00021dbf7, 0x0, 0x0)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/conn/bind=
_windows.go:291
> > +0x265
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/device.(*Device).BindUpdate(0xc000222000,
> > 0x0, 0x0)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/de=
vice.go:470
> > +0x104
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/device.(*Device).handleDeviceLine(0xc0002220=
00,
> > 0xc000324030, 0xb, 0xc00032403c, 0x1, 0x1, 0xc0003140a0)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/ua=
pi.go:223
> > +0x7a5
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation(0xc00022200=
0,
> > 0x52ee60, 0xc0003042a0, 0x0, 0x0)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/ua=
pi.go:183
> > +0x279
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/device.(*Device).IpcHandle(0xc000222000,
> > 0x537840, 0xc0004b4078)
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard@v0.0.0-20210409202608-75526d60714c/device/ua=
pi.go:426
> > +0x165
> > 2021-04-12 08:41:07.410: [TUN] created by
> > golang.zx2c4.com/wireguard/windows/tunnel.(*tunnelService).Execute.func=
2
> > 2021-04-12 08:41:07.410: [TUN]
> > golang.zx2c4.com/wireguard/windows/tunnel/service.go:226 +0x7b
> > 2021-04-12 08:41:07.467: [MGR] [lhirisseccom01] Tunnel service tracker
> > finished
> > 2021-04-12 08:41:16.327: [MGR] [Wintun] IsPoolMember: Reading pool
> > devpkey failed, falling back: Element not found. (Code 0x00000490)
> > 2021-04-12 08:41:16.338: [MGR] Removing Wintun interface
> > =E2=80=98lhirisseccom01=E2=80=99 because no service for it exists
> >
> > On 09/04/2021 23:47, Jason A. Donenfeld wrote:
> >> The fix has been released in 0.3.10.
> >>
> >> Jason

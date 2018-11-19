Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C41C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:55:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE012075B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:55:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=erayd.net header.i=@erayd.net header.b="ROY4RtUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE012075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=erayd.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a82509f;
	Mon, 19 Nov 2018 20:48:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54651074
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:48:36 +0000 (UTC)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21d592d8
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:48:36 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id x2so7063053ywc.9
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 12:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erayd.net; s=ga;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=p+5Z/GQIjOFMxKnYOaZ2L9x51ySGs5MmPC9en9MaDCw=;
 b=ROY4RtUNm1KAm1RWpTzmx1u8NnNkVRGWSDFjL21tnphVuO1Z0obsU15LBf9b9uXUWP
 ZYlq8tBcw6m0yWlP0U48ArbPILrioEzzPhTmgLyBTJmadSIvPFVpR3kOtjbxvu53Li9l
 GtjvF+OQegEMnqKamo/dsXXS0nohvqupjv9u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=p+5Z/GQIjOFMxKnYOaZ2L9x51ySGs5MmPC9en9MaDCw=;
 b=eyNgxnDYE4xD5Cera753+OTz/bDDjyLqAIw5BqZrToWT7fFgbuyjGf8BFf8ALDGSED
 tBUNKHBITMFZLdewu1dE+XcpsRD/jga90QNWYvrNi8iUQkx+V4Wuh+Imz197ieBKxoMK
 PevCqGHKxvNuQgy+0ZZxCBHcAOnah/H1lJt9VzC0h2vQXzMpvVniCE++8BswhYw0wSFD
 lNrIHG46YHPgbDQjYUQ+p+Vk6gf7YoWJBzlP5V95wHLocc3Itaux3l6DEhjrCy5YzJ5D
 RXjFQO0X06nbK6RN9x84HI11vaNoYbqtrbns175WF5tyXG2AeIFIbDrIkhJQr14QIwBE
 xRBg==
X-Gm-Message-State: AGRZ1gKs4dUyaahxvUt5biYy+Q1blOZc9h3inBReyZWS/NfVtfRTLDXm
 iBIan8nCl8cxcVKjGK/v79+VVC5Nkqv5UWaN4sXJUE2bTG4=
X-Google-Smtp-Source: AJdET5cLewG2lomcDaWHmEsz+/6L8J1DgTErmLEYA9d9C4BSRbJnW1WyeGuSINZM1yepVpsaoKG/V6HWuqvZqLKZzp0=
X-Received: by 2002:a0d:df85:: with SMTP id
 i127mr17863232ywe.125.1542660877213; 
 Mon, 19 Nov 2018 12:54:37 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
In-Reply-To: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
From: Steve Gilberd <steve@erayd.net>
Date: Tue, 20 Nov 2018 09:54:26 +1300
Message-ID: <CAJQSx3aGs6xGqU0Otknn3jFfizyYS9VemG2QBWsY=3E6P_ED5w@mail.gmail.com>
Subject: Re: Seeking suggestions for a WG port to use with restrictive public
 wifi networks
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
Content-Type: multipart/mixed; boundary="===============3145047624658716402=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3145047624658716402==
Content-Type: multipart/alternative; boundary="000000000000987f85057b0ab9e5"

--000000000000987f85057b0ab9e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have you tried 1701/udp? That's the standard L2TP port - it's unlikely to
be particularly useful on networks which deliberate block VPN access, but
I've encountered a number of networks on which that port was usable, and
not much else.

Cheers,
Steve

On Tue, 20 Nov 2018 at 09:38 John <graysky@archlinux.us> wrote:

> Use case: WG VPN server (linux) and iOS clients (I mention that
> because the solution need to just-work with the iOS WG client without
> extra steps for ease).
>
> Goal: identify a port on which to run WG that has a good chance of
> being open to clients on both LTE and public WiFi networks.
>
> I currently run OpenVPN on 80/tcp which works for the vast majority of
> networks.  I'd like to switch over to WG.
>
> I found that port 123 is not very compatible with the public networks
> I tend to use.  Port 53 seems to work on WiFi, but does not ork due to
> Verizon actively blocking traffic on it.  I tried a few higher numbers
> including 51820 and 41185 but they seem to be blocked.  I also tried a
> few standard service ports including: 80, 443, and 1194 but all of
> which failed to connect.
>
> Should I stick with the "standard" udp service ports for my
> trial-and-error based approach?  Wikipedia has an article that lists
> many of these (List_of_TCP_and_UDP_port_numbers).  Any suggestions are
> welcomed.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019, The Terrace, Wellington 6143, NZ*

--000000000000987f85057b0ab9e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have you tried 1701/udp? That&#39;s the standard L2TP port=
 - it&#39;s unlikely to be particularly useful on networks which deliberate=
 block VPN access, but I&#39;ve encountered a number of networks on which t=
hat port was usable, and not much else.<div><br></div><div>Cheers,</div><di=
v>Steve<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 20 Nov 2=
018 at 09:38 John &lt;<a href=3D"mailto:graysky@archlinux.us">graysky@archl=
inux.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Use case: WG=
 VPN server (linux) and iOS clients (I mention that<br>
because the solution need to just-work with the iOS WG client without<br>
extra steps for ease).<br>
<br>
Goal: identify a port on which to run WG that has a good chance of<br>
being open to clients on both LTE and public WiFi networks.<br>
<br>
I currently run OpenVPN on 80/tcp which works for the vast majority of<br>
networks.=C2=A0 I&#39;d like to switch over to WG.<br>
<br>
I found that port 123 is not very compatible with the public networks<br>
I tend to use.=C2=A0 Port 53 seems to work on WiFi, but does not ork due to=
<br>
Verizon actively blocking traffic on it.=C2=A0 I tried a few higher numbers=
<br>
including 51820 and 41185 but they seem to be blocked.=C2=A0 I also tried a=
<br>
few standard service ports including: 80, 443, and 1194 but all of<br>
which failed to connect.<br>
<br>
Should I stick with the &quot;standard&quot; udp service ports for my<br>
trial-and-error based approach?=C2=A0 Wikipedia has an article that lists<b=
r>
many of these (List_of_TCP_and_UDP_port_numbers).=C2=A0 Any suggestions are=
<br>
welcomed.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr">Ch=
eers,</p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<span style=3D"color:rgb(102,102,102)">Erayd LTD=C2=A0</span><span style=3D=
"color:rgb(102,102,102)"><b>=C2=B7</b></span><span style=3D"color:rgb(102,1=
02,102)">=C2=A0Consultant</span><br>
<span style=3D"color:rgb(102,102,102)"><i>Phone: +64 4 974-4229=C2=A0</i></=
span><span style=3D"color:rgb(102,102,102)"><i><b>=C2=B7</b></i></span><spa=
n style=3D"color:rgb(102,102,102)"><i>=C2=A0Mob: +64 27 565-3237</i></span>=
<br>
<span style=3D"color:rgb(102,102,102)"><i>PO Box 10019, The Terrace, Wellin=
gton 6143, NZ</i></span></p>
</div></div>

--000000000000987f85057b0ab9e5--

--===============3145047624658716402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3145047624658716402==--

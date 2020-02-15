Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A68C352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 22:50:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8B920675
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 22:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kWgvEEx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8B920675
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ca91bca;
	Sat, 15 Feb 2020 22:48:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97b2a246
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 22:48:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dc1c057
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 22:48:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cda96c49
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=W3iEKO9MS14Gy/PEZawJ5G09AY8=; b=kWgvEE
 x0Pke9rXHuIH2+hDr8xQ1ORWFOdt0o/BhJLAZkjuCBohLJk9TMy0wqALfpXH5anT
 lYd5VUsnBP8VXy9n4nR/Tea9WpPAm3E+ew0JoQ5chDmBaPks5qf+YbeKPdN+QL8W
 Kctmqo6CPPphFHzaNh1YT0M1odPcRGgRDecKgoUwIYielr7wLJbWPlhK6o/jxukL
 y3SNXiCW71/xbD5alOLmlzRn9U+/v5pU/EfGThjGeLRHBi7wKP2x2kVKOwi2Nupf
 iortv4p/21n7CZpEKBgQpmGIyid91kY2w7/OeKTT5MlK+WihEQc/tufr+WlSNAlf
 fyKuQsgxCWOKV/uQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f87cf8af
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 22:48:20 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id h9so12617206otj.11
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 14:50:37 -0800 (PST)
X-Gm-Message-State: APjAAAWymY24LqRbpjer6o0kzufaHLu8rPiT5itQDAc3zt4Iz6shas9I
 HTSsRVU3+opfvBc0yvVNVoxGwNfrTimOxOWveiw=
X-Google-Smtp-Source: APXvYqzWE3kRkq7y9R2fP9M3R0KsKpMTxXm1FoM8d76xZjjflWBANu8aW7IIi0ot7T/I7oMPQEYJjYd47FpFidskbfA=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr7490192otm.179.1581807036933; 
 Sat, 15 Feb 2020 14:50:36 -0800 (PST)
MIME-Version: 1.0
References: <cdf774f4-694e-22ab-966a-c57a1b9ff10a@m7n.se>
In-Reply-To: <cdf774f4-694e-22ab-966a-c57a1b9ff10a@m7n.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 15 Feb 2020 23:50:24 +0100
X-Gmail-Original-Message-ID: <CAHmME9rPnUPE7g3M7wsAfDw2_U0Gy4eqUWF2bnJ9yyhsHX0D3Q@mail.gmail.com>
Message-ID: <CAHmME9rPnUPE7g3M7wsAfDw2_U0Gy4eqUWF2bnJ9yyhsHX0D3Q@mail.gmail.com>
Subject: Re: wireguard-go: IpcGetOperation: return peers in sorted order
To: mikma.wg@lists.m7n.se
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
Content-Type: multipart/mixed; boundary="===============2084778154981886291=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2084778154981886291==
Content-Type: multipart/alternative; boundary="0000000000008a306f059ea52685"

--0000000000008a306f059ea52685
Content-Type: text/plain; charset="UTF-8"

The show command presently sorts things based on last handshake time:
https://git.zx2c4.com/wireguard-tools/tree/src/show.c#n27

It sounds like you'd like the output of showconf to be sorted too so that
peers have some stable output order; perhaps you have diffing configs in
mind?

The kernel will output peers in the order that they were added, iirc. Maybe
wireguard-go should do the same?

Alternatively, we could sort this in the showconf code? But then we need
some sorting criteria, and people might wish instead for things to match
the input order of the original file.

In other words, either showconf sorts, or wireguard-go retains its input
order. I think I'd prefer the latter. Do you have a preference?

Jason


On Sat, Feb 15, 2020, 23:42 <mikma.wg@lists.m7n.se> wrote:

> Hello,
>
> I have an improvement to IpcGetOperation in wireguard-go.
>
> uapi: IpcGetOperation: return peers in sorted order
>
> Sort peers based on the public key.
> The pros of using a sorted peer list is that the order doesn't change in
> each ipc operation, or execution of the "wg showconf" command. Which
> could be the case previously with an unsorted peer list.
>
> The output from git format-patch is attached. The patch is also
> available at
>
> https://cgit.m7n.se/pub/wireguard-go/commit/?id=027bf58651f1a7b2be1bedfde187e5277a13f48e
>
> /Mikael
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000008a306f059ea52685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>The show command presently sorts things based on las=
t handshake time: <a href=3D"https://git.zx2c4.com/wireguard-tools/tree/src=
/show.c#n27">https://git.zx2c4.com/wireguard-tools/tree/src/show.c#n27</a><=
br><div dir=3D"auto"><br></div><div dir=3D"auto">It sounds like you&#39;d l=
ike the output of showconf to be sorted too so that peers have some stable =
output order; perhaps you have diffing configs in mind?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">The kernel will output peers in the order t=
hat they were added, iirc. Maybe wireguard-go should do the same?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Alternatively, we could sort this=
 in the showconf code? But then we need some sorting criteria, and people m=
ight wish instead for things to match the input order of the original file.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">In other words, either =
showconf sorts, or wireguard-go retains its input order. I think I&#39;d pr=
efer the latter. Do you have a preference?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Jason</div><br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Feb 15, 2020, 23:42  &lt;<a href=3D"m=
ailto:mikma.wg@lists.m7n.se">mikma.wg@lists.m7n.se</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello,<br>
<br>
I have an improvement to IpcGetOperation in wireguard-go.<br>
<br>
uapi: IpcGetOperation: return peers in sorted order<br>
<br>
Sort peers based on the public key.<br>
The pros of using a sorted peer list is that the order doesn&#39;t change i=
n<br>
each ipc operation, or execution of the &quot;wg showconf&quot; command. Wh=
ich <br>
could be the case previously with an unsorted peer list.<br>
<br>
The output from git format-patch is attached. The patch is also <br>
available at <br>
<a href=3D"https://cgit.m7n.se/pub/wireguard-go/commit/?id=3D027bf58651f1a7=
b2be1bedfde187e5277a13f48e" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://cgit.m7n.se/pub/wireguard-go/commit/?id=3D027bf58651f1a7b2be1bedfd=
e187e5277a13f48e</a><br>
<br>
/Mikael<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--0000000000008a306f059ea52685--

--===============2084778154981886291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2084778154981886291==--

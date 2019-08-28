Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5742CC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 19:08:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFE5214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 19:08:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=davz-net.20150623.gappssmtp.com header.i=@davz-net.20150623.gappssmtp.com header.b="QbDzoJiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACFE5214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davz.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2909057;
	Wed, 28 Aug 2019 19:08:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf547f4b
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 19:08:26 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38ba8f7b
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 19:08:26 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 18so1704125ioe.10
 for <wireguard@lists.zx2c4.com>; Wed, 28 Aug 2019 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davz-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ra2LC7VKEEUjeEIj9f61oD4lx3/0n8aRtyyrl4EB0M=;
 b=QbDzoJiWcS2X/cNvunY4qz+w2FzqO8A5AyrSzDnSlG136mqftEBmFbnb6uBs3wLmFP
 hBPiOA8r7LBjl4Lp/96aQ1CotKx/nuJDonpcW81eq1ZFJlOK5J8bD5VZTqDOjeXLb2Jn
 Nucpe8HJFW0fahHPPel9rISJjt0N2SNYp7XLp0BPkVZwtuAgndgZLrY/U+DGHBMljdRj
 s2BnGIU1Icp7XfAQS2KCCE91FLixVGhKtHlW1cvzO1t1TqsYm1Ov0Zf8sl1VH5nYM4fA
 OJPmnNmy4j0e68qetzXuPOx0K0x1TSnjNWWQXKXEKGBP5nfQNIojkfG+YpUiM0VZO1b8
 imig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ra2LC7VKEEUjeEIj9f61oD4lx3/0n8aRtyyrl4EB0M=;
 b=c2+CsqZX7SvRC1cGNH0WoyFSR9pcniPVbtarff5sOw8vKx3tqpnzY3r0j1B17twKJv
 o9z44d8a+0v3K3EbYEr7WlJzPNjIfMJxombTaGkpZ1F9LlUImGs79+ETqH9EQQWIvh0u
 BlKC6mwT2nSR7wv2hNjQrutIR23PaKfngbK7pdoM1P33UTFzQxzt16DZw7T7SZFc+SIp
 9MsN6FylRlnxPKdcSng2+Ko9iSD52FlY/sqjN6nLudb3rkr1YwNJ9lwKiLmS3VXcOZVL
 j1ZVyGDTtwhPQqb5gj4EoHj15QVi74JOM5ToFbQhgZbQHZ9Q77YD+RmD3eXdB6SNTj7B
 /tqQ==
X-Gm-Message-State: APjAAAVpFzvF1AABqcBQChsZ2fHFKXQE1fxnuUoguXOmnKHdfEAv7c8J
 HXgSBPjTiuMxw3cP5pBYulhb51tVYkCLS1TYHxvO3A==
X-Google-Smtp-Source: APXvYqxB3EYKwad9NpZhbxUB6EeSQrD6deP1ExSQE5qy+mtl/YZconiKXRbpktfwEjpAGglGOQIrkgH3xddJduZQ0Bc=
X-Received: by 2002:a5e:9917:: with SMTP id t23mr6298598ioj.23.1567019305756; 
 Wed, 28 Aug 2019 12:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
 <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
 <CALwBDFtP-QkGVZ6EncjtQxZ1--sGWKwzXwpNPaiLYymR5=+G6Q@mail.gmail.com>
In-Reply-To: <CALwBDFtP-QkGVZ6EncjtQxZ1--sGWKwzXwpNPaiLYymR5=+G6Q@mail.gmail.com>
From: Alex Davies <alex@davz.net>
Date: Wed, 28 Aug 2019 20:08:13 +0100
Message-ID: <CAHwDNp2pLJBV8M0sPa+XA4MDMVqJOp2=PQ1B=_W++k7V=wYfGA@mail.gmail.com>
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: Varun Priolkar <me@varunpriolkar.com>
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
Content-Type: multipart/mixed; boundary="===============3175890177133451145=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3175890177133451145==
Content-Type: multipart/alternative; boundary="0000000000001386e30591321d83"

--0000000000001386e30591321d83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is great news. We have been using wireguard on OPNSense (mostly as
servers, but also as a client in a few places) in production for some time
now, without drama (we found one bug with a trivial workaround, see email
chain "Table=3Doff behavior (not adding any route *at all*)" to this list).
We can now upgrade to something formally "supported" ;-)

If anybody else tries to use the hardware appliances provided by the
founders of OPNSense (Deciso[1]) as a wireguard server or client, we found
the performance on the non-x86 CPUs (A10, etc.) was not great (they have
all sorts of ipsec type offloads, but not for WG). IIRC we struggled to get
more than a few gigabits per second in aggregate. The Intel E3 models are
able to run as close to line rate on 10G as makes no odds for us.

[1]
https://www.deciso.com/wp-content/uploads/2015/11/Brochure-OPNsense-applian=
ces_ordered-rev201603.pdf


On Mon, Aug 26, 2019 at 1:32 PM Varun Priolkar <me@varunpriolkar.com> wrote=
:

> Congratulations! :) I did test it out when it wasn=E2=80=99t stable and w=
ell
> things weren=E2=80=99t stable(as expected). Hope to have an another crack=
 at it.
>
> On Sun, 25 Aug 2019 at 21:32, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>> Congratulations on the release. That's great news.
>>
>> Would you like me to add some blurb to https://www.wireguard.com/install=
/
>> on it?
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> --
> Regards,
>
> Varun Priolkar
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000001386e30591321d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is great news. We have been using wireguard on OPNSen=
se (mostly as servers, but also as a client in a few places) in production =
for some time now, without drama (we found one bug with a trivial workaroun=
d, see email chain &quot;Table=3Doff behavior (not adding any route *at all=
*)&quot; to this list).=C2=A0

We can now upgrade to something formally &quot;supported&quot; ;-)<div><br>=
</div><div>If anybody else tries to use the hardware appliances provided by=
 the founders of OPNSense (Deciso[1]) as a wireguard server or client, we f=
ound the performance on the non-x86 CPUs (A10, etc.) was not great (they ha=
ve all sorts of ipsec type offloads, but not for WG). IIRC we struggled to =
get more than a few gigabits per second in aggregate. The Intel=20

E3 models are able to run as close to line rate on 10G as makes no odds for=
 us.=C2=A0<br></div><div><div><br></div><div>[1]=C2=A0<a href=3D"https://ww=
w.deciso.com/wp-content/uploads/2015/11/Brochure-OPNsense-appliances_ordere=
d-rev201603.pdf">https://www.deciso.com/wp-content/uploads/2015/11/Brochure=
-OPNsense-appliances_ordered-rev201603.pdf</a></div><div><br></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Aug 26, 2019 at 1:32 PM Varun Priolkar &lt;<a href=3D"mailto:me@varun=
priolkar.com">me@varunpriolkar.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div><div dir=3D"auto">Congratulations! :=
) I did test it out when it wasn=E2=80=99t stable and well things weren=E2=
=80=99t stable(as expected). Hope to have an another crack at it.</div></di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, 25 Aug 2019 at 21:32, Jason A. Donenfeld &lt;<a href=3D"mailto:Jas=
on@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Congratulations on the relea=
se. That&#39;s great news.<br>
<br>
Would you like me to add some blurb to <a href=3D"https://www.wireguard.com=
/install/" rel=3D"noreferrer" target=3D"_blank">https://www.wireguard.com/i=
nstall/</a> on it?<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail-m_-72491894=
59869727714gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v>Regards,<br><br></div>Varun Priolkar</div></div></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000001386e30591321d83--

--===============3175890177133451145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3175890177133451145==--

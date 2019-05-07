Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3DBC04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588642173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=z3n.uk header.i=@z3n.uk header.b="55+2Mx5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588642173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3n.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a010da71;
	Sat, 11 May 2019 13:10:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d96df036
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 16:28:56 +0000 (UTC)
Received: from m32-19.eu.mailgun.net (m32-19.eu.mailgun.net [141.193.32.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 165ac20a
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 16:28:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=z3n.uk; q=dns/txt;
 s=smtp; 
 t=1557246535; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=VxBVkZWm25hn+9Hx/1f6KahWVDKzx0Er5eUyuuNm8ms=;
 b=55+2Mx5cCDVrscFnuQB3A6ztRUJGtyV/88KafdvYO4mpwlGXgQta8su6uLSVV9IAOIt19YNM
 fhyf5E2pryUFicPzoqShfa0n3XBq6ZysPBMIj5Qj4V0tcMVMA8sQQEkgf/oa3N/UUciSK7sQ
 jvrUEbi+HFO8ScV0CguI/YQnjnY=
X-Mailgun-Sending-Ip: 141.193.32.19
X-Mailgun-Sid: WyI2NzAzMCIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImNjODYiXQ==
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com
 [209.85.161.47])
 by mxa.mailgun.org with ESMTP id 5cd1b245.7f4e6a12b930-smtp-out-n02;
 Tue, 07 May 2019 16:28:53 -0000 (UTC)
Received: by mail-yw1-f47.google.com with SMTP id q185so13726137ywe.3
 for <wireguard@lists.zx2c4.com>; Tue, 07 May 2019 09:28:53 -0700 (PDT)
X-Gm-Message-State: APjAAAWWcgI0LXS1HP9A+RyOudpHhHqz2MynYb22wfI0bstvty/U88zF
 u9FboP5nJWtmB55xoNDN8p4Sl4WoB+ha7X+xcAw=
X-Google-Smtp-Source: APXvYqzKnbcEQjDFhbr5QfAGGQ5JOYgfIxpTkD00e67cj+Ag9/1v9MjbztyihS2AQyCHLKSder9MVJBhIVtxvVCdOe0=
X-Received: by 2002:a0d:e785:: with SMTP id
 q127mr20752648ywe.204.1557246532237; 
 Tue, 07 May 2019 09:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
 <87pnovti6t.fsf@line.ungleich.ch>
In-Reply-To: <87pnovti6t.fsf@line.ungleich.ch>
From: Will Tisdale <will@z3n.uk>
Date: Tue, 7 May 2019 17:28:41 +0100
X-Gmail-Original-Message-ID: <CAFWLA-WB4hv_Y=0gnnQ=3UeJ1av0GQWg1=DQ+jMZfyuCBnJUbg@mail.gmail.com>
Message-ID: <CAFWLA-WB4hv_Y=0gnnQ=3UeJ1av0GQWg1=DQ+jMZfyuCBnJUbg@mail.gmail.com>
Subject: Re: Request to change IPv4 preference - mobile apps
To: Nico Schottelius <nico.schottelius@ungleich.ch>
X-Mailman-Approved-At: Sat, 11 May 2019 15:10:35 +0200
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============4783242768374513447=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4783242768374513447==
Content-Type: multipart/alternative; boundary="00000000000061c1d205884eb6cd"

--00000000000061c1d205884eb6cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nico,

Not sure how that would work with WireGuard being a stateless protocol.
It also sounds a bit racey given that both v4 and v6 addresses would be
flinging packets at essentially the same endpoint.

I think the =E2=80=98proper=E2=80=99 way is to use the address returned in =
the AAAA record
if one exists. If people=E2=80=99s setup is so broken that it becomes an is=
sue,
they
will likely have worse issues than WG not working. :)

Preferring v4 does weird things like WG using DNS64 addresses over real
v6 addresses too - and using NAT64 instead of native v6 is really broken
behaviour.


Cheers,


-Will

On Mon, 6 May 2019 at 21:57, Nico Schottelius <nico.schottelius@ungleich.ch=
>
wrote:

>
> Hey Will,
>
> I think the "proper" way to handle this is by using the happy eyeballs
> algorithm: resolve AAAA and A, connect to both, use whatever answers
> first.
>
> Best,
>
> Nico
>
> Will Tisdale <will@z3n.uk> writes:
>
> > Hello,
> >
> > I sent a message to the list about weirdness with IPv4 being preferred
> > over IPv6 in the iOS app a few days ago, but it didn't get there for
> > whatever reason.
> >
> > I've since done a bit of digging through the code and found that
> > preferring IPv4 is intentional, and it's also implemented that way on
> > the Android app too.
> >
> > It seems a shame to hobble native IPv6 support for everyone just to
> > work around some peoples misconfigured setups.
> >
> > My suggestion/request would be to change the apps to prefer IPv6 as
> > default, but add a switch to the apps to disable IPv6 or prefer IPv4
> > for those with broken setups.
> >
> > Does that seem reasonable?
> >
> >
> > Cheers,
> >
> >
> > -Will
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> --
> Your Swiss, Open Source and IPv6 Virtual Machine. Now on
> www.datacenterlight.ch.
>

--00000000000061c1d205884eb6cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Nico,</div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Not sure how that would work with WireGuard being a stateless=
 protocol.</div><div dir=3D"auto">It also sounds a bit racey given that bot=
h v4 and v6 addresses would be=C2=A0</div><div dir=3D"auto">flinging packet=
s at essentially the same endpoint.=C2=A0</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I think the =E2=80=98proper=E2=80=99 way is to use the ad=
dress returned in the AAAA record</div><div dir=3D"auto">if one exists. If =
people=E2=80=99s setup is so broken that it becomes an issue, they=C2=A0</d=
iv><div dir=3D"auto">will likely have worse issues than WG not working. :)<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Preferring v4 does weird=
 things like WG using DNS64 addresses over real=C2=A0</div><div dir=3D"auto=
">v6 addresses too - and using NAT64 instead of native v6 is really broken=
=C2=A0</div><div dir=3D"auto">behaviour.=C2=A0</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">-Will</div><=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 6 May 2019 at 21:57, Nico Schottelius &lt;<a href=3D"mailto:nico.scho=
ttelius@ungleich.ch">nico.schottelius@ungleich.ch</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
Hey Will,<br>
<br>
I think the &quot;proper&quot; way to handle this is by using the happy eye=
balls<br>
algorithm: resolve AAAA and A, connect to both, use whatever answers<br>
first.<br>
<br>
Best,<br>
<br>
Nico<br>
<br>
Will Tisdale &lt;<a href=3D"mailto:will@z3n.uk" target=3D"_blank">will@z3n.=
uk</a>&gt; writes:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; I sent a message to the list about weirdness with IPv4 being preferred=
<br>
&gt; over IPv6 in the iOS app a few days ago, but it didn&#39;t get there f=
or<br>
&gt; whatever reason.<br>
&gt;<br>
&gt; I&#39;ve since done a bit of digging through the code and found that<b=
r>
&gt; preferring IPv4 is intentional, and it&#39;s also implemented that way=
 on<br>
&gt; the Android app too.<br>
&gt;<br>
&gt; It seems a shame to hobble native IPv6 support for everyone just to<br=
>
&gt; work around some peoples misconfigured setups.<br>
&gt;<br>
&gt; My suggestion/request would be to change the apps to prefer IPv6 as<br=
>
&gt; default, but add a switch to the apps to disable IPv6 or prefer IPv4<b=
r>
&gt; for those with broken setups.<br>
&gt;<br>
&gt; Does that seem reasonable?<br>
&gt;<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt;<br>
&gt; -Will<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGua=
rd@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wire=
guard</a><br>
<br>
<br>
--<br>
Your Swiss, Open Source and IPv6 Virtual Machine. Now on <a href=3D"http://=
www.datacenterlight.ch" rel=3D"noreferrer" target=3D"_blank">www.datacenter=
light.ch</a>.<br>
</blockquote></div></div>

--00000000000061c1d205884eb6cd--

--===============4783242768374513447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4783242768374513447==--

Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F24C3F2C6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 08:54:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BED24695
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 08:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="06Rb1pip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BED24695
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82b19e86;
	Sat, 29 Feb 2020 08:50:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1c525e0
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Feb 2020 08:50:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c74b95b
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Feb 2020 08:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=vXIDi37hUzHFLKwqbXCpEFcwOOo=; b=06Rb1p
 ipOA8ZDLQY0D3CF6fwx8ybJjRShgEZbT8hc74/wZSK1ApZ4m5ifCotyN7c3L+gn9
 xd7JKalaJhLlhrMPdJzmuXF0vujA2gExor3Q6N+UnN5U6k91L0ZS6DrehdjnmVIj
 W0E4CAO1JXgbt472UnKL5nQcDCdHwu8bHucoSxOfF0GIftYUwRT0UQzf/0wrdJHR
 z+Qz00SIhE9poJgP88E7zMqsSCLWc/uG8gVMMOU7LOcxl2NCw0FUC8E3Q2dO2m8U
 erJn/U8wFAOFaolggiLxRmWnT1cCN4eZhfNpXSJBdsRpT9zMMpp1yd7WKhsD7EdZ
 4wrjBs9wpas/N3Bw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3976a58
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Feb 2020 08:50:15 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id j14so667686otq.3
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 00:54:15 -0800 (PST)
X-Gm-Message-State: APjAAAWLhfBthn3k+jEQqgoxZcxk8gbaMEZ77/xQFK8+FC3cxHFaH+jj
 39MxzYRlQxW2OJXFJaCstLT8pNgXX6E6b4lclns=
X-Google-Smtp-Source: APXvYqwLuaZZguFlDvZckAuv0RdT6+DkI0QlsH4ex81BFiQAJs6jq+PyWK7avwuLbcFEA2ljpQCRWe017q4pvr1jhTg=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr6376525otm.179.1582966454964; 
 Sat, 29 Feb 2020 00:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
 <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
 <bc47c4f7-4aa4-fc6e-8f3c-34366c756236@sholland.org>
 <3bce7f79-88df-8035-6eb9-1e19e51c01a5@gmail.com>
 <CAA2ss9HbDro5vgS0W8_cTQUetLFzjUCqXO1CHmsHprM7_Q+mXA@mail.gmail.com>
In-Reply-To: <CAA2ss9HbDro5vgS0W8_cTQUetLFzjUCqXO1CHmsHprM7_Q+mXA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 29 Feb 2020 16:54:03 +0800
X-Gmail-Original-Message-ID: <CAHmME9q+8urTTq+HBknrhFq5B2YbK9GmcHWP6qOCuQUGh6tWKQ@mail.gmail.com>
Message-ID: <CAHmME9q+8urTTq+HBknrhFq5B2YbK9GmcHWP6qOCuQUGh6tWKQ@mail.gmail.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Eiji Tanioka <tanioka404@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6981583727276137642=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6981583727276137642==
Content-Type: multipart/alternative; boundary="0000000000003d597b059fb319dc"

--0000000000003d597b059fb319dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see no patch caught in the queue. Try again?

On Sat, Feb 29, 2020, 16:36 Eiji Tanioka <tanioka404@gmail.com> wrote:

> Hi Vasili!
>
> Did you send patch to ML?
> If so, I think that your patch is in the moderation queue. I had met
> same situation when sending my patch because of body size (over 40
> KB).
>
> I think it's okay if you wait.
>
> Regards,
>
> 2020=E5=B9=B42=E6=9C=8829=E6=97=A5(=E5=9C=9F) 16:03 Vasili Pupkin <digges=
t@gmail.com>:
>
> >
> > On 26.02.2020 6:59, Samuel Holland wrote:
> > > On 2/25/20 9:44 PM, Vasili Pupkin wrote:
> > >> It seams that russian translation is very basic and not utilize
> > >> quantity=3D"two"
> > >> and quantity=3D"few" forms, without them some plurals reads odd. Do =
you
> need help
> > >> fixing it or it is done on purpose?
> > > I don't think it was done on purpose; likely the translator was
> unaware of the
> > > additional options for quantity in <item> tags. I am happy to merge
> patches
> > > improving the translation (which is really up to your judgement, sinc=
e
> I don't
> > > speak any of these languages).
> >
> > Have you received the patch?
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000003d597b059fb319dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I see no patch caught in the queue. Try again?</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb=
 29, 2020, 16:36 Eiji Tanioka &lt;<a href=3D"mailto:tanioka404@gmail.com">t=
anioka404@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hi Vasili!<br>
<br>
Did you send patch to ML?<br>
If so, I think that your patch is in the moderation queue. I had met<br>
same situation when sending my patch because of body size (over 40<br>
KB).<br>
<br>
I think it&#39;s okay if you wait.<br>
<br>
Regards,<br>
<br>
2020=E5=B9=B42=E6=9C=8829=E6=97=A5(=E5=9C=9F) 16:03 Vasili Pupkin &lt;<a hr=
ef=3D"mailto:diggest@gmail.com" target=3D"_blank" rel=3D"noreferrer">digges=
t@gmail.com</a>&gt;:<br>
<br>
&gt;<br>
&gt; On 26.02.2020 6:59, Samuel Holland wrote:<br>
&gt; &gt; On 2/25/20 9:44 PM, Vasili Pupkin wrote:<br>
&gt; &gt;&gt; It seams that russian translation is very basic and not utili=
ze<br>
&gt; &gt;&gt; quantity=3D&quot;two&quot;<br>
&gt; &gt;&gt; and quantity=3D&quot;few&quot; forms, without them some plura=
ls reads odd. Do you need help<br>
&gt; &gt;&gt; fixing it or it is done on purpose?<br>
&gt; &gt; I don&#39;t think it was done on purpose; likely the translator w=
as unaware of the<br>
&gt; &gt; additional options for quantity in &lt;item&gt; tags. I am happy =
to merge patches<br>
&gt; &gt; improving the translation (which is really up to your judgement, =
since I don&#39;t<br>
&gt; &gt; speak any of these languages).<br>
&gt;<br>
&gt; Have you received the patch?<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"=
noreferrer">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a><br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000003d597b059fb319dc--

--===============6981583727276137642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6981583727276137642==--

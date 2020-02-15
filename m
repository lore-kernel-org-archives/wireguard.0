Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258CBC7114D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:29:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C362F2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYc0/LMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C362F2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4566c0cb;
	Sat, 15 Feb 2020 19:26:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4975328e
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 00:11:16 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97af4ca2
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 00:11:16 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id g6so4316298plt.2
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2020 16:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=6X5XEncHjBMhgxUlfkKvzhEbuMF2OWGj8AOQrX6BX3U=;
 b=VYc0/LMwdxHtCbPAH2UzqbQxG2orkF+W7L1CsDwzC5grzfD4P8ydp9br3aphaauwpa
 2luaqtE6WMDwKr9KlGL7zTkOgGOimMuouP2NdKNhYkMRjpgGfWB2JOTLI8a0Ns2JrJiM
 cpszFwPXYV9d2iIK9KcKNMwZ4gzWP3dSIRbv6LMvB/h9jJTzcI/Tjhw4wxWo/2lngI1Y
 wuf5RZ/3qIk3yD++XBdV9trRW47jQ4cXhjL7zZQCIT33mRn4z8Y2hZt7zPHx50bnNBS6
 wnCD0IR+Ma+MNyisSbUohtr/SNkNYJau88rebUQy12qX2aU7k9n2slXl7yHCvBFo3ml5
 nu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=6X5XEncHjBMhgxUlfkKvzhEbuMF2OWGj8AOQrX6BX3U=;
 b=AMkFZ4qFi7o5gv/sV6aBy+kuIYf4rZcMeO21HzJPGYIoZcHhgUZbyeYpxUzxAmnb1a
 WIgao8DrngWlCPOJbiL94Ys6t8mo/+PS9BqcHNOWWexixD3xa5cJUBaf484IAM7F0OL7
 J4h4nkXI+Wn76cZxRErwEBXRCgPTch7hDBMPS3rY/R4kEWdJOpTxFEwo7g1AUdBPyf4s
 BU1rUZl5PpQCbPvJ0ZjBCF26YCmrCvu73U7+LZ3Dxxd1J6VSDcez5GcphSgGTIJDgRsj
 lkor25QxQAYaH2sw5mTMoEJi8NwmcWRHAd4jD2mCAZvXDbpeHO5EhjTkSJ12yK3KXxmm
 iDhg==
X-Gm-Message-State: APjAAAVDfL/Eus5w+/K37vihXYkCBwZgIxOuntUmCUinv9Y8Ze6hYeN4
 BamvONLLFzj787MYrhvoPcGcqzeGA/FhehDoEwY=
X-Google-Smtp-Source: APXvYqxS9vD8Sn/ok7TSK5eZb3DYsMQvqzZn9tBkcXRlv/QglfaJ5fcAWpxAgX/Qj0HKxXjcuoKH9pLRlchDBdrpTCA=
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr6708445pjg.35.1581725605161; 
 Fri, 14 Feb 2020 16:13:25 -0800 (PST)
MIME-Version: 1.0
References: <CA+w0pKY0KGCBAPYqoTReXdDmB22ctWkczEoK-FFxoR3B8b0wzw@mail.gmail.com>
 <1FB426DC-C314-4DBE-BEF9-2A35D49094C4@pallas.us>
In-Reply-To: <1FB426DC-C314-4DBE-BEF9-2A35D49094C4@pallas.us>
From: Mo Balaa <buddybalaa@gmail.com>
Date: Fri, 14 Feb 2020 18:13:14 -0600
Message-ID: <CAKmhVkq4F+BLRc0nugT8kDwJp1LaTJt1DNpS2Lyss4x0r2xUuA@mail.gmail.com>
Subject: Re: CryptoKey Routing Management for Peers
To: Derrick Lyndon Pallas <derrick@pallas.us>
X-Mailman-Approved-At: Sat, 15 Feb 2020 20:26:03 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: buddybalaa@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2786907140360992571=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2786907140360992571==
Content-Type: multipart/alternative; boundary="000000000000d3f19c059e92305f"

--000000000000d3f19c059e92305f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My company will be open sourcing a configuration management system we=E2=80=
=99ve
called wg-easy. It is designed specifically for managing large scale
distributed WireGuard networks. We are happy to see other are interested in
operating WireGuard at scale.

Coming very soon, TM.

On Fri, Feb 14, 2020 at 17:46 Derrick Lyndon Pallas <derrick@pallas.us>
wrote:

> You might also want to check out https://pypi.org/project/wgnlpy/ which
> is a Wireguard configuration library for python.
>
> ~Derrick =E2=80=A2 iPhone
>
> On Feb 14, 2020, at 3:02 AM, Barrett Strausser <barrett@bossanova.com>
> wrote:
>
> =EF=BB=BF
>
> I don't doubt that it can handle 1M peers.
>
> My question was more concerned with can an *Organization *perform the
> configuration management to handle 1M peers if all configuration is throu=
gh
> a static IP.
>
> If I have 1M peers and .9999 have no change per day, that still leaves 10=
0
> changes or ~4 per hour. I'd argue it is a good practice to have to restar=
t
> services to pick up those changes.
>
> I'll have a look at those links. Thank you very much
>
> -b
>
>
>
> On Sat, Feb 8, 2020 at 4:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
>
>> WireGuard has an API, via Netlink. This might help you:
>>
>> https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
>> https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wireguard.h
>>
>> It can handle 1M peers, yes.
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000d3f19c059e92305f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">My company will be open sourcing a configuration man=
agement system we=E2=80=99ve called wg-easy. It is designed specifically fo=
r managing large scale distributed WireGuard networks. We are happy to see =
other are interested in operating WireGuard at scale.=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Coming very soon, TM.=C2=A0</div></di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, Feb 14, 2020 at 17:46 Derrick Lyndon Pallas &lt;<a href=3D"mailto:=
derrick@pallas.us">derrick@pallas.us</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)"><div dir=3D"auto">You might also want to check out=C2=A0<a href=3D"https=
://pypi.org/project/wgnlpy/" target=3D"_blank">https://pypi.org/project/wgn=
lpy/</a>=C2=A0which is a Wireguard configuration library for python.<br><br=
><div dir=3D"ltr">~Derrick=C2=A0=E2=80=A2 iPhone</div><div dir=3D"ltr"><br>=
<blockquote type=3D"cite">On Feb 14, 2020, at 3:02 AM, Barrett Strausser &l=
t;<a href=3D"mailto:barrett@bossanova.com" target=3D"_blank">barrett@bossan=
ova.com</a>&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite">=
<div dir=3D"ltr">=EF=BB=BF</div></blockquote></div><div dir=3D"auto"><block=
quote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr">I don&#39;t doubt tha=
t it can handle 1M peers.=C2=A0<div><br></div><div>My question was more con=
cerned with can an <i>Organization </i>perform the configuration management=
 to handle 1M peers if all configuration is through a static IP.</div><div>=
<br></div><div>If I have 1M peers and .9999 have no change per day, that st=
ill leaves 100 changes or ~4 per hour. I&#39;d argue it is a good practice =
to have to restart services to pick up those changes.</div><div><br></div><=
div>I&#39;ll have a look at those links. Thank you very much</div><div><br>=
</div><div>-b</div><div><br></div><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 8, 2020 at 4:2=
9 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_b=
lank">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">WireGuard ha=
s an API, via Netlink. This might help you:<br>
<br>
<a href=3D"https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg=
-library" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/wiregu=
ard-tools/tree/contrib/embeddable-wg-library</a><br>
<a href=3D"https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wiregu=
ard.h" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/wireguard=
-tools/tree/src/uapi/linux/wireguard.h</a><br>
<br>
It can handle 1M peers, yes.<br>
</blockquote></div>
<span>_______________________________________________</span><br><span>WireG=
uard mailing list</span><br><span><a href=3D"mailto:WireGuard@lists.zx2c4.c=
om" target=3D"_blank">WireGuard@lists.zx2c4.com</a></span><br><span><a href=
=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" target=3D"_blank">h=
ttps://lists.zx2c4.com/mailman/listinfo/wireguard</a></span><br></div></blo=
ckquote></div>_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--000000000000d3f19c059e92305f--

--===============2786907140360992571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2786907140360992571==--

Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ED4C3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:08:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D3F206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBVe9WtP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D3F206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35cc535f;
	Thu, 30 Jan 2020 01:54:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 751683be
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 09:17:01 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 949e433b
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 09:17:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id t23so5379764wmi.1
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 01:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=wOT/OTBL2uzpC6AeOeNF9w/o0iSJ3EgiGKVN0jYy/qA=;
 b=QBVe9WtPumTeGDCAVcgrf01V5fHViSJS5rlibMZdEc37tSSl7Kc+V1Zsjnb8W1T4RX
 zC16/+fESTjxPXsa48ZIB+FCTlMj2G1qlchD0TiNvZ2REzgzMvcJJjtNr6fl340YlNJa
 tXPwtrCq46xntwhqmeF2gpMtvXGJGpe4FVdwx3Uk9h3Awk6fxF6kv7M6WgA/WpfmuDHY
 XPYibF2har18LgcKtidVjrED4bMVPeD1SjYxTbyC1jC592JKQgeIgPP4ErqmZgGuDZrF
 0+01eA18ehIFWszbg05gnSgyyiqlMJsb/YCjUUrJYeNl+BOfk9RuJhyrqec7PdGRuYRL
 x8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=wOT/OTBL2uzpC6AeOeNF9w/o0iSJ3EgiGKVN0jYy/qA=;
 b=NFw91zYd9t53khpOV5Hr1/7w7QELnc1soOG6JWwp41SC5zTezQdCUjUkvCriDU0x59
 l/EcMHqgT8c9r1uYGAb3yQb7I+17P9wiQkVukcEUVB/wN60+FuGJhP4p8qezdk4VxVTZ
 KUQxyWXn4VWVRykuKhPrWH2xp7jkFOJeOvavQsd6Y+GbnMYsTgR/OAIwQdLlWlt8CRl9
 7fbkNK/kvkUhEqvCZjONBjmQGVatoG0MAAHjNg3r3JfR21B6iNXSGXO//eZ0nt3BwvI6
 wdxtcGzxumwNJWlEbhPYlvL6Fam2hd6YVHgWgQrsSBpmFi39+r0FZe0CfT7rG02mYM8x
 Y5mQ==
X-Gm-Message-State: APjAAAWsko/i/O/j0OmPtLt7i3ctgWuv7uXK3z+EwbAA/Pn8VntZj8f8
 OOShAeTyNoX05uzO+lYe4cedwMYRpmbHgHnH5nF96Q==
X-Google-Smtp-Source: APXvYqzLLeRkJoUw/dXn2s0DHV633KQHaXlQWMfKRIsuNbAiFWKMtAqceYo2RpjIJXkRM6ub71yqlf7eERMueFfQjj0=
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr2901425wmc.10.1580289420695; 
 Wed, 29 Jan 2020 01:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20200129002159.GA9104@wolff.to>
 <CAHmME9po4e8VccZwWmHotBqR=RBbKtwu8uGV7wm2WXz9Rq3f=Q@mail.gmail.com>
In-Reply-To: <CAHmME9po4e8VccZwWmHotBqR=RBbKtwu8uGV7wm2WXz9Rq3f=Q@mail.gmail.com>
From: C Habs <bumpthelala@gmail.com>
Date: Wed, 29 Jan 2020 09:16:49 +0000
Message-ID: <CANe8y8amu3m01vHG_2fj2th_DNB8HeE8GNOiRemupELtNzcyVA@mail.gmail.com>
Subject: Re: Wireguard is now in Linus' tree
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:54:05 +0100
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
Content-Type: multipart/mixed; boundary="===============0663068620863273355=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0663068620863273355==
Content-Type: multipart/alternative; boundary="000000000000901c59059d43cdbb"

--000000000000901c59059d43cdbb
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2020 at 08:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Bruno,
>
> Thanks for posting this! Indeed last night I stayed awake as long as I
> could, refreshing Linus' git repo on my phone until I was dreaming. I
> _think_ I've woken up now, but this might still be a dream...
>
> A big thanks to everybody who's helped the project over the years,
> written code, assisted in the IRC channel, asked good questions on the
> list and IRC channel, and so forth.
>
> I look forward to start refining some of rougher areas of WireGuard now.
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


Thank you to all, from me in userland. It never ceases to amaze me the
effort and skill from generous people that goes in to these projects made
available for all to use.

Habs

--000000000000901c59059d43cdbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 29 Jan 2020 at 08:45, Jason A=
. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bruno,=
<br>
<br>
Thanks for posting this! Indeed last night I stayed awake as long as I<br>
could, refreshing Linus&#39; git repo on my phone until I was dreaming. I<b=
r>
_think_ I&#39;ve woken up now, but this might still be a dream...<br>
<br>
A big thanks to everybody who&#39;s helped the project over the years,<br>
written code, assisted in the IRC channel, asked good questions on the<br>
list and IRC channel, and so forth.<br>
<br>
I look forward to start refining some of rougher areas of WireGuard now.<br=
>
<br>
Regards,<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a></blockquote><div><br></div><div>Thank you to all, from me in userland.=
 It never ceases to amaze me the effort and skill from generous people that=
 goes in to these projects made available for all to use.</div><div><br></d=
iv><div>Habs<br></div><div><br></div><div>=C2=A0</div></div></div>

--000000000000901c59059d43cdbb--

--===============0663068620863273355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0663068620863273355==--

Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD66C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:52:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DA224686
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO7tAtYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1DA224686
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1e3ecd2;
	Tue, 28 Jan 2020 10:51:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47d8e79a
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:51:06 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 830611c7
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:51:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id j17so14209471edp.3
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 02:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=A12iolCT8jOKKGzLY/xM87JcZ8st/O2RGgxu1ZE4kPU=;
 b=OO7tAtYDFA/N5XGMuMUtEw3JeHs2HRLe4zrCfRIpClWJDcRsnew7a0UXlTosVKwg1E
 OWgx4AJYE675RPP8Z8LRY0+YgCHk4pda6FtF330QKLoxpk8EBHefvMn+5mm73MRXDw9+
 9JpYi/y4Gq/KJOMswk69cfidF/hFxKwsZiCmIdEqMyDFGcOkIVhg8ddwO7rxwhxC6bBN
 Qd1WQ2mdF3GAUQ3m6a3cViJ7x7TPYmOGuZH/Rb2NeQFWM/D1gAJci2uMc0lVMLvQ04D+
 3kfb5BzmK5MT9DkpI6EuxC4Z+7PrI5sRHIzJQTUnC2/+sCwEdjaPXgfwOtzlavq/HKmU
 QZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=A12iolCT8jOKKGzLY/xM87JcZ8st/O2RGgxu1ZE4kPU=;
 b=KlH3Vfxd1mJ62RuJKUM7W7RwbXOZ7Cw+/L7wbDixQO+T80QGt89oOvCC4LT4YCKp8e
 eZOk4FtUuF4RnhugzeujUmbeH1qJjefuJOINBwd8GNrEkJNkpyFejuD5y3oHWlOWgHHj
 vydBwjo/UCZUN7ZCUTgvHijK5bnspbFujOdia+jG0M/URBifvOSlivdhwRQvFhNk3OiG
 AFI6t9mLmHmeCtx8wqFIzVQMRzn+QXIssAwoGeBRZVHLTgp/8PEJzbvJPMGumlYoRE+a
 HOfqMZvRf0X8hCz/OgKlxiNkYyJNrjxLnefCiyK/HvLXQEiuvMWEEviwPnykjz5cE/aI
 urQg==
X-Gm-Message-State: APjAAAXKSGZydadgzz9+4EHPUZwb/+ZvphvYa1syf/+32G0Zzhy9YaBu
 vXaSaqQ/EYNFsUlSuCA/SzuIG1gmzhFImQ3oEpdSuR0q1N8=
X-Google-Smtp-Source: APXvYqyp2NPqf3V6Wr3JRV0iIVe1ubrI9QPe8+tR5Qajn1iXoQCddVeUutItXvugdd9yrpQbaR7xa+biH3AzoAKhUbs=
X-Received: by 2002:a05:6402:c0e:: with SMTP id
 co14mr2777436edb.192.1580208664416; 
 Tue, 28 Jan 2020 02:51:04 -0800 (PST)
MIME-Version: 1.0
References: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
In-Reply-To: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
From: Kai Haberzettl <khaberz@gmail.com>
Date: Tue, 28 Jan 2020 11:50:53 +0100
Message-ID: <CA+CGqoKd5LoT2jmetk-ETCXMAU8LNgkgtP40R42zOX7oH7P3Qw@mail.gmail.com>
Subject: Re: wireguard-hosts file
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============6465940625504326679=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6465940625504326679==
Content-Type: multipart/alternative; boundary="0000000000001d13bf059d310048"

--0000000000001d13bf059d310048
Content-Type: text/plain; charset="UTF-8"

Maybe an Alternative would be simpler to implement: Make wg output all
comment lines of the corresponding [peer] section from the .conf file in
addition to what it already lists. That would serve the same purpose, I
think.

On Fri, Jan 24, 2020 at 5:07 PM jens <jens@viisauksena.de> wrote:

> i really would love to have a feature like wireguard-hosts file.
> whereas wg command would print given "name" instead of key - so the
> output would be more meaningfull
> We have some wireguard running in server like infrastructure, where one
> server serves dozens of "clients"
>
> so instead of
> peer: l9FxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=
> we would have something alike
> peer: superhero downtown
>
> some of you may be familar with batman-adv layer2 routing protocol,
> there they also have a batctl which is working pretty similar to wg tool.
> there you can add a bat-hosts file which is doing the job, which totaly
> works likes any hosts file
> a normal hosts file maps ip to name,
> a bat-hosts file maps mac addresses to name,
> a wg-hosts file would map keys to name.
>
> i found the sources for bat-hosts ( .c .h .sample ) here
>
> https://downloads.open-mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz
>
> is this something maybe usefull to other also?
> is there a chance to have this implemented by default?
>
> thx for answers.
> fuzzle
>
> --
> make the world nicer, please use PGP encryption
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000001d13bf059d310048
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Maybe an Alternative would be simpler to =
implement: Make wg output all comment lines of the corresponding [peer] sec=
tion from the .conf file in addition to what it already lists. That would s=
erve the same purpose, I think.=C2=A0</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 24, 2020 at 5:07 PM jens &=
lt;<a href=3D"mailto:jens@viisauksena.de">jens@viisauksena.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">i really would=
 love to have a feature like wireguard-hosts file.<br>
whereas wg command would print given &quot;name&quot; instead of key - so t=
he<br>
output would be more meaningfull<br>
We have some wireguard running in server like infrastructure, where one<br>
server serves dozens of &quot;clients&quot;<br>
<br>
so instead of<br>
peer: l9FxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=3D<br>
we would have something alike<br>
peer: superhero downtown<br>
<br>
some of you may be familar with batman-adv layer2 routing protocol,<br>
there they also have a batctl which is working pretty similar to wg tool.<b=
r>
there you can add a bat-hosts file which is doing the job, which totaly<br>
works likes any hosts file<br>
a normal hosts file maps ip to name,<br>
a bat-hosts file maps mac addresses to name,<br>
a wg-hosts file would map keys to name.<br>
<br>
i found the sources for bat-hosts ( .c .h .sample ) here<br>
<a href=3D"https://downloads.open-mesh.org/batman/releases/batman-adv-2019.=
5/batctl-2019.5.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://downlo=
ads.open-mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz</a=
><br>
<br>
is this something maybe usefull to other also?<br>
is there a chance to have this implemented by default?<br>
<br>
thx for answers.<br>
fuzzle<br>
<br>
-- <br>
make the world nicer, please use PGP encryption<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--0000000000001d13bf059d310048--

--===============6465940625504326679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6465940625504326679==--

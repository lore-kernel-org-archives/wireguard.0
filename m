Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB579C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 20:19:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386E320879
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 20:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vjl6wvO4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 386E320879
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32e57046;
	Tue, 14 May 2019 20:18:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd051a20
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 20:18:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b37a858
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 20:18:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de0e42ef
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=YiiaDYj9mU8SJd/wafcCDkW4mH8=; b=Vjl6wv
 O41zSKqrGG8/YRPC5YRooVd1BZctMduN8D2f25xLvZyyJfCKT2V673FEy/yoNub3
 BBnmgeuEX9dbR/0c4rUrwICcnwtOrO8dWrV8WQWsc2bPF+zAg3GjDpS6lPaX/wk8
 TdVPEseCSi1R0UJsmSFWgulrpRPBlPRdFUuWB1rp2GtH3xFhpoh7rw2yF/Z7v4ki
 mOhJvk+S0yrog5P5MKjiW2GLbcl2KjQHtmw/S48hyYlSTN+SPRaBgxJneLMrai2x
 rM48gdfAi3mgcqVMAgNwpwGKCpxHC1hLX98EY4qJkFiLkwyWGBuWzLq/9l4n6esI
 j6LDu7H3fwCeAXnQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a12c0ad7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 19:50:11 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 66so129364otq.0
 for <wireguard@lists.zx2c4.com>; Tue, 14 May 2019 13:18:45 -0700 (PDT)
X-Gm-Message-State: APjAAAUiHhbmgU1ss8M/031+y2RYb0vgT3k87jBxqee0xvKavfxUGxej
 ogVDsag8MqItZTWpA9fEMYLVoCks9yDU1PBRags=
X-Google-Smtp-Source: APXvYqxuUuKvwToVIFkpJolGNebGiqkHMA6xqhALgpMe6NS0d+nRulwLjZ6/wEaSckZrmRs77TZX35Tv4++j657kE8Q=
X-Received: by 2002:a05:6830:164d:: with SMTP id
 h13mr2524581otr.99.1557865123737; 
 Tue, 14 May 2019 13:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <9b657152-e9c9-5254-ea3e-0ff4c452fc36@bartschnet.de>
 <20190514194658.GB22244@kroah.com>
In-Reply-To: <20190514194658.GB22244@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 May 2019 22:18:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9qSRwVkTA1mroudGG=p8CP-R8wpHYmh9uaqu_W3X=LZbA@mail.gmail.com>
Message-ID: <CAHmME9qSRwVkTA1mroudGG=p8CP-R8wpHYmh9uaqu_W3X=LZbA@mail.gmail.com>
Subject: Re: Add Wireguard to Linux staging tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="===============6721152608687168543=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6721152608687168543==
Content-Type: multipart/alternative; boundary="0000000000004ef93c0588debd30"

--0000000000004ef93c0588debd30
Content-Type: text/plain; charset="UTF-8"

Indeed don't add it to staging.

Efforts to upstream certainly haven't stopped. There's some work that needs
to be done. We're doing that work.

On Tue, May 14, 2019, 21:53 Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, May 14, 2019 at 11:11:52AM +0200, Rene 'Renne' Bartsch, B.Sc.
> Informatics wrote:
> > Hi,
> >
> > it seems activities adding Wireguard to the Linux kernel have stopped
> > because of lack of audits and cryptographic weakness tests.
>
> That is not why it has stopped.
>
> > I suggest to offer adding Zinc/Wireguard to the Linux kernel staging
> > tree to make it easily available for testing and auditing.
>
> It's easy to test and audit today, adding it to staging is not going to
> help that out any, sorry.
>
> thanks,
>
> greg k-h
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000004ef93c0588debd30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Indeed don&#39;t add it to staging.<div dir=3D"auto"><br>=
</div><div dir=3D"auto">Efforts to upstream certainly haven&#39;t stopped. =
There&#39;s some work that needs to be done. We&#39;re doing that work.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, May 14, 2019, 21:53 Greg KH &lt;<a href=3D"mailto:gregkh@linuxfou=
ndation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Tue, May 14, 2019 at 11:11:52AM +0200, Rene &#39;Ren=
ne&#39; Bartsch, B.Sc. Informatics wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; it seems activities adding Wireguard to the Linux kernel have stopped<=
br>
&gt; because of lack of audits and cryptographic weakness tests.<br>
<br>
That is not why it has stopped.<br>
<br>
&gt; I suggest to offer adding Zinc/Wireguard to the Linux kernel staging<b=
r>
&gt; tree to make it easily available for testing and auditing.<br>
<br>
It&#39;s easy to test and audit today, adding it to staging is not going to=
<br>
help that out any, sorry.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000004ef93c0588debd30--

--===============6721152608687168543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6721152608687168543==--

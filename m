Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148F0C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 18:19:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DFD6206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 18:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uPYxHxjO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DFD6206CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45ec19a4;
	Fri, 6 Sep 2019 18:19:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50e91615
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:19:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4531f3b3
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:19:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4009676
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=gOeQ/gNGHKkF+xa5kzTEueCAT40=; b=uPYxHx
 jOHqRn2TFlH18curLhdM6Ip1nUaGAuXGaOkqCGNjNDRZnHrId1J28Zh274eOjDnO
 Ergef+6TqNqxijGf0k3A/4DEv+I5S9/lUODEYQ153ajZEHhpkG/6BRPXpqnsqFai
 AathcNAVYaNulUIE9zb7XLrVwhqTa+/6Uc0b+75scjksl0X7rDsPgVBZvG8I/FA/
 ULj4ddTBRjcbLr6OLtKTl7o7geMN2oso1jo9sjZjFZFLnHQ0JwqAWjkALTAqu1V2
 VXkEyBhXFLb0x+Jw1arsqaQRafkUYt7QFIzyyPl1yawqDoR5hmh52A6s0GHmwJy/
 yKvfrew5N07XBaXQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68339cc7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 17:35:43 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id s28so6569263otd.4
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 11:19:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWAFKrgG/3KDFFEkBVvt7IDW6mkQTOfQFgLZ76VK1nDpRORzMBC
 R1m37Y1nssbm0l3xQRSZiLkq/4njWFux/CnGMto=
X-Google-Smtp-Source: APXvYqwBW8+fEXJkXflWvteAziZznRHS/YUvE+OuGI7sZI00dUd9hge89WdTL9g3P4OFcE6gGrL186ErG7jd79OJAOw=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr8483610otk.369.1567793943834; 
 Fri, 06 Sep 2019 11:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <a8a4d088-d5fd-5e3b-23ab-72e2c7932ff3@activezone.de>
 <CAHmME9pTAY5X3h2xwwz6LPjqWpgtd2R+Lw4C3-ZPqxve=4HCSw@mail.gmail.com>
 <3a0ae2da89436159fbce7856a6a88d3e@activezone.de>
In-Reply-To: <3a0ae2da89436159fbce7856a6a88d3e@activezone.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 12:18:49 -0600
X-Gmail-Original-Message-ID: <CAHmME9prw1nYHjvx4=tW4BNJLoXO4OeCQfzcvP_J3iSnV4No1w@mail.gmail.com>
Message-ID: <CAHmME9prw1nYHjvx4=tW4BNJLoXO4OeCQfzcvP_J3iSnV4No1w@mail.gmail.com>
Subject: Re: DMKS failed after Kernel Upgrade to 4.4.0-161-generic on Ubuntu
 16.04 LTS
To: Markus Grundmann <markus@activezone.de>
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
Content-Type: multipart/mixed; boundary="===============7325598377319146743=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7325598377319146743==
Content-Type: multipart/alternative; boundary="0000000000001a790d0591e67962"

--0000000000001a790d0591e67962
Content-Type: text/plain; charset="UTF-8"

Egbert just uploaded new packages. `apt update && apt upgrade` and you
should be set.

On Fri, Sep 6, 2019, 09:00 Markus Grundmann <markus@activezone.de> wrote:

> No! No! Jason! You do not have to apologize. I think we have to thank
> you for WireGuard!
>
> -Markus
>
> Am 2019-09-06 16:06, schrieb Jason A. Donenfeld:
>
> > Sorry for the hassle. I'm not happy about the situation either, but it
> > is what it is. Ubuntu isn't the best distro to deal with
> > unfortunately.
> >
> > I'll poke Egbert again to see if he can hurry up.
>

--0000000000001a790d0591e67962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Egbert just uploaded new packages. `apt update &amp;&amp;=
 apt upgrade` and you should be set.</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019, 09:00 Markus Grund=
mann &lt;<a href=3D"mailto:markus@activezone.de">markus@activezone.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">No! No! Jason! You do not=
 have to apologize. I think we have to thank <br>
you for WireGuard!<br>
<br>
-Markus<br>
<br>
Am 2019-09-06 16:06, schrieb Jason A. Donenfeld:<br>
<br>
&gt; Sorry for the hassle. I&#39;m not happy about the situation either, bu=
t it<br>
&gt; is what it is. Ubuntu isn&#39;t the best distro to deal with<br>
&gt; unfortunately.<br>
&gt; <br>
&gt; I&#39;ll poke Egbert again to see if he can hurry up.<br>
</blockquote></div>

--0000000000001a790d0591e67962--

--===============7325598377319146743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7325598377319146743==--

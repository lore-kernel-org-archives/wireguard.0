Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98725C3B196
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317D62168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu2tCdbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317D62168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 277626ed;
	Fri, 14 Feb 2020 10:55:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8227fa0e
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 15:17:56 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc9f063d
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 15:17:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id n18so12012359ljo.7
 for <wireguard@lists.zx2c4.com>; Tue, 11 Feb 2020 07:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZpg+qVIr+9hfGLNqA0DG9U+puVyd46CBIwi5EjNY3M=;
 b=Cu2tCdblkuNmAqXhsECLNYe4V5vRBV+bXE9z1ppKVXf6XkAarGY01xUwfR9IuhWjZG
 79iN2x8mJnJX/+VkH7CdStBw0IEO8eXQwZ0ZvWU1WDpvPlYZQ9xpJcg+Kq+gHbMK7iLV
 cuj5p5r+eqFloNe/C/u9EQVfRu4iNP0KU8q44kuXX/VqBZ77jclADTt/J6ZtzuBTEBp5
 TsdrdwT7jKRrEta7ClkRq9NG1NVLZ4IMmhNdN80j0hJklOkvc9ygoppPcUa9uGL3nRu2
 +UJp3JBAQbn4ryENDFriAYxF/8KWXr9MzeJPt46H7egbe5weB3BFBgAtAuIo8tXxn578
 wZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZpg+qVIr+9hfGLNqA0DG9U+puVyd46CBIwi5EjNY3M=;
 b=Ml+I3EYcnCpFcw/YyJ/XxX6oErIskWSteGkj54kancpiRcVPbbvQZDoEhZfCjizxGV
 elWuQA3j0gU0kprstx6XN8MPRS9aq7lPVLBBcapt3fu994CNqZRmrPCssErjf9fSBPOh
 GhlGijx8BPeyxqpVkwyOmP9A5l/ijeSt9FN2v68OYu8vritkfqLbgwR6+Y/3Qk/W/Qi5
 XXrDsyjJVZqkcXHztbxLodkKZIwHyhOCewIJEPrIHOWIBYLFq/D6rE7KrznxTQhAYz6F
 clkNyedikb7lFywhbkyo4uVLJ5c96d8b0VL/+UUamo4BY7q/IyXihsgBgM+cBWcpIWUb
 ReYg==
X-Gm-Message-State: APjAAAU94DQYEJuasCEIGX7ht9WaNngB9CPm5/4r4C0UoU+SAU/xxMKl
 My3MWDmA0twHpqDLEfTWv0bwXEs44lAvpxg0lTw=
X-Google-Smtp-Source: APXvYqwMj7wxyZcv2gh5NOQxMvfK5+WJRUfP/jMHBuztp9oStUc2TK79NAIuKi9eWcx+geMJdOiOurBmZEVQKa2Tr1M=
X-Received: by 2002:a2e:8797:: with SMTP id n23mr4340685lji.176.1581434379220; 
 Tue, 11 Feb 2020 07:19:39 -0800 (PST)
MIME-Version: 1.0
References: <413c4ea5-9e70-acf9-caff-f6049374f7ce@gmail.com>
 <CAHmME9rbO2mPjgX7FHgC4f3uK9ewtsiaNvVpZ7SpXuNPLCB07g@mail.gmail.com>
In-Reply-To: <CAHmME9rbO2mPjgX7FHgC4f3uK9ewtsiaNvVpZ7SpXuNPLCB07g@mail.gmail.com>
From: Ingo Naumann <cyberurchin@gmail.com>
Date: Tue, 11 Feb 2020 16:19:28 +0100
Message-ID: <CAEouytwqENepmAF59Yx4_fjHo4Y4_E2Bz5hCeSfbcDX4K7+zyA@mail.gmail.com>
Subject: Re: Windows Wireguard with Multiple Endpoints in Different Subnets
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:55:07 +0100
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
Content-Type: multipart/mixed; boundary="===============2176409974625324596=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2176409974625324596==
Content-Type: multipart/alternative; boundary="00000000000068bcd9059e4e6235"

--00000000000068bcd9059e4e6235
Content-Type: text/plain; charset="UTF-8"

The config file stays the same. The configuration breaks when I define a
default gateway in my network settings (in order to have the Windows
machine connected to the Internet). From that moment on, the packages
destined to the other ethernet port (the one where the default gateway not
is) are showing up on the wrong port (I can see them with Wireshark). But
only the packages from Wireguard, if I do a simple ping, everything works
because the subnets are all still properly defined.


On Tue, Jan 28, 2020 at 11:38 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Tue, Jan 28, 2020 at 11:34 AM <cyberurchin@gmail.com> wrote:
> > b) The configuration described above breaks when I define a default
> gateway, e.g. 192.168.0.1.
>
> I didn't quite understand what type of change this sentence implies.
> What's the config file after you make the transformation described in
> (b)?
>

--00000000000068bcd9059e4e6235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The config file stays the same. The configuration breaks w=
hen I define a
 default gateway in my network settings (in order to have the Windows=20
machine connected to the Internet). From that moment on, the packages=20
destined to the other ethernet port (the one where the default gateway=20
not is) are showing up on the wrong port (I can see them with=20
Wireshark). But only the packages from <span class=3D"gmail-il">Wireguard</=
span>, if I do a simple ping, everything works because the subnets are all =
still properly defined.<div class=3D"gmail-yj6qo gmail-ajU"><div id=3D"gmai=
l-:15v" class=3D"gmail-ajR" tabindex=3D"0"><br></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 28, =
2020 at 11:38 AM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">=
Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Tue, Jan 28, 2020 at 11:34 AM &lt;<a href=3D"mailto:cyber=
urchin@gmail.com" target=3D"_blank">cyberurchin@gmail.com</a>&gt; wrote:<br=
>
&gt; b) The configuration described above breaks when I define a default ga=
teway, e.g. 192.168.0.1.<br>
<br>
I didn&#39;t quite understand what type of change this sentence implies.<br=
>
What&#39;s the config file after you make the transformation described in<b=
r>
(b)?<br>
</blockquote></div>

--00000000000068bcd9059e4e6235--

--===============2176409974625324596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2176409974625324596==--

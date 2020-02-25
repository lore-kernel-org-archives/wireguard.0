Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B759C35DF2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 05:14:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022C22467C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 05:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1k05A3T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 022C22467C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eea0bb90;
	Tue, 25 Feb 2020 05:11:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 922f0b77
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 05:11:06 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f04f035
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 05:11:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id 7so8649187lfz.11
 for <wireguard@lists.zx2c4.com>; Mon, 24 Feb 2020 21:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vyNWIsHI/qkOAy/OyhxSqqZhUwc4freppl4V+T2inNM=;
 b=H1k05A3T5VGPlNkApvUbGqQsr0UHViVp7F3MAgqlF23Y+2ktbDB+i7WPomHaCf1j+V
 4pheeTi+Yxqs6kabhASCdCxnOWGTqD805L/z6eRxoHAcvebqcb2Zyiu/8zmaq6mI4AD4
 o+8Qzw0aKAW8+qAKlrqt/bE+rgIdzVwFf9jAoZYgwZrrwzD8MG/fwhio0uIJfCpyZtU5
 emzYuS02ik5cnXVQrmWkROgeKZfjGug6roRP2ULtLr0jXoesk052TUM6N/OGXunS+Jsd
 X0lTegf3O1Hjk59nCCwxkfqmWtHcrq/MX5Xpply+Stm0VarOBW5L6QTn1KkP/k2I7Jea
 TdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vyNWIsHI/qkOAy/OyhxSqqZhUwc4freppl4V+T2inNM=;
 b=lH3p4GN7Fejrw/BgVfRmGp3XIdbmCbK6EriiTo7j27oLAIyBMgW0aOtvFgYxUYUR1c
 EJG1iiAzTqSiXzoNT/tCt8NHbVS3CGoMxzA1LlOlAotxSVfBTKx46sfuIhhgjIWFRWcD
 Ex5D/E+xSO0GQIIZpyIwwlX6p0xO3E0XUv3bQQNvv43CMfd0izoA3C7YRuWJ4abx/cKC
 rUfgO33IL6anqLdr03p2LthedHCcAwum/5D7u5AGJCmcScXl0VSSNDlvuJXc5+u2OU+b
 I2WZY086oE5iJWNBn2LdHJolcUZR6bXTM2Vz0mQKm7dUCL6Av/9zliMiE8k9gDX+LjmL
 DYfA==
X-Gm-Message-State: APjAAAXagEfcG3PJ3hEfGg/wdLVnWg7ylEuxKHu4gQ4VFZZVSDuy53Qu
 uWm8M5pDs9ex23g35I3jymwNzm+NfdMIF51og3g=
X-Google-Smtp-Source: APXvYqwSwfbq/MFjkjd/OtY/JQYsWrYIdm6bm5Bv6unz9cwWHWnv7shFMm9fgsQBzo5duSazZExF0YwoWbIg81g40Zw=
X-Received: by 2002:a05:6512:31ca:: with SMTP id
 j10mr17747474lfe.110.1582607673411; 
 Mon, 24 Feb 2020 21:14:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+5JoNrd7dNRQv+y7-wBw1denTt9GKnvF3S1R-FwgYixauMC=w@mail.gmail.com>
In-Reply-To: <CA+5JoNrd7dNRQv+y7-wBw1denTt9GKnvF3S1R-FwgYixauMC=w@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Tue, 25 Feb 2020 00:14:22 -0500
Message-ID: <CAMaqUZ1r7Y_57bUYs=D_EoACbzA9uvkywTMEhUsMa1QgT_X9UA@mail.gmail.com>
Subject: Re: [feature request] Randomize PersistentKeepalive
To: John Smith <dingrite@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7198086602522695380=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7198086602522695380==
Content-Type: multipart/alternative; boundary="000000000000314eed059f5f90fe"

--000000000000314eed059f5f90fe
Content-Type: text/plain; charset="UTF-8"

Won't help -- a keepalive is by definition the minimum possible size frame.
That means not just that it's a predictable size, but that everything that
size must be a keepalive, randomized interval or not.

To get the kind of effect you're looking for, you'd need to send actual
dummy data -- which, incidentally, you can totally do no problem just by
making sure you're sending packets from an IP that isn't on the AllowedIPs
list on the other side. That will always cause the payload to be silently
dropped on the floor before it even hits the rest of the networking stack,
and with resource usage comparable to that of keepalives.

--Reid

On Mon, Feb 24, 2020 at 7:49 PM John Smith <dingrite@gmail.com> wrote:

> There are some applications where you do not want a listener to know that
> a channel is being kept alive and no information is being transmitted.
>
> Perhaps the ideal solution would be to add an option to the wg tool to
> send a keepalive packet, preferably of arbitrary size within some range. A
> script could then be used to keep the channel alive in a manner. Would be
> cleaner than sending something else through that may require further action
> by the peer.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000314eed059f5f90fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Won&#39;t help -- a keepalive is by definition the m=
inimum possible size frame. That means not just that it&#39;s a predictable=
 size, but that everything that size must be a keepalive, randomized interv=
al or not.=C2=A0</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
o get the kind of effect you&#39;re looking for, you&#39;d need to send act=
ual dummy data -- which, incidentally, you can totally do no problem just b=
y making sure you&#39;re sending packets from an IP that isn&#39;t on the A=
llowedIPs list on the other side. That will always cause the payload to be =
silently dropped on the floor before it even hits the rest of the networkin=
g stack, and with resource usage comparable to that of keepalives.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">--Reid</div><div dir=3D"auto"><b=
r></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Feb 24, 2020 at 7:49 PM John Smith &lt;<a href=3D"mailto:dingrit=
e@gmail.com">dingrite@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">There are some applications where you do not=
 want a listener to know that a channel is being kept alive and no informat=
ion is being transmitted.<div><br></div><div>Perhaps the ideal solution wou=
ld be to add an option to the wg tool to send a keepalive packet, preferabl=
y of arbitrary size within some range. A script could then be used to keep =
the channel alive in a manner. Would be cleaner than sending something else=
 through that may require further action by the peer.</div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>

--000000000000314eed059f5f90fe--

--===============7198086602522695380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7198086602522695380==--

Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DE0C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 01:54:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B7A20851
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 01:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mindcast.org header.i=@mindcast.org header.b="Wwb3k4HE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B7A20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mindcast.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f161ad7e;
	Tue, 11 Dec 2018 01:45:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 611976a8
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 01:45:25 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fda8b799
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 01:45:24 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id n18-v6so11485520lji.7
 for <wireguard@lists.zx2c4.com>; Mon, 10 Dec 2018 17:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mindcast.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uDEP9J2T1AssZJ3ww6ZXrVMI+1Ut/lJacZPFjXRM10U=;
 b=Wwb3k4HEpUmQF5Tmj4k3KTYOgqZMRyTwhY/vl+6N2hh2gcDce3zLO7dOrDQ4ZDoTRI
 uJidhSJPFN3ucGw9GqrQNMzDnXSkpvmNLNJfCg3E2qnTjT7ztDs1wwq/AQpwCZC4kg8q
 bqnulgWBqUMdt/WmtVBGUYRQOQ2+QR+DAB5J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uDEP9J2T1AssZJ3ww6ZXrVMI+1Ut/lJacZPFjXRM10U=;
 b=CB9uTnklTOGE7tVMVIwsRigr9X3x9lTcT+j0ckOazbgjHXaOxZzVE/naS96bopdnbB
 tSRyYVtHpzs7jldLlseqmJDkBxh2BKZlU/SRxz/FKU0Rq55Jh9njWoOOYGiahxFSKihx
 PCskvzV1CLuQpUdjoFQ/MQQAheXYnT6/gAIbKXCUCfLYkYsZqhUTyGi5KwL9ZKaUlfue
 Nw6x3DwprLXbW+ADAOL2ScsJqOeIsKF1m4q6evT6IjwDY6oXTCWou9guOm0ZPR9DYaBa
 wyoD/P5Vtt/nEhWwi/QjapFQAAFTZNXr4SwJdXQATnJI/2RSiOcX/UXsN5HulrLUQkRu
 wANg==
X-Gm-Message-State: AA+aEWZOnUIcKbsqluqlRzGLLGGcVt1z4ptVH5rR4o4jVat7fcB7ZXrv
 1gvypAjrNhRKwHMQKV+pbaY+Nb227fLQ/h/2275RmCpt
X-Google-Smtp-Source: AFSGD/XYiIMkAgCijupxgiQFBEeXFdNMBtxJk8DzKwh07IAWH6rnXmeO0Etyipuxt9qHCU28UbEQhjPpSZupkGnuz3Q=
X-Received: by 2002:a2e:81a:: with SMTP id 26-v6mr9457579lji.14.1544493247449; 
 Mon, 10 Dec 2018 17:54:07 -0800 (PST)
MIME-Version: 1.0
References: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
 <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
 <CAHmME9qh+3sR-YL0OVJ4+t+qmutU0j=mJM==5L3QQAZ5Ux4mJA@mail.gmail.com>
 <CAHmME9qVH0sZyEbSuE3mXJ12Lz8zJMPZ43ZRDYQA6n4CmjADrg@mail.gmail.com>
In-Reply-To: <CAHmME9qVH0sZyEbSuE3mXJ12Lz8zJMPZ43ZRDYQA6n4CmjADrg@mail.gmail.com>
From: "Berk D. Demir" <bdd@mindcast.org>
Date: Mon, 10 Dec 2018 17:53:56 -0800
Message-ID: <CALv=V9HhyzsGrJbi95EQMsk=XKk_WMcwTXtg+VwjJOp=qSJC=Q@mail.gmail.com>
Subject: Re: wireguard-go on android crashes due seccomp enforcement of
 sys_inotify_init
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3499765640091367548=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3499765640091367548==
Content-Type: multipart/alternative; boundary="0000000000005f6275057cb55be3"

--0000000000005f6275057cb55be3
Content-Type: text/plain; charset="UTF-8"

Thank you for this stellar stewardship.

Will confirm fix in this thread once I get the latest build.

On Mon, Dec 10, 2018 at 17:48 Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Berk,
>
> The fixed version should now be rolling out on the Play Store,
> probably available within an hour, and eventually in F-Droid too
> whenever their build infra kicks in. Thanks again for reporting the
> bug.
>
> Regards,
> Jason
>

--0000000000005f6275057cb55be3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thank you for this stellar stewardship.</div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Will confirm fix in this threa=
d once I get the latest build.</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Mon, Dec 10, 2018 at 17:48 Jason A. Donenfeld &lt;<a href=
=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Hi Berk,<br>
<br>
The fixed version should now be rolling out on the Play Store,<br>
probably available within an hour, and eventually in F-Droid too<br>
whenever their build infra kicks in. Thanks again for reporting the<br>
bug.<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div></div>

--0000000000005f6275057cb55be3--

--===============3499765640091367548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3499765640091367548==--

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F6C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Jun 2022 06:17:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a996a527;
	Sun, 19 Jun 2022 06:17:01 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 31426454
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Jun 2022 06:16:59 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id i17so5326690qvo.13
 for <wireguard@lists.zx2c4.com>; Sat, 18 Jun 2022 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NzhKqzJH6k+Rfi2CDjTY9LAM4ZFDRE7R5dscMk5v8k=;
 b=p0yfv8HEOhDXJ2w0VHsZMA+HnDwPJHyDMxxX5ZAW2bIOZWhfHBpL6ualSsWlUZqduJ
 JNuuhMjbIiOnt95BG0atfZBgb9nRJX2oo340oUjHBTUphH8EYbtpzyFkFpGAjO7x9mZB
 bHY3xpULoqSx103epIxDfzJGRT2pxR8OFnavaHaDYU7DHNdcCvBq5xsZIld83lJP8TkV
 FyxoqITByImMx5RlNv5i4kjC7XG2LL3QW37PcD80Pv9YYr0oZTiNzmBavfENgeKhacnB
 BiNzsoa50HdGytSp83dzOV27I0d7rVSEQzmP7dhaJScKlS9qdkStotshce45GfHMl6f+
 gmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NzhKqzJH6k+Rfi2CDjTY9LAM4ZFDRE7R5dscMk5v8k=;
 b=5h2D6HIc5nmKBpfIOZUWBqA0HRGOShCgDGAJu4W+4ovWSak9FcUXKgP6g8RAtk9B8n
 lMyzPjPRcRMspbAST1ekvOIcdKQfE1qNmtw2koYJmYGmccezmkt+nIh7E8bzK5/lkelJ
 Wqd6TE39McHn7Qtm7xl/C1awyDfNOxi6iAHWSNOfjJ70zOnoC0rVxRPQwiEjgM/3yB2+
 0us8xxMTo7HgsarRw1vsKNpetP01x8ePHNXNf4NyvHgLGDlGff69er3MDDe3edZ+ACDk
 yVLs/3FFkYfhutUTH86R7I9QjtMd0wa2R7t/zI5UzI4hoApJoRPmYHxssgGsCrqX9fFu
 wsvQ==
X-Gm-Message-State: AJIora/MNH8tAYpXD4QTW2TZNQhkhv1abxxRKk4r1ha/6lQKdQ7E0BhP
 NnLnwd7OeQwLj0rFv1mOITLOKFYhiYtN3MCQ5is=
X-Google-Smtp-Source: AGRyM1s0UGcf/edHVGHUycmISXD0LrAcerFk8+gx9wheIMHOSM3DGCY7ouJ+kgCGFnVuMimKqXcfuBPWICjUA7AYyMo=
X-Received: by 2002:a05:622a:5ca:b0:306:6c7c:efe7 with SMTP id
 d10-20020a05622a05ca00b003066c7cefe7mr14975349qtb.310.1655619418432; Sat, 18
 Jun 2022 23:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAC2bXD6FKSk1EEcw4QtqxengUvyCN2bfwzG5jFUvAPAsg2kxBA@mail.gmail.com>
 <Yqxr57xeYHYI3F22@zx2c4.com>
In-Reply-To: <Yqxr57xeYHYI3F22@zx2c4.com>
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Sat, 18 Jun 2022 23:16:46 -0700
Message-ID: <CAC2bXD7g8QsFi_Cw5rpiPRBz_vEPa4SJQF7f7COyfMJq6kVq=g@mail.gmail.com>
Subject: Re: why not use ktime_get_clocktai_ts64
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, Jun 17, 2022, 04:56 Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Jacob,
>
> On Wed, Jun 15, 2022 at 06:48:08PM -0700, Jacob Lifshay wrote:
> > I was reading in noise.c and noticed you use ktime_get_real_ts64 and
> > do manual adjustments (the current code is broken if/when there's
> > another leap second) rather than using ktime_get_clocktai_ts64 which
> > already handles compensation for leap seconds.
> >
> > https://git.zx2c4.com/wireguard-linux/tree/drivers/net/wireguard/noise.c?id=7fae4596a269d2f9a6a7d1a8695c3a68ab34f7be#n501
> >
> > Is there a reason for that?
>
> Not really I guess. The only requirement, though, is that the timestamps
> are monotonic with respect to the particular localprivate-remotepublic
> pairing of peers. So I'm not sure it matters?


ok. Apparently linux's TAI clock offset is often not set on linux
systems, so that's a good reason not to use it.

Do note that 10s is the wrong offset, the correct value is 37s iirc.

see also (related issue on tai64 crate -- also uses the wrong offset):
https://github.com/RustCrypto/formats/issues/675

Jacob

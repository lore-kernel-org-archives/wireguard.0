Return-Path: <SRS0=s0AX=FT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA9BC2BB48
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Dec 2020 00:33:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6671522258
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Dec 2020 00:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6671522258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec275dcb;
	Tue, 15 Dec 2020 00:24:32 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [2607:f8b0:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 65c31b22
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Dec 2020 03:08:53 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f17so11538921pge.6
 for <wireguard@lists.zx2c4.com>; Sun, 13 Dec 2020 19:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Y4ZR25CDWrFjyeuCoS4dcQmYfG5u2bNucQUd5/A8YY=;
 b=H3XeuiT6futa/vBpPop8eW/Xsygjx5WNQcff9Jj6rU0aPDdL3ddk7ZQKc/2P0wVEYb
 Qu6wE4SKNZZNMOspJd0kQhbFKv5BtvE2D/YCMzIPsD/uoLmDo4ep6L/uSlqY1rXqNt52
 71zJGUlkN3Z9vWZQ5lSvK2Dn2OI3ywqxB7+jfrMiim1JWX+GkWbBYOK1gTsn8TfxwFX8
 9hquEWOGhCdTDJtjOB/EyaRoWkoMO0TTq0UpEWN/FL8jHf28R26h9ICWOMtGYIxMHyk1
 j7XSgD0s2YsOVl1LbG02K/9510j82YMEYNKSKE2euAm3BmNtyFQieWmg+duQNyt7GHvc
 aDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Y4ZR25CDWrFjyeuCoS4dcQmYfG5u2bNucQUd5/A8YY=;
 b=TNgaFFSa5vCdow+jGCgtJfJ+koF6R8Hu+ZIsTtcILcDRjKVicfDg5hWt3SdYS7bYeV
 U7KIM3icq03jFTZ6KnG1E7MvTnLZQ7cRZTXy43H3h43/s6oZUjCKFiJ/zxcWTJiYxuXH
 YC2iESUfxO8Re+jEroiNmQRlUOmTWcFKhjQIbJ/mCEp81pGjIDHSplQncd2LP220b02g
 z8RwVqa0PAebVfllQ7HsjpqYxwM16+pQZaChDQsMCRwmLF+TVsNnDXRfQp5s6tX/sFcz
 mcrdvCy5s/7Iogp26ckm2/Gdz63gx7AITdA1JGEp8YlEdHKK5DcReil2psSXUt9RcRk8
 GxLg==
X-Gm-Message-State: AOAM530Ej2LuZmX2IK9Y/xWCDO0UT1P81qX/9Y/hIaDjRGISgk0FA2vl
 mIflrtSReISOxRw2XpuaLl3Oz5G1LeD3tJh6bQs=
X-Google-Smtp-Source: ABdhPJx83hrmq0sJp3bdgCiX+hExfCM1SAtXpkPq0lPpYaypZchK0xVYe/lkAFNbb0o3LUwewFxvWp6bmSQBQMEG8/E=
X-Received: by 2002:a62:e30c:0:b029:19d:932b:a1e2 with SMTP id
 g12-20020a62e30c0000b029019d932ba1e2mr21493105pfh.78.1607915816979; Sun, 13
 Dec 2020 19:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20201210235412.85721-1-ajstiles@gmail.com>
 <X9am5M94oX00YKU4@latitude>
In-Reply-To: <X9am5M94oX00YKU4@latitude>
From: Adam Stiles <ajstiles@gmail.com>
Date: Sun, 13 Dec 2020 19:16:46 -0800
Message-ID: <CAB5G8p8Y7+TcjBQYWQy+kZMjD=-qv0WoY+vn0dp5A_6FkSGDQw@mail.gmail.com>
Subject: Re: [PATCH wireguard-apple] Update SPDX-License-Identifier tags from
 GPL-2.0 to MIT
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 15 Dec 2020 01:24:32 +0100
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

Hi Jonathan,

Thanks for looking at the patch. In retrospect, I should have asked
about this before I submitted it. I wasn't intending a re-license.
Rather, I assumed those SPDX identifiers were missed when repo was
converted from GPL to MIT a couple of years ago. Apologies,

Adam


On Sun, Dec 13, 2020 at 3:42 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Hi,
>
> a little drive-by review, since I happened to see the patch.
> In case I misunderstood something, I apologise in advance.
>
> On Thu, Dec 10, 2020 at 03:54:12PM -0800, Adam Stiles wrote:
> > Signed-off-by: Adam Stiles <ajstiles@gmail.com>
> > ---
> >  Sources/WireGuardApp/UI/macOS/View/highlighter.c | 2 +-
> >  Sources/WireGuardApp/UI/macOS/View/highlighter.h | 2 +-
> >  Sources/WireGuardKitC/key.c                      | 2 +-
> >  Sources/WireGuardKitC/key.h                      | 2 +-
> >  Sources/WireGuardKitC/x25519.c                   | 2 +-
> >  Sources/WireGuardKitGo/Makefile                  | 2 +-
> >  Sources/WireGuardKitGo/wireguard.h               | 2 +-
> >  7 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/Sources/WireGuardApp/UI/macOS/View/highlighter.c b/Sources=
/WireGuardApp/UI/macOS/View/highlighter.c
> > index e0d4e04..55fabfd 100644
> > --- a/Sources/WireGuardApp/UI/macOS/View/highlighter.c
> > +++ b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
> > @@ -1,4 +1,4 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > +// SPDX-License-Identifier: MIT
>
> AFAIUI, such a change expresses a relicensing of the code, and it should
> (IMHO) be made clear in the commit message that this is the case.
>
> All authors of the code must agree to a relicensing. It would be nice
> to see the list of authors in the commit message, along with a
> confirmation that all agreed to relicense the code to MIT.
>
> > -/* SPDX-License-Identifier: GPL-2.0+
> > +/* SPDX-License-Identifier: MIT+
>
> I think MIT+ is an editing error. It's not on the official SPDX license
> identifier list, in any case.
>
>
> Best regards,
> Jonathan Neusch=C3=A4fer

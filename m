Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4183EC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:35:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F2820735
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="R9z1J69M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F2820735
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1106b68a;
	Mon, 30 Mar 2020 02:27:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cb42dbc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:27:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7c92c84
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=lv1ngJm8GcCe
 1Lv0uCDb6NCbCcY=; b=R9z1J69MXb09b9mmmb9qUmG2UwYUadWrVlzAFq67duo4
 6r5UxyeFExWuqQ15xUievcJS8Hp8/8F6Tf0O4SNa8vCphoQEWXQsqjMQVTDw/4AY
 F3WsYmEVqwfYw/fWe6q5qF+r0VmFenDfFKmfq3uvmwvVdsKnBYg9m+OgzIU7+Sds
 IPHhziohixyzMz/UGi86qdubRHY/3FyXU5tBu0mvr9fdJLprztMAOtujqwWiFXzp
 xMRoRYocUmX2IfhaAAFuJlVMcG81zdv0OZQqnoWmMu6RoNCkFD6LBbzAPk5IH7Pk
 mqQR89WydIRgWAuO8pSCM92yGoPzKbujbLVVD4H64A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d7cc28d4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:27:24 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id r5so14351659ilq.6
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 19:35:15 -0700 (PDT)
X-Gm-Message-State: ANhLgQ19rvq+Zsm3DVgUoYujuiDsPdhH5DQjo3yWw1chRXWEvFrLiYSM
 FWzHuB+NbnKZrApK04fArfYgiEACN5jWy84PSGM=
X-Google-Smtp-Source: ADFU+vs8v9JO+XX+muVdBXahjFJmxTqYcgKEiL0MVYANlRopFfL9YSCcOXWbpCc5eZXkHtRXkqv01ZSPxDFlu72FvaY=
X-Received: by 2002:a92:cece:: with SMTP id z14mr9651006ilq.38.1585535714734; 
 Sun, 29 Mar 2020 19:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <e478e85d-e62e-a064-287b-d876c2f84ac5@reldeif.de>
 <CALpmF+F1=tL9H-yk_PYpSAVq4rtFiST-vzWDL69_MEUpUb030Q@mail.gmail.com>
In-Reply-To: <CALpmF+F1=tL9H-yk_PYpSAVq4rtFiST-vzWDL69_MEUpUb030Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Mar 2020 20:35:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9qqp_gASe+FD9iq2RnToVkmSwmg4jim4-=RnRkvb4+JBA@mail.gmail.com>
Message-ID: <CAHmME9qqp_gASe+FD9iq2RnToVkmSwmg4jim4-=RnRkvb4+JBA@mail.gmail.com>
Subject: Re: [PATCH] Add german translation
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Fiedler?= <bjoern@reldeif.de>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Mar 29, 2020 at 8:34 PM Harsh Shandilya <me@msfjarvis.dev> wrote:
>
> On Mon, 30 Mar 2020 at 07:52, Bj=C3=B6rn Fiedler <bjoern@reldeif.de> wrot=
e:
> >
> > Suggestion for german translation.
> > Created with the help of andentered into crowdin.
> >
> > Signed-off-by: Bj=C3=B6rn Fiedler <bjoern@reldeif.de>
> > ---
> >  ui/src/main/res/values-de/strings.xml | 188 ++++++++++++++++++++++++++
> >  1 file changed, 188 insertions(+)
> >  create mode 100644 ui/src/main/res/values-de/strings.xml
>
> We're only using Crowdin for translations now, so please translate on
> there and I'll be syncing strings periodically and before each release
> to ensure all latest translations are in the app.

https://crowdin.com/translate/WireGuard/all

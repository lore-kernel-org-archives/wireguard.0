Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD08C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 09:47:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD669206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 09:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ7r1hRL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD669206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d762cc10;
	Mon, 6 Apr 2020 09:38:45 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e39615c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 09:38:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w145so11260802lff.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Apr 2020 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9BZKtWZ3Vdct78tEjdmeg+MV7D3u9GNCGLUBwR4P6vk=;
 b=gZ7r1hRLw0fdaSjxFNZyjZy9dyuUHWLKIHdBeh4eNpymIJ8glifhCFNjYULqrGQBpd
 oY5mNRTPYHeWSfg8iy+oNf46pGWpjru226KHbpjZHB6PWE4ey5UFDYJ3SBBJlVSIs5c0
 xyJ43n6SKGYYpXWGjE1QpoBeJSrVP8JWUrOSJNmoSUqh69A5XcXXKNQ0S5n1pOud34jD
 WhQfwadHgYoXtu+nHThIyaIMA+pvqynU1Y7TtJqolvVM/ul7Px2qkTdRY55ONrk1DHeP
 WrJ7H1VaDcgcONJbnmhHZIsycQW0tEJetp2pJeH7aPbJN9DWdHWzBT0Hc5JbetngsfE+
 WQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BZKtWZ3Vdct78tEjdmeg+MV7D3u9GNCGLUBwR4P6vk=;
 b=gVOBiMFVpMcbFjgsPcCxuDqKChfDG1xsS27OTPsn1WPhw7hlxi7AqJ76j5ytyaCdeW
 8By+boG7RYckYbV2JLRW3WGQPqPPHyrx2I5clOVFgK6QzXCyWZAJKBRNF8U2D1QM9xVP
 tv4B2bqY0nXnSY4TNHRKkYNqB5Jt9DGbtlqhMAWGnDo4ucaTjBrMxjylFShrF9YK+YyY
 4AFHQvdPTwBplBsNWgFHaN4i8fwLOrl+gGETQP9dR2GkbcigCZSBoBO0W7MRF/ttd2Yv
 WOKgx+M7/aRZbzmLnVi+VsBTkPYw526zTk9ZSddlT2QVGN5+uwfc0OfeSD875RuA5oDZ
 C3WQ==
X-Gm-Message-State: AGi0PuaOjWXspRnucbYZM0goFkwDhS/lVKAyfTud1Jan4CSnPbnOF6NC
 3sDUx+9dd+dl9oNxY/T5n9VxxvtFQjfznNDsaRSH+AGcK/k=
X-Google-Smtp-Source: APiQypIla20uXUbpI8KAteCY0WpU9SQOms7xL16exLYMB275CW89hVStS5NB4AZ0tkmCyb37/c7aa6x51yhPOQAloiY=
X-Received: by 2002:a19:7615:: with SMTP id c21mr12527119lff.24.1586166447977; 
 Mon, 06 Apr 2020 02:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMaqUZ2i+LFg8wreOr=H1gB5ocw9+N5uacsZukcjEx6xNrbdkQ@mail.gmail.com>
 <CAFX-c4sfzqEwCk+1Ec7dRtVD60jougU1w9=V-cAQ-8Qk0S+HZg@mail.gmail.com>
In-Reply-To: <CAFX-c4sfzqEwCk+1Ec7dRtVD60jougU1w9=V-cAQ-8Qk0S+HZg@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Mon, 6 Apr 2020 05:46:51 -0400
Message-ID: <CAMaqUZ0G8Gt=33Fxh=UxgPUXz3z5c0AjbFq6F9QxgcTU-xWKzg@mail.gmail.com>
Subject: Re: Thoughts on wg-dynamic
To: brian mullan <bmullan.mail@gmail.com>
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

I looked at something similar, but I really don't want to pay the
extra overhead -- and it just feels wrong to use
IP-in-Ethernet-in-GRE-in-UDP-in-IP(-in-WG-in-UDP-in-IP) if you don't
have to for routing purposes. (Version 2.0 of the product I'm working
on might use something similar for dynamic routing, but for now I'm
content with the assumption that all peers can reach each other.)

--Reid

On Sun, Apr 5, 2020 at 8:02 PM brian mullan <bmullan.mail@gmail.com> wrote:
>
> Reid
>
> I've been using
>
> m13253/VxWireguard-Generator: Utility to generate VXLAN over Wireguard mesh SD-WAN configuration
>
> https://github.com/m13253/VxWireguard-Generator
>
> I added BGP with BGP VRF.  It all works great in my multi cloud, multi node use-case.
>
> Brian

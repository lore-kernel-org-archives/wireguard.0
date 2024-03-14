Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C54EC54E5D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2024 03:40:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd76eddd;
	Thu, 14 Mar 2024 03:36:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bf9c751f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2024 03:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF66A6156C
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2024 03:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36431C433C7
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2024 03:35:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BEIMofJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1710387356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufLxwUri9oF1Ju7jFdR1vSsQE/010F+BadmW8nZ4azo=;
 b=BEIMofJja6FJPbS0D4BCmOSOP5We16lRSkupRoio0Bsefglkxq59tI8PtUWz+mxGScPggl
 nnzfk+dXAQpAFpDjP6kKhsXLjJ6yh8bVDbmjQsL948nCNDUriGLP2qkrQuIlWR4RhJG7cM
 s+LHUDHYcOrIwl2bAAdfw6NzaMaq/lQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f85e1aca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2024 03:35:56 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so408354276.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Mar 2024 20:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6o2M4MvcU2jxQtfu+CaKvC+E+gTeTi6RQRnGRSYu3TBDAF2J/jAhydQr4dmPzHbyHXMdyXUQEO0Xr8cI8CgLuIYgCmCWeecja
X-Gm-Message-State: AOJu0YwXJ3X3ff0Rv9GYb++i1erTf6JsBd/6Du5PRdnLpsuJsoorkPFn
 uL7/wfev3gyxazb0+nZSrhe1edQJR46HKfqm1Za3o4IsuJ0PfHWoW8tTpMROs2EWyFqkk8c8lgp
 WrxGv5ekTcCEdOKd67b9eHPZixTA=
X-Google-Smtp-Source: AGHT+IGUdgKF/dbUVT5otlmUuvnWc2bC3zUXkuCsUJ2i/Uqok9paRwhbAvJI8AHnKgDRCdykiRdMzw+jO45j6wnIV6c=
X-Received: by 2002:a25:bfd1:0:b0:dc2:5553:ca12 with SMTP id
 q17-20020a25bfd1000000b00dc25553ca12mr555095ybm.14.1710387355458; Wed, 13 Mar
 2024 20:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240308112746.2290505-1-leitao@debian.org>
 <ZfJtzhKJV4yo3LRF@zx2c4.com>
 <CAHmME9prrtWu8jkj20WKvTZV6mjQE2Vt_mFWGOuy9St1FOrEOg@mail.gmail.com>
In-Reply-To: <CAHmME9prrtWu8jkj20WKvTZV6mjQE2Vt_mFWGOuy9St1FOrEOg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Mar 2024 21:35:43 -0600
X-Gmail-Original-Message-ID: <CAHmME9oPPtJXd8DsA+xXvbdN7T0PbAM5kYpQj32KZXv9bKP1ng@mail.gmail.com>
Message-ID: <CAHmME9oPPtJXd8DsA+xXvbdN7T0PbAM5kYpQj32KZXv9bKP1ng@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] wireguard: Leverage core stats allocator
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, horms@kernel.org, dsahern@kernel.org, 
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>
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

On Wed, Mar 13, 2024 at 9:27=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Wed, Mar 13, 2024 at 9:24=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.c=
om> wrote:
> >
> > I applied this series to the wireguard tree. Thanks for the patches.
>
> Actually, sorry, nevermind. 1/2 is fine, but 2/2 results in `ip -stats
> link ...` returning all zeros.

Ahh, okay, required some more commits from 6.8. Okay, seems to be
working. I'll let this cook a bit and then push it up in a while.


Jason

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F51C54E5D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2024 03:31:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1caddbe;
	Thu, 14 Mar 2024 03:27:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 10ee5172
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2024 03:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01600CE1A4B
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2024 03:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A536C433F1
 for <wireguard@lists.zx2c4.com>; Thu, 14 Mar 2024 03:27:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mGJ5hLTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1710386854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvHFDPgOfKDs4ElWYSlkdgyoAPxlTvHb6gfuyj65NzE=;
 b=mGJ5hLTz9O+W9CMwAzNGFBmRO1n5/Gqxz9yPeV2eZpDqINyVKsEYMw701YJWriWfgKxg/H
 2GWEYEbkH2dYzhmiRkrwE38Iy/E52ZaRPxoJRhb4rFEgCp3aaG3x11nLjLjibH4X2yo1Qm
 jz28KQyeaPZ5amNRUoJyQ/an044XWlI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54b793f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2024 03:27:33 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso459053276.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Mar 2024 20:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfXkO+ldef2Onkiyh/0Po1NrJS+JLR3zAsQ/nxzl4mWGCY4GqTMYq8Xvl0C8lC+aMeF2fUc1mQJbwudgZjM4+YsXJoTFs9pA+z
X-Gm-Message-State: AOJu0YzEjqu5tZVVvCWiTBarD7jooLpm6Nusm1bq+L7xzsj+ui26xMuK
 hlQPT236rn86XOL+PlVgw+QUxh/XEbLHUWqNiBu9gsTaHCS5PUKa3tLzQ8UMrg5kxAg00/ebqJV
 2mm4DzDaOXa+Ui1ImZS4Pp2X+G/Y=
X-Google-Smtp-Source: AGHT+IGipbRUywjVyzfyxsuyOdfop1QdmEURhyUqVShack9PjxKn4e+Wp5XMqX4UTwrQK7k0qQflfCUqvZnmp+9H3+s=
X-Received: by 2002:a05:6902:110:b0:dd0:471:712 with SMTP id
 o16-20020a056902011000b00dd004710712mr569095ybh.33.1710386851905; Wed, 13 Mar
 2024 20:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240308112746.2290505-1-leitao@debian.org>
 <ZfJtzhKJV4yo3LRF@zx2c4.com>
In-Reply-To: <ZfJtzhKJV4yo3LRF@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Mar 2024 21:27:19 -0600
X-Gmail-Original-Message-ID: <CAHmME9prrtWu8jkj20WKvTZV6mjQE2Vt_mFWGOuy9St1FOrEOg@mail.gmail.com>
Message-ID: <CAHmME9prrtWu8jkj20WKvTZV6mjQE2Vt_mFWGOuy9St1FOrEOg@mail.gmail.com>
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

On Wed, Mar 13, 2024 at 9:24=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> I applied this series to the wireguard tree. Thanks for the patches.

Actually, sorry, nevermind. 1/2 is fine, but 2/2 results in `ip -stats
link ...` returning all zeros.

Jason

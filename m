Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0592CCF6499
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 00:19:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 851db241;
	Wed, 19 Nov 2025 19:23:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e5dd461
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Nov 2025 19:23:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FC4F41B23
 for <wireguard@lists.zx2c4.com>; Wed, 19 Nov 2025 19:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F502C116C6
 for <wireguard@lists.zx2c4.com>; Wed, 19 Nov 2025 19:23:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="I+iiF84r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763580192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBS1R+KWQuyQS4ikMq/m97ZN3SpSoGN8I0V3RuwXubs=;
 b=I+iiF84rbqTdp86zcKG7OWQO05xfM1C3zQx6pkgytcAHKBfVLgBnOGRJdJn1uRndhDSWHR
 3oQq/aDHNr1GYeVVUq0//19q1CoZryJgr4PfeeUPdnPGFN6oSMGgqzRTSbhwPgm8XogD6N
 BCQhIYnpGkcv0S9yPwPzH/QbknAGBCc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 810f8fec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Nov 2025 19:23:11 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7c76607b968so25631a34.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Nov 2025 11:23:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWpWb/n2EMpnSiYUm5lIHpbk75U9W/KmJ2YyLENHeQ6757zsikT4HnoM1IBGc5x5cE9YSBUujPhiQ8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxHY6ksL/vzquAx22Y33h1ytKA8CIy1lVnDhUiiOWUVE+MA0Ub4
 u9WG18D5zk4AIS7To3hFJmBh5F7/lCK/O+nCEtuNLlHstltNRHGfW5h6S2G1NyCzJEzpVn4CfiM
 iXj78oSWEuzoieUvaYGYdjzSwwhyKv7s=
X-Google-Smtp-Source: AGHT+IFWThcQphzmtMR1ZuP2+pYZXYtjvWAaMc/MPtL0eQ+UOwpEqO8TkAKOgEc0jUYpcex3oAJFRMG7Wc/2bTyrr7U=
X-Received: by 2002:a05:6808:1796:b0:450:c6a0:3f39 with SMTP id
 5614622812f47-450ff3e8b6amr241128b6e.58.1763580190101; Wed, 19 Nov 2025
 11:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-5-ast@fiberby.net>
 <aRvWzC8qz3iXDAb3@zx2c4.com>
 <f21458b6-f169-4cd3-bd1b-16255c78d6cd@fiberby.net>
 <aRyLoy2iqbkUipZW@zx2c4.com>
 <9871bdc7-774d-4e35-be5f-02d45063d317@fiberby.net>
 <aRz4rs1IpohQpgWf@zx2c4.com> <20251118165028.4e43ee01@kernel.org>
 <f4d147da-3299-4ae7-b11e-b4309625e2c9@fiberby.net>
In-Reply-To: <f4d147da-3299-4ae7-b11e-b4309625e2c9@fiberby.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Nov 2025 20:22:57 +0100
X-Gmail-Original-Message-ID: <CAHmME9rzr8EGkTy3TduTXK45-w1CwEYnRLX=SjkAqo1CTTgVHA@mail.gmail.com>
X-Gm-Features: AWmQ_bkA-F3ilICecskNIJAu7S_B6vXW8UH-CCPXrJPWb6WBZhcwX_rzqk5QfHg
Message-ID: <CAHmME9rzr8EGkTy3TduTXK45-w1CwEYnRLX=SjkAqo1CTTgVHA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 04/11] netlink: specs: add specification for
 wireguard
To: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: Jakub Kicinski <kuba@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
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

On Wed, Nov 19, 2025 at 8:20=E2=80=AFPM Asbj=C3=B8rn Sloth T=C3=B8nnesen <a=
st@fiberby.net> wrote:
> B) Add a "operations"->"function-prefix" in YAML, only one funtion gets r=
enamed.
>
>     wg_get_device_start(), wg_get_device_dump() and wg_get_device_done() =
keep
>     their names, while wg_set_device() gets renamed to wg_set_device_doit=
().
>
>     This compliments the existing "name-prefix" (which is used for the UA=
PI enum names).
>
>     Documentation/netlink/genetlink-legacy.yaml |  6 ++++++
>     tools/net/ynl/pyynl/ynl_gen_c.py            | 13 +++++++++----
>     2 files changed, 15 insertions(+), 4 deletions(-)
>
> Jason, would option B work for you?

So just wg_set_device() -> wg_set_device_doit()? That seems quite fine
to me. And it's probably a better name, too, given that it corresponds
with device_dump. It makes both of those follow the form "wg_{genl
verb}_{nl verb}". I like it.

Jason

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA87CEE33B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 17:12:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1229e98;
	Tue, 18 Nov 2025 17:11:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2dfb6b90
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 17:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F2FF060B51
 for <wireguard@lists.zx2c4.com>; Tue, 18 Nov 2025 17:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7D2C19422
 for <wireguard@lists.zx2c4.com>; Tue, 18 Nov 2025 17:11:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cu9urYDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763485855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vplNO5csMyvgI0N+D58HkHbAeNRmIHcdSs3oPvlRhjY=;
 b=cu9urYDHTq35ESp8/5LBlH+0dt3QdLsjnnK3GfcvJ24psLpnaLjR08u066RSbTP90HwWJM
 pWwrB8+RTwA7dUfjXmQhT8QTOWhHJSjzqzrWwVHFIoFkaqkNtfPYYQupE7mv58V29nk8Cy
 gzr5KOuelRlQ/K+A6buaMBly6+CSiDU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1c345863
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 17:10:54 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-450bbac0368so5831b6e.1
 for <wireguard@lists.zx2c4.com>; Tue, 18 Nov 2025 09:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1zYSkWoHOWaUvPem/5qPg2OnQIXv1VDlttraFOJHVXqk7p7Fb2x9SNYTNsMjNjPUnSacKSXNvT2U=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxfbYcuOjk2SClePK3c4qouwyK9bLoLEmfsK+IE5+ZnpMWxdSXD
 PW4KQx9g46xUD7rZ+piJdZzuVh4abLC+xQ5E5J24gVTS4t5qqCAu5/y1RBBl+bNdBugNuuesccU
 a++qK4DR7nyYJBSPwDp/LQhtkEmiiAg4=
X-Google-Smtp-Source: AGHT+IHyJUxom0hIRKScdEIXcqhrOcYQvTp4xIGZtuKdvJzwmINJbL3H3L94nnkBnG5pxXMRsYlyY/8rIR7RH87Fvjc=
X-Received: by 2002:a05:6808:13c4:b0:450:c6af:7c10 with SMTP id
 5614622812f47-450ee21dcf2mr107881b6e.22.1763485853009; Tue, 18 Nov 2025
 09:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-4-ast@fiberby.net>
In-Reply-To: <20251105183223.89913-4-ast@fiberby.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Nov 2025 18:10:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9pYvUZ8b9dzWi-XBk9N6A04MzSLELgnBezHUF7FHz-maA@mail.gmail.com>
X-Gm-Features: AWmQ_bnuBzEBp57HuRaFihbm9Rt0pgcJuXMd6cUvTwLP-PJHaf_yRwTXcyrtcqM
Message-ID: <CAHmME9pYvUZ8b9dzWi-XBk9N6A04MzSLELgnBezHUF7FHz-maA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 03/11] wireguard: netlink: enable strict
 genetlink validation
To: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
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

Hi Asbj=C3=B8rn,

On Wed, Nov 5, 2025 at 7:32=E2=80=AFPM Asbj=C3=B8rn Sloth T=C3=B8nnesen <as=
t@fiberby.net> wrote:
>  static struct genl_family genl_family __ro_after_init =3D {
>         .ops =3D genl_ops,
>         .n_ops =3D ARRAY_SIZE(genl_ops),
> -       .resv_start_op =3D WG_CMD_SET_DEVICE + 1,
>         .name =3D WG_GENL_NAME,
>         .version =3D WG_GENL_VERSION,
>         .maxattr =3D WGDEVICE_A_MAX,

This patch is fine and standalone enough, that I merged it into my
wireguard.git devel branch:

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/c=
ommit/?h=3Ddevel&id=3Dfbd8c752a8e3d00341fa7754d6e45e60d6b45490

If you wind up rerolling the rest of these, you can do it against that bran=
ch.

Jason

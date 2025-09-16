Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1660ECAC599
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 15:54:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d64da1;
	Tue, 16 Sep 2025 15:51:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be9741b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 15:51:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5D81601E4
 for <wireguard@lists.zx2c4.com>; Tue, 16 Sep 2025 15:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2236AC4CEFE
 for <wireguard@lists.zx2c4.com>; Tue, 16 Sep 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Qo+NIX5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1758037894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWvtPY8JOaJUdfA6RqqgaTmXzD6Rya5jbmVIeuYMqlk=;
 b=Qo+NIX5mhGe2yd4oJbXiPz7RY+ol8CmGTpRFuJco7KjFapGtERQR/OjwbbZw2zeCD04y9w
 Y1W19Z/NkrHQLCNoQ93+Yf/Vv82M3IU40/LSqLp0F7XC+MWwOX9r5bLRt4Kg5H4dS1m3+j
 gsdUO5jODHhxBHhOQNsaRulnVeBU8UY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a151a8fd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 15:51:34 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-75731ec93bcso812991a34.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 Sep 2025 08:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXoEngO7bd+oDXuETBwm1kQW8MGH5L34QR2wlcbwg/ntnchNqSkeg8eF3XZ+cd1rBHJMHsCs/ElDFc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwF7ZWcHgaI5lTp13GKn0NxOUqi9pnmia4F2EQOSA5jZ9aOvSe0
 qmP2t1ilxvs3yYsWf316UZIOrefRYf6B+zOOVxI/wsagSHco5UYaq0S0Elk6kVnaDVl9dGwS73A
 1jfmerJSKmhSjcaodaNbBBfSRPNIDQ+Y=
X-Google-Smtp-Source: AGHT+IGP3SbAdOU4oqfpbda8n9JY4xGEouxACuVPUK518Vvhsmppkle9doyRfdV089EzJh2FTqLp3XYTq06dthgl3G8=
X-Received: by 2002:a05:6808:1b0a:b0:438:384c:36db with SMTP id
 5614622812f47-43b8d90d7c5mr7717876b6e.15.1758037892410; Tue, 16 Sep 2025
 08:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250904-wg-ynl-rfc@fiberby.net>
In-Reply-To: <20250904-wg-ynl-rfc@fiberby.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Sep 2025 17:51:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9ra4_P0-FdVV75gaAWiW8yWsUJJsmTes_kac0EdTgnjHQ@mail.gmail.com>
X-Gm-Features: AS18NWBaLEA3oFeqxFk5qRFGjst8026RADBzbjhLf2Na8sHUXJEqAzutzDYhGUA
Message-ID: <CAHmME9ra4_P0-FdVV75gaAWiW8yWsUJJsmTes_kac0EdTgnjHQ@mail.gmail.com>
Subject: Re: [RFC net-next 00/14] wireguard: netlink: ynl conversion
To: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi Asbjorn,

On Fri, Sep 5, 2025 at 12:03=E2=80=AFAM Asbj=C3=B8rn Sloth T=C3=B8nnesen <a=
st@fiberby.net> wrote:
>
> This series contains the wireguard changes needed to adopt
> an YNL-based generated netlink code.
>
> This RFC series is posted for reference, as it is referenced
> from the current v1 series of ynl preparations, which has to
> go in before this series can be submitted for net-next.

I'm not actually convinced this makes anything better. It seems like
the code becomes more complicated and less obvious. What is the
benefit here? As is, I really don't like this direction.

Jason

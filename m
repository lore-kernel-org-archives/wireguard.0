Return-Path: <SRS0=oTJ6=DN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BB7C41604
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 12:21:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB8020760
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 12:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ww5Enqy6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB8020760
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39005ccb;
	Tue, 6 Oct 2020 11:48:44 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce91d067
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 11:48:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c42fbf96
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2JdfBqEvpTKKqrZQt0/6m7TOjro=; b=Ww5Enq
 y6S79JK+b5Roa6zltL8PNdQmxOayXaQ7xztcCcbTK2Rbs5/pDmtHZp8nX5cm+ABF
 K6LjXPo62Cn0Y2qEX3tSivqsgVdW/ImV4GE7IpamSjCn817ixbaICEwHT0ze9Cu9
 D+uiBVe9CocTbxYv5n0cdFGYCpfjELKSpUmrtvh3ZMN2T6gRYKZBp2vpeNijiS/S
 GgSvy1X3OZP0l/3ebP3IE04JglAE4aWwzyag1PR6lKCg+AUmtE6VhyW8c2SDHKZA
 TMrAjrI1gGPsEBaQ2raB9R+q9LETCOkaQcq3LUgyd54HpEPt4OHQS+4iWE75qKD+
 0eKpN7w3TsGV0hbg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e66b5dcc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 11:48:40 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id t18so3371510ilo.12
 for <wireguard@lists.zx2c4.com>; Tue, 06 Oct 2020 05:21:10 -0700 (PDT)
X-Gm-Message-State: AOAM532APT6/AH637+48irjSRHwa9Ldco01TaeZdB6QOfa7s1fr4CK8x
 noTaksgVKTpCYGoT4+e2KlIYbSI0pGfguaey33k=
X-Google-Smtp-Source: ABdhPJx/Zo8tOP5NObXKk3aFdQOf/XfG4WzG7Tw8iWL8FaBA+GjCoTsM7FHlKfd1aQzKRINdZ3iE1Fz2tdQFXF9lHQM=
X-Received: by 2002:a92:849a:: with SMTP id y26mr3399023ilk.38.1601986869735; 
 Tue, 06 Oct 2020 05:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
In-Reply-To: <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2020 14:20:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9qUWGbuSasA+xxoJO+ycog9+S6TPW9aPF8fFDkgaQDP3g@mail.gmail.com>
Message-ID: <CAHmME9qUWGbuSasA+xxoJO+ycog9+S6TPW9aPF8fFDkgaQDP3g@mail.gmail.com>
Subject: Re: wg-quick up (on linux) fails in case of several default routes
To: Chris <wireguard@spam-free.eu>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, Oct 5, 2020 at 3:51 PM Chris <wireguard@spam-free.eu> wrote:
> wg-quick tries to set the route to the wg server through the default gateway.

On Linux? It shouldn't be iterating default gateways at all, but
rather using suppress_prefix. Can you provide more technical
information about what you're seeing and maybe a patch to fix the
issue?

Jason

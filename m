Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F3DC6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 00:59:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f67fd940;
	Mon, 20 Feb 2023 00:59:00 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fca3240d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Feb 2023 00:58:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a20so1579787ljn.4
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 16:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o/Bbsal05eNVNt1/6Z1lc1ssxBCWKJeJYTKWrOslw5U=;
 b=PiTeDNfhef/JlnX5JYSrDyHvz5MNWmoRw99QxrjG+Q8bbb/ypa0a8a7VqGHWd+CGr2
 M6LW07t+VmY9Tr2BwKMozdN6ZjXR8QRfVjnmNz6A6X9wJ2pcganRhCpgpd7pJVE1gOTw
 Qhqbl/yT41Pzyo49lzFJhItfmrzIOOmwXlG6tsKKGNbTl05ASbtJWcVLIZE3VATYjrQM
 fmTf+XoMtxbCKon+nA9HIsdjNTU6grtOkR4SI+Kx7lT19khZJbUmD1gz5rBSCBqggBTD
 YJRhQ8ghm+n5O2Fn8gps+mwSMuNV311BxsKTtYmaQzWqoqkkiqvi4D4l9KN4lJyb5HC2
 9SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o/Bbsal05eNVNt1/6Z1lc1ssxBCWKJeJYTKWrOslw5U=;
 b=i1hFv2dGzvlnuYgACnbOlKsCNK0461g43txM2Kn+OwH2KrMEKaG41ff1wN/j8DooW0
 Wg7R/ucgfodsT7iEafWI+xnJyF5+mTSHX1oeVKEfkEy4+k8hRPGIbn7w9VZ3QFzcxcfj
 HQsXPF+JDpK7A3Wnqow3ygWLuy9H8TmiIMe6IKvyPO6WTwiaqRcVWyJGtgvMJRJ09dXM
 1aN41/cGMb0BNeOFNYjZXOe+lam6Jp5xZztZFtO548GoywZ4LCdp/qhevqemZ/YxL0YC
 T9MRhnkENJcEuUn9x0NI5qM3wUCjEXLShVUuYPI6QdryYBBtJFUNfF101JplvzC1HhL1
 sUpg==
X-Gm-Message-State: AO0yUKUkhSiA5TKG/U6hdXzEOfJiKpSa3UmgH44br1Pe1upWD/QlKdhk
 BhzJe5Myy9PxUOeHxfkS6b+S9VPx/uEt0peXNxuvHkeLr+g=
X-Google-Smtp-Source: AK7set/9pXtyJLblgmfRyWZ3Fa6H7Yx7ikjGA6SGCfaRJ3egGSCw2eRiS5E0vaLFgnmiVLdXosrFE4fEOnHjD3h93kg=
X-Received: by 2002:a2e:a99b:0:b0:293:4ba5:f626 with SMTP id
 x27-20020a2ea99b000000b002934ba5f626mr559727ljq.2.1676854738074; Sun, 19 Feb
 2023 16:58:58 -0800 (PST)
MIME-Version: 1.0
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <CADGd2DoE6TCtCxxWL7JWyNW5+yy_Pe+9MNzHznbudMWLTXQreA@mail.gmail.com>
 <f9cdf498-d29d-7dae-3e47-8c53435933ea@yahoo.com>
In-Reply-To: <f9cdf498-d29d-7dae-3e47-8c53435933ea@yahoo.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sun, 19 Feb 2023 21:58:43 -0300
Message-ID: <CAJq09z7kucxv4Cemq+6TVrvF_95XwgS_m1UqBiifADSVT6aMMw@mail.gmail.com>
Subject: Re: Source IP incorrect on multi homed systems
To: tlhackque <tlhackque@yahoo.com>
Cc: John Lauro <johnalauro@gmail.com>, 
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Yes, wg is not a request/response protocol. But it does have some
state. Can't wireguard remember the last local address that each peer
sent traffic? It is just like the tracking already in use for peer ip
address. If there is an "last address" it would be nice if we could
hint the kernel to use that as the source address, with a fallback to
the current behavior if the address is not available. It might solve a
couple of problems. I just don't know if it is possible to hint the
source address without enforcing it. It not, wg would have to deal
with cases when the address is gone.

Regards,

Luiz

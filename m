Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA0CA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2026 15:19:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 57b64318;
	Tue, 6 Oct 2026 15:19:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f6d48bca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 15:19:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B0FA0429DF
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2026 15:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED291F0089D
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2026 15:19:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=T4rRGkfl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1791299952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Weov/P+/p0SLpGeOdCKZ0hPSh/5P6GsNL1zHwTxrXD8=;
 b=T4rRGkflwwu37nc3SE56s5aXMFNq1Sd7iW4cWzK2tAYnvPhnH1j40GDZVnFwwLI0KGvv7Q
 PJughyNC8CBlfidR36wp9qFjdnU3/WaR95BTCQDoYMMnXMRA5salV54V8Qa9XyGuA6nCfq
 k1qsihynzbgngPpUsholmOlL4gFI33U=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 63623e0a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2026 15:19:12 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c315729ad50so101397366b.0
 for <wireguard@lists.zx2c4.com>; Tue, 06 Oct 2026 08:19:12 -0700 (PDT)
X-Gm-Message-State: AFuF++lP7Qf3VqOvl4GXtx/JW6SQ+SB1VC6C/K4WfLnafq+IN3u5q+cC
 6bQ2EFob7Bw2YswbEtzq1vC5GMaaZ5a3jUVs95MltJCveaHqSiOe9zWDuTSLy7KMM91a72HQVDt
 l+77L4o0PW052xwWjltkN99Pn+gWqvZQ=
X-Received: by 2002:a17:907:9303:b0:c2d:be57:f73a with SMTP id
 a640c23a62f3a-c3169fcb966mr205695166b.13.1791299950007; Tue, 06 Oct 2026
 08:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261005203555.3552816-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <asQUKTOiEn6GB5sy@zx2c4.com> <asSo7kefA3IQFpQp@zx2c4.com>
 <fbeae2e157e335504157b6a6683fb505@oss.cyber.gouv.fr>
In-Reply-To: <fbeae2e157e335504157b6a6683fb505@oss.cyber.gouv.fr>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2026 17:18:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9pgEFwtj2sCvJTcYHSo1P8PG5Kq3d69Qse6FZ2NbN9=mw@mail.gmail.com>
X-Gm-Features: AclHuK-mqDh7kqqib3p4GuIAljgLgEirJ4KIrhrG3xAzndDfPZnbYHtxqYInJtE
Message-ID: <CAHmME9pgEFwtj2sCvJTcYHSo1P8PG5Kq3d69Qse6FZ2NbN9=mw@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: noise: reject responses for replaced
 initiations
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Hi J=C3=A9r=C3=A9my,

On Tue, Oct 6, 2026 at 2:40=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<jeremy.jean@oss.cyber.gouv.fr> wrote:
> Thanks for your quick reply. Sorry that I could not answer in time.
> Your analysis is indeed the scenario that I had in mind, yet, the
> second thread does not really have to block, I'd say it can just
> be slow?

That's right.

> As for real world feasibility and impacts, I must admit that
> I have no idea.

I've been unable to synthetically reproduce this -- even with adding
sleeps and additional synchronization primitives to the code to force
it. But it does seem like a real issue in theory. So thanks for the
patch. I'll add some detail to the commit message, and get this
upstream and backported and such.

Jason

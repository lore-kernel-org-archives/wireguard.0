Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CBEC48297
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Feb 2024 19:08:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dc6b561;
	Tue, 6 Feb 2024 19:08:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4c6960ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2024 19:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44BC7616B6
 for <wireguard@lists.zx2c4.com>; Tue,  6 Feb 2024 19:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2954C43399
 for <wireguard@lists.zx2c4.com>; Tue,  6 Feb 2024 19:08:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LVYTNWwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1707246492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Z2BovTB2FP3edEraPK/nJ0WYXm/OBj4X4o2+dRHDHE=;
 b=LVYTNWwYm9Wnifm+IPQytFsIAWPe8JRZPoAImZ+xzPkRASSk8ARmb0BFkv1v7b3KZjEBEd
 p/QCXwDCviVUlOQQfN09tIpxSlcGQbxkxlcWz6KmGWBlb4FZw0M8l7ZdpkgmvgnrIPbLlt
 Scnb/Mp3SgEFPF0wRmM213GES4sPrmI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf3db93e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2024 19:08:12 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6040d33380cso61647407b3.1
 for <wireguard@lists.zx2c4.com>; Tue, 06 Feb 2024 11:08:12 -0800 (PST)
X-Gm-Message-State: AOJu0YwQzMhBDoU4tlDYCF4DMV/ZdSafw+TOfGcRePBJIY2cm8+DXTF5
 QIsgOomKvAoG/1OwuUsceGt0qS4abmlztuJuPLQRbzNs7lcttYLlRTHnAko1aBYDPFN2c53dlPx
 fgmX/5+EHemfmkTLrL8AxcIALiZU=
X-Google-Smtp-Source: AGHT+IFOV3Wdo2fUCv+WtJ2o5y/XqcPp1tWUbVJd5wtVPEHmafutx5P5ZJmnK/9+OaT6VsaQgi9vpUwdxEhxJFQC1YU=
X-Received: by 2002:a81:99ca:0:b0:5ff:85f4:27ee with SMTP id
 q193-20020a8199ca000000b005ff85f427eemr2455343ywg.10.1707246491366; Tue, 06
 Feb 2024 11:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20240205181111.43414-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240205181111.43414-1-n.zhandarovich@fintech.ru>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Feb 2024 20:08:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9qkOEzzUJmJroZp3X2j=2Q6tE+EMYCr0bW3vYyK=M5FuQ@mail.gmail.com>
Message-ID: <CAHmME9qkOEzzUJmJroZp3X2j=2Q6tE+EMYCr0bW3vYyK=M5FuQ@mail.gmail.com>
Subject: Re: [PATCH RESEND net v2] wireguard: receive: annotate data-race
 around receiving_counter.counter
To: n.zhandarovich@fintech.ru
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot <syzkaller@googlegroups.com>, 
 syzbot+d1de830e4ecdaac83d89@syzkaller.appspotmail.com
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

Queued up, thanks.

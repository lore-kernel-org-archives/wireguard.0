Return-Path: <SRS0=RmRV=3X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E76C35247
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 18:25:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324992082E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Feb 2020 18:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xvc/8haW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 324992082E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30954267;
	Mon, 3 Feb 2020 18:24:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31f8e6e7
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:24:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23e9d221
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:24:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c71667b
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=v/RhtGqW9pZQWsh+J/RhtbLwTBo=; b=xvc/8h
 aWfHBlvsrF9NUbOoJcQ+0Zj2RwIZvoVKFpkmSgYPNQgpFxuyLXEOGfcyGX/9XdXn
 66fZJJzWmWPaXn2D1oUe82aFsA6XemhoNEgDqeqI+MuIVXnovp/N5M/sV8J3OalH
 s77m4d3Moi5uiGN1XPfChCSxA0Bhf8gOXjtISXdpcMKYVI31K82RDBQuM4+8xbo2
 mPf9bYk2B1xEpH4Jgd4oKe8qE3xN/N8/h/NM1UD3LJFpsaAus2XuBfXe1hh/q25b
 PPKtnuOszCqyLo/5dSN4AyuZEV14md4vG1sF7v+33flVamfWPo1DSqNzFzRX/i3j
 3LJ5OKypOXK51z2g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2cdf91e4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:24:12 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id z9so14567441oth.5
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 10:24:54 -0800 (PST)
X-Gm-Message-State: APjAAAUK2k0vO2cLB/xhyGAhz/Zcba2r+KDCzISyQqhSrtyzg8iQmkZs
 fW3Xhflp2yehrxryaqdO0i2JZkALcrZxKtCS2sc=
X-Google-Smtp-Source: APXvYqyl3P00X16a0ayt89NNM1VCqEYQo63LBY2XNGicvBCuwVwizfrwTk7HaB3RD4LiU72+3aj6SlW2Ws2Hbq2DPFg=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr19094643otm.52.1580754293959; 
 Mon, 03 Feb 2020 10:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20200203171951.222257-1-edumazet@google.com>
 <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
 <efaa70a3-5c71-3cc0-ffe4-e8401d598992@gmail.com>
In-Reply-To: <efaa70a3-5c71-3cc0-ffe4-e8401d598992@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Feb 2020 19:24:42 +0100
X-Gmail-Original-Message-ID: <CAHmME9r+Nzb7wbD5-Oa4SpNukLsyXf3O8GYgrjsvyeUjHzM=Cw@mail.gmail.com>
Message-ID: <CAHmME9r+Nzb7wbD5-Oa4SpNukLsyXf3O8GYgrjsvyeUjHzM=Cw@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: fix use-after-free in
 root_remove_peer_lists
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 syzbot <syzkaller@googlegroups.com>, "David S . Miller" <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Feb 3, 2020 at 7:18 PM Eric Dumazet <eric.dumazet@gmail.com> wrote:
>
> I will let you work on a lockdep issue that syzbot found :)

Indeed, somehow I had missed that Dmitry added the wireguard netlink
interface, assuming that I needed to stop being lazy and add it
myself. Working my way through the backlog since Jan 29 now to see
what I'm missing out on.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

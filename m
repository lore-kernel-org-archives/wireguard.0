Return-Path: <SRS0=S5mX=JM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B35C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 17:53:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2528461132
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 15 Apr 2021 17:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2528461132
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d7181bf;
	Thu, 15 Apr 2021 17:53:18 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 33591c4e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Apr 2021 17:53:16 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618509195; bh=51TTsnz3wEVCPAiyrTnhDtdWCf7ndcuhK0WzK1rBtX0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ocoBPum8+lD6mqsyPngRB9PIjLGFB0fki8YaCHR2yvC6+RsaV59qmAVwdHsug8Kyh
 LER2A6Nx2Uc8iacj/E786Ko2POp9FuQNipWwx2QQVOjKywbxh9mq62wb8qcjBc3DLK
 ZrsW2SFNnS2psjFunm2fZjaAWaYkYowg1zlZKgcr0hjcCI/42K/gg6qeFdGPMHn0lE
 GApwbZclecNFG/Sue0MPKqPQwxyjXNAXsdX9QB4QYZ6dWZDFXAWJFRdknps3G3zBUL
 fT+e8D+ePhBv5OHogrV0AWwnRY8nLVkXH9jTesQFAFSx8wRwhKKQhae+PkI9gARdXf
 ANqBvhHpDlpWg==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Stefan Haller
 <stefan.haller@stha.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
In-Reply-To: <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
Date: Thu, 15 Apr 2021 19:53:14 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87sg3rigdx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hi Stefan,
>
> Sounds like Toke has come up with the optimal solution, so I think
> I'll drop the "link1" patch/hack.
>
> One thing I was wondering though, mostly for my own curiosity, is what
> config you're using that shows the problem, and how does the problem
> manifest?
>
> I just put this in bird.conf:
>
> router id 192.168.88.2;
> protocol babel {
>        interface "wg0" {
>                type wired;
>                port 1234;
>        };
> };
>
> And then I ran:
>
> # pkg install bird2
> # bird -d -c bird.conf
>
> And I didn't see any troubling error messages. But maybe it's more
> subtle than that?

I think it would just silently ignore the interface; does it say
anything about running on it? You could also see if there's any traffic,
there should be UDP packets with dest port 6696 appearing if it does
run...

-Toke

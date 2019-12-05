Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57426C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 20:24:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE67C20707
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 20:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nNcavKTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE67C20707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4d93eb7;
	Thu, 5 Dec 2019 20:24:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f33f45a
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 20:24:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cf5e887
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 20:24:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df89a932
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=duSj9EWNoEgV6ekiHA6rBdJNsmE=; b=nNcavK
 Tkeb6yQmAc+jb/RfZLwTOlLMxKwB96JvLoBBVJCJhmy1xOFc5NOeNH/xB0C0xCa+
 Ezo6MQ1wmm1ZQ4GgpkddN8XvfC7sKMkNUOdbbpW3Rj5TJwWUX3JXrtmUFpUqqEle
 Mmr8g6z9OTzVjmiSDN5D4PHWqWaas/K4tdJDARQ7isAFd5cksc+n25YUrckWne3z
 +QkGBzCZD0x24XE6AVL5Hjo/yIPSrhLA7ausbIWtjHRzS3ASDs6kg5B9B+txXwdo
 unR13zQBusT8Mxl1dx+ixNto/6A/AKyg5DpfJbYsvjqnmSW9WNllgD1sZz7MiKol
 CnYwNbG7nLLG8+qA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6923cc25
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 19:29:47 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x14so443585oic.10
 for <wireguard@lists.zx2c4.com>; Thu, 05 Dec 2019 12:24:43 -0800 (PST)
X-Gm-Message-State: APjAAAVrAs5C3qws2pXGnTwdi7n+Uh8uerGACzBmnmB1AJT/JuWrvpIS
 YdCV9uq7lu+7ANHmeiH7/dklRQiaG333iyLQeFM=
X-Google-Smtp-Source: APXvYqwfp2KCakMgsdudO+AHzmJSqB+DfuPILsQjp5xnS7lmqfeariWDR7EBE05EPxg/dXl9l1P+XwAq/h6oUaYX8t8=
X-Received: by 2002:aca:5143:: with SMTP id f64mr8671336oib.66.1575577482373; 
 Thu, 05 Dec 2019 12:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
In-Reply-To: <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Dec 2019 21:24:31 +0100
X-Gmail-Original-Message-ID: <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
Message-ID: <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: Vasili Pupkin <diggest@gmail.com>,
 "William J. Tolley" <william@breakpointingbad.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Vasili,

On Thu, Dec 5, 2019 at 8:50 PM Vasili Pupkin <diggest@gmail.com> wrote:
> Isn't it enough to just enforce Strong Host Model, i.e. a host won't
> respond from it's IP that is not facing the interface. If a host is
> connected to two subnets 10.1.x.x and 10.2.x.x and have two IP 10.1.0.1
> and 10.2.0.1, it will just drop all the packets sent to 10.1.0.1 that
> came from the interface 10.2.0.1 and vice verse. This model can be
> emulated using the FIB lookup feature of NFT with this one liner:
>
> nft add rule inet filter input fib daddr . iif type != { local,
> broadcast, multicast } drop
>
> this also works for both IP4 and IP6. This mode can be safely enabled on
> most setups not breaking things. Enabling it is a good precaution
> measure anyway and it is a shame that it is not widely assumed as
> default and standard.
>
> Doing the same with just iptables isn't easy and can't be accomplished
> with one liner but nft perfectly coexist with iptables.
>

That actually appears to work pretty well in my quick bootleg setup.
Thanks. I'm adding William to the email chain -- perhaps he can try
this and report back with his attack rig?

If we can make nft coexistance work reliably, perhaps we can run the
nft rule on systems where the nft binary simply exists.

For cleanup, we'll need some way of marking that rule as belonging to
wg-quick(8) for our interface. The iptables magic currently uses
--comment for that.

There's also the issue with nft not having default table and chain
names. Perhaps it'd be cleanest to just ad a new table and chain with
a given name, and set that as a high priority input hook?

We'll also probably want to make this only apply to our interface, and
not others, if that's possible.

Any downsides I'm overlooking?

William -- you might want to subscribe to follow along better:
https://lists.zx2c4.com/pipermail/wireguard/2019-December/004679.html
https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

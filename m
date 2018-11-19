Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64158C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:24:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02D420851
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="mTcYJ8T3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02D420851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23bdb9cf;
	Mon, 19 Nov 2018 20:18:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1de0a20
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:18:43 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 132ede13
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:18:43 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id z33so28856964otz.11
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 12:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sR7y85UDK2vDJ7lQlV/N9z8wftdxEwsmhVTg6ZG5fbg=;
 b=mTcYJ8T39PfsHyKkvHNTVqloclRjH7qqgl/faOb0SZ4AiMDHedoy4LokxfKLhief2P
 w8KqGRiLYI3pkSDlYblmZrOd+qBVZfWBz6p2kxy4PRrYw41sX4G+5oVBrM1veIVt0wMx
 eiDem+pjUUBpmVwTQgZPT4iQ4L/lpcu21JemOUXEOAL/GgdF+Ywa/Tt/2XZ6fcQgFfl2
 j1/J+9Z0fCeoQc241KTwwtT15JrkMYJAlLyKjZpwxzTmfRpoopc1mQlntWEJEyqPriJX
 +JnB3UujbG4GREu3AUcwH8vS9PuNQRx5nhRIw4yDXcHULWRc2AT9eCBivsArd6KkpLCc
 RHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sR7y85UDK2vDJ7lQlV/N9z8wftdxEwsmhVTg6ZG5fbg=;
 b=uE+TcONafgz0/bOYpbvAAbs2WTg8ItB2B/LAPxqYTDJA2L705eGSoadf+a6lgi5qwF
 p3IVe1/eO7M3NkZxNGo1/nnKTX7E+NO23sa+ZnjZji/Tme9F8SX3mecuw2fLVEaqgfKD
 MLt35vN117SbczN7MocFCcnnTH2qrd5ZXiwPVDyQwIuuseKqkZFodHMQRXnUnBNNE4ib
 /sihAuJl9qcIIsNUVwXZR9OwTqdLE/3aim4RcsyciUcaErvxKDdmJoyWtsTVhOdRHKNz
 i39BWUDJpWlQCTCAkVqLvbH/2wb4z2BgtGaDmXGQ+HXUFhwdSqAVus8exTqz8iRRevoO
 RlHg==
X-Gm-Message-State: AGRZ1gJE+xVaD1DxuJFKQwzZsvxEsaW8Id2Zf8Kkdsw2puufYA3RZ2P0
 3hk5XWD2Ev+Wogrh1FRIZdNA2d/hD39eMGJ4GuOzcQ==
X-Google-Smtp-Source: AJdET5e1r6Xkj71bW2YBHePgyYL0V+FJusDdOp0jGD2vvNjQkBRxa8AQiiO5jICMjMYyA2BStk75+DivMcj5ZHZcWS4=
X-Received: by 2002:a9d:245:: with SMTP id 63mr13597408otb.135.1542659084089; 
 Mon, 19 Nov 2018 12:24:44 -0800 (PST)
MIME-Version: 1.0
References: <CAHjFYUKdWpEjv2xyHjV15=kpbAMSxyDbGFkD93BMG7xJ09cfWA@mail.gmail.com>
In-Reply-To: <CAHjFYUKdWpEjv2xyHjV15=kpbAMSxyDbGFkD93BMG7xJ09cfWA@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Mon, 19 Nov 2018 15:24:32 -0500
Message-ID: <CAO_nJAY0tc+RvA6A-j8_ck1N-XBm+S6ciBs66qnQjS6Ya-fWzg@mail.gmail.com>
Subject: Re: Traffic on port 53 fails on LTE but works on WiFi
To: jacob.schooley+wgvpn@gmail.com
Cc: wireguard@lists.zx2c4.com
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

OK!  Firstly, thank you to everyone who took the time to reply.  I
think it's a safe assumption that WG is functioning as it should and
that I need to identify another port on which to run.  I will post a
new thread on this topic.

On Mon, Nov 19, 2018 at 10:28 AM Jacob Schooley
<jacob.schooley+wgvpn@gmail.com> wrote:
>
> Finally, something I can actually help with.
>
> Yes, Verizon is actively blocking data through port 53.
>
> Back in 2015 I discovered by accident that VPN traffic through port 53 on Verizon was not monitored by whatever they use to calculate data usage. Even better, it worked on deactivated sim cards for a few months after they were deactivated. Basically this meant I could dig around in the local Verizon store's dumpster every few months to find sim cards, pop them into a portable hotspot, and use a VPN over 53 for completely free, unthrottled data on Verizon without even having an account with them. I was a broke high school student and my parents wouldn't allow me to have service on my phone at the time so this was a life saver.
>
> Fast forward to a couple months ago, someone else gets root on the mifi 6620L, finds the loophole, and decides to sell mifi's with a VPN client or proxy installed that redirected everything through port 53. Basically resulting in a seamless experience for free unlimited data. These hacked devices sold for $300+ on eBay. Of course, after it was in the wild Verizon started DPIing port 53 and now nothing gets through.
>
>
>
> On 11/19/18, John <graysky@archlinux.us> wrote:
> > I have a simple WireGuard VPN setup I use running WG on a home Linux
> > box and connecting to it with several iOS clients. The server peer is
> > setup on port 53 since a the networkadmins of some remote WiFi
> > networks my mobile devices seems to block udp traffic on higher ports.
> > Encrypted connections work fine on WiFi as I have setup, but do _not_
> > work when I connect via LTE (Verizon supplying the data). On LTE, I
> > am no longer able to transfer data to/from the server peer but I can
> > handshake with it.
> >
> > If I inspect the output of `sudo wg` on the server peer, I see the
> > endpoint IP address changes to reflect my Verizon LTE IP and the time
> > since the last handshake reset to a few seconds which is consistent
> > with my ability to connect to the WireGuard peer server.
> >
> > I am unable to transfer data (pull up a web site or check email etc).
> > It's as/if Verizon is blocking my data flow on port 53. If I change
> > the port from 53 to 123, it seems to work fine although I do not have
> > universal connectivity on the various WiFi networks I visit on port
> > 123. The optimal port would be 53 for my use case.
> >
> > So the questions:
> > 1) What can I try on the server peer side to diagnose?
> > 2) Do people feel that Verizon is actively blocking the connection on port
> > 53?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

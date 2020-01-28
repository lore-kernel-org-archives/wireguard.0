Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7ADC33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:39:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A259A2467E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ANV5D01j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A259A2467E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e41957ac;
	Tue, 28 Jan 2020 10:38:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98a40c41
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:38:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b743f308
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:38:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fff74700
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=CHJg5B/GE1M8BkBa8p+nk9IBrhA=; b=ANV5D0
 1jJjNy3+ozCREbsqWC2ljs+4jMSt6YUg2VALmF39MHUjWRMq/l/P80iALiHb+Dc3
 HJtQMiICTQCqp9jOXpNCYy2hkVqrgi5L6C3Pwp3AfkU66ZL2ULIPqBhr5anDHO/m
 uhyRw4NTvewrPgo4PXNT+WyHZAnAg1585CH7GRZdsbgaHjmlAbnk5WhdrlhZazPs
 ZuNt1QfuLAmic8qDHepwL6hm2GrlWaX8LWTn49wN0TvpvEU0nYkl0/z+4s3oa2Ku
 dXBX0H3vS70TIpov7YiTPN47Wr+xEV2NUXv9k4z2euZBHbENrTS8+55Augoz8ISF
 b6BGnwPqf5PczJyA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32b68bed
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 09:36:56 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id l7so9797999oil.12
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 02:38:46 -0800 (PST)
X-Gm-Message-State: APjAAAULfg2tr5sV7bXbjNA2aYu9vvnO9L1ek72yu8y8xwcOVSUnAAaD
 KdaPPC0AsrlIbVKWaoeq/OPZoCCgHvh0XdNrx2A=
X-Google-Smtp-Source: APXvYqxcBrUCXkdu/pIO07tOQLXt4wL7xazu3I6zUvr8tYSpSbxf4i4BTBcKKhYF/f6MHT8QL7lYqsYyyDi8vqRoph0=
X-Received: by 2002:aca:815:: with SMTP id 21mr2465461oii.52.1580207926119;
 Tue, 28 Jan 2020 02:38:46 -0800 (PST)
MIME-Version: 1.0
References: <413c4ea5-9e70-acf9-caff-f6049374f7ce@gmail.com>
In-Reply-To: <413c4ea5-9e70-acf9-caff-f6049374f7ce@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jan 2020 11:38:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9rbO2mPjgX7FHgC4f3uK9ewtsiaNvVpZ7SpXuNPLCB07g@mail.gmail.com>
Message-ID: <CAHmME9rbO2mPjgX7FHgC4f3uK9ewtsiaNvVpZ7SpXuNPLCB07g@mail.gmail.com>
Subject: Re: Windows Wireguard with Multiple Endpoints in Different Subnets
To: cyberurchin@gmail.com
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

On Tue, Jan 28, 2020 at 11:34 AM <cyberurchin@gmail.com> wrote:
> b) The configuration described above breaks when I define a default gateway, e.g. 192.168.0.1.

I didn't quite understand what type of change this sentence implies.
What's the config file after you make the transformation described in
(b)?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

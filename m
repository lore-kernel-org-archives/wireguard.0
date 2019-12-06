Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D92C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:08:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD6724659
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W54XSHgA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BD6724659
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82e732ea;
	Fri, 6 Dec 2019 15:08:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84674165
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:08:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdd87891
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:08:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 755cc4a6
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=jy9E0As8xM16t1h2xhNjf5NEPoM=; b=W54XSH
 gAVEv9JgwA3gzcA4POSxpG1dJ7a24DQFe8+SyguBZkg1P8AEMnL9rtP3MZzUcksa
 xAq2YRttcziJ/h4WKYDt7Yz0bPbS576lSKPVEoC3shOyXVcIcp2fPg8BA9xHBBU4
 +l1fIDaxqofLenWz2z7YCCctHEekrviS7bLYdIH9vrKbECyf4gwEWUJQTFIi17Mn
 Kf4E2ZFnQ9VavIbhe9NRvflYJf6Qb8AhWSGs830TQLEs03fpzW8PSQlaYSo1Mzsv
 RC6oYiHDS35Ax+eg9+AEW7jhlZOtuKMtV73JkN4SoQF42GXmcNvXUIE0ylPJVIGx
 Ht7rHr50FchMDXZQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bf94e9e5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 14:13:16 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id j22so7477oij.9
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 07:08:17 -0800 (PST)
X-Gm-Message-State: APjAAAV4DNawf2IDzHoPwxiQkeV4/PMlcONgY5ghL32FDx9KloROjR7f
 t4jqYsq94QZzPx2Sh6sZyl1B8yflZW7rM7+Ilg0=
X-Google-Smtp-Source: APXvYqxqiWKWZf+ERSaWxIDcSRMiGhTZOCyZ89TxC2bfOnJIT0qlIBYVccf7/DR4QKHNAM32SWlcTHEWI7RgGuhazE4=
X-Received: by 2002:aca:815:: with SMTP id 21mr12846988oii.52.1575644897080;
 Fri, 06 Dec 2019 07:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <51usC7EJy_alaYnTOuLCvYhTzzcKrvAfq01j0Vfu5QVd6OGARQLdDDqQymloKWhWqkp81E09bpwjSRw5mnJDwg5fv8FuAVS-W0CYLuJlpRI=@protonmail.ch>
In-Reply-To: <51usC7EJy_alaYnTOuLCvYhTzzcKrvAfq01j0Vfu5QVd6OGARQLdDDqQymloKWhWqkp81E09bpwjSRw5mnJDwg5fv8FuAVS-W0CYLuJlpRI=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Dec 2019 16:08:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9qUWRO76NJrnO5iNoWuauvMT3kf+qM1bY49bVkcBFXY9g@mail.gmail.com>
Message-ID: <CAHmME9qUWRO76NJrnO5iNoWuauvMT3kf+qM1bY49bVkcBFXY9g@mail.gmail.com>
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Cc: "William J. Tolley" <william@breakpointingbad.com>,
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

On Fri, Dec 6, 2019 at 4:06 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
>
> On Thursday, December 5, 2019 8:24 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> >
> > If we can make nft coexistance work reliably, perhaps we can run the
> > nft rule on systems where the nft binary simply exists.
> >
>
> Will this work correctly on systems where nft binary exist but only
> iptables rules are used?

That's what I meant by, "if we can make nft coexistance work reliably."
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

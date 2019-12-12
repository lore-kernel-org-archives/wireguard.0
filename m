Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B402FC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 11:21:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F349C227BF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 11:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cA8Whilq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F349C227BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5edd5c3d;
	Thu, 12 Dec 2019 11:21:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 430d46df
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 11:21:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 443f21ff
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 11:21:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 374a1695
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 10:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=329YBczmYA2lNrThLy4cSHJu76g=; b=cA8Whi
 lqmN8fP5dDdW0w+PuUi3XsCpAowLYQDKVvabpzmUQZcy2RhvlOB0mkdg2dF1pCN4
 ylCBlzO4O0oJNGmUKoKjNc8YsIQc4181rvzNxTHgFCGOHmqeZFedlg0W5HfurAA/
 xkjw7mYy6ctioc16iNr2MBqNeM+y4339dSKkW7fy6gNzaUq9PBUgWCxFQ1j2ffdF
 8yxp2gM2V69pv9VMruzZQzerWJLH8/6Ym9l8dPrLo9K0UC4uLBQCxV6CmQErnAp0
 KHmrw8jPmoZX3vhvUTr/+tdJa/zD8AkXeUV4Fnwn9BIIrRajYajfuCzu2jmUuVSk
 sOX8nAQH/60xtbMg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db1e0e35
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 10:25:30 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id g18so1510336otj.13
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2019 03:21:17 -0800 (PST)
X-Gm-Message-State: APjAAAVdniw5GXVjpNusldqYTs4eC7q12kh/GMoXLYt0wRGdvNxdC2Dl
 rk4nZK9wzIBEoWiU2cchtpqKkcgSjl2ahj1iyrw=
X-Google-Smtp-Source: APXvYqx7erDkWXZz7mcMsLzPKvBGspY69pk1cm6pACUJj5rJGhH+LLv22b3a3CBXOdsz50OcrgLTukp1xvbUI3Ot2ZI=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr7851450ote.52.1576149676904; 
 Thu, 12 Dec 2019 03:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
 <a8f51c8e-d0e8-aaa6-024f-70b65007559f@gmail.com>
 <CAHmME9pSsTogYKMObNuy20FCRE8tNrjT9OVefn1GqqmG1B7q6w@mail.gmail.com>
 <59e3deeb-b615-fc61-0871-c56f20aae67f@gmail.com>
In-Reply-To: <59e3deeb-b615-fc61-0871-c56f20aae67f@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 12:21:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9ooxYz8FDvxmdkLFV-wvwNEopW9eRh45D7=HWY2DWxw1w@mail.gmail.com>
Message-ID: <CAHmME9ooxYz8FDvxmdkLFV-wvwNEopW9eRh45D7=HWY2DWxw1w@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Cc: "jwollrath@web.de" <jwollrath@web.de>
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

I think in the end we'll ship the nftables code. Fedora is defaulting
their stuff to nftables now [1][2]. That means systemd-networkd might
need or want (speculation) to update their firewall-util.c [3] to
support it. And knowing their attitudes on this sort of thing, that
means they'll probably (speculation) sunset iptables support and start
mandating nftables-enabled kernels. That in turn means non-nftables
kernels will probably become fewer and fewer. Some readers on this
list might vomit at that kind of reasoning, but I think it nonetheless
might reflect a practical reality of the ecosystem that wg-quick(8)
lives in. So at the moment, we'll support both iptables(8) and nft(8),
preferring the latter if it exists.

[1] https://fedoraproject.org/wiki/Changes/firewalld_default_to_nftables
[2] https://fedoraproject.org/wiki/Changes/iptables-nft-default
[3] https://github.com/systemd/systemd/blob/master/src/shared/firewall-util.c
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

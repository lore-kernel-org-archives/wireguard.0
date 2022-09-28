Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563BDC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 19:23:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9148546b;
	Wed, 28 Sep 2022 19:23:17 +0000 (UTC)
Received: from melchior.bamsoftware.com (melchior.bamsoftware.com
 [2600:3c00:e000:128:de39:20ee:9704:752d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 405bb4bb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 19:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bamsoftware.com; s=mail; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2LTJ+qoDP6ROiJ8F23uLkinhbTDslNWdZAjd0uCOSxU=; b=dMxRUrYXFZD2H2xPOm2LCvIPcW
 XF2WDBwwrzeMul7oxR2aLvhcDBiz3VPlsa6arPDOllyQ8bCyKOL6bSSXHrR2taWX8iZI6clJL9EAD
 7fHcxFJc7oFNIiKDVJClah9ZKSdF5g2ZQkjrd/upuodoKsBnAK7CP6C2uiyMhi3yfzQw=;
Date: Wed, 28 Sep 2022 13:23:08 -0600
From: David Fifield <david@bamsoftware.com>
To: Mehdi Haghgoo <powergame_coder2@yahoo.com>
Cc: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard does not work in Iran
Message-ID: <20220928192308.cmr7vzbgp3bby2al@bamsoftware.com>
References: <561370843.2818033.1664357524603.ref@mail.yahoo.com>
 <561370843.2818033.1664357524603@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561370843.2818033.1664357524603@mail.yahoo.com>
User-Agent: NeoMutt/20180716
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

On Wed, Sep 28, 2022 at 09:32:04AM +0000, Mehdi Haghgoo wrote:
> It seems that Wireguard does not work at all in Iran.
> I used to use it with nmcli on Linux, but recently it just does not work, even with ADSL Internet (Mobile internet is mainly shut down).
> 
> I suspect it is not because UDP is completely blocked, because I see some other VPNs are working with UDP. Could the co
> 
> Are there any suggestions to make Wireguard work under recent harsh Internet crackdowns?

Some people are reporting success with two-hop proxies, since not all
networks in Iran are subject to the same blocking rules. The first hop
is to another host in Iran that is less censored; the second hop crosses
the border. I haven't seen a report of someone doing this with
onobfuscated WireGuard specifically, but it may work. The second link in
the list has a kcptun component, which is UDP.

tutorial for multi-hop shadowsocks servers
https://github.com/net4people/bbs/issues/126

Tutorial: setting up a Tor bridge for Iran
https://github.com/net4people/bbs/issues/127

Two-layered access
https://forum.torproject.net/t/two-layered-access/4783

In terms of obfuscation for the WireGuard protocol, here are some
references:

Iptables WireGuard obfuscation extension
https://lists.zx2c4.com/pipermail/wireguard/2022-September/007822.html

swgp-go (userspace obfuscation proxy)
https://lists.zx2c4.com/pipermail/wireguard/2022-June/007638.html

WireGuard with obfuscation support
https://lists.zx2c4.com/pipermail/wireguard/2021-September/007142.html
https://github.com/net4people/bbs/issues/88

WireGuard obfuscation using shadowsocks
https://lists.zx2c4.com/pipermail/wireguard/2019-January/003809.html

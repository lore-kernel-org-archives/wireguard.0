Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E0C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Oct 2022 08:51:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4b3816ea;
	Sun, 2 Oct 2022 08:49:04 +0000 (UTC)
Received: from mail.core.gen.tr (ns1.core.gen.tr [50.116.31.210])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5a0c881a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 21:59:08 +0000 (UTC)
References: <561370843.2818033.1664357524603.ref@mail.yahoo.com>
 <561370843.2818033.1664357524603@mail.yahoo.com>
 <20220928192308.cmr7vzbgp3bby2al@bamsoftware.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=core.gen.tr; s=mail;
 t=1664402345; bh=J6QzuqNK/jrKmpZScE7VpttM89CeRQk+F5M/VM60r3s=;
 h=References:From:To:Subject:Date:In-reply-to;
 b=gIjWH2vONZfLg4dUZ+7fAbg5EbhBOfkbkrw521kfnwQDSgs7fZffoGYdXRwPWZJ1v
 N2o/gVbDZ8ECL2bBSJWJ/dQdkW8AyJDkrav6rs/04H7pfAyqIC0mQTvdHgkk1qxhzS
 c9p7OHpp4fl0gfG/PMRCYMfBRkSKLNM34KhxsG0Y=
From: Evrim Ulu <evrim@core.gen.tr>
To: wireguard@lists.zx2c4.com
Subject: Re: Wireguard does not work in Iran
Date: Thu, 29 Sep 2022 00:58:01 +0300
In-reply-to: <20220928192308.cmr7vzbgp3bby2al@bamsoftware.com>
Message-ID: <87czbfyxcq.fsf@core.gen.tr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Mailman-Approved-At: Sun, 02 Oct 2022 08:49:02 +0000
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


Hi there.

Here is my old attempt, may help.

Description:
https://www.core.gen.tr/posts/008-fixing-wireguard/

Patch:
https://www.core.gen.tr/patches/wg-evrim-5.18.0.patch


best,
evrim.

David Fifield <david@bamsoftware.com> writes:

> On Wed, Sep 28, 2022 at 09:32:04AM +0000, Mehdi Haghgoo wrote:
>> It seems that Wireguard does not work at all in Iran.
>> I used to use it with nmcli on Linux, but recently it just does 
>> not work, even with ADSL Internet (Mobile internet is mainly 
>> shut down).
>> 
>> I suspect it is not because UDP is completely blocked, because 
>> I see some other VPNs are working with UDP. Could the co
>> 
>> Are there any suggestions to make Wireguard work under recent 
>> harsh Internet crackdowns?
>
> Some people are reporting success with two-hop proxies, since 
> not all
> networks in Iran are subject to the same blocking rules. The 
> first hop
> is to another host in Iran that is less censored; the second hop 
> crosses
> the border. I haven't seen a report of someone doing this with
> onobfuscated WireGuard specifically, but it may work. The second 
> link in
> the list has a kcptun component, which is UDP.
>
> tutorial for multi-hop shadowsocks servers
> https://github.com/net4people/bbs/issues/126
>
> Tutorial: setting up a Tor bridge for Iran
> https://github.com/net4people/bbs/issues/127
>
> Two-layered access
> https://forum.torproject.net/t/two-layered-access/4783
>
> In terms of obfuscation for the WireGuard protocol, here are 
> some
> references:
>
> Iptables WireGuard obfuscation extension
> https://lists.zx2c4.com/pipermail/wireguard/2022-September/007822.html
>
> swgp-go (userspace obfuscation proxy)
> https://lists.zx2c4.com/pipermail/wireguard/2022-June/007638.html
>
> WireGuard with obfuscation support
> https://lists.zx2c4.com/pipermail/wireguard/2021-September/007142.html
> https://github.com/net4people/bbs/issues/88
>
> WireGuard obfuscation using shadowsocks
> https://lists.zx2c4.com/pipermail/wireguard/2019-January/003809.html


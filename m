Return-Path: <SRS0=SFG/=X6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A3CC47404
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Oct 2019 22:02:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E73B222C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Oct 2019 22:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="E6P3hdtR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E73B222C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15b98ccb;
	Sat, 5 Oct 2019 22:02:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa004756
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 22:02:19 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36ab3b0b
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 22:02:19 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 21EB0201F1
 for <wireguard@lists.zx2c4.com>; Sun,  6 Oct 2019 00:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1570312938; bh=T8vWpRmCFprQ2EO2VzdXvdeuoeQ5tzkEOSrXfgRg/Zk=;
 h=References:From:To:Subject:In-reply-to:Date:From;
 b=E6P3hdtRv+Bchmyvda+f+yL1y+UnpFUSYebsbLx6jVxL1WxHYkNHtfZNtWaOs5MgD
 wb7jTm5/8PFcAaiTU7zwZdgNVcE7f9VSnZ+6k6uRL5Bi64cbg4gd6ycK/QFdJ1sqE4
 VjRE2VlKePpT5jIAeJx+m80prdaFGE5f95zfrnKk=
Received: by diamond.localdomain (Postfix, from userid 1000)
 id B8A4C13E0027; Sun,  6 Oct 2019 00:02:18 +0200 (CEST)
References: <87v9t2c45b.fsf@ungleich.ch>
 <CAHmME9rHYf71vrPxVec5AVaUOgB=+1YHE+j8rg=ebDbZO0qA2g@mail.gmail.com>
 <87r23qc2jw.fsf@ungleich.ch>
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Kernel panic on 5.3.1-arch1-1-ARCH
In-reply-to: <87r23qc2jw.fsf@ungleich.ch>
Date: Sun, 06 Oct 2019 00:02:18 +0200
Message-ID: <874l0mzw9h.fsf@ungleich.ch>
MIME-Version: 1.0
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


... and just updated via the testing repo, everything green on 5.3.4.

On this system I see one error regarding the IPv4 fib table,
which might be due to IPv6 only usage:

[root@diamond ~]# wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -6 address add 2a0a:e5c1:137::137/48 dev wg0
[#] ip link set mtu 1420 up dev wg0
Error: ipv4: FIB table does not exist.
Dump terminated
[#] wg set wg0 fwmark 51820
[#] ip -6 route add ::/0 dev wg0 table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
[root@diamond ~]# ip a sh dev wg0
5: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet6 2a0a:e5c1:137::137/48 scope global
       valid_lft forever preferred_lft forever
[root@diamond ~]# pacman -Q | grep wireguard
wireguard-dkms 0.0.20190913-1
wireguard-tools 0.0.20190913-1

As everything work[tm], would it be an option to rename it to a warning
instead?

Best,

Nico

Nico Schottelius <nico.schottelius@ungleich.ch> writes:

> Hey Jason,
>
> thanks for the quick reply - I' ll upgrade as soon as a new package is
> released and give a status update afterwards. Thanks for tracking it
> down!
>
> Best,
>
> Nico
>
> Jason A. Donenfeld <Jason@zx2c4.com> writes:
>
>> This isn't WireGuard, actually. It's a line in wg-quick's bash that
>> says `ip rule add ... suppress_prefix ...`.
>>
>> You can reproduce the kernel crash without WireGuard anywhere in the
>> equation with this sequence:
>>
>> ip netns add crash
>> ip -n crash link add dummy1 type dummy
>> ip -n crash link set dummy1 up
>> ip -n crash -6 route add default dev dummy1
>> ip -n crash -6 rule add table main suppress_prefixlength 0
>> ip netns exec crash ping -f -c 1000 -W 1 1234::1 || true
>> ip -n crash -6 rule del table main suppress_prefixlength 0
>> ip -n crash link del dummy1
>> ip netns del crash
>>
>> I submitted a patch for this upstream here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=ca7a03c4175366a92cee0ccc4fec0038c3266e26
>>
>> It's been backported to stable already. Update your kernel to 5.3.4
>> and things should work again for you.
>>
>> Jason


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

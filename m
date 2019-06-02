Return-Path: <SRS0=NVpv=UB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934F5C282DC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Jun 2019 10:39:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359C2275D9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Jun 2019 10:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359C2275D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ec286b7;
	Sun, 2 Jun 2019 10:39:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94801f82
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jun 2019 10:39:20 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ae27d9f
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jun 2019 10:39:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 4F5BE4E41F
 for <wireguard@lists.zx2c4.com>; Sun,  2 Jun 2019 12:39:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id GjOyaMeztg9A for <wireguard@lists.zx2c4.com>;
 Sun,  2 Jun 2019 12:39:13 +0200 (CEST)
Subject: Re: wg-quick up automation fails
To: wireguard@lists.zx2c4.com
References: <b46b6815-347b-1410-51df-db52c7386313@53c70r.de>
 <49c02779bfc7c9109e6083d24b88244bb3411ef1.camel@airmail.cc>
 <125a5194-c3c3-a409-3673-e2c752c398bf@53c70r.de>
From: Silvan Nagl <mail@53c70r.de>
Openpgp: preference=signencrypt
Autocrypt: addr=mail@53c70r.de; keydata=
 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
Message-ID: <978138c3-3366-72f0-3950-3e33e5eeefe5@53c70r.de>
Date: Sun, 2 Jun 2019 12:38:38 +0200
MIME-Version: 1.0
In-Reply-To: <125a5194-c3c3-a409-3673-e2c752c398bf@53c70r.de>
Content-Language: en-US
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

Hi again,

i just noticed my default interface has MTU 1348 so when i am connected
to this one and use wg-quick it will break. Disconnecting from it first
and than using wg-quick will set higher MTUs on the WireGuard interface
so it wont break for ipv6.

Greetings,

53c70r

On 6/2/19 12:27 PM, Silvan Nagl wrote:
> Hi,
>
> as i already mentioned the problem persists on master branch for me.
>
> Greetings,
>
> 53c70r
>
> On 6/2/19 8:32 AM, XRP wrote:
>> On Sun, 2019-06-02 at 01:49 +0200, Silvan Nagl wrote:
>>> G'day,
>>>
>>> i recently upgrade WireGuard to the latest shipped Debian version
>>> (0.0.20190406-1) and noticed my wg-quick created interface did not
>>> come
>>> up as usual anymore. (Also tried the git master branch) I tried to
>>> single command trough wg-quick's automation to reproduce the error;
>>>
>>> automatic:
>>>
>>> [#] ip link add Y type wireguard
>>> [#] wg setconf Y /dev/fd/63
>>> [#] ip address add X.X.X.X/32 dev Y
>>> [#] ip address add fc00::XXXX/128 dev Y
>>> [#] ip link set mtu XXXX up dev Y
>>> [#] resolvconf -a tun.Y -m 0 -x
>>> [#] wg set Y fwmark 51820
>>> [#] ip -6 route add ::/0 dev Y table 51820
>>> RTNETLINK answers: No such device
>>> [#] resolvconf -d tun.Y
>>> [#] ip link delete dev Y
>>>
>>> manual:
>>>
>>>> ip link add Y type wireguard
>>>> wg setconf Y <(wg-quick strip /etc/wireguard/Y.conf)
>>>> ip address add X.X.X.X/32 dev Y
>>>> ip address add fc00::XXXX/128 dev Y
>>>> ip link set mtu 1268 up dev Y
>>>> resolvconf -a tun.X -m 0 -x
>>>> wg set Y fwmark 51820
>>>> ip -6 route add ::/0 dev Y table 51820
>>> < RTNETLINK answers: No such device
>>>
>>> (MTU may be to low here so i set it higher again)
>>>
>>>> ip link set mtu 1420 up dev Y
>>>> ip -6 route add ::/0 dev Y table 51820 (works now)
>>> breaks up @ this point because of error handling...
>>>
>>> Additionally it could be possible the MTU isn't set correctly.
>> I had a similar problem where I got a "RTNETLINK answers: No such
>> device" error. After that I tried to use the wg-quick version in the
>> master branch and that fixed my problem. I hope that helps.
>>
>> (MTU for IPv6 must be 1280 bytes at least.)
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

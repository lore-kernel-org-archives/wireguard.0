Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF5C00A8F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Oct 2023 11:17:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc5c7ecb;
	Tue, 24 Oct 2023 11:13:28 +0000 (UTC)
Received: from filter.openoffice.nl (filter.openoffice.nl
 [2a01:4f8:200:546b::2eef])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d943ecd
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Oct 2023 11:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter.openoffice.nl (Postfix) with ESMTP id 678A81007F2;
 Tue, 24 Oct 2023 13:13:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at filter.openoffice.nl
Received: from filter.openoffice.nl ([IPv6:::1])
 by localhost (filter.openoffice.nl [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id iwatZkmeWrKS; Tue, 24 Oct 2023 13:13:27 +0200 (CEST)
Received: from blub.net (mail.blub.net [95.97.76.243])
 by filter.openoffice.nl (Postfix) with ESMTP id 267A31003C3;
 Tue, 24 Oct 2023 13:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sess.ink; s=filter;
 t=1698146007; bh=wLruOji1UQfbDsi+dyDHzmWnbrB+vAjkcaECIsGNXQs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=J2NjQpJ6nWf4CstTRLBo6X2Is+w3HI8MBO+CSRwiUozFgsA5fK/ORuuP8zFpwyunv
 2IHbdZTNZ0wOJIXya8F/oDwNDeUH87zeruAGQHCZr5l0SVs0841SR8Vdv67xViUfWQ
 Wm7vjmfv9MzSa43CS9xeWMF9VkD0loTmDMgNn6SgWZDYFevvTkjEDEB8jm/xOxV3IR
 itlOQmtI1Wap5fAEJgJt9UlM/E+Jon+EVAcL/ePnqoYi96BMs2X2H8/oGrt8ZDGwl3
 Kvhs2ZjL7NS5RODQEM4U9woZWl09sw+qy6jm0jRxitoqmr5VoCvR6BWYdrE9Tw7qPN
 DuK6OGDOcGrww==
Received: from [IPV6:2a02:a46d:bbe9:0:8cd9:c87d:7af9:5581]
 (2a02-a46d-bbe9-0-8cd9-c87d-7af9-5581.fixed6.kpn.net
 [IPv6:2a02:a46d:bbe9:0:8cd9:c87d:7af9:5581])
 by blub.net (Postfix) with ESMTPSA id D7A063000ED;
 Tue, 24 Oct 2023 13:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sess.ink; s=v;
 t=1698146007; bh=wLruOji1UQfbDsi+dyDHzmWnbrB+vAjkcaECIsGNXQs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=qmhyShNKsPymi77foj9cXV2RxqS3cD6ZvMTpDf3rnX7KC9jlR6SZwpkE3/qJWOOac
 waf2tdOtb+iplCdbNZ+HVTqLSBJ48/Vz/iwEms4qiTgE6fOnhcy+LYmcXzctcE3/It
 YlbMmInBC+skPb5zoyIP0n4lyRj0r+zzeyoEAweATOFv07F6UF3g5NL+7guJjZhgIy
 +AMlUyFuJcaBGxdA0JH+YpWQ+TOQb5wo0nsUy/T6QAc8vgzOvoINBL3X994V+vNP7M
 PfNi2HFm77HvP7qNoJyK3NrOYh7LQJ2xyks56yLG6h7I7BDd5i2ColsCKGgsTuaNYO
 4xBTLssxn8cRw==
Message-ID: <f3f77566-6d78-4746-b458-cab5b2807b50@sess.ink>
Date: Tue, 24 Oct 2023 13:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AllowedIPs = ::/0 routes IPv4 - on Android?
Content-Language: nl-NL
To: =?UTF-8?Q?Marek_K=C3=BCthe?= <m-k-mailling-list@mk16.de>,
 wireguard@lists.zx2c4.com
References: <63bb2149-2d0b-df64-27f9-6e003dfdc577@openoffice.nl>
 <20231024113755.6a786c71@parrot>
From: Valentijn Sessink <v@sess.ink>
In-Reply-To: <20231024113755.6a786c71@parrot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Marek,

Do you have any sources for that? AFAIK, ::/0 is a convenient way to 
describe "any IPv6 address".

Still, if you are correct and should ::/0 include IPv4, then the exact 
same setup under Linux operates differently, because here ::/0 only 
routes IPv6, not IPv4. Note the empty result for the ipv4 routing table:

# AllowedIPs = ::/0
v@lnx:~$ ip ro li ta 51820
v@lnx:~$ ip -6 ro li ta 51820
default dev wgip6 metric 1024 pref medium

# AllowedIPs = ::/0, 0.0.0.0/0
v@lnx:~$ ip ro li ta 51820
default dev wgip6 scope link
v@lnx:~$ ip -6 ro li ta 51820
default dev wgip6 metric 1024 pref medium

So the question remains: ::/0 under Android routes all IPv4 traffic to 
the WG interface, while under Linux, it will only route IPv6.
Is this known behaviour?

The wg-quick manpage is ambiguous, saying that "if one of those routes 
is the default route (0.0.0.0/0 or ::/0), then it uses ip-rule(8) to 
handle overriding of the default gateway." No information on routing 
IPv4 or IPv6 differently.

A rephrase could be something like "if one of those routes is 0.0.0.0/0, 
or ::/0, it uses ip-rule(8) to handle overriding the default route for 
IPv4 or IPv6 respectivally."

Best regards,

Valentijn

On 24-10-2023 11:37, Marek Küthe wrote:
> ::/0 does not describe no IPv4 address, but all IP addresses. So when
[...]
> On Tue, 5 Sep 2023 16:04:34 +0200
> Valentijn Sessink <v@sess.ink> wrote:
>> AllowedIPs = ::/0
[...]
>> To my surprise, I found out that this also tries to route IPv4 addresses
>> to the other WG side.
>> Is this a known feature? Android 13, WireGuard for Android
>> v1.0.20230707, (from AOSP).-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  v.sessink@openoffice.nl  +31(0)20-4214059

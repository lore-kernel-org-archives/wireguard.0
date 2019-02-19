Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4878EC4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:13:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B1320675
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48B1320675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ironai.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce28e8a2;
	Thu, 21 Feb 2019 07:04:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b457b87
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 15:37:31 +0000 (UTC)
Received: from achernar.uberspace.de (achernar.uberspace.de [95.143.172.237])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d49d49f9
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 15:37:31 +0000 (UTC)
Received: (qmail 27431 invoked from network); 19 Feb 2019 15:46:02 -0000
Received: from localhost (HELO ?192.168.1.133?) (127.0.0.1)
 by achernar.uberspace.de with SMTP; 19 Feb 2019 15:46:02 -0000
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: wireguard@lists.zx2c4.com
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
 <dda16c02-171c-6b44-8258-fda8d65d0543@urlichs.de>
From: Vincent Wiemann <vincent.wiemann@ironai.com>
Message-ID: <ce051517-9325-824c-3299-ba08138e7912@ironai.com>
Date: Tue, 19 Feb 2019 16:45:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <dda16c02-171c-6b44-8258-fda8d65d0543@urlichs.de>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Feb 2019 08:03:58 +0100
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

Hi Matthias,

On 19.02.2019 08:22, Matthias Urlichs wrote:
> We don't even need call-outs. We already have a netlink interface which
> a userspace client can use to monitor WG. Teach that client to
> re-resolve the name and to update the peer.
>

that's not a good design choice. A kernel VPN module should not depend
on a user space daemon for doing regular checks or a daemon running at
all. We want to be able to set it up using e.g. systemd-networkd and
don't have to care about it afterwards. Thus WireGuard should be able to
resolve the hostnames.

On 17.02.2019 19:26, Vincent Wiemann wrote:
> One could build up on
> https://www.kernel.org/doc/Documentation/networking/dns_resolver.txt ,
> but it's a lot of work and shouldn't be a goal before WireGuard becomes
> an upstream kernel module.

I'm pretty sure that's the way to go long-term.

Regards,

Vincent Wiemann
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

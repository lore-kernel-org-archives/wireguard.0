Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB84C35673
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95550214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95550214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=powercraft.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfd43347;
	Sun, 23 Feb 2020 10:27:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45290c33
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 14:37:04 +0000 (UTC)
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 333c735f
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Feb 2020 14:37:04 +0000 (UTC)
Received: from yessica.powercraft.nl ([80.127.158.83])
 by smtp-cloud8.xs4all.net with ESMTP
 id 4mzbjrYg4PKvK4mzcjeanm; Thu, 20 Feb 2020 15:39:56 +0100
Received: from [192.168.24.203] (ebony.powercraft.nl [80.127.158.83])
 by yessica.powercraft.nl (Postfix) with ESMTPSA id 046442031C
 for <wireguard@lists.zx2c4.com>; Thu, 20 Feb 2020 15:39:55 +0100 (CET)
Subject: Re: how to forward/route/rule all traffic broadcast from an br0 to wg0
To: wireguard@lists.zx2c4.com
References: <bfa1d3ff-7885-0c68-9d74-212dec0aaed8@powercraft.nl>
From: Jelle de Jong <jelledejong@powercraft.nl>
Message-ID: <33e4e4e3-bcc4-4ebd-23b9-abf2ffb9ed6a@powercraft.nl>
Date: Thu, 20 Feb 2020 15:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bfa1d3ff-7885-0c68-9d74-212dec0aaed8@powercraft.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJn4M4J+JBRaotu7igtxHIRtDtkFg9IKPdRw3WCAWZBybFAsDkAyZSo/52vcdeUwI5Z3qYta9Wr7u/oXQ2hS7jGy3XShjvcTc/EBTgsoqn5JRSvuRFo3
 xmQfF4Hs0kJQu7gxpFPsLoN0oqledCDZtNXGNitSsVXws9ZNL8hTSbHMgooxMR5Yb+oEUvj2FA6viW8t5yYy8zXQQxUTt0X57q0=
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello everyone,

Anyone that can answer the question on how to broadcast traffic like 
DHCP through an excisiting wireguard connection?

Kind regards,

Jelle de Jong

On 2020-02-07 17:49, Jelle de Jong wrote:
> Hello everybody,
> 
> br0 (with eth0 eth1 eth3)
> wg0 (192.168.43.10/24)
> 
> dhcp-helper to forward broadcast to ip?
> 
> I am looking for way to use a wireguard tunnel to route all traffic 
> including dhcp broadcast from one network to an other network and create 
> a form of a network bridge.
> 
> I got an working wireguard client wg0 (192.168.43.10/24) that has a 
> linux bridge br0 on the same system, so br0 and wg0.
> 
> I can not add wg0 to the bridge because bridging is layer2.
> 
> How can I use either ip route, nftables, iptables, etc to route all 
> traffic on br0 to wg0.
> 
> I want to runnel an dhcp and pxe boot over the br0 to wg0.
> 
> Can someone share an example?
> 
> Kind regards,
> 
> Jelle de Jong
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

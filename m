Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FD0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 13:05:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F618207B2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 13:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F618207B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbee3e2c;
	Mon, 21 Dec 2020 12:55:51 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dbe536fa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 12:55:48 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id 6F30A8E1
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 14:04:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id 5A4AB28B830
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 14:04:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 8itt9_lpIPMa for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 14:04:49 +0100 (CET)
Received: from [172.24.68.132] (unknown [81.24.66.208])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id 1E79628A079
 for <wireguard@lists.zx2c4.com>; Mon, 21 Dec 2020 14:04:49 +0100 (CET)
Subject: Re: FreeBSD/CARP: bind outgoing packets to virtual IP
To: wireguard@lists.zx2c4.com
References: <9f417549-5123-5b4d-0f2d-ddc4b57c82a8@spam-fetish.org>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <e0c7e1d5-809a-8a09-a6b8-7b4ebf8c6b03@spam-fetish.org>
Date: Mon, 21 Dec 2020 14:07:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9f417549-5123-5b4d-0f2d-ddc4b57c82a8@spam-fetish.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

Any news on my old request?
There are more and more users in OPNsense asking for HA features with 
WireGuard.

Best,
Michael

Am 28.09.2020 um 13:33 schrieb Muenz, Michael:
> Hi,
>
> for HA solutions within Linux it seems WireGuard has the ability to 
> use fwmark to treat packet right with iptables.
>
> When it comes to FreeBSD we don't have any chance to rewrite packets 
> in HA setups.
>
> Let's say you have unit1 with master IP 1.1.1.5 and unit2 with master 
> IP 1.1.1.9 and a floating IP 1.1.1.7 which is only owned by the active 
> unit. Without the option to bind the service to a fixed IP, packets 
> leaving the firewall will be sourced from the highest interface IP 
> which would break when the floating IP is moving from unit 1 to 2.
>
> I know most of the user base are Linux users but I more and more get 
> requests also from bigger companys about HA-setups via OPNsense.
>
> Do you have any plans about a similar feature for your FreeBSD users? :)
>
>
> Best,
>
> Michael
>
>


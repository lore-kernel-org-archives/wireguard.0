Return-Path: <SRS0=uQE/=WZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B477C3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Aug 2019 04:47:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B24C22CF5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Aug 2019 04:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B24C22CF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d30b9fd3;
	Thu, 29 Aug 2019 04:46:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b9cd155
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Aug 2019 04:46:40 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6534bc7c
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Aug 2019 04:46:40 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id 1F7854FD
 for <wireguard@lists.zx2c4.com>; Thu, 29 Aug 2019 06:46:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id 12F5728B847
 for <wireguard@lists.zx2c4.com>; Thu, 29 Aug 2019 06:46:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SE2ittezWDZK for <wireguard@lists.zx2c4.com>;
 Thu, 29 Aug 2019 06:46:37 +0200 (CEST)
Received: from [81.24.66.132] (unknown [81.24.66.132])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id B0D3728B82F
 for <wireguard@lists.zx2c4.com>; Thu, 29 Aug 2019 06:46:37 +0200 (CEST)
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
To: wireguard@lists.zx2c4.com
References: <b660d135-4450-66d3-0254-a893f46ba9f7@spam-fetish.org>
 <CAHmME9qPAOLxz3CyHxq9tubzgzvksGS5iz55yL=eB2wFa23fXg@mail.gmail.com>
 <CALwBDFtP-QkGVZ6EncjtQxZ1--sGWKwzXwpNPaiLYymR5=+G6Q@mail.gmail.com>
 <CAHwDNp2pLJBV8M0sPa+XA4MDMVqJOp2=PQ1B=_W++k7V=wYfGA@mail.gmail.com>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <c87496a2-b47b-c15c-763c-3b01d0b039cb@spam-fetish.org>
Date: Thu, 29 Aug 2019 06:47:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHwDNp2pLJBV8M0sPa+XA4MDMVqJOp2=PQ1B=_W++k7V=wYfGA@mail.gmail.com>
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

Am 28.08.2019 um 21:08 schrieb Alex Davies:
> This is great news. We have been using wireguard on OPNSense (mostly 
> as servers, but also as a client in a few places) in production for 
> some time now, without drama (we found one bug with a trivial 
> workaround, see email chain "Table=off behavior (not adding any route 
> *at all*)" to this list). We can now upgrade to something formally 
> "supported" ;-)
>
> If anybody else tries to use the hardware appliances provided by the 
> founders of OPNSense (Deciso[1]) as a wireguard server or client, we 
> found the performance on the non-x86 CPUs (A10, etc.) was not great 
> (they have all sorts of ipsec type offloads, but not for WG). IIRC we 
> struggled to get more than a few gigabits per second in aggregate. The 
> Intel E3 models are able to run as close to line rate on 10G as makes 
> no odds for us.
>
> [1] 
> https://www.deciso.com/wp-content/uploads/2015/11/Brochure-OPNsense-appliances_ordered-rev201603.pdf
>
The gateway code in OPNsense 19.7 changed, so it was only possible to do 
PBR with 19.1.X.

With the last update of 19.7.3 I updated the plugin to add gateway 
support so it works with PostUp and PostDown. As usual in Open Source it 
lacks documentation yet. :)

https://github.com/opnsense/plugins/pull/1443


I did some quick iperf tests in a 10G lab last year (old Xeon E3):

https://www.routerperformance.net/comparing-opnsense-vpn-performance/


Best,

Michael

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

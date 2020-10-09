Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4D6C43457
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DEF82226B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DEF82226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87b54631;
	Fri, 9 Oct 2020 13:59:59 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fc0ac0bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:59:57 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 2380B8ED;
 Fri,  9 Oct 2020 14:32:49 +0000 (UTC)
Date: Fri, 9 Oct 2020 19:32:48 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Chris <wireguard@spam-free.eu>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
Message-ID: <20201009193248.6212a0ee@natsu>
In-Reply-To: <d888c808-fffb-1d61-cdf4-752e61e33fd1@spam-free.eu>
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009182214.0169140f@natsu>
 <d888c808-fffb-1d61-cdf4-752e61e33fd1@spam-free.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 9 Oct 2020 16:19:22 +0200
Chris <wireguard@spam-free.eu> wrote:

> Maybe I oversimplify your problem, but from what I read, your standard route 
> will be using the Iranian net.
> And - I guess - it is only a limited numer of IP addresses, that you would like 
> to reach through the tunnel.
> 
> I don't know your OS, but simply adding ip routes pointing to the tunnel for the 
> desired destinations would do the job.

OK, a desired destination would be *.youtube.com, how would you go about that?

You can't add routes to domain names of websites, not to mention to wildcards
of domain names; and websites can resolve into a lot of IPs, which will change
randomly due to load balancing, or due to sites migrating their hosting over
time. So just resolving them right now and using specific IPs likely wouldn't
work for long.

One solution is the browser extensions that I mentioned coupled with a SOCKS
proxy on remote side. Another is what David suggests with dnsmasq and ipset,
which seems like it'll be more transparent from the usage standpoint, but also
more complex to set up.

-- 
With respect,
Roman

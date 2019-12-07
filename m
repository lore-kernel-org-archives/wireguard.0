Return-Path: <SRS0=RJfG=Z5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80349C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Dec 2019 20:52:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A6F2176D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Dec 2019 20:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A6F2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a556507b;
	Sat, 7 Dec 2019 20:51:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 319287ae
 for <wireguard@lists.zx2c4.com>; Sat, 7 Dec 2019 20:51:41 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9fc1511
 for <wireguard@lists.zx2c4.com>; Sat, 7 Dec 2019 20:51:41 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 755111E305B;
 Sat,  7 Dec 2019 15:51:41 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-81.om.om.cox.net
 [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 3A6431E3053;
 Sat,  7 Dec 2019 15:51:41 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9pTt2MPH3gxks8S=3hVKS6P2XFkJd5eT7uivsoK7QPMJg@mail.gmail.com>
Date: Sat, 7 Dec 2019 14:51:40 -0600
Message-Id: <EA649C00-DEF2-464F-A5DF-9A81FA6FB5C4@lonnie.abelbeck.com>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <fdc450ad-f382-87d7-4c63-c31d595295df@gmail.com>
 <CAHmME9pTt2MPH3gxks8S=3hVKS6P2XFkJd5eT7uivsoK7QPMJg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: "William J. Tolley" <william@breakpointingbad.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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



> On Dec 6, 2019, at 9:18 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> Hi Vasili,
> 
> On Thu, Dec 5, 2019 at 10:28 PM Vasili Pupkin <diggest@gmail.com> wrote:
>> I've just figured out that the same effect can also be achieved with
>> iptables:
>> iptables -t filter -I INPUT -m addrtype --limit-iface-in ! --dst-type
>> LOCAL -j DROP
> 
> Neat trick, but it still requires this to run on all incoming packets
> from all interfaces, right? In other words, it enables a strong host
> model for the whole system instead of just with regards to addresses
> "owned" by the WireGuard interface. Adding support for the latter
> would get us back to the original rule we're using right now, right?

For what its worth, if some sort of basic firewall with conntrack is enabled, Step 1 of the attack is blocked with a "ctstate INVALID" rule.

Per testing in the lab, using attack "nping --tcp --flags SA ..."

For Example, VALID_CHK in the (external facing) INPUT and FORWARD chains:
--
-A VALID_CHK -m conntrack --ctstate INVALID -j DROP
--
for both iptables and ip6tables filter tables.

Is it common some sort of basic firewall with conntrack is not enabled ?

Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

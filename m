Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B92BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 20:12:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F05F22D5A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 20:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F05F22D5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=osk.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f70e7319;
	Tue, 5 Jan 2021 20:12:14 +0000 (UTC)
Received: from mail.osk.ch (dynamic.wline.6rd.res.cust.swisscom.ch
 [2a02:1205:5052:8220:20f:feff:fe92:5373])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5df5f1fb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 20:12:13 +0000 (UTC)
Received: from server.osk.ch (localhost [127.0.0.1])
 by mail.osk.ch (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id 105KCDmx031303;
 Tue, 5 Jan 2021 21:12:13 +0100
Received: (from osk@localhost)
 by server.osk.ch (8.14.4/8.14.4/Submit) id 105KCCcK031302;
 Tue, 5 Jan 2021 21:12:12 +0100
X-Authentication-Warning: server.osk.ch: osk set sender to wg@osk.ch using -f
Date: Tue, 5 Jan 2021 21:12:12 +0100
From: Chris Osicki <wg@osk.ch>
To: Gijs Conijn <egc112@outlook.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WG default routing
Message-ID: <20210105201212.GA31054@server>
References: <20210103215441.GA24251@server>
 <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
X-message-flag: Using Microsoft software might be a security risk
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: inspected by milter-greylist-4.5.11 (mail.osk.ch [127.0.0.1]);
 Tue, 05 Jan 2021 21:12:13 +0100 (CET) for IP:'127.0.0.1'
 DOMAIN:'localhost' HELO:'server.osk.ch' FROM:'wg@osk.ch' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.11
 (mail.osk.ch [127.0.0.1]); Tue, 05 Jan 2021 21:12:13 +0100 (CET)
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

On Mon, Jan 04, 2021 at 01:22:31PM +0000, Gijs Conijn wrote:
> That is what I am using the allowed IP's for
> I only want to route via the tunnel to my home LAN so I enter the WG subnet and the home LAN subnet in allowed IP's
> (As I understood Allowed IP's are not only Allowed but also routed via the  tunnel)
> 
> Regards, Erik 
> DDWRT WireGuard user
> 
> -----Oorspronkelijk bericht-----
> Van: WireGuard <wireguard-bounces@lists.zx2c4.com> Namens Chris Osicki
> Verzonden: zondag 3 januari 2021 22:55
> Aan: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Onderwerp: WG default routing
> 
> Hi
> 
> I am quite new to wireguard, moving after years of OpenVPN, and found it simple and _really good_.
> One thing, however, makes me wonder. Why WG tries always to take over all my routing?
> My first try was with wg-quick, and noticed all my traffic went through the WG-VPN connection.
> It escapes me why. What is the idea behind this policy?
> 
> On my Linux boxes it's not a problem, I don't have to use wg-quick and with few lines of bash in a script I have what I need. I have root.
> On my Android devices I don't have root, and I cannot change anything in routing etc.
> Why don't you provide an option to specify which net to route which way?
> 
> Regards,
> Chris
> 

Hi

As far as I can see after few tests, AllowedIPs config file option has nothing to do with routing and I hope 
it will stay like this. It is just a filter and the next question arise: why this? Don't we have iptables/nftables?
Or is it for non Unix-like systems?

Regards,
Chris

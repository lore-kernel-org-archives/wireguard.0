Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840C1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 14:30:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16DC60FC0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 14:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A16DC60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=baywinds.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98b23c3a;
	Fri, 29 Oct 2021 14:28:29 +0000 (UTC)
Received: from baywinds.org (50-196-187-248-static.hfc.comcastbusiness.net
 [50.196.187.248])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01a636fe
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Oct 2021 09:58:38 +0000 (UTC)
Received: from [192.0.2.130] (rr-iii [192.0.2.130])
 by baywinds.org (8.14.4/8.14.4) with ESMTP id 19S9wYbs027524
 for <wireguard@lists.zx2c4.com>; Thu, 28 Oct 2021 02:58:35 -0700
Subject: Re: Split DNS for macOS
To: wireguard@lists.zx2c4.com
References: <20211028071638.88001-1-stephen@slarew.net>
From: Bruce Ferrell <bferrell@baywinds.org>
Message-ID: <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
Date: Thu, 28 Oct 2021 02:58:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20211028071638.88001-1-stephen@slarew.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Greylist: inspected by milter-greylist-4.6.4 (baywinds.org [192.0.2.134]);
 Thu, 28 Oct 2021 02:58:35 -0700 (PDT) for IP:'192.0.2.130'
 DOMAIN:'rr-iii' HELO:'[192.0.2.130]' FROM:'bferrell@baywinds.org' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4
 (baywinds.org [192.0.2.134]); Thu, 28 Oct 2021 02:58:35 -0700 (PDT)
X-Mailman-Approved-At: Fri, 29 Oct 2021 14:28:28 +0000
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

On 10/28/21 12:16 AM, Stephen Larew wrote:
> For many months now, I have been running a patched WireGuard macOS app
> that enables a split DNS configuration. I would like to try to upstream
> my patches for split DNS.
>
> There has been some interest in this patch:
> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
> - A commenter on my GitHub fork of wireguard-apple.
>
> What is split DNS? It allows sending DNS queries to a specific server
> based on the domain name. Systemd-resolved calls it a routing domain.
> Apple's Network Extension framework calls it a match domain.  Split DNS
> is especially useful for internal DNS servers.
>
> For example, if corp.example.com is a routing domain for the DNS server
> at 192.0.2.1 (only accessible over WireGuard), then
> server.corp.example.com is resolved using 192.0.2.1 while
> www.example.com is resolved using some other DNS resolver (depending on
> the other network settings in macOS).
>
> The proposed patch adds new syntax to the wg-quick DNS= line.
> Specifically, a tilde prefixed domain is treated as a routing domain.
> Multiple routing domains can be added.
>
> Limitations:
> - Needs modifications to iOS UI to work on iOS.
> - Only matching routing domains are sent to the DNS servers specified in
>    the DNS= config line.  No separate fallback catch-all DNS server can
>    be set.
> - Routing/match domains are also included in the list of search domains.
>    This could be changed with the matchDomainsNoSearch API, but lacking
>    more UI or config file changes to expose this option to the user, I
>    went with the default.
>
> [1] https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMacBookAir-2.local/T/
> [2] https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5e89f1af57fcdff8

That seems to be a redefinition of the existing definition of split DNS.

Most usually, split DNS is done at the DNS server and different zones are served to the resolver based on various criteria... Usually the origination IP of the query;  If the query 
comes from a client on your LAN, or a particular subnet, the contents of a particular, private, zone are returned.  If the query comes from, say the internet,  a public zone is 
returned.

YOUR description, is how DNS works in general... Except  your patch also seems to either bypass the resolver libraries or wedge itself in front of them The system resolver 
libraries well tested and understood and they handle the following very nicely.

There is the issue of what happens with large DNS responses.  Any DNS response over 512 bytes UDP fails and is required to be retried as a TCP query, which can handle the large 
response.  It's late and I'm too tired to look it up, but there IS an RFC for this.

It's a little known issue, but I've seen it when working with other VPN products that ignored/didn't understand the behavior. The results weren't pretty and really embarrassing.

Systemd has a bad habit of re-inventing the wheel... Badly. Eventually it get's sorted, but is that really progress? In the long haul, "move fast and break things" is a MAJOR pita 
for the vast majority of us.  But some like it.

For some real fun, look into DHCPCD.  It faithfully implements a particular RFC.  In some networking environments using VPNs, it breaks routing horribly.... But it meets the RFC.  
You'll find it in Raspbian by default, and most other Debian derived distros.  I automatically rip it out and replace it with the also available ISC DHCP client.  That one is fully 
compatible with Windows, OS X, iOS, and every android and smart device I could test it with.  A DHCP server configured to be compatible with DHCPCD broke all of the previously named.

I'm giving this opinion away for free, so it's worth what you paid for it.



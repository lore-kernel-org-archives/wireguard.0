Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7882C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 17:03:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 034A960EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 17:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 034A960EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=spamteq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bbca019;
	Fri, 29 Oct 2021 17:03:24 +0000 (UTC)
Received: from mail-out2.spamhaus.org (mail-out2.spamhaus.org
 [193.190.148.132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1d5da2e9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=spamteq.com;
 s=dkim2018; t=1635527002;
 bh=DiRuIv2jhw5OHNT9OfWFAKN9GsqCSUu6ONOvPJtlh5U=;
 h=Date:Subject:To:From:From:Subject:Date:To:Cc;
 b=R0Z1twHiRvNUncW01MWXBvAbBNtCUHfel3Y5yVWgFcUnKgF/tKePgx7dY53Kb+YrP
 73JZ7yKEd+u5Y1SLdnbunpkm5sFyc70BdI5NEaoH60jB+fGg39yYkf8szgDoOK3g21
 UKzmFKBHOKBogaeXX1W/qxgwMR+pXkpTR8YFJheVCWKI/7Rhs3fjZ9aAZbWL43friI
 +8dWEgL5nef+8WzXkZSLnC9cN0O+fpQ694xmESA44S6Vdkyrpr8BFR4RjnKJuIozwJ
 jqEHQWYrWMbt+z3eyhISSdvJ5bwh8hHwGb5x3FvjLkmTlwr2HQdglmAJNeCOgh4rV+
 /J2s49oxGrsxA==
Message-ID: <K25247-14.1635527002@spamhaus.org>
Date: Fri, 29 Oct 2021 17:03:22 +0000
MIME-Version: 1.0
Subject: Re: Split DNS for macOS
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
From: Andrew Fried <afried@spamteq.com>
In-Reply-To: <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
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

Hi Stephen,

A better solution to your problem would be to deploy DNSDIST:
	https://dnsdist.org/

I for one would hope that esoteric requests that address a solution for 
less than 1% of the users would be rejected with the overall goal of 
preventing feature creep and bloat.

Andrew


On 10/29/21 11:33 AM, Stephen Larew wrote:
> 
> 
>> On Oct 28, 2021, at 02:58, Bruce Ferrell <bferrell@baywinds.org> wrote:
>>
>> On 10/28/21 12:16 AM, Stephen Larew wrote:
>>> For many months now, I have been running a patched WireGuard macOS app
>>> that enables a split DNS configuration. I would like to try to upstream
>>> my patches for split DNS.
>>>
>>> There has been some interest in this patch:
>>> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
>>> - A commenter on my GitHub fork of wireguard-apple.
>>>
>>> What is split DNS? It allows sending DNS queries to a specific server
>>> based on the domain name. Systemd-resolved calls it a routing domain.
>>> Apple's Network Extension framework calls it a match domain.  Split DNS
>>> is especially useful for internal DNS servers.
>>>
>>> For example, if corp.example.com is a routing domain for the DNS server
>>> at 192.0.2.1 (only accessible over WireGuard), then
>>> server.corp.example.com is resolved using 192.0.2.1 while
>>> www.example.com is resolved using some other DNS resolver (depending on
>>> the other network settings in macOS).
>>>
>>> The proposed patch adds new syntax to the wg-quick DNS= line.
>>> Specifically, a tilde prefixed domain is treated as a routing domain.
>>> Multiple routing domains can be added.
>>>
>>> Limitations:
>>> - Needs modifications to iOS UI to work on iOS.
>>> - Only matching routing domains are sent to the DNS servers specified in
>>>    the DNS= config line.  No separate fallback catch-all DNS server can
>>>    be set.
>>> - Routing/match domains are also included in the list of search domains.
>>>    This could be changed with the matchDomainsNoSearch API, but lacking
>>>    more UI or config file changes to expose this option to the user, I
>>>    went with the default.
>>>
>>> [1] https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMacBookAir-2.local/T/
>>> [2] https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5e89f1af57fcdff8
>>
>> That seems to be a redefinition of the existing definition of split DNS.
>>
>> Most usually, split DNS is done at the DNS server and different zones are served to the resolver based on various criteria... Usually the origination IP of the query;  If the query comes from a client on your LAN, or a particular subnet, the contents of a particular, private, zone are returned.  If the query comes from, say the internet,  a public zone is returned.
>>
>> YOUR description, is how DNS works in general... Except  your patch also seems to either bypass the resolver libraries or wedge itself in front of them The system resolver libraries well tested and understood and they handle the following very nicely.
>>
>> There is the issue of what happens with large DNS responses.  Any DNS response over 512 bytes UDP fails and is required to be retried as a TCP query, which can handle the large response.  It's late and I'm too tired to look it up, but there IS an RFC for this.
>>
>> It's a little known issue, but I've seen it when working with other VPN products that ignored/didn't understand the behavior. The results weren't pretty and really embarrassing.
>>
>> Systemd has a bad habit of re-inventing the wheel... Badly. Eventually it get's sorted, but is that really progress? In the long haul, "move fast and break things" is a MAJOR pita for the vast majority of us.  But some like it.
>>
>> For some real fun, look into DHCPCD.  It faithfully implements a particular RFC.  In some networking environments using VPNs, it breaks routing horribly.... But it meets the RFC.  You'll find it in Raspbian by default, and most other Debian derived distros.  I automatically rip it out and replace it with the also available ISC DHCP client.  That one is fully compatible with Windows, OS X, iOS, and every android and smart device I could test it with.  A DHCP server configured to be compatible with DHCPCD broke all of the previously named.
>>
>> I'm giving this opinion away for free, so it's worth what you paid for it.
> 
> Regardless of naming or definitions, I think the ability for a *local device* to route DNS queries to different DNS servers based on domain matching criteria is certainly useful. It’s not always possible or desirable to control and configure an upstream DNS server. Hence, this patch enables the local device to do split DNS.
> 
> To be clear, this patch does not bypass or wedge around anything. In fact, it configures the native macOS DNS settings in the appropriate manner to effect a split DNS configuration.
> 
> As a result of controlling the native macOS DNS resolution logic, any feature, absent or present, in the macOS DNS resolver libraries should be unaffected. This includes the large DNS response and TCP behavior. I do not expect the small/large UDP/TCP DNS features to change behavior when using a split DNS configuration as proposed in this patch.
> 
> -Stephen
> 

-- 
Andrew Fried
afried@spamteq.com
+1.703.667.4050 Office
+1.703.362.0067 Mobile

Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E19C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 21:34:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0444560F9D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 21:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0444560F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=spamteq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eaaa812a;
	Wed, 3 Nov 2021 21:34:30 +0000 (UTC)
Received: from mail-out2.spamhaus.org (mail-out2.spamhaus.org
 [193.190.148.132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40fa7506
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 21:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=spamteq.com;
 s=dkim2018; t=1635975267;
 bh=xuc7IQ2QcYcdibVuJlAwNy+Pw1fbspIdGRmoPNA7aFI=;
 h=Date:Subject:To:From:From:Subject:Date:To:Cc;
 b=oxuvPR+MwUt5Yi8oatz9ltIpdIk+x/QVXLqSsW0Gy8qS8Oep3D4GYBLqJg0DrSa8c
 dm/7/zaq/epb7Q1Fjl/lI5Fw77+cIBodhPYtieSckXUWicxh841JxUqqy852NtDciJ
 Tn37JzEQJqgisW9wDlr9jGb4Vlgas5X1oNwXRmT3ohpShdO6plOUILLlTbxYZHfhCU
 IsEqFlLcqGT94XIFmufiP8Yzil60pr/EbjbqW18ORR221ANnYGjTW3A4XW4gusRA3n
 QiAmNzeVLPifvQGNZEq5gYlqsWAEYU59L0/J75dguwaVas4gA1sGpwzMwCgO5xI5gv
 /1w0yBgIKuksw==
Message-ID: <K17663-81.1635975267@spamhaus.org>
Date: Wed, 3 Nov 2021 21:34:27 +0000
MIME-Version: 1.0
Subject: Re: Split DNS for macOS
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <CAHsVW7N2JA25KXDRM0ghNrn-9BZpuqY0OMHX4WTi7hmXjS9nGA@mail.gmail.com>
From: Andrew Fried <afried@spamteq.com>
In-Reply-To: <CAHsVW7N2JA25KXDRM0ghNrn-9BZpuqY0OMHX4WTi7hmXjS9nGA@mail.gmail.com>
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

Hi Matty,

I understand exactly what you're trying to accomplish and agree that 
split dns can be challenging, especially with multiple VPN gateways.

My point is that what you're describing is a DNS issue, not a 
firewall/vpn/routing issue.  As such, I think there's more eloquent way 
to solve DNS related issues.

The old fashioned way is to add exceptions to the equivalent of the 
/etc/host file.  Not ideal, doesn't scale well and pretty static, but if 
you're relying on just a few private host mappings it works pretty well.

The second and more palatable solution is to have the internal 
nameservers running software that supports views - such that queries for 
xxxx.example.com that originate from private address space return 
different answers than if the query originated from public space.

A third option would be set the internal recursives up as forwarders 
that only respond authoritatively for your private "mydomain.internet" 
and forward all other requests to nameservers capable of public recursion.

There's the dnsdist solution, which is an advanced dns proxy server 
capable of routing requests to different recursives based on the domain 
name.  DNSDIST does a lot of other stuff as well, but the heart of is 
intelligent proxying.  In our racks we use DNSDIST to distribute around 
a million DNS queries per minute and it works flawlessly.

Basically, what I'm suggesting is that DNS servers handle DNS and 
wireguard handle routing/transport.  Adding VPN functionality to a 
nameserver or dns capabilities to Wireguard adds complexities that can 
be better handled elsewhere.

What makes Wireguard so good is that it does one thing and does it 
really, really well.

Andrew


On 10/29/21 5:06 PM, Matty Driessen wrote:
> Hello Andrew,
> 
> I just want to chime in here and say that I think the current
> implementation of search domains is simply not working the way it
> should on the MacOS client.
> 
> My use case is pretty common, an internal DNS server that has entries
> for internal servers. I defined a search domain in the WireGuard
> configuration; DNS = 10.13.13.1 mydomain.internal. The search domain
> is for convenience, so I can just use the servername instead of
> servername.mydomain.internal. Now this works fine when I route all the
> traffic through the VPN (AllowedIPs = 0.0.0.0/0) but the search domain
> is completely ignored when I only route the traffic I need to
> (AllowedIPs = 10.13.13.0/24 192.168.0.0/24).
> 
> I don't think this is a configuration error on my side. The DNS
> responds fine when using servername.mydomain.internal. This problem is
> even mentioned in the "WireGuard macOS & iOS TODO List"
> 9. matchDomains=[“”] doesn’t do what the documentation says.
> Specifically, DNS servers are not used if allowed IPs isn’t 0.0.0.0/0.
> 
> The description isn't 100% accurate (or outdated), the DNS server is
> used but the search domain isn't being set on the primary resolver.
> Some have solved this issue by adding the search domains to the list
> of matchDomains; dnsSettings.matchDomains = [""] +
> dnsSettings.searchDomains. But that way the DNS server specified in
> WireGuard is still the primary resolver for all DNS queries.
> 
> Here is a link on how OpenVPN handles this and I think it's how it
> should work when not using AllowedIPs 0.0.0.0/0.
> https://openvpn.net/faq/how-does-ios-interpret-pushed-dns-servers-and-search-domains/
> On a split-tunnel, where redirect-gateway is not pushed by the server,
> and at least one pushed DNS server is present:
> - route all DNS requests through pushed DNS server(s) if no added
> search domains.
> - route DNS requests for added search domains only, if at least one
> added search domain.
> 
> Yours sincerely,
> Matty
> 
> --
> 
> Hi Stephen,
> 
> A better solution to your problem would be to deploy DNSDIST:
>          https://dnsdist.org/
> 
> I for one would hope that esoteric requests that address a solution
> for less than 1% of the users would be rejected with the overall goal
> of preventing feature creep and bloat.
> 
> Andrew
> 

-- 
Andrew Fried
afried@spamteq.com
+1.703.667.4050 Office
+1.703.362.0067 Mobile

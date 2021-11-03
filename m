Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708EFC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 09:15:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B8061073
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 09:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08B8061073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixigo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87da2cb4;
	Wed, 3 Nov 2021 09:15:17 +0000 (UTC)
Received: from mail.aixigo.de (mail.aixigo.de [5.145.142.10])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6bc82de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 09:15:16 +0000 (UTC)
Received: from mailhost.ac.aixigo.de (mailhost.ac.aixigo.de [172.19.96.11])
 by mail.aixigo.de (OpenSMTPD) with ESMTPS id 9cd07c70
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 10:15:15 +0100 (CET)
Received: from [172.19.97.128] (dpcl082.ac.aixigo.de [172.19.97.128])
 by mailhost.ac.aixigo.de (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 1A39FEE71848611; Wed, 3 Nov 2021 10:15:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aixigo.com;
 s=default; t=1635930914;
 bh=8EOoSJSrcGOfx0eGPjKQ+NKa2tYSgVeEhHeQMQV7vVo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=QhNWiCKr6odNj8uUPkbYd5S4XaNFQRpE3uAZOgFQJcxOQtF1OR+jocUaXakDOHDJx
 A31BhOExYFxv7CmQbExBd9cg5FH6vyuI19GkknfjSV6QjJCtCHcXmVSdyc81fNtksJ
 yRhD4s2bslJYHOJUeEu73024RAnSQE5KHrzLm/oo=
Message-ID: <54f3f2a6-7c58-dc42-56bd-fffe74bc3a18@aixigo.com>
Date: Wed, 3 Nov 2021 10:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Split DNS for macOS
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
 <K25247-14.1635527002@spamhaus.org>
 <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
From: Harald Dunkel <harald.dunkel@aixigo.com>
In-Reply-To: <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.3 at srvvm01.ac.aixigo.de
X-Virus-Status: Clean
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

Hi folks,

I really like this patch. Currently DNS on MacOS is unable to resolve
both my local DNS names and the domain in the office in parallel, if
Wireguard is enabled. I have to use somehost.local to fall back to
zeroconf for my LAN as a workaround, which is pretty annoying.

My suggestion would be to set SupplementalMatchDomains instead(!) of
SearchDomains, using the current config file syntax without '~'. Since
SupplementalMatchDomainsNoSearch is disabled by default, setting
SupplementalMatchDomains is sufficient to configure both lists. See

https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf

This has to be verified, of course.


Regards
Harri



On 2021-10-29 23:07:38, Stephen Larew wrote:
>> On Oct 29, 2021, at 10:03, Andrew Fried <afried@spamteq.com> wrote:
>>
>>> On Oct 29, 2021, at 08:33, Stephen Larew <stephen@slarew.net> wrote:
>>>
>>>> On Oct 28, 2021, at 02:58, Bruce Ferrell <bferrell@baywinds.org> wrote:
>>>>
>>>> On 10/28/21 12:16 AM, Stephen Larew wrote:
>>>>> For many months now, I have been running a patched WireGuard macOS app
>>>>> that enables a split DNS configuration. I would like to try to upstream
>>>>> my patches for split DNS.
>>>>>
>>>>> There has been some interest in this patch:
>>>>> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
>>>>> - A commenter on my GitHub fork of wireguard-apple.
>>>>>
>>>>> What is split DNS? It allows sending DNS queries to a specific server
>>>>> based on the domain name. Systemd-resolved calls it a routing domain.
>>>>> Apple's Network Extension framework calls it a match domain.  Split DNS
>>>>> is especially useful for internal DNS servers.
>>>>>
>>>>> For example, if corp.example.com is a routing domain for the DNS server
>>>>> at 192.0.2.1 (only accessible over WireGuard), then
>>>>> server.corp.example.com is resolved using 192.0.2.1 while
>>>>> www.example.com is resolved using some other DNS resolver (depending on
>>>>> the other network settings in macOS).
>>>>>
>>>>> The proposed patch adds new syntax to the wg-quick DNS= line.
>>>>> Specifically, a tilde prefixed domain is treated as a routing domain.
>>>>> Multiple routing domains can be added.
>>>>>
>>>>> Limitations:
>>>>> - Needs modifications to iOS UI to work on iOS.
>>>>> - Only matching routing domains are sent to the DNS servers specified in
>>>>>   the DNS= config line.  No separate fallback catch-all DNS server can
>>>>>   be set.
>>>>> - Routing/match domains are also included in the list of search domains.
>>>>>   This could be changed with the matchDomainsNoSearch API, but lacking
>>>>>   more UI or config file changes to expose this option to the user, I
>>>>>   went with the default.
>>>>>
>>>>> [1] https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMacBookAir-2.local/T/
>>>>> [2] https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5e89f1af57fcdff8
>>>>
>>>> That seems to be a redefinition of the existing definition of split DNS.
>>>>
>>>> Most usually, split DNS is done at the DNS server and different zones are served to the resolver based on various criteria... Usually the origination IP of the query;  If the query comes from a client on your LAN, or a particular subnet, the contents of a particular, private, zone are returned.  If the query comes from, say the internet,  a public zone is returned.
>>>>
>>>> YOUR description, is how DNS works in general... Except  your patch also seems to either bypass the resolver libraries or wedge itself in front of them The system resolver libraries well tested and understood and they handle the following very nicely.
>>>>
>>>> There is the issue of what happens with large DNS responses.  Any DNS response over 512 bytes UDP fails and is required to be retried as a TCP query, which can handle the large response.  It's late and I'm too tired to look it up, but there IS an RFC for this.
>>>>
>>>> It's a little known issue, but I've seen it when working with other VPN products that ignored/didn't understand the behavior. The results weren't pretty and really embarrassing.
>>>>
>>>> Systemd has a bad habit of re-inventing the wheel... Badly. Eventually it get's sorted, but is that really progress? In the long haul, "move fast and break things" is a MAJOR pita for the vast majority of us.  But some like it.
>>>>
>>>> For some real fun, look into DHCPCD.  It faithfully implements a particular RFC.  In some networking environments using VPNs, it breaks routing horribly.... But it meets the RFC.  You'll find it in Raspbian by default, and most other Debian derived distros.  I automatically rip it out and replace it with the also available ISC DHCP client.  That one is fully compatible with Windows, OS X, iOS, and every android and smart device I could test it with.  A DHCP server configured to be compatible with DHCPCD broke all of the previously named.
>>>>
>>>> I'm giving this opinion away for free, so it's worth what you paid for it.
>>>
>>> Regardless of naming or definitions, I think the ability for a *local device* to route DNS queries to different DNS servers based on domain matching criteria is certainly useful. It’s not always possible or desirable to control and configure an upstream DNS server. Hence, this patch enables the local device to do split DNS.
>>>
>>> To be clear, this patch does not bypass or wedge around anything. In fact, it configures the native macOS DNS settings in the appropriate manner to effect a split DNS configuration.
>>>
>>> As a result of controlling the native macOS DNS resolution logic, any feature, absent or present, in the macOS DNS resolver libraries should be unaffected. This includes the large DNS response and TCP behavior. I do not expect the small/large UDP/TCP DNS features to change behavior when using a split DNS configuration as proposed in this patch.
>>>
>>> -Stephen
>>
>> Hi Stephen,
>>
>> A better solution to your problem would be to deploy DNSDIST:
>> 	https://dnsdist.org/
>>
>> I for one would hope that esoteric requests that address a solution for less than 1% of the users would be rejected with the overall goal of preventing feature creep and bloat.
>>
>> Andrew
> 
> DNSDIST may allow (I have not tried) one to create a split DNS scenario, but it is an extra piece of software that would need to be discovered, installed, configured, and maintained by a user or system administrator. I do not believe it would properly integrate with the macOS DNS resolution machinery. I do not believe it is a better solution to the problem.
> 
> As I understand it, under some circumstances, the Tailscale macOS app also implements split DNS in roughly the same manner as done in my patch. Namely, the tailscale app appears to use the Network Extension APIs to directly integrate with the macOS DNS resolution machinery. Perhaps the relevant difference is that tailscale approaches configuration differently (not based on wg-quick) than the WireGuard macOS app.
> 
> I do not have statistics or polling on who desires this split DNS feature. I have received private and public requests to upstream the feature. Tailscale also implements split DNS; presumable customers demand it. I suspect if the feature was available to users of the WireGuard app, then it would be used with precision to great effect. Users who do not need this split DNS feature do not lose any previous functionality in the macOS WireGuard app.
> 
> Personally, my one hesitation with this patch is that, as currently implemented, a new syntax is added to the wg-quick config file (tilde prefixed route/match domains). My patch does not address compatibility issues nor does it add documentation to wg-quick for the new syntax.
> 
> -Stephen
> 


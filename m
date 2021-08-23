Return-Path: <SRS0=4Jqt=NO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B2EC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Aug 2021 17:40:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0A8610C7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Aug 2021 17:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D0A8610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5878a5bd;
	Mon, 23 Aug 2021 17:38:41 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d167be6f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Aug 2021 17:38:37 +0000 (UTC)
Received: from [192.168.136.137] (unknown [83.135.142.33])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 9D1181C0192;
 Mon, 23 Aug 2021 19:38:37 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: Re: enabling WG0 allows telegram but impedes browsing
To: S Bauer <sanderbauer@gmail.com>, wireguard@lists.zx2c4.com
References: <CA+MSESn8FSHVmOjHQGsNsQqu89ijP3uGiz3ohE3Lbh6LHM3meA@mail.gmail.com>
Message-ID: <bc607757-8c13-6146-c7bd-50aad949de76@spam-free.eu>
Date: Mon, 23 Aug 2021 19:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+MSESn8FSHVmOjHQGsNsQqu89ijP3uGiz3ohE3Lbh6LHM3meA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

If I understand it right, everything seems fine BUT once wg is up you cannot 
reach e.g. other websites.
Therefore you you try to track the route to say reddit. Command line:

mtr -n reddit.com

and then you will see at what point the data transport to reddit gets stuck.

Also check (command line)

host -v reddit.com

to check on the correct DNS working.

Chris


On 20/08/2021 13:16, S Bauer wrote:
> Hello team,
>
> Hoping you could help me out with a foggy situation.
> The past week I have been struggling to get the Wireguard VPN working
> smoothly. Everything seems to work on paper, except in a specific way
> it doesn't. I am using Pop!_OS 21.04 (Ubuntu Hirsute).
>
> SitRep;
> I work as a freelance consultant and want to be careful about the
> local networks' peeping tom when accessing sensitive work documents
> from 'out of office', e.g. at a friend's place or at a hotel. So my
> objective is to access my home network via PiHole and then continue
> onward to access my work-related documents on a fileserver.
> I was hoping this could be easily achieved with Wireguard.
>
> Using the Wireguard VPN wg0 with wg-quick worked perfectly when I
> connected to my brother's phone hotspot (4G). I could access our home
> via VPN as expected and could work on my documents without any
> problems.
> The trouble is that I am now at a different location, working with a
> fixed router from Ziggo NL. For some reason the WG0 still connects
> perfectly, but after that a small mystery occurs. I did not make any
> modifications to WG0.conf, so I remain stumped.
> With WG active, I am no longer able to access any webpage. So no
> access to protonmail\gmail, reddit or anything else. Telegram,
> however, is still working fine. Internal machines on the home's local
> network (IP-camera) can also be accessed directly.
> Disabling the WG gives me full access to any webpage as usual. So
> something is amiss that affects my browser only (Firefox 91.0).
>
> I already did some troubleshooting. Starting with Uncomplicated
> Firewall (UFW). I tried disabling UFW and rebooting, but this did not
> change anything. I still lacked browser access when connected with
> WG0, but Telegram still worked fine.
> The output from sudo wg is;
> interface: wg0
> public key: (hidden)
> private key: (hidden)
> listening port: <portnumber>
> fwmark: 0xca6c
>
> peer: (hidden)
> preshared key: (hidden)
> endpoint: >our_endpoint_name<.ddns.net:51820
> allowed ips: 0.0.0.0/0, ::/0
> latest handshake: 3 seconds ago
> transfer: 92 B received, 4.77 KiB sent
>
> To be on the safe side, I added several rules to UFW (and reloaded UFW
> each time) per advice from
> https://jianjye.medium.com/how-to-fix-no-internet-issues-in-wireguard-ed8f4bdd0bd1
> , leaving me with the following output from ufw status verbose. (But
> like I said, the problem occurs even with UFW disabled.)
> Status: active
> Logging: on (low)
> Default: deny (incoming), allow (outgoing), deny (routed)
> New profiles: skip
>
> To Action From
> -- ------ ----
> Anywhere/udp on wg0 ALLOW IN Anywhere/udp
> <portnumber>/udp ALLOW IN Anywhere
> <portnumber>/udp ALLOW IN Anywhere
> <portnumber>/udp on wlp0s20f3 ALLOW IN Anywhere
> Anywhere/udp on wlp0s20f3 ALLOW IN Anywhere/udp
> <portnumber> on wlp0s20f3 ALLOW IN Anywhere
> Anywhere/udp (v6) on wg0 ALLOW IN Anywhere/udp (v6)
> <portnumber>/udp (v6) ALLOW IN Anywhere (v6)
> <portnumber>/udp (v6) ALLOW IN Anywhere (v6)
> <portnumber>/udp (v6) on wlp0s20f3 ALLOW IN Anywhere (v6)
> Anywhere/udp (v6) on wlp0s20f3 ALLOW IN Anywhere/udp (v6)
> <portnumber> (v6) on wlp0s20f3 ALLOW IN Anywhere (v6)
>
> Anywhere on eth0 ALLOW FWD Anywhere on wg0
> Anywhere on wg0 ALLOW FWD Anywhere on eth0
> Anywhere on wg0 ALLOW FWD Anywhere on enp40s0
> Anywhere on enp40s0 ALLOW FWD Anywhere on wg0
> Anywhere on wlp0s20f3 ALLOW FWD Anywhere on wg0
> Anywhere on wg0 ALLOW FWD Anywhere on wlp0s20f3
> Anywhere (v6) on eth0 ALLOW FWD Anywhere (v6) on wg0
> Anywhere (v6) on wg0 ALLOW FWD Anywhere (v6) on eth0
> Anywhere (v6) on wg0 ALLOW FWD Anywhere (v6) on enp40s0
> Anywhere (v6) on enp40s0 ALLOW FWD Anywhere (v6) on wg0
> Anywhere (v6) on wlp0s20f3 ALLOW FWD Anywhere (v6) on wg0
> Anywhere (v6) on wg0 ALLOW FWD Anywhere (v6) on wlp0s20f3
>
> Now all these rules may be barbaric overkill, and yes I will admit
> that I have a limited understanding of what everything means and how
> it affects my security. Though I am a linux newcomer and employ
> duckduckgo to the best of my abilities the learning curve is still
> pretty much in effect. That being said, do feel free to point out any
> serious flaws I may have unwittingly introduced or simply push me
> towards some longreads ;)
>
> Any hints on solving this issue are appreciated.
>
>
> Additional notes;
> * the DDNS in wg0.conf is properly translated to an IP address each
> time. So that seems to be no issue.
> * I am currently using the Dutch Ziggo network, which already seems to
> have a reputation concerning the use of VPN applications. Maybe the
> issue lies herein?
> * Should I consider this relevant? >
> https://github.com/pop-os/pop/issues/773 I am a bit cautious about
> doing more random stuff before actually understanding what is going
> on.
>
> Regards,
> Sander



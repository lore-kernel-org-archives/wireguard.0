Return-Path: <SRS0=fEac=TY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA33BC072B5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 May 2019 15:18:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382F72075E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 May 2019 15:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mx.trustiosity.com header.i=@mx.trustiosity.com header.b="XM4cqQE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382F72075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trustiosity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1486eb69;
	Fri, 24 May 2019 15:17:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 812a6c92
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 May 2019 15:17:56 +0000 (UTC)
Received: from mx.trustiosity.com (mx.trustiosity.com [54.186.28.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbd90db8
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 May 2019 15:17:55 +0000 (UTC)
Received: from [192.168.212.105] (csm.ldm [192.168.212.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: zrm@trustiosity.com)
 by mx.trustiosity.com (Postfix) with ESMTPSA id 34B634211E7
 for <wireguard@lists.zx2c4.com>; Fri, 24 May 2019 11:17:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
 s=mx; t=1558711074; bh=spKY+8wPrJxGCfcj7ACQmuwhYJbXy9bIYSU0j7bjiyo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XM4cqQE+045r5ruLa+ETWOgWJgQv9N1/arLWwWIPBYUwcyEE+qqAjGjRA5H2iqBZG
 Ao2UaGt0o0o4OFcQ5/bxryUA/Ztpeeq2t0xFkc14M1zFfZpcUyXniFeVWX8hX5GTQI
 BgGFP2G3CS5aL5J+XE6bbTPBm3Yi/eb4iVyJM6jc=
Subject: Re: WG can now be fragmented -- great!
To: wireguard@lists.zx2c4.com
References: <20190524134817.2c0e73d2@natsu>
From: zrm <zrm@trustiosity.com>
Message-ID: <9f1123cc-8796-3b76-f452-09f080a296ce@trustiosity.com>
Date: Fri, 24 May 2019 11:17:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524134817.2c0e73d2@natsu>
Content-Language: en-US
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

On 5/24/19 04:48, Roman Mamedov wrote:
> Hello,
> 
> Just wanted to share my excitement about
> https://git.zx2c4.com/WireGuard/diff/?id=57a8ca7f49b5e70aae18b8b5a70cde8f9e4a9346&id2=7cf2dae97635c8c20a8943522bab2b56c6885c8d
> 
> This means WG packets can now be fragmented, and as such we can use arbitrary
> large MTU inside WG. This in turn means we can now use WG to transport full
> 9000 MTU VXLAN frames over the Internet:
> 
> # ifconfig wg10
> wg10      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
>            inet6 addr: fd39:aa:6089:5d42:7900:fcd:12a3:6181/64 Scope:Global
>            UP POINTOPOINT RUNNING NOARP  MTU:9070  Metric:1
>            RX packets:12405 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:11130 errors:17 dropped:2 overruns:0 carrier:8
>            collisions:0 txqueuelen:1000
>            RX bytes:81966214 (78.1 MiB)  TX bytes:45563644 (43.4 MiB)
> 
> # ifconfig xwg10
> xwg10     Link encap:Ethernet  HWaddr 02:79:00:0f:cd:12
>            inet addr:10.123.0.250  Bcast:10.123.0.255  Mask:255.255.255.0
>            inet6 addr: fe80::79:ff:fe0f:cd12/64 Scope:Link
>            UP BROADCAST RUNNING MULTICAST  MTU:9000  Metric:1
>            RX packets:12369 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:9577 errors:9 dropped:0 overruns:0 carrier:9
>            collisions:0 txqueuelen:1000
>            RX bytes:80678848 (76.9 MiB)  TX bytes:44408417 (42.3 MiB)
> 
> # ping 10.123.0.1 -s 8972 -M do
> PING 10.123.0.1 (10.123.0.1) 8972(9000) bytes of data.
> 8980 bytes from 10.123.0.1: icmp_seq=1 ttl=64 time=78.7 ms
> 8980 bytes from 10.123.0.1: icmp_seq=2 ttl=64 time=77.2 ms
> 8980 bytes from 10.123.0.1: icmp_seq=3 ttl=64 time=82.0 ms
> 8980 bytes from 10.123.0.1: icmp_seq=4 ttl=64 time=77.5 ms
> ^C
> --- 10.123.0.1 ping statistics ---
> 4 packets transmitted, 4 received, 0% packet loss, time 3003ms
> rtt min/avg/max/mdev = 77.214/78.881/82.054/1.940 ms
> 
> 08:39:47.573368 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (0|1440) 710 > 710: UDP, bad length 9102 > 1432
> 08:39:47.573371 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (1440|1440)
> 08:39:47.573374 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (2880|1440)
> 08:39:47.573376 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (4320|1440)
> 08:39:47.573378 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (5760|1440)
> 08:39:47.573380 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (7200|1440)
> 08:39:47.573383 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (8640|470)
> 08:39:48.575079 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (0|1440) 710 > 710: UDP, bad length 9102 > 1432
> 08:39:48.575189 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (1440|1440)
> 08:39:48.575339 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (2880|1440)
> 08:39:48.575448 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (4320|1440)
> 08:39:48.575565 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (5760|1440)
> 08:39:48.575691 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (7200|1440)
> 08:39:48.575693 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (8640|470)
> 08:39:48.575828 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (0|1440) 710 > 710: UDP, bad length 9102 > 1432
> 08:39:48.575831 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (1440|1440)
> 08:39:48.575833 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (2880|1440)
> 08:39:48.575834 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (4320|1440)
> 08:39:48.575837 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (5760|1440)
> 08:39:48.575838 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (7200|1440)
> 08:39:48.575840 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (8640|470)
> 
> I also briefly tested performance and despite fragmentation having a bad
> reputation for some, I don't see much difference in iperf speeds to
> the same host vs going directly.
> 
> This is now usable to join multiple locations via VXLAN interfaces as members
> of L2 bridges to physical 1G/10G networks without hobbling MTU of the latter.
> 
> Thanks!
> 

I'm not saying this is a bad idea to support, but it may be good to 
document a couple of things about this.

The first is that this makes it apparent to an observer what the MTU on 
your other interfaces are, and which interface a connection routes 
through if they're different. This is only a small information leak, but 
it is one.

I would also suggest that if you're going to do this with the underlying 
transport, check the DF bit on the inner packet and send the ICMP[v6] 
too big message back to the sender as appropriate. Then you can set a 
high MTU on the wg interface but things that support PMTU discovery can 
still use it.

Moreover, you may want to performance test the common degenerate case of 
setting the MTU on the wg interface to not account for transport 
overhead which then fragments every packet into one full packet and one 
tiny packet. That is likely to be somewhat worse, and would occur in any 
case that the MTU on the originating and wg underlying transport 
interfaces are equal and the MTU on the wg interface is set to that or 
higher.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

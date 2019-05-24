Return-Path: <SRS0=fEac=TY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7077DC072B5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 May 2019 08:48:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71A1217D7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 May 2019 08:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71A1217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39fc4818;
	Fri, 24 May 2019 08:48:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e06cb62a
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 May 2019 08:48:18 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c31f04de
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 May 2019 08:48:18 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id B84E4203F4
 for <wireguard@lists.zx2c4.com>; Fri, 24 May 2019 08:48:17 +0000 (UTC)
Date: Fri, 24 May 2019 13:48:17 +0500
From: Roman Mamedov <rm@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: WG can now be fragmented -- great!
Message-ID: <20190524134817.2c0e73d2@natsu>
MIME-Version: 1.0
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

Hello,

Just wanted to share my excitement about
https://git.zx2c4.com/WireGuard/diff/?id=57a8ca7f49b5e70aae18b8b5a70cde8f9e4a9346&id2=7cf2dae97635c8c20a8943522bab2b56c6885c8d

This means WG packets can now be fragmented, and as such we can use arbitrary
large MTU inside WG. This in turn means we can now use WG to transport full
9000 MTU VXLAN frames over the Internet:

# ifconfig wg10
wg10      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  
          inet6 addr: fd39:aa:6089:5d42:7900:fcd:12a3:6181/64 Scope:Global
          UP POINTOPOINT RUNNING NOARP  MTU:9070  Metric:1
          RX packets:12405 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11130 errors:17 dropped:2 overruns:0 carrier:8
          collisions:0 txqueuelen:1000 
          RX bytes:81966214 (78.1 MiB)  TX bytes:45563644 (43.4 MiB)

# ifconfig xwg10
xwg10     Link encap:Ethernet  HWaddr 02:79:00:0f:cd:12  
          inet addr:10.123.0.250  Bcast:10.123.0.255  Mask:255.255.255.0
          inet6 addr: fe80::79:ff:fe0f:cd12/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9000  Metric:1
          RX packets:12369 errors:0 dropped:0 overruns:0 frame:0
          TX packets:9577 errors:9 dropped:0 overruns:0 carrier:9
          collisions:0 txqueuelen:1000 
          RX bytes:80678848 (76.9 MiB)  TX bytes:44408417 (42.3 MiB)

# ping 10.123.0.1 -s 8972 -M do
PING 10.123.0.1 (10.123.0.1) 8972(9000) bytes of data.
8980 bytes from 10.123.0.1: icmp_seq=1 ttl=64 time=78.7 ms
8980 bytes from 10.123.0.1: icmp_seq=2 ttl=64 time=77.2 ms
8980 bytes from 10.123.0.1: icmp_seq=3 ttl=64 time=82.0 ms
8980 bytes from 10.123.0.1: icmp_seq=4 ttl=64 time=77.5 ms
^C
--- 10.123.0.1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3003ms
rtt min/avg/max/mdev = 77.214/78.881/82.054/1.940 ms

08:39:47.573368 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (0|1440) 710 > 710: UDP, bad length 9102 > 1432
08:39:47.573371 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (1440|1440)
08:39:47.573374 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (2880|1440)
08:39:47.573376 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (4320|1440)
08:39:47.573378 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (5760|1440)
08:39:47.573380 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (7200|1440)
08:39:47.573383 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (8640|470)
08:39:48.575079 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (0|1440) 710 > 710: UDP, bad length 9102 > 1432
08:39:48.575189 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (1440|1440)
08:39:48.575339 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (2880|1440)
08:39:48.575448 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (4320|1440)
08:39:48.575565 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (5760|1440)
08:39:48.575691 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (7200|1440)
08:39:48.575693 IP6 dynamic-2a02-2698-8024-0.tmn.ertelecom.ru > rin.romanrm.net: frag (8640|470)
08:39:48.575828 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (0|1440) 710 > 710: UDP, bad length 9102 > 1432
08:39:48.575831 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (1440|1440)
08:39:48.575833 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (2880|1440)
08:39:48.575834 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (4320|1440)
08:39:48.575837 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (5760|1440)
08:39:48.575838 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (7200|1440)
08:39:48.575840 IP6 rin.romanrm.net > dynamic-2a02-2698-8024-0.tmn.ertelecom.ru: frag (8640|470)

I also briefly tested performance and despite fragmentation having a bad
reputation for some, I don't see much difference in iperf speeds to
the same host vs going directly.

This is now usable to join multiple locations via VXLAN interfaces as members
of L2 bridges to physical 1G/10G networks without hobbling MTU of the latter.

Thanks!

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

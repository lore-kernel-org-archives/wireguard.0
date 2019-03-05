Return-Path: <SRS0=CwyT=RI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF18BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Mar 2019 09:50:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC692082C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Mar 2019 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC692082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66a0dfef;
	Tue, 5 Mar 2019 09:39:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 767b47e9
 for <wireguard@lists.zx2c4.com>; Tue, 5 Mar 2019 09:39:47 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95b3fec8
 for <wireguard@lists.zx2c4.com>; Tue, 5 Mar 2019 09:39:47 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id B271A20394
 for <wireguard@lists.zx2c4.com>; Tue,  5 Mar 2019 09:50:03 +0000 (UTC)
Date: Tue, 5 Mar 2019 14:50:02 +0500
From: Roman Mamedov <rm@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: ifconfig lists IPv6 twice for one WG interface
Message-ID: <20190305145002.06660202@natsu>
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

I'm facing a strange issue where "ifconfig" shows the IPv6 twice for one
particular WG interface. Other similar interfaces on the same machine aren't
affected. Can't pinpoint what's special about this one yet.

The IP is not added twice during interface setup. Adding it once more, as
expected results in

  # ip -6 addr add fd39:aa:3dc2:a78a:7900:fcd:12a3:6181/64 dev wgw
  RTNETLINK answers: File exists

The "ip" tool doesn't list the address twice:

  # ip a l dev wgw
  44: wgw: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1432 qdisc noqueue state UNKNOWN group default qlen 1000
      link/none 
      inet6 fd39:aa:3dc2:a78a:7900:fcd:12a3:6181/64 scope global 
         valid_lft forever preferred_lft forever

But please no comments about "ifconfig" being deprecated, I prefer to keep using
it for certain tasks.

Now adding some debug print to my interface creation script, with:

  ifconfig $IFACE
  ip -6 addr add $MYIP/64 dev $IFACE || exit 1
  ifconfig $IFACE

This results in such output:

  wgw       Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  
            POINTOPOINT NOARP  MTU:1420  Metric:1
            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000 
            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

  wgw       Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  
            inet6 addr: fd39:aa:3dc2:a78a:7900:fcd:12a3:6181/64 Scope:Global
            inet6 addr: fd39:aa:3dc2:a78a:7900:fcd:12a3:6181/64 Scope:Global
            POINTOPOINT NOARP  MTU:1420  Metric:1
            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000 
            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Overall this doesn't seem to break anything, but might be a sign of something not gong
entirely right under the hood. Anyone seen the same thing?

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

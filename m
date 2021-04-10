Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFA9C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 15:28:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B109A611AE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 15:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B109A611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1389c806;
	Sat, 10 Apr 2021 15:27:27 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 63a4d35b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Apr 2021 15:27:25 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 1072F1E3064;
 Sat, 10 Apr 2021 11:27:24 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id E62E81E3063;
 Sat, 10 Apr 2021 11:27:23 -0400 (EDT)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Date: Sat, 10 Apr 2021 10:27:23 -0500
Subject: T-Mobile 4G/5G CGNAT vs WireGuard tunnel jitter
Message-Id: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.17)
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

Greetings,

I have been testing the T-Mobile Home Internet (4G/5G fixed wireless) =
service to a Linode VM via WireGuard.

The TMHI service uses CGNAT plus an additional NAT in their =
modem/gateway with a MTU of 1420, so WireGuard is configured with a 1340 =
MTU.

Everything works, but I thought I would share some jitter results that =
readers here might find interesting.

[gw-lan WGIP:10.4.1.1] -- [TMHI modem/gateway] -- 4G/5G/CGNAT -- [linode =
WGIP:10.4.1.10]

gw-lan ~ # mtr -wn -c 30 -s 1340 10.4.1.10
...
HOST: gw-lan      Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 10.4.1.10  0.0%    30   88.7  88.9  77.2  99.2   5.4

Looks to be as expected, in the direction of the CGNAT, now the other =
direction, against the grain of the CGNAT ...

linode ~ # mtr -wn -c 30 -s 1340 10.4.1.1
...
HOST: linode     Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 10.4.1.1  0.0%    30  206.1 243.5  73.8 393.9  97.9

Huge jitter, and is very reproducible.  But no packet loss.

Further investigation shows for low traffic rates (linode->gw-lan) the =
jitter over WireGuard is huge, here are some UDP iperf3 tests showing =
how the jitter goes down as the traffic rate is increased.

linode ~ # iperf3 -c 10.4.1.1 -u -b 5k -t 30
...
[ ID] Interval           Transfer     Bitrate         Jitter    =
Lost/Total Datagrams
[  5]   0.00-30.25  sec  18.9 KBytes  5.11 Kbits/sec  68.428 ms  0/15 =
(0%)  receiver

linode ~ # iperf3 -c 10.4.1.1 -u -b 10k -t 30
...
[ ID] Interval           Transfer     Bitrate         Jitter    =
Lost/Total Datagrams
[  5]   0.00-30.30  sec  37.7 KBytes  10.2 Kbits/sec  82.411 ms  0/30 =
(0%)  receiver

linode ~ # iperf3 -c 10.4.1.1 -u -b 50k -t 30
...
[ ID] Interval           Transfer     Bitrate         Jitter    =
Lost/Total Datagrams
[  5]   0.00-30.14  sec   184 KBytes  49.9 Kbits/sec  7.532 ms  0/146 =
(0%)  receiver

linode ~ # iperf3 -c 10.4.1.1 -u -b 100k -t 30
...
[ ID] Interval           Transfer     Bitrate         Jitter    =
Lost/Total Datagrams
[  5]   0.00-30.10  sec   367 KBytes   100 Kbits/sec  4.182 ms  0/292 =
(0%)  receiver

linode ~ # iperf3 -c 10.4.1.1 -u -b 500k -t 30
...
[ ID] Interval           Transfer     Bitrate         Jitter    =
Lost/Total Datagrams
[  5]   0.00-30.11  sec  1.79 MBytes   498 Kbits/sec  1.308 ms  0/1456 =
(0%)  receiver


So using VoIP a higher bitrate CODEC is actually better w.r.t jitter.

Hope others find this interesting.

Lonnie


Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE29FC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 19:49:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCD521841
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 19:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="WWaL6br1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCD521841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17cff021;
	Tue, 18 Dec 2018 19:48:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23517d46
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 19:48:46 +0000 (UTC)
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 916fa677
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 19:48:45 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e12so16877534otl.5
 for <wireguard@lists.zx2c4.com>; Tue, 18 Dec 2018 11:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=a6Ja6LBcmCHvw1z17s43/CEwYikX32jIdiZPtf8cBr0=;
 b=WWaL6br1yQvAFGflMq7UAR3An1X9WmSAtv0/666afIYoYMMdKAIc0puAaLnq1ERDj4
 VVhIuw2yfmy1SquOdYKudEgqNqu0PuUoT/wkCnys03fCTkw72rvIrOOMYGte1B/wth8Z
 2TyJCZcCP3lgDRMAmLJy+HTtF5z8bPQO8QgeYQQ6Svz15Y59sgRoY3HxiaoAfzWTmpgu
 QwbM6G5WjpQBdzYhN8FssoP7vChmjhEFSctp98gtcS83Lv1weIewNOq1AyRbEDENdcwN
 M2cEVbyhinlI0p3WU3hFUTjybq5ofI/7k6KIpCYPCiaffNGLGfQAimBgicRflih3a/nY
 AkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a6Ja6LBcmCHvw1z17s43/CEwYikX32jIdiZPtf8cBr0=;
 b=NIFOfTUTcnsQIwQmjOGuPOdA65roVidWC7DwIPXrQvyeIZ2V0EnQmE2jZsnXBnRoSz
 m5Am2fQvbsQ2q5+p/86+tUkYmlwmNLcm4jCCfnW7jSgYSsOLIw5ZdRZu7SuMLHI+U14n
 Fk7wCPAjA2sFHxQnBf7LoEP2YNe/pTBjzYjVGUkmfpBqmx0CzsSjzLw/DKslBTFKmzP4
 QUsDrdoscT3NVlcCPPL4o+mK9U3t6IXViqdjmw3OS8vwDOUNtvU8gjckCJp2RHOzIW09
 F+UVG7LAA3A9Ksglp/x0b9p3/JRSz6dgXzJgQO9SZO1Qkql0Lf0OELHr9vBiOd0ECPIv
 rR3w==
X-Gm-Message-State: AA+aEWYtZKDjN1B+GXx0Rdb0pvUbq2SyfyzA0HOjhfqhCJruzgo5r1M4
 3QJ8J7e8H/GF9020k8ri/tlAXQtDicZx78rWLd4T+1+gHpMLOg==
X-Google-Smtp-Source: AFSGD/WCJ+S/WuqY+fkSJtvpsmiq0ry1V+ghirgWjU3i7T+L5dZ3j9C8hfkhynwrhNwP+0OMADRUjwrnrmpZXfaBVrw=
X-Received: by 2002:a9d:6f95:: with SMTP id h21mr13555386otq.66.1545162554215; 
 Tue, 18 Dec 2018 11:49:14 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Tue, 18 Dec 2018 14:49:03 -0500
Message-ID: <CAO_nJAZG+GtovJG0tCusWD3VrMdV=ZMJ1=OXTTO4DQsChtriVg@mail.gmail.com>
Subject: Syntax for iperf3 to use over pair wireguard interfaces on a LAN?
To: wireguard@lists.zx2c4.com
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

I want to get iperf3 to benchmark a simple wireguard setup on my LAN.
I have two machines, foo is 192.168.1.228 and bar is 192.168.1.112.

These IP addresses are fully functional on their respective eth0
interfaces.  Each one also has a wg0 interface configured as shown
below.  I can get iperf3 to work over the non-wireguard interfaces,
but not over the wireguard interfaces.  What am using iperf3 wrong?
Did I misconfigure wg?

Details:
Here are the /etc/wireguard/wg0.conf files for both machines (I don't
care if the public/private keys are present/this is only a test
environment and it will allow others to simply copy/paste if they want
to test as well):

On foo:
####
[Interface]
Address = 10.0.9.15/24
SaveConfig = true
ListenPort = 500
PrivateKey = kLac+M+JJJ+gpsKo1DeUyfuwfDwGeKMj81+M3Z3mUkw=

[Peer]
PublicKey = y6DrsFVIgqBMc8joSuEytCpQEywk5dPKRoeLZZC9H34=
AllowedIPs = 10.0.9.16/32
####

On bar:
####
[Interface]
Address = 10.0.9.16/24
SaveConfig = true
ListenPort = 500
FwMark = 0xca6c
PrivateKey = 4EwMqSyvLaHrv5JvAAyKnmdbw9UN4rsjydkPXb5ll28=

[Peer]
PublicKey = SkBs9t96znOr+d60tgPlXkp7z6YABvfxD9KNVzZIP3I=
AllowedIPs = 0.0.0.0/0
Endpoint = 192.168.1.228:500
####

Again, both wireguard interfaces are up and connected.  For example, on foo:

# wg
interface: wg0
  public key: SkBs9t96znOr+d60tgPlXkp7z6YABvfxD9KNVzZIP3I=
  private key: (hidden)
  listening port: 500

peer: y6DrsFVIgqBMc8joSuEytCpQEywk5dPKRoeLZZC9H34=
  endpoint: 192.168.1.112:500
  allowed ips: 10.0.9.16/32
  latest handshake: 10 minutes, 41 seconds ago
  transfer: 32.45 KiB received, 8.24 KiB sent

If I run iperf3 in server mode on foo and in client mode on bar, it
works as expected using the non-wireguard interfaces:

On foo:
% iperf3 -s -B 192.168.1.228
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------
Accepted connection from 192.168.1.112, port 58575
[  5] local 192.168.1.228 port 5201 connected to 192.168.1.112 port 46261
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   107 MBytes   900 Mbits/sec
[  5]   1.00-2.00   sec   112 MBytes   939 Mbits/sec
[  5]   2.00-3.00   sec   112 MBytes   940 Mbits/sec
[  5]   3.00-4.00   sec   112 MBytes   938 Mbits/sec
[  5]   4.00-5.00   sec   112 MBytes   940 Mbits/sec
[  5]   4.00-5.00   sec   112 MBytes   940 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-5.00   sec   596 MBytes  1.00 Gbits/sec                  receiver
iperf3: the client has terminated

On bar:
% iperf3 -c 192.168.1.228 -B 192.168.1.112
Connecting to host 192.168.1.228, port 5201
[  5] local 192.168.1.112 port 46261 connected to 192.168.1.228 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   950 Mbits/sec    0    281 KBytes
[  5]   1.00-2.00   sec   112 MBytes   939 Mbits/sec    0    296 KBytes
[  5]   2.00-3.00   sec   112 MBytes   938 Mbits/sec    0    296 KBytes
[  5]   3.00-4.00   sec   112 MBytes   938 Mbits/sec    0    296 KBytes
[  5]   4.00-5.00   sec   112 MBytes   944 Mbits/sec    0    308 KBytes
^C[  5]   5.00-5.33   sec  36.7 MBytes   939 Mbits/sec    0    308 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-5.33   sec   598 MBytes   942 Mbits/sec    0             sender
[  5]   0.00-5.33   sec  0.00 Bytes  0.00 bits/sec                  receiver
iperf3: interrupt - the client has terminated

When I try using the IP addresses of the respective wireguard
interfaces, I get nothing:

On foo:
% iperf3 -s -B 10.0.9.15
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------

On bar:
% iperf3 -c 10.0.9.15 -B 10.0.9.16
iperf3: error - unable to connect to server: Connection timed outa
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: <SRS0=QOBX=DC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0B2C47420
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Sep 2020 11:42:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A972083B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Sep 2020 11:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IeyQJ5Vy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A972083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfc24df1;
	Fri, 25 Sep 2020 11:10:57 +0000 (UTC)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3af8dd4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Sep 2020 10:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Mime-Version:Subject:Message-Id:Date; bh=/HAfP
 Xk4fitACs5Qs3QUwn1qVF3F23xkjkoYrHdDSVo=; b=IeyQJ5VyfubDevaV13UNT
 pOrbKJLu4haRtznFK84mDfyspvHyN5EXHaGlMBIgKF4Lw6s70pktA4jNHbfmDbF6
 G32ZmPwLwqrmLGcvRXznIxpFTq8HMRbbsyalA+Ggnkns3FI7gc/1IS6H/ABXJg5t
 AjRGkJUKQOe0z4mMCZSaJA=
Received: from [192.168.3.7] (unknown [120.244.142.50])
 by smtp12 (Coremail) with SMTP id EMCowAC312PsI2tf3LrkCQ--.33794S3;
 Wed, 23 Sep 2020 18:31:09 +0800 (CST)
From: bupt008 <bupt008@163.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Windows Wireguard client stop working when rebooting
Message-Id: <2A861943-6008-4774-A342-DF5B5C2B93C3@163.com>
Date: Wed, 23 Sep 2020 18:31:08 +0800
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-CM-TRANSID: EMCowAC312PsI2tf3LrkCQ--.33794S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxKrWkJw47KrWDJr1xAFWDArb_yoWfAw1Dp3
 W5tan8CrWktryUtFsFvr1S9as8A3WxKFW7C3WkAF17XFn09F1jk34Sgr1fAFyqvw1fK34a
 vF1kCr15WFWDuaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU2-nUUUUU=
X-Originating-IP: [120.244.142.50]
X-CM-SenderInfo: hexs3iiqy6il2tof0z/xtbByxiouFPAO+9n7wAAsM
X-Mailman-Approved-At: Fri, 25 Sep 2020 13:10:56 +0200
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

Hi, guys.

I have met a problem when using wireguard client on windows 10.=20

My Wireguard is installed on Windows 10 professional 64-bit  OS Version: =
19041.450 version:2004

Autorun wireguard when the system reboot, I found the wiregurad stop =
working=20

I use wireguard.exe /installtunnelservice c:\vpn.conf command to autorun =
wireguard. And it looks  wireguard.exe /installtunnelservice does not =
work every time.

I want to know whether this is a known bug?

 After rebooting, the logs show below:
 2020-09-23 12:42:18.251748: [MGR] Exited UI process for user =
'redpill@DESKTOP-1GGH8U7' for session 1 with status 40010004
2020-09-23 12:43:51.339939: [MGR] Starting WireGuard/0.1.1 (Windows =
10.0.19041; amd64)
2020-09-23 12:43:51.347939: [MGR] Starting UI process for user =
=E2=80=98redpill@DESKTOP-1GGH8U7=E2=80=99 for session 1
2020-09-23 12:43:51.360940: [TUN] [vpn] Starting WireGuard/0.1.1 =
(Windows 10.0.19041; amd64)
2020-09-23 12:43:51.361940: [TUN] [vpn] Watching network interfaces
2020-09-23 12:43:51.363941: [TUN] [vpn] Resolving DNS names
2020-09-23 12:43:51.379940: [TUN] [vpn] Host not found when resolving =
vpn.entropage.com, but no Internet connection available, sleeping for 4 =
seconds
2020-09-23 12:43:51.388941: [MGR] Update checker: Get =
"https://download.wireguard.com/windows-client/latest.sig": dial tcp: =
lookup download.wireguard.com: no such host
2020-09-23 12:43:55.381735: [TUN] [vpn] Host not found when resolving =
vpn.entropage.com, but no Internet connection available, sleeping for 4 =
seconds
2020-09-23 12:43:59.402536: [TUN] [vpn] Creating Wintun interface
2020-09-23 12:43:59.614899: [TUN] [vpn] Using Wintun/0.8 (NDIS 6.83)
2020-09-23 12:43:59.614899: [TUN] [vpn] Enabling firewall rules
2020-09-23 12:43:59.620257: [TUN] [vpn] Dropping privileges
2020-09-23 12:43:59.621295: [TUN] [vpn] Creating interface instance
2020-09-23 12:43:59.622296: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.622296: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.622296: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.622296: [TUN] [vpn] Routine: event worker - started
2020-09-23 12:43:59.622877: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.623295: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.623295: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.623295: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.623295: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.624294: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.624294: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.624294: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.625302: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.625302: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.625302: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.626305: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.626305: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.626305: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.626305: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.627294: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.627294: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.627294: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.627294: [TUN] [vpn] Routine: encryption worker - =
started
2020-09-23 12:43:59.627294: [TUN] [vpn] Routine: handshake worker - =
started
2020-09-23 12:43:59.628294: [TUN] [vpn] Routine: decryption worker - =
started
2020-09-23 12:43:59.628294: [TUN] [vpn] Routine: TUN reader - started
2020-09-23 12:43:59.629294: [TUN] [vpn] Setting interface configuration
2020-09-23 12:43:59.629294: [TUN] [vpn] UAPI: Updating private key
2020-09-23 12:43:59.629294: [TUN] [vpn] UAPI: Removing all peers
2020-09-23 12:43:59.630294: [TUN] [vpn] UAPI: Transition to peer =
configuration
2020-09-23 12:43:59.630294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - UAPI: =
Created
2020-09-23 12:43:59.630294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - UAPI: =
Updating endpoint
2020-09-23 12:43:59.630294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - UAPI: =
Updating persistent keepalive interval
2020-09-23 12:43:59.630294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - UAPI: =
Removing all allowedips
2020-09-23 12:43:59.631294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - UAPI: =
Adding allowedip
2020-09-23 12:43:59.631294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - UAPI: =
Adding allowedip
2020-09-23 12:43:59.631294: [TUN] [vpn] Bringing peers up
2020-09-23 12:43:59.631294: [TUN] [vpn] Routine: receive incoming IPv6 - =
started
2020-09-23 12:43:59.631294: [TUN] [vpn] Routine: receive incoming IPv4 - =
started
2020-09-23 12:43:59.631294: [TUN] [vpn] UDP bind has been updated
2020-09-23 12:43:59.631294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Starting...
2020-09-23 12:43:59.632294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Routine: sequential receiver - started
2020-09-23 12:43:59.632294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Routine: nonce worker - started
2020-09-23 12:43:59.632294: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Routine: sequential sender - started
2020-09-23 12:43:59.632294: [TUN] [vpn] Listening for UAPI requests
2020-09-23 12:43:59.632294: [TUN] [vpn] Startup complete
2020-09-23 12:44:02.484247: [TUN] [vpn] Monitoring default v4 routes
2020-09-23 12:44:02.487245: [TUN] [vpn] Binding v4 socket to interface =
12 (blackhole=3Dfalse)
2020-09-23 12:44:02.497958: [TUN] [vpn] Setting device v4 addresses
2020-09-23 12:44:02.666057: [TUN] [vpn] Monitoring default v6 routes
2020-09-23 12:44:02.666057: [TUN] [vpn] Binding v6 socket to interface 0 =
(blackhole=3Dfalse)
2020-09-23 12:44:02.666057: [TUN] [vpn] Setting device v6 addresses
2020-09-23 12:44:15.059918: [TUN] [vpn] Device closing
2020-09-23 12:44:15.059918: [TUN] [vpn] Routine: TUN reader - stopped
2020-09-23 12:44:15.209921: [TUN] [vpn] Routine: event worker - stopped
2020-09-23 12:44:15.209921: [TUN] [vpn] Routine: receive incoming IPv4 - =
stopped
2020-09-23 12:44:15.209921: [TUN] [vpn] Routine: receive incoming IPv6 - =
stopped
2020-09-23 12:44:15.209921: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.209921: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Stopping...
2020-09-23 12:44:15.210919: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Routine: sequential receiver - stopped
2020-09-23 12:44:15.210919: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Routine: sequential sender - stopped
2020-09-23 12:44:15.210919: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.210919: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.210919: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.210919: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.211917: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.211917: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.211917: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.211917: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.211917: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.212918: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.212918: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.212918: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.212918: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.212918: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.212918: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.213918: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.213918: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.213918: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.213918: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.213918: [TUN] [vpn] Routine: encryption worker - =
stopped
2020-09-23 12:44:15.214918: [TUN] [vpn] Routine: handshake worker - =
stopped
2020-09-23 12:44:15.214918: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.214918: [TUN] [vpn] Routine: decryption worker - =
stopped
2020-09-23 12:44:15.214918: [TUN] [vpn] peer(rv/k=E2=80=A664Ws) - =
Routine: nonce worker - stopped
2020-09-23 12:44:15.214918: [TUN] [vpn] Interface closed
2020-09-23 12:44:15.215918: [TUN] [vpn] Shutting down=


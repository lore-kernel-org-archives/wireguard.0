Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B03C2D0F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:30:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A12C720732
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A12C720732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ertel-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f51d455e;
	Tue, 31 Mar 2020 03:22:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f824d675
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 14:30:22 +0000 (UTC)
Received: from SK-DEV-004.localdomain ([92.117.227.233]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M4bA6-1jJTW43KBa-001hH9; Mon, 30 Mar 2020 16:38:14 +0200
From: sven-dev@ertel-net.de
To: wireguard@lists.zx2c4.com
Cc: Sven Ertel <sven-dev@ertel-net.de>
Subject: [PATCH]  Prefer IPv6 in DNSResolver
Date: Mon, 30 Mar 2020 16:38:02 +0200
Message-Id: <20200330143802.4607-1-sven-dev@ertel-net.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:vHX9acdzMfQHaqp5dCwYHxn7EjnVTPAAcV2QyqvS7t8hEuLEsC2
 EWe7L1E+gwl2aptVLS9xKMrmPsDmOWVPGsGAksbmaXi37XAZ1VQa/e0nv7vmEMPvnDeh7cJ
 Am6pE6TEee8wwI/OoKPo42MjPdsz0asCM7K2EPs4qeRjOKC6EA40m+8lwBh/u68WXfhX6Uu
 NkVlmHyA0uO5DpU3ZLn5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K9xwtuCQ79A=:OWpCpj95BdZAKis8e65pvS
 muWUuQI1cZqcqdXRmsm0Z9kJoeLb3rL1ROGjHI76dTMu1TNkyp+vIuMQ+uClk6Y1+UXuC77bl
 kPOcC0H85i+1SpNY+kMJZS02WSmLs961OKgwALGMTTDrYdBQVOth0WGG2PYbe1tXPsTS7fDZG
 ePFSAiIM8rDA8/0U5eeEhNAUJmNZTNAKLt0DEw/0CyMF/i99Rv9aBMdXhTpu6ET91N3TTvo6n
 UzjjCFqbaWl+0zEn7Oi6kMRXboCd9QfXAYzM9M/Ty/sbMIRLNwxyWcL5BEi5+CFn9mTD6MCsc
 tn2Wo/1vJ7gLl2jK4ja2ZNQHKMGApkJI+38Uh/SkcMPbPD2xYLY3FqlbQKE3idyKIS6maU79j
 +43BjZSBlcreFNG8ZY/9tFz06ZLUtkto7OFG9TZ01VjBf31EAOZnYZjMHRVv3shECHLuu2K5A
 1h39gUmbLtgse0m+YRkf6JmcdPhCFQ5D9wXoozd+5PGlQCc0HHJN9d5xrjXWV/8t+CF/Iyg2l
 kTjn5PNkmHc0ySS4aX0xfay4YFsasOnsZVPwsejuf0kYIGCjFAeCZUH/W74u7cQHnyP3aY5kt
 FQoPvtdI9nxvdZhCuisZs6tICsUoKgPJlqbVk0tc6tCjBdys8cHQ/7B+CEX2yHI7kwkLZR/NP
 umGumq55DlrkcWxB+6rVoMRit4oy6GPxN09VyAGTiYjE8+IWaDJ9zxzc+HBYUMRwnOWmoKuDs
 1ZmnC9bNAhwJzxTsyi9P+98mrv5THcDwgFtKMs/Fl+6LeogS0UM9inegN7YKj9qo40l8mRerw
 kTB/+GYVSbt86HL8jubHxTZui3A+dhQwxc1znByt7VTyS8m3vy8t8kxnf2UD8b4gf31adjp
X-Mailman-Approved-At: Tue, 31 Mar 2020 05:22:32 +0200
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

From: Sven Ertel <sven-dev@ertel-net.de>

Hi all,

WireGuard is great! So is IPv6, but I've the feeling that IPv6 is a little bit
neglected in here and I want to help to improve that.

Attached a patch to prefer IPv6 over IPv4 in the Apple client.

This is my first patch, so please be kind ;)

Best regards

Sven

...

Change DNSResolver to prefer IPv6 addresses over IPv4 addresses.
---
 .../WireGuardNetworkExtension/DNSResolver.swift      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/WireGuard/WireGuardNetworkExtension/DNSResolver.swift b/WireGuard/WireGuardNetworkExtension/DNSResolver.swift
index cdb9665..48afea6 100644
--- a/WireGuard/WireGuardNetworkExtension/DNSResolver.swift
+++ b/WireGuard/WireGuardNetworkExtension/DNSResolver.swift
@@ -82,20 +82,20 @@ class DNSResolver {
                 if result.ai_family == AF_INET && result.ai_addrlen == MemoryLayout<sockaddr_in>.size {
                     var sa4 = UnsafeRawPointer(result.ai_addr)!.assumingMemoryBound(to: sockaddr_in.self).pointee
                     ipv4Address = IPv4Address(Data(bytes: &sa4.sin_addr, count: MemoryLayout<in_addr>.size))
-                    break // If we found an IPv4 address, we can stop
+                    continue // If we found an IPv4 address, continue looking for an IPv6 address
                 } else if result.ai_family == AF_INET6 && result.ai_addrlen == MemoryLayout<sockaddr_in6>.size {
                     var sa6 = UnsafeRawPointer(result.ai_addr)!.assumingMemoryBound(to: sockaddr_in6.self).pointee
                     ipv6Address = IPv6Address(Data(bytes: &sa6.sin6_addr, count: MemoryLayout<in6_addr>.size))
-                    continue // If we already have an IPv6 address, we can skip this one
+                    break // If we found an IPv6 address, we can stop
                 }
             }
             freeaddrinfo(resultPointer)
 
-            // We prefer an IPv4 address over an IPv6 address
-            if let ipv4Address = ipv4Address {
-                return Endpoint(host: .ipv4(ipv4Address), port: endpoint.port)
-            } else if let ipv6Address = ipv6Address {
+            // We prefer an IPv6 address over an IPv4 address
+            if let ipv6Address = ipv6Address {
                 return Endpoint(host: .ipv6(ipv6Address), port: endpoint.port)
+            } else if let ipv4Address = ipv4Address {
+                return Endpoint(host: .ipv4(ipv4Address), port: endpoint.port)
             } else {
                 return nil
             }
-- 
2.17.1


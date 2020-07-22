Return-Path: <SRS0=9eeE=BB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B98FC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jul 2020 22:20:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60C820825
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jul 2020 22:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=coppint.com header.i=@coppint.com header.b="Z1gQMp/M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60C820825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coppint.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0333368b;
	Wed, 22 Jul 2020 21:57:08 +0000 (UTC)
Received: from mail01.coppint.com (mail01.coppint.com [212.129.15.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bad63942
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 21:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.coppint.com (Mail server) with ESMTP id F0A00BFA82
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jul 2020 00:19:47 +0200 (CEST)
X-Virus-Scanned: mail01.coppint.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coppint.com; s=dkim;
 t=1595456383; bh=VUP3YDlInNrEbNfh+JWPAsTKtU+/e7bKG+esTjnGYsQ=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:
 Content-Transfer-Encoding;
 b=Z1gQMp/MdXpCPJA4ucf60vA4yF0KXvuK0ssD6iaQ0H9X3EMIkk1IKtUqgnqLK/4DI
 AcfPtjvU90Rb4dNuDJYKFOu0UtcmozVO1TSFfMJD3uyUXKMRi+S5lhEsy1hJQGJC9i
 jgyS4bEPR04UiHv5oIqZWkYtWFg/M/InPiHvV8CQBoJ6Ub+uptl6KKO2ST2wEOvCaw
 dkwTs5IB8/KVPQJTUlOFr4oVeDjNzAmYb1CqU4CVqEsPEuq6PjtfV86+T0fq8nubMP
 AwmbLc1fl1NaYJatqsS5OuYWGUJDBCX8JnEaQnfUUzPwwMttEsoq4yZZJpnP+5ulBi
 wwcaZccA8KWWw==
To: wireguard@lists.zx2c4.com
From: "Florent B." <florent@coppint.com>
Subject: Build fails on Proxmox
Message-ID: <e8277a70-7376-1760-b537-78f7f9a748d5@coppint.com>
Date: Thu, 23 Jul 2020 00:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi,

I try to install Wireguard on Proxmox servers 5.4 (Debian Stretch),
running kernel 4.15.18-58 (pve-kernel-4.15.18-30-pve).

I use Wireguard DKMS from buster-backports, version 1.0.20200712.

Build fails on :

    /var/lib/dkms/wireguard/1.0.20200712/build/socket.c: In function
'send6':
    /var/lib/dkms/wireguard/1.0.20200712/build/socket.c:139:18: error:
'const struct ipv6_stub' has no member named 'ipv6_dst_lookup'; did you
mean       'ipv6_dst_lookup_flow'?
   dst = ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                  ^~
    scripts/Makefile.build:322: recipe for target
'/var/lib/dkms/wireguard/1.0.20200712/build/socket.o' failed


How can I build Wireguard on this platform ?

Thank you.

Florent


Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE632C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0349420674
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0349420674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=al2klimov.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d0b6d7a;
	Tue, 10 Nov 2020 12:59:00 +0000 (UTC)
Received: from smtp.al2klimov.de (smtp.al2klimov.de [2a01:4f8:c0c:1465::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b7bc5814
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Oct 2020 14:35:54 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 253C75DE45
 for <wireguard@lists.zx2c4.com>; Sat, 31 Oct 2020 14:38:16 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: MacOS: DNS setting has no effect if the tunnel is not the default gw
Message-ID: <9f61c27c-3cae-3283-30e0-ce99fe73a305@al2klimov.de>
Date: Sat, 31 Oct 2020 15:38:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

Hello there!

I have two almost identical tunnels. The only difference:

-AllowedIPs=0.0.0.0/0, ::/0
+AllowedIPs=192.168.234.153/32, 64:ff9b::192.168.234.153/128, 
192.168.234.186/32, 64:ff9b::192.168.234.186/128

The first one's setting DNS=192.168.234.153 has an effect, the second 
one's not.

Has anyone seen this problem, too?
Does anyone even know how to workaround it?

Best,
AK

Return-Path: <SRS0=6TfW=GY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E84DC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:40:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517A723877
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517A723877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=afaics.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feca6523;
	Thu, 21 Jan 2021 13:40:48 +0000 (UTC)
Received: from outgoing.selfhost.de (outgoing.selfhost.de [82.98.87.70])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58a74130
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Jan 2021 10:36:47 +0000 (UTC)
Received: (qmail 13431 invoked from network); 17 Jan 2021 10:36:47 -0000
Received: from unknown (HELO mailhost.afaics.de)
 (postmaster@xqrsonfo.mail.selfhost.de@87.160.250.197)
 by mailout.selfhost.de with ESMTPA; 17 Jan 2021 10:36:47 -0000
Received: from cecil.afaics.de (cecil.afaics.de [10.42.100.186])
 by mailhost.afaics.de (OpenSMTPD) with ESMTP id 2878b8f6;
 Sun, 17 Jan 2021 10:36:42 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Harald Dunkel <harri@afaics.de>
Subject: mtu on Linux vs MacOS
Message-ID: <eadf405d-1039-06e7-744a-d2207ded2150@afaics.de>
Date: Sun, 17 Jan 2021 11:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Jan 2021 00:19:16 +0000
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

Hi folks,

I am using PPPoE to connect to my IP provider. To use wireguard on Linux I
have to reduce the MTU in wg0.conf to 1400. Using the default 1420 a ssh
connection tunneled through wireguard gets stuck (reproducible). An echo
of a very long line (e.g. 4096 chars) is sufficient.

The weird part is, MTU 1420 works fine for wireguard on MacOS. How comes
that Wireguard appears to be more stable on MacOS than on Linux?

Peer is OpenBSD 6.8.


Regards
Harri

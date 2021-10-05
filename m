Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD911C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 23:35:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D281A61381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 23:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D281A61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=moenia.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4e801de;
	Thu, 7 Oct 2021 23:35:52 +0000 (UTC)
Received: from smtp.is-kassel.org (eremit.is-kassel.org [46.182.18.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2d02da0
 for <wireguard@lists.zx2c4.com>; Tue, 5 Oct 2021 08:40:25 +0000 (UTC)
Received: from dynamic-077-006-024-045.77.6.pool.telefonica.de by
 smtp.is-kassel.org (SendMail 8.13.4/1.6.0) 
 with ESMTP  TLSv1/SSLv3 id 1958iFV3031587 for <wireguard@lists.zx2c4.com>;
 Tue, 5 Oct 2021 10:44:16 +0200
X-Authenticated: authenticated by smtp.is-kassel.org:
 jb@dynamic-077-006-024-045.77.6.pool.telefonica.de;
 Tue, 5 Oct 2021 10:44:16 +0200
From: uxDWzco-wg@moenia.de
Subject: performance: multiple clients on one interface?
To: wireguard@lists.zx2c4.com
Message-ID: <a208c85e-4835-cb77-003c-a040544ec968@moenia.de>
Date: Tue, 5 Oct 2021 10:39:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 07 Oct 2021 23:35:48 +0000
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

hi,

after have various tests run with 1:1 connections we want to expand it
to multiple connects to one system (linux-based).

due the limitations at least in linux wireguard-IFs can't be part of a
bridge-IF, but if we handle all connections with only one
wireguard-interface, we have to use a single udp-port for all connections...

using same port for all connections means, that for receiving encrypted
packets every configured key must be tried, until the right one is
found, or is this wrong?

so: how many connections are reasonable for a single device, without
running in to trouble due to the time trying all the keys?

or is there some internal optimization after have found a match by
filtering possible keys by src-addr/port, so the complete search is only
done at first connection-try?

it would be very helpful, to get some information on it here.

regards

j.

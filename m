Return-Path: <SRS0=+2x1=QC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7134EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Nov 2021 15:42:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4174C61B5E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Nov 2021 15:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4174C61B5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=at.anteris.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 906767b3;
	Mon, 15 Nov 2021 15:42:09 +0000 (UTC)
Received: from brahe.magma-soft.at (brahe.magma-soft.at [46.4.26.84])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3e30b01
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Nov 2021 07:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
 d=magma-soft.at; s=default; h=To:From:Subject:Message-ID:Date:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-Language; bh=t0LgSOyDWFqwc8058roSvZIymmE=; b=GS0g2gAb/qp
 qY2eUd3vVyzzGG6ouqpDaVHeo50hdWMpkWwqUvF2OApwgqfoV1lAbNqVA3ke5QRz
 McqlVk97HMrn9WUvcQXLv5pea1aqFRsGA5xFffppsa7lWJO25Kodb8Jz0Sh5QSRA
 FnxkRNsdpeG2Iu75TbltOngu4njX5JMA=
Received: (qmail 12265 invoked from network); 12 Nov 2021 07:14:48 -0000
Received: from unknown (HELO [172.30.1.86])
 (jorge@at.anteris.net@[83.164.143.62])
 (envelope-sender <jorge-wg@at.anteris.net>)
 by brahe.magma-soft.at (qmail-ldap-1.03) with TLS_AES_128_GCM_SHA256 encrypted
 SMTP for <wireguard@lists.zx2c4.com>; 12 Nov 2021 07:14:48 -0000
To: wireguard@lists.zx2c4.com
From: Georg Lehner <jorge-wg@at.anteris.net>
Subject: Wireguard setup tool
Message-ID: <37ef73aa-4244-9ee7-e2b8-d1738a8d3e78@at.anteris.net>
Date: Fri, 12 Nov 2021 08:14:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 15 Nov 2021 15:42:07 +0000
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

Hello,

Thank's for Wireguard, way cool!

I'd like to share a setup tool I'm using:

   https://at.magma-soft.at/darcs/wgsetup/

You'll find wgsetup, a shell script, and a README.md file there.

wgsetup fetches configuration information for a peer via https:// from a 
.well-known location.

A node using wgsetup can only "see" configuration information for peers 
in the same "realm". A realm shares a common secret which has to be 
distributed out-of-band.

When wgsetup sets up a connection to a peer it prints out shell 
executable peer configuration instructions for the case when the node is 
not reachable via https://, e.g. because they hide behind a NAT.

Connections are always configured with pre shared keys, which are never 
disclosed by wgsetup.

wgsetup requires a POSIX shell, gpg, some tools of the Gnu Coreutils and 
curl.  Current use is on Debian Linux, I'll be happy to receive feedback 
and adapt it to other environments.

Best Regards,

   Georg



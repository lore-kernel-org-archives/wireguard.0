Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B44DEE49AA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 20:28:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7281d0f2;
	Sat, 19 Aug 2023 20:14:16 +0000 (UTC)
Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a54158e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Aug 2023 16:27:38 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
 by w4.tutanota.de (Postfix) with ESMTP id 02A15106030B
 for <wireguard@lists.zx2c4.com>; Mon, 14 Aug 2023 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692030457; 
 s=s1; d=diyaa.ca;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=cgsrJTi+YOhiGFBA2CKe5lax0I8WbUOka8k0Jc1mkEA=;
 b=Dy9bgWOmuOLqaePWOlLU8V/gHOU0JZMSs52TEgynTA0bgMTXZfyzBWVMmy2rJHVf
 QlMuMcP0g9dLGryFeytTCMts1iqitlYpTS30jP4MetQVVcNlz6wN3CNEFQbLEVR7PFx
 4PRIz5jDAxMzfBFzy47+QKZIRmOI3tC1ctAxufJA7XaCsiyMbzeihA0I2T6G6jmEpJV
 7p88XgTfX/G6tf1z9t1fFe3Fi31CWN4RsTnjD6vc19Go3KKX8+8Cj2jypI9tajuSXIz
 Yhn8I43C2gHySOiPhCGjXenmbKxp5Km4P7BZ5W07ScNoDeECuji/yFwA9ZVk3oCbIFm
 Ab/7o/aATw==
Date: Mon, 14 Aug 2023 18:27:37 +0200 (CEST)
From: Diyaa Alkanakre <diyaa@diyaa.ca>
To: Wireguard <wireguard@lists.zx2c4.com>
Message-ID: <NborxNu--3-9@diyaa.ca>
Subject: Wireguard Dynamic ARP entries
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 19 Aug 2023 20:14:11 +0000
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

Hello everyone,

I am seeing lots of ARP dynamic entries on Windows when typing "arp -a" on the command line on windows. I am wondering if that is a normal behavior? when I set a wireguard peer with a default route "0.0.0.0/0, ::/0" I end up spending about 2 minutes to get to the bottom of the CLI when I type "arp -a".

I am just wondering if that is a normal behavior? why is this happening??

Thank you in advance,

Diyaa

Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E07BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 23:30:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295B4207A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 23:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295B4207A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rootdir.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdc661c5;
	Mon, 11 Jan 2021 23:30:50 +0000 (UTC)
Received: from cube.ra-langbehn.de (cube.ra-langbehn.de [185.162.251.73])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b79580ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 16:34:54 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Claas Langbehn <claas@rootdir.de>
Subject: Wireguard roaming - ARP?
Message-ID: <9a55e4b8-39eb-9705-5775-1aa3d5663ca6@rootdir.de>
Date: Mon, 11 Jan 2021 17:34:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at cube
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 11 Jan 2021 23:30:49 +0000
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


my wireguard setup is a triangle setup with
PEER A = fixed IPv4/IPv6 addresses
PEER B + PEER C = dial-up with dynamically changing IPv6-addresses.
To initially start the link between B and C it is neccessary to tell one 
of them the others endpoint address. I do that manually, because it does 
not make any sense with the dynamic addresses.
With the keep-alive option the wireguard vpn survives more that 99%, but 
now I had a case where it failed:
B had a power loss at night (90 mins) and after the return of the power 
it did not know the endpoint of C any more. So it cound not send packets 
to C.
C could not send packets to B any more, because the endpoint addresses 
also changed due to the power loss (the CPE had a power loss too).
This is why the link between B and C stopped working (could not be 
recovered).

I could start using dyndns to solve this, but since I am using a 
triangle setup: Would'nt it be nice if there would be some kind of ARP 
between the clients? A always knows the vaild peer endpoint addresses of 
my VPN. B/C could ask A about each others endpoint address. What do you 
think? Would this be a nice feature?



Many regards
Claas

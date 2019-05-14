Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2B1C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 09:02:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0687A20862
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 09:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="ZjHURfjq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0687A20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2774fcd3;
	Tue, 14 May 2019 09:02:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5316f0a2
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 09:02:46 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d594a74f
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=NlCFyKr5p/wD+eflKh83pI4sYHxsok438HrQAJmNWvo=; b=ZjHURfjqQ2tn3isG2nAY+KXozk
 Y5PHQv1yngOIhheJNIKIPWBYZVxrzHnFL40G18h5a2Wdezx2bNmI8pV7Dagh9CLwPStxdmAKU5ch4
 xpxL+svNyY2tmpivXA8M3u4goDW6y88bLQ6rbmBOEeGLvvxCbpMaot2aJAGttTucYj9IOebXtIATu
 76FRdMMTm6wHNHFKJETNDhTmJwcQHL7YFSgEmbwVafZC2iZleu4XB+I8iPIOQYuftF9mXOTD565f9
 /Bqcv8lGkX8C6/GA9Fty6/NEqJJLLe5L87XcFd7MdT13plspsEq7zGDMpSLoUW8lNJQ5Y/Np1ueXq
 2PuNoaazn6CE+vIQdHixuKYK1IfpZiXPcl1OESBsR8aKUIqSsNQomeeXOegUpnO+g3BSWTeQNuHXN
 AZffsRpKDL4X5s4rFB37JDalTpaXvh2tigV6Lr1c70XEq1y3oTMQJ8L9ZVtCLv1Cq9JI46IZq/LIq
 dSie+GVIn+/nPPF4aiQoOPE6CwTNcYb6pl1HPEfJOKubPKcnhwqVdnjyBZN0kGNvQkGApVxVe987U
 QVij1UspoRIX4K7e7JjYrcWntmhh3hKMJ16rHXvZ2KhNHrl1sES5kSRHB//X67gpDqoj8XuilQPlu
 TJcjdwRyJq+Dw4zrPbNIw3fD+ufCmgeCee1o+znhI=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1hQTKa-0007Kq-4q
 with ESMTPSA (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 for wireguard@lists.zx2c4.com; Tue, 14 May 2019 11:02:43 +0200
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: wg-quick: Add ORCHIDv2 address for in-band management
Message-ID: <58b72a97-4de6-0f2e-8323-6dcb86bc51e1@bartschnet.de>
Date: Tue, 14 May 2019 11:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: de-DE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I suggest to extend wg-quick with functions to add an ORCHIDv2 address derived from the public key
for in-band managment purposes (e.g. DHCPv6 relays, peer list exchange, ...).

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

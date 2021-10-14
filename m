Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3D9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 15:34:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F8660ED4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 15:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3F8660ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kracon.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6556aee5;
	Thu, 14 Oct 2021 15:34:37 +0000 (UTC)
Received: from mailgw1.kracon.dk (mailgw1.kracon.dk [185.38.24.9])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c73de2a4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 08:31:13 +0000 (UTC)
Received: from mail.kracon.dk (mail.kracon.dk [185.38.24.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailgw1.kracon.dk (Postfix) with ESMTPS id 9FC7D24129
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 10:31:12 +0200 (CEST)
Received: (qmail 22948 invoked from network); 14 Oct 2021 08:30:30 -0000
Received: from unknown (HELO ?192.168.44.112?) (sk@77.243.47.130)
 by 192.168.3.2 with ESMTPA; 14 Oct 2021 08:30:30 -0000
Message-ID: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
Date: Thu, 14 Oct 2021 10:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: wireguard@lists.zx2c4.com
Content-Language: en-GB
From: Svenne Krap <svenne@kracon.dk>
Subject: Source IP for multihomed peer
Organization: Kracon ApS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:34:33 +0000
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

I have it a problem, that seems like the following is happening.


BoxA has multiple ip-addresses with different internet providers (i.e. 
multihomed)

BoxB is a normal single-homed dynamic peer (i.e. no fixed address), as 
is BoxC.

BoxB  and boxC both have hardcoded address1 ('boxA1')  as its peer


What seems to happen is:

1) BoxB writes sends to BoxA1  (address 1)

2) BoxA responds with BoxA2  (address 2)

3) BoxB disregards the traffic.


BoxC contacts boxA on BoxA1 and due to routing (due to BoxC's network) 
it gets replies with the right address ('boxA1'), and everything works 
as expected.



My question is twofold:

1) Does the above seem like a likely chain of events?

2) Is there any way to force the source ip of the connection from boxA 
to always use address boxA1 ?

 From the documentation Listenport only seems like the portnumber and 
there seems to be no way to set the source ip.


Regards


Svenne


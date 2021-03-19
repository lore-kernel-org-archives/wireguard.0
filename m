Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F672C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:24:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923C861974
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923C861974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=harz.behrens.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 669e884e;
	Fri, 19 Mar 2021 17:22:48 +0000 (UTC)
Received: from post.behrens.de (post.behrens.de [2a01:170:1023::1:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99f0fb59
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 16:57:03 +0000 (UTC)
Received: from [IPv6:2a01:170:1023:0:c89e:2273:4fc4:580]
 ([IPv6:2a01:170:1023:0:c89e:2273:4fc4:580]) (authenticated bits=0)
 by post.behrens.de (8.16.1/8.16.1) with ESMTPSA(MSP) id 12JGv1j3084738
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO cn=)
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 17:57:01 +0100 (CET)
 (envelope-from frank@harz.behrens.de)
From: Frank Behrens <frank@harz.behrens.de>
Subject: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
Date: Fri, 19 Mar 2021 17:57:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 19 Mar 2021 17:22:46 +0000
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

Hello Jason, hello community,

although I regret the recent removal of FreeBSD kernel driver I can live 
with the present development model.

With the current sources in the external repository I could create a 
working VPN for the first time with my Android phone. It works well, 
thanks to all contributors. The setup was done only with ifconfig(8), I 
have the now removed parts still in place. :-)

For my setup I needed a different route for the encapsulated packets and 
so I implemented the missing parts. With this message I give that part 
to the community (matching the existing BSD-2-Clause-FreeBSD license).
For the sake of simplicity I created an own branch on github, the commit 
is 
https://github.com/frbehrens/wireguard-freebsd/commit/f0445be7b5b30a98da11bf2e209739a2155a59bb 
or use for direct patch download:
https://github.com/frbehrens/wireguard-freebsd/commit/f0445be7b5b30a98da11bf2e209739a2155a59bb.patch

Kind regards,
     Frank

-- 
Frank Behrens
Osterwieck, Germany


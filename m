Return-Path: <SRS0=bSPH=AF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A44C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 15:21:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5BD20723
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 15:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB5BD20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexy-rousseau.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f4f4d5d;
	Wed, 24 Jun 2020 15:02:25 +0000 (UTC)
Received: from 15.mo1.mail-out.ovh.net (15.mo1.mail-out.ovh.net
 [188.165.38.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bdcf97ca
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 15:02:21 +0000 (UTC)
Received: from player773.ha.ovh.net (unknown [10.108.54.141])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9A37C1CA77F
 for <wireguard@lists.zx2c4.com>; Wed, 24 Jun 2020 17:21:21 +0200 (CEST)
Received: from RCM-web6.webmail.mail.ovh.net
 (nld76-1-78-214-156-147.fbx.proxad.net [78.214.156.147])
 (Authenticated sender: contact@alexy-rousseau.com)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 23C1B13CB563F
 for <wireguard@lists.zx2c4.com>; Wed, 24 Jun 2020 15:21:20 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 24 Jun 2020 17:21:20 +0200
From: contact@alexy-rousseau.com
To: wireguard@lists.zx2c4.com
Subject: Compile wireguard-apple with a free Apple developer license
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d4c6b71794b276ae3b1c572ba69c671f@alexy-rousseau.com>
X-Sender: contact@alexy-rousseau.com
X-Originating-IP: 78.214.156.147
X-Webmail-UserID: contact@alexy-rousseau.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8030199611164442703
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekjedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvffufgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpegtohhnthgrtghtsegrlhgvgiihqdhrohhushhsvggruhdrtghomhenucggtffrrghtthgvrhhnpeejheehieekkedthedufffhkeffleefkedtjeffieeiteejvdehieffhefgueetffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdejkedrvddugedrudehiedrudegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghonhhtrggtthesrghlvgighidqrhhouhhsshgvrghurdgtohhmpdhrtghpthhtohepfihirhgvghhurghrugeslhhishhtshdriiigvdgtgedrtghomh
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

I am trying to run the Wireguard client on iOS and MacOS with Xcode 
(https://github.com/WireGuard/wireguard-apple).
Actually I have a free developer license, my question is :

* Is it possible to run the iOS and MacOS client on XCode with a free 
license or should I pay for my tests?

Thanks in advance for your help and sorry if my question is obvious, I'm 
a newbie on the Apple environment.

—
Regards, Alexy ROUSSEAU

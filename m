Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E458C2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:42:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A88206CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A88206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baslug.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32769493;
	Sat, 4 Apr 2020 22:33:32 +0000 (UTC)
Received: from 8.mo179.mail-out.ovh.net (8.mo179.mail-out.ovh.net
 [46.105.75.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1d687cc6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 07:52:00 +0000 (UTC)
Received: from player715.ha.ovh.net (unknown [10.108.42.66])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 31E461616B1
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2020 09:59:58 +0200 (CEST)
Received: from RCM-web1.webmail.mail.ovh.net (adsl-ull-243-226.40-151.wind.it
 [151.40.226.243]) (Authenticated sender: smart2128@baslug.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id B23BA10C3FF53
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2020 07:59:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 31 Mar 2020 09:59:57 +0200
From: Vincenzo Reale <smart2128@baslug.org>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Apple Italian translation
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <2237f18ad1480a78e5f7ef935fd6b014@baslug.org>
X-Sender: smart2128@baslug.org
X-Originating-IP: 151.40.226.243
X-Webmail-UserID: smart2128@baslug.org
X-Ovh-Tracer-Id: 17905467695601682511
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeiiedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggtgfgfffhvffufgfkgihisehtjehjtddtredvnecuhfhrohhmpeggihhntggvnhiiohcutfgvrghlvgcuoehsmhgrrhhtvdduvdeksegsrghslhhughdrohhrgheqnecukfhppedtrddtrddtrddtpdduhedurdegtddrvddviedrvdegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhmrghrthdvuddvkeessggrshhluhhgrdhorhhgpdhrtghpthhtohepfihirhgvghhurghrugeslhhishhtshdriiigvdgtgedrtghomh
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:33:28 +0200
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

The wireguard-apple translation has already been completed on Crowdin.
Please, let me know if you still need the patch.

Regards,
Vincenzo

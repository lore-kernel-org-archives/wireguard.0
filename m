Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB0C3DA4A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Aug 2024 16:23:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b856c22f;
	Fri, 2 Aug 2024 16:20:23 +0000 (UTC)
Received: from smtp2.eurecom.fr (smtp2.eurecom.fr [193.55.113.211])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id daf99fd5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jul 2024 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
 t=1721940569; x=1753476569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3aEztgTVBhbM1fPogn1tXuE16lRm2oUtKCXwkFnq2lQ=;
 b=tbTvnExcS+exJHKSJIauIU09DB2bWEeNEaXEem4skRlNzih9mFcJrBQv
 YMj/BQ5QmEUy8ffa6H9YaUcrJvtB36EnLdA8Zyd1H47MYxmGqzJMyICC6
 40/wGUmJs8IOrE8K+3w59ZLRSOHmPJV/0qyqA8p/yzSw8ILVvW10AgA9j g=;
X-CSE-ConnectionGUID: pfn4yj3BShKrN1vxlzQRIQ==
X-CSE-MsgGUID: 7eqg5YHpQdCZtDFO6dq+ng==
X-IronPort-AV: E=Sophos;i="6.09,236,1716242400"; d="scan'208";a="15981992"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago2i.eurecom.fr with ESMTP; 25 Jul 2024 22:49:28 +0200
Received: from arc.fortinet-emea.com (91-175-7-2.subs.proxad.net [91.175.7.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id B8F3320CA;
 Thu, 25 Jul 2024 22:49:27 +0200 (CEST)
From: Ariel Otilibili <otilibil@eurecom.fr>
To: wireguard@lists.zx2c4.com
Cc: Ariel Otilibili <otilibil@eurecom.fr>
Subject: Extracted error message for the sake of legibility
Date: Thu, 25 Jul 2024 22:42:37 +0200
Message-ID: <20240725204917.192647-2-otilibil@eurecom.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I have been using WireGuard for some time; it does ease the configuration of
VPNs. This is my first patch to the list, I asked to be subscribed; please
confirm me it is the case.

I would like to improve my C programming skills; your feedback will be much
appreciated.

Ariel


Return-Path: <SRS0=RWyD=JU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74672C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 17:36:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A86B613F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 17:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A86B613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe477b60;
	Fri, 23 Apr 2021 17:36:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5186845f
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 17:36:03 +0000 (UTC)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1lZzT5-0001Qd-Pb; Fri, 23 Apr 2021 17:19:52 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: wireguard@lists.zx2c4.com
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Subject: [PATCH 0/1] wireguard-linux-compat: fix build on Ubuntu 18.04
Date: Fri, 23 Apr 2021 14:19:37 -0300
Message-Id: <20210423171938.583964-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.27.0
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

Back in February, we were looking into backporting a commit to Ubuntu 18.04 GA
kernel that introduces skb_mark_not_on_list.

That would break wireguard-linux-compat when building against that kernel, so a
change was submitted as that commit would be introduced soon.

However, that plan did not work out as intended, and since then,
wireguard-linux-compat CI has been broken on Ubuntu 18.04.

Jason, thanks for bringing that up to our attention, and sorry that we broke
wireguard-linux-compat CI.

We will resend a fix as soon as we sort out when that commit will be applied.

Thanks.
Cascardo.

Thadeu Lima de Souza Cascardo (1):
  Revert "compat: skb_mark_not_on_list will be backported to Ubuntu
    18.04"

 src/compat/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.27.0


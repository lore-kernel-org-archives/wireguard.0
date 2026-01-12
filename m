Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC04EF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:14:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6f86479;
	Sun, 8 Feb 2026 17:10:36 +0000 (UTC)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce3222c2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jan 2026 03:10:55 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1768187454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjQXTurCqg8eMA0SqlreYKSa2/BSBZlUecjE8/D6eRo=;
 b=DAclZ753FhN3IYgOkQEkzVjY6K8HvdSb2MxLMLN3vTfM2F5NP/hmMufoEXAXiTyj6EKM5c
 f1lURNRKOGE8rrgnxOPOQrAsbAA+GWDi//y1l0m0A5UQz/bG0+KM1axiVdXoDMLcxAzV3N
 LeZudy70yGi8cKU1d9EnzXYJTbPcNlU=
From: Fushuai Wang <fushuai.wang@linux.dev>
To: wangfushuai@baidu.com
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com
Subject: Re: [PATCH v2] wireguard: allowedips: Use kfree_rcu() instead of
 call_rcu()
Date: Mon, 12 Jan 2026 11:10:21 +0800
Message-Id: <20260112031021.81853-1-fushuai.wang@linux.dev>
In-Reply-To: <20251005133936.32667-1-wangfushuai@baidu.com>
References: <20251005133936.32667-1-wangfushuai@baidu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

> Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
> the code and reduce function size.

Gentle ping.

---
Regards,
WANG

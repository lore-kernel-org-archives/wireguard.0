Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA0CF34C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41f9c296;
	Tue, 18 Nov 2025 17:32:24 +0000 (UTC)
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e4e346a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Oct 2025 13:30:59 +0000 (UTC)
From: Fushuai Wang <wangfushuai@baidu.com>
To: <edumazet@google.com>
CC: <Jason@zx2c4.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <pabeni@redhat.com>, <wangfushuai@baidu.com>, <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] wireguard: allowedips: Use kfree_rcu() instead of
 call_rcu()
Date: Sun, 5 Oct 2025 21:30:31 +0800
Message-ID: <20251005133031.31891-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <CANn89iJs+Y7Ge2sbAOQSsuE6O1GbxuHbNrFxBO0fq1C3HOfxPA@mail.gmail.com>
References: <CANn89iJs+Y7Ge2sbAOQSsuE6O1GbxuHbNrFxBO0fq1C3HOfxPA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.127.72.16]
X-ClientProxiedBy: bjkjy-exc6.internal.baidu.com (172.31.50.50) To
 bjkjy-exc17.internal.baidu.com (172.31.50.13)
X-FEAS-Client-IP: 172.31.50.13
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

>> Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
>> the code and reduce function size.
>>
>> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> 
> Hmm... have you compiled this patch ?
> 
> I think  all compilers would complain loudly.

you are right.
I uploaded the wrong version of the patch. I will send the correct v2 shortly.

Thank you for pointing it out!

Regards,
Wang.

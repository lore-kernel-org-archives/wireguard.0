Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C8EF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5402677;
	Sun, 8 Feb 2026 17:13:09 +0000 (UTC)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 769652a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Jan 2026 11:42:24 +0000 (UTC)
Message-ID: <e500a519-8277-4ddc-be7c-529b64b24860@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1768218141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkpHsuvE6V8Bk7Pqpm7Lok7WPhoO3vgdm1OBWx3Et7o=;
 b=lV/Q/faMYufFVo58zKJkIRqEafbT+KpNpulx33db8hdn6J4sI1BWiWOosUf6Ek/cCRBIhO
 KU9bhvsHMYKsn+fdylQwyFXHyi5w0X61+ohFK6XC7nvYu5pGLrGcavFqRxf0SDTOhENyR8
 tRwZyKGE09xb+1e6XCUHMbGgRSSiehM=
Date: Mon, 12 Jan 2026 11:41:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] wireguard: allowedips: Use kfree_rcu() instead of
 call_rcu()
To: Fushuai Wang <fushuai.wang@linux.dev>, wangfushuai@baidu.com
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com
References: <20251005133936.32667-1-wangfushuai@baidu.com>
 <20260112031021.81853-1-fushuai.wang@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260112031021.81853-1-fushuai.wang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

On 12/01/2026 03:10, Fushuai Wang wrote:
>> Replace call_rcu() + kmem_cache_free() with kfree_rcu() to simplify
>> the code and reduce function size.
> 
> Gentle ping.

I believe you have to resend the patch as it's not going to be
automatically re-evaluated. And you have to rebase it on top of current
net-next. While preparing new patch, please add clear indentification of
the target tree, the subject should look like "[PATCH net-next v3] ..."
in your case.

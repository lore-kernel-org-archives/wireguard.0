Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A9C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 17:28:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dcf4e96;
	Tue, 20 May 2025 19:39:23 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1bb46a32
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2025 10:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7F01A40366;
 Thu, 23 Jan 2025 10:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01B0C4CED3;
 Thu, 23 Jan 2025 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737629867;
 bh=f41UpFEOXRxZ5O0RV5KxYINmp7dFVbrFYnQ2EhExkXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVMazZoBktp6usukCFQEM4Dd35SAuIuWB3SB3/G6UkTrJ09U3xhw+5ZTF2aRLFkUK
 vTjYuvTPX6+hVbC8TRUDOahgR5nqMkd4Ow0bg5tXqUYHwyGzSn+wUTTyzXRBtVXWlQ
 oIeM+1r6qnqBJL5powgWqu++auL9k4+N5sYJcIh5j2KTIMIVWBQQrMYJo4zl28vojZ
 FyUchGzbg4czA5BZ2bR8jbIbOzsSa67Cnxc9uLlmwgD/RPVShNFiLsWAT1MtBJarZl
 6gu6Ac1GlQHE00JwUYo/qVAdocO65kMFwcVfV78mu+x5E1u8ddIUtwHeoMQaysRq15
 OBmD/LbOF3dhA==
Date: Thu, 23 Jan 2025 10:57:43 +0000
From: Simon Horman <horms@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: Jason@zx2c4.com, shuah@kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de,
 jstultz@google.com, zhanjun@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
Subject: Re: [PATCH] wireguard: selftests: Cleanup CONFIG_UBSAN_SANITIZE_ALL
Message-ID: <20250123105743.GO395043@kernel.org>
References: <F0F29BE7BB89FAAF+20250123044923.161871-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F0F29BE7BB89FAAF+20250123044923.161871-1-wangyuli@uniontech.com>
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

On Thu, Jan 23, 2025 at 12:49:23PM +0800, WangYuli wrote:
> Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
> removed the CONFIG_UBSAN_SANITIZE_ALL configuration option.
> Eliminate invalid configurations to improve code readability.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

This looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

And I see you also posted an patch to remove the only other in-tree
references from Documentation/translations/zh_CN/dev-tools/ubsan.rst [1].

Thanks.

[1] https://lore.kernel.org/all/6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com/

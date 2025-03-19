Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F631C54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15955cda;
	Tue, 20 May 2025 19:42:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ea99f2ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Mar 2025 16:04:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA5FB5C5B3A;
 Wed, 19 Mar 2025 16:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792D1C4CEE4;
 Wed, 19 Mar 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jazZvQ5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1742400278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INl+wOk3mYWty4PRlR7VWhbsVm/lVjeQqLlim8JHYhc=;
 b=jazZvQ5qjwyifsrGNAgUp6rMzT2gpMLC/N0+JaOnujaxUsbm1ZTwxBQS1/z5hnCsp3A7NS
 Xs7BjaZDQaUproMgWmLPzVNmxNF0oN1eiPchhfetXwXYj21BOooIlMvpNbE2Hm6/owKVqe
 v0VOf+geXgnLMoXPbxv2JsilTI+yIW8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7eeba5cc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 19 Mar 2025 16:04:36 +0000 (UTC)
Date: Wed, 19 Mar 2025 17:04:31 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <kees@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: Add __nonstring annotations for
 unterminated strings
Message-ID: <Z9rrD0dyDDzTZRHj@zx2c4.com>
References: <20250312201447.it.157-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312201447.it.157-kees@kernel.org>
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

Hi Kees,

On Wed, Mar 12, 2025 at 01:14:51PM -0700, Kees Cook wrote:
> When a character array without a terminating NUL character has a static
> initializer, GCC 15's -Wunterminated-string-initialization will only
> warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
> with __nonstring to correctly identify the char array as "not a C string"
> and thereby eliminate the warning:
> 
> ../drivers/net/wireguard/cookie.c:29:56: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (9 chars into 8 available) [-Wunterminated-string-initialization]
>    29 | static const u8 mac1_key_label[COOKIE_KEY_LABEL_LEN] = "mac1----";
>       |                                                        ^~~~~~~~~~
> ../drivers/net/wireguard/cookie.c:30:58: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (9 chars into 8 available) [-Wunterminated-string-initialization]
>    30 | static const u8 cookie_key_label[COOKIE_KEY_LABEL_LEN] = "cookie--";
>       |                                                          ^~~~~~~~~~
> ../drivers/net/wireguard/noise.c:28:38: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (38 chars into 37 available) [-Wunterminated-string-initialization]
>    28 | static const u8 handshake_name[37] = "Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s";
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/wireguard/noise.c:29:39: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (35 chars into 34 available) [-Wunterminated-string-initialization]
>    29 | static const u8 identifier_name[34] = "WireGuard v1 zx2c4 Jason@zx2c4.com";
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The arrays are always used with their fixed size, so use __nonstring.
> 

Applied. Thanks for the patch.

Jason

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CAECEDDB5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 15:18:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed1d502d;
	Tue, 18 Nov 2025 15:16:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3603a3e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 15:16:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F30D60194;
 Tue, 18 Nov 2025 15:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931C3C4CEFB;
 Tue, 18 Nov 2025 15:15:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="D0idrpsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763478958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3duBZSGflUSL/GDeTdz6fRXMK3HgvgGy6X7ydA69T8=;
 b=D0idrpsJ2Z5TMt+ykjafJyw4xEnkzq+HEze9VXF0odyux4ParJDQnXWsqbBeU1AmXSRiFR
 Q9oMkiYrCa4IBj2s4HfxM7F9EtSpAPP8j2afheNY6t2ZlEndVJIWI1wminrWe9f/0RqGjX
 ZnLZIMXP/l3edWLpfMIsjXwIv9xicmk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2832a4aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 18 Nov 2025 15:15:57 +0000 (UTC)
Date: Tue, 18 Nov 2025 16:15:55 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 03/11] wireguard: netlink: enable strict
 genetlink validation
Message-ID: <aRyNq_-PrpqtsC5Z@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-4-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183223.89913-4-ast@fiberby.net>
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

On Wed, Nov 05, 2025 at 06:32:12PM +0000, Asbjørn Sloth Tønnesen wrote:
> Wireguard is a modern enough genetlink family, that it doesn't

WireGuard, capital G.

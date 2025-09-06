Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB6DCA0FED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 00:07:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5990bbe;
	Sat, 6 Sep 2025 00:07:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c5808579
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:07:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19CBB6029B;
 Sat,  6 Sep 2025 00:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C12C4CEF1;
 Sat,  6 Sep 2025 00:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757117246;
 bh=zYE+E8tCnsrg0b34NooGYBFJYA5zkC/kI80cDxPkmU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RaYItX7HMlPCJtzaZ6iSHJrQc6glP5zIoPvr54tOfCwePX8/b+FHC33PySiigmcXv
 b9l6pqkRGgzygknbMRy0J/Emy4Z6hKNxcBm7iIo8bxUS7+ctzOh1uiv+w/l2LipbW2
 UBtVypzWE8kBGwDkVVsZnCsCvYv85BH8NzwiOMxTM+xk3jJ09dGs/bE7rFCBbYEEXp
 9iaw0uSVNAJDCDQpf6eMd1XMCQdMbI4XKcmLV0Di6qtrnYFllRaJvI01pJ9qHYKbRN
 mywsea84URLRiWvaQ5DfE6ByQyD7vaDvzWDYwW+EUjieNgHnPri1DqL9q7pFCGVQB5
 pMyVO51jH045A==
Date: Fri, 5 Sep 2025 17:07:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] tools: ynl-gen: allow overriding
 name-prefix for constants
Message-ID: <20250905170725.20387dc6@kernel.org>
In-Reply-To: <20250904220156.1006541-1-ast@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu,  4 Sep 2025 22:01:24 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> Allow using custom name-prefix with constants,
> just like it is for enum and flags declarations.
>=20
> This is needed for generating WG_KEY_LEN in
> include/uapi/linux/wireguard.h from a spec.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>

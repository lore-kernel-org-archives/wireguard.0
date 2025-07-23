Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC43C83F1A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Jul 2025 15:46:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74f480fc;
	Wed, 23 Jul 2025 15:46:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62879944
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jul 2025 15:46:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 48A4A4560D;
 Wed, 23 Jul 2025 15:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C75C4CEE7;
 Wed, 23 Jul 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753285612;
 bh=ZjkFYW2U13Mn/AmyiaZUOzdKnfqib/AK/IkijJ/maJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNQlQ22hhTYDAPi/lRwAWj2qwUsXFOufz2OH9a9kWha+0ZAdtGQ93nBfhCsm8j9Rz
 cMzRiQamF7jCzbfh3hsopUlr63HJM+GBVtVcNbxvMv+xT+v3qL5lSrRMNL5zy975DG
 3ICxz03o8VjYbcwc9w8gDyQvogFZ2i3j3sJlnPf5v4juKizkbQrXmjJxhxE55pRIqa
 1pbA6bL7MGDCcJvsJ5C3v2fwaVkWys2akT3KdRpMt5jqUJEJK+50AOlgavBqkPSrjM
 US71vAw/WrEL/FmlQymCQmmQLKtUVLMJu02zmdsO0UCD4aVK4EAgfvNb+HU9C9wj/q
 wKxS3sFVQzoaA==
Date: Wed, 23 Jul 2025 16:46:47 +0100
From: Simon Horman <horms@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Xin Long <lucien.xin@gmail.com>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next 0/3] net: Add sockaddr_inet unified address
 structure
Message-ID: <20250723154647.GI1036606@horms.kernel.org>
References: <20250722171528.work.209-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722171528.work.209-kees@kernel.org>
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

+ Iwashima-san and Willem

  This series looks like something you should review

On Tue, Jul 22, 2025 at 10:18:30AM -0700, Kees Cook wrote:
> Hi!
> 
> Repeating patch 1, as it has the rationale:
> 
>     There are cases in networking (e.g. wireguard, sctp) where a union is
>     used to provide coverage for either IPv4 or IPv6 network addresses,
>     and they include an embedded "struct sockaddr" as well (for "sa_family"
>     and raw "sa_data" access). The current struct sockaddr contains a
>     flexible array, which means these unions should not be further embedded
>     in other structs because they do not technically have a fixed size (and
>     are generating warnings for the coming -Wflexible-array-not-at-end flag
>     addition). But the future changes to make struct sockaddr a fixed size
>     (i.e. with a 14 byte sa_data member) make the "sa_data" uses with an IPv6
>     address a potential place for the compiler to get upset about object size
>     mismatches. Therefore, we need a sockaddr that cleanly provides both an
>     sa_family member and an appropriately fixed-sized sa_data member that does
>     not bloat member usage via the potential alternative of sockaddr_storage
>     to cover both IPv4 and IPv6, to avoid unseemly churn in the affected code
>     bases.
> 
>     Introduce sockaddr_inet as a unified structure for holding both IPv4 and
>     IPv6 addresses (i.e. large enough to accommodate sockaddr_in6).
> 
>     The structure is defined in linux/in6.h since its max size is sized
>     based on sockaddr_in6 and provides a more specific alternative to the
>     generic sockaddr_storage for IPv4 with IPv6 address family handling.
> 
>     The "sa_family" member doesn't use the sa_family_t type to avoid needing
>     layer violating header inclusions.
> 
> Also includes the replacements for wireguard and sctp.
> 
> Thanks,
> 
> -Kees
> 
> Kees Cook (3):
>   ipv6: Add sockaddr_inet unified address structure
>   wireguard: peer: Replace sockaddr with sockaddr_inet
>   sctp: Replace sockaddr with sockaddr_inet in sctp_addr union
> 
>  drivers/net/wireguard/peer.h | 2 +-
>  include/linux/in6.h          | 7 +++++++
>  include/net/sctp/structs.h   | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 

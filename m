Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD00C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8de4eaa;
	Tue, 20 May 2025 19:42:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fe678ce8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2025 23:47:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E9415C2720;
 Fri, 21 Feb 2025 23:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305A7C4CED6;
 Fri, 21 Feb 2025 23:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740181673;
 bh=YpqZyI6XQkE+I/cz0HVGo821pG3xUv+i2G8tH9sw4Ck=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KM/ZfJRW4Ao62YReF/CByxvaytS6eCg7A62ykfem1F7ZlcxARc/ttMS+Eo7QSiRoC
 L/Yjcd2caMn4ObZZCnCGyEuo9xgC6WZot/rpFAy5wigXVK3ut+VHILxglTeHRYA9kk
 k60pF94LnYZ/h3hrEAauaHfon//iQu4AioNB3aq2W2kbk7oEuocz2/ygkH/nvqljBK
 2J+2++rVJPifxTn81/PKTdrWtLY/Om1L+itbDoBh6z+E8Cwe1RdbvdUeamo4+pUpWj
 /c4yBKxGb0jQHXag71qQxP+sWONgV0p8K4pbQVmHScKyB2/E2s11Z7gaJWVk4E/s5B
 mJf6Xz30VzUiw==
Date: Fri, 21 Feb 2025 15:47:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Xiao Liang <shaw.leon@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, Kuniyuki
 Iwashima <kuniyu@amazon.com>, "David S. Miller" <davem@davemloft.net>,
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Alexander Aring <alex.aring@gmail.com>, Stefan
 Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v10 00/13] net: Improve netns handling in
 rtnetlink
Message-ID: <20250221154751.54318ae5@kernel.org>
In-Reply-To: <20250219125039.18024-1-shaw.leon@gmail.com>
References: <20250219125039.18024-1-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 19 Feb 2025 20:50:26 +0800 Xiao Liang wrote:
> Patch 01 avoids link name conflict in different netns.
> 
> To achieve 2), there're mainly 3 steps:
> 
>  - Patch 02 packs newlink() parameters into a struct, including
>    the original "src_net" along with more netns context. No semantic
>    changes are introduced.
>  - Patch 03 ~ 09 converts device drivers to use the explicit netns
>    extracted from params.
>  - Patch 10 ~ 11 removes the old netns parameter, and converts
>    rtnetlink to create device in target netns directly.
> 
> Patch 12 ~ 13 adds some tests for link name and link netns.

Nice work, thank you!

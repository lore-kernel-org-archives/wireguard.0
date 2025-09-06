Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C6CCA1013
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Sep 2025 01:05:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dc21c87;
	Sat, 6 Sep 2025 00:10:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fbb24093
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 00:09:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4EA6601B3;
 Sat,  6 Sep 2025 00:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00552C4CEF1;
 Sat,  6 Sep 2025 00:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757117397;
 bh=VTf5wW96kBXEFtzvHYorlKxfpU60Bg+Sr9U40sLg0a0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oXL9Y3Kq3kyyU3GWml8d8JVQgV619xoRY9CJoY2WO/UV+pSvLFvTYzoCD9f9WXXP2
 Dmturid+6Rihi7kP1R+xmGPW1zqDuHRCNgy9zC/JcLn+ifP0R5io1JFUHLqItNGtbn
 3l0bTM/0Axur0n/CayjjVysDCt9nb1L/+TPm2Blwm66LsPUdFALHJHiQQ6zvr8okr6
 S7qclZOhecukkU/nTgPv1p45fSF35do10J9LeJzoao3BKeDTNrK8WW4UJ8l9pLjg/Q
 Msv8plDwESpTb5tCV12NCF09m+chCdIA/epVUgDmB8ttj+eLiC4ACsxWTxDok/qlMe
 fLmjUoWpAeuCQ==
Date: Fri, 5 Sep 2025 17:09:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
Message-ID: <20250905170956.64fa623b@kernel.org>
In-Reply-To: <20250904220156.1006541-2-ast@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
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

On Thu,  4 Sep 2025 22:01:25 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> This patch adds support for NLA_POLICY_NESTED_ARRAY() policies.
>=20
> Example spec (from future wireguard.yaml):
> -
>   name: wgpeer
>   attributes:
>     -
>       name: allowedips
>       type: indexed-array
>       sub-type: nest
>       nested-attributes: wgallowedip
>=20
> yields NLA_POLICY_NESTED_ARRAY(wireguard_wgallowedip_nl_policy).
>=20
> This doesn't change any currently generated code, as it isn't
> used in any specs currently used for generating code.


Reviewed-by: Jakub Kicinski <kuba@kernel.org>

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CACFCAC592
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Sep 2025 22:41:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d026e44e;
	Tue, 16 Sep 2025 22:39:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 06d0f652
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Sep 2025 22:39:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E55A36022A;
 Tue, 16 Sep 2025 22:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163A6C4CEEB;
 Tue, 16 Sep 2025 22:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758062373;
 bh=Ort8kF21YmqS/VszU+RQlm6xUoyQ77hb3hySCxPgjDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s+cOa2LrKFip85zl7kxfCjTEXmwSTQ87NTyhrwlFjZ1FGAr6a48/UdWwirn3ixWo+
 QD4g5Vb6nkKT2n6zllDTiSUUb9zIDkUVND5IMyNREKoohCP8J6LFSG2QVMTv3l2kf1
 uOEpqH80l4uIcUk3y94BVc0b09Awuk9H2a1dpdY/oCqUJ4TOB0wxi9QFeXk7NouzaC
 gzPfjevTfZzqnNp+6/9VWfssfLYTxHoeJjaitIhn57y5PW7aiMVoSL+qJChB3VYnJY
 xvzdxHu/G/UnRzIGt52uKd8wvfRkO6dQ1pG8ds56koRuAjapL7TTJLF/YtWH6TcQip
 6VPbZ7JY8gnjA==
Date: Tue, 16 Sep 2025 15:39:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?=
 <ast@fiberby.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, Sabrina Dubroca <sd@queasysnail.net>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 00/11] tools: ynl: prepare for wireguard
Message-ID: <20250916153932.200647ad@kernel.org>
In-Reply-To: <CAHmME9rf9NGRVtJBnjUJVPraGKL6dk0nRxzXmSi-7X6Y1zjmsA@mail.gmail.com>
References: <20250915144301.725949-1-ast@fiberby.net>
 <CAHmME9rf9NGRVtJBnjUJVPraGKL6dk0nRxzXmSi-7X6Y1zjmsA@mail.gmail.com>
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

On Tue, 16 Sep 2025 17:53:00 +0200 Jason A. Donenfeld wrote:
> On Mon, Sep 15, 2025 at 4:47=E2=80=AFPM Asbj=C3=B8rn Sloth T=C3=B8nnesen =
<ast@fiberby.net> wrote:
> >
> > This series contains the last batch of YNL changes to support
> > the wireguard YNL conversion. =20
>=20
> "the wireguard YNL conversion"

FWIW these patches stand on their own whether we accept the wireguard
patches or not. Put more plainly - please do not read me applying this
set as an endorsement of the larger plan..

> Did I miss some conversation about this? I figure I must have. I must
> say I'm not too keen on wireguard (and apparently only wireguard?)
> being a guinea pig for this.

The specs themselves are gaining maturity. I think adding a YNL spec
for wireguard would be quite nice. Whether we should be converting
the kernel code and uAPI to take advantage of the auto-generation is
a completely separate conversation. If you're not anticipating many
new additions in the uAPI there's little to be gained.

Intro:
https://docs.kernel.org/next/userspace-api/netlink/specs.html
Existing specs:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/Do=
cumentation/netlink/specs/
Libs:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/to=
ols/net/ynl/pyynl/lib/ynl.py
https://github.com/linux-netdev/ynl-c (this one is also in tree)
https://github.com/linux-netdev/ynl-cpp

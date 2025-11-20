Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A8CF64A6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 02:28:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a16f660;
	Thu, 20 Nov 2025 02:27:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 32923be9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 02:27:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4520A42DA5;
 Thu, 20 Nov 2025 02:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9759EC4CEF5;
 Thu, 20 Nov 2025 02:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763605649;
 bh=3Y9kcr0znSxvhLSXbAv9R4vrY6lksgh6vjh7lHpAmqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fybc5y8l1gtATaBEOY7OJPh0GFTtycn9xzKEMr3NmAWOYviVz9j9wfZRgpLIkuqB7
 mB2ni2I0KNZVR/ykS42Fo6ZcR881qwhp6AbuT82aW1BVT4faDiso3MbNqNkj/wvnt6
 I2iJtRtoa/dk32MkHRi0xQ3dVtwFmC7CnQjN06GrVhAiy4x+eLejomZWnz0A/8ZuM1
 ybqYNzeD2xuzTj0bUpvOO7ToIGoGqCgzqV4k8VwAaRG8VOgcKadsbAbasPtI6Qcm7f
 UNqRHsQpsn7mACglxL0WoqdUz0bfMHaDWi+/Jy8Y9GuHAeSEsyuOCOqsF7dCAO8gcr
 7nExsR/K1SLtg==
Date: Wed, 19 Nov 2025 18:27:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Donald Hunter
 <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jordan Rife
 <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 04/11] netlink: specs: add specification for
 wireguard
Message-ID: <20251119182727.612321f8@kernel.org>
In-Reply-To: <f4d147da-3299-4ae7-b11e-b4309625e2c9@fiberby.net>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-5-ast@fiberby.net>
 <aRvWzC8qz3iXDAb3@zx2c4.com>
 <f21458b6-f169-4cd3-bd1b-16255c78d6cd@fiberby.net>
 <aRyLoy2iqbkUipZW@zx2c4.com>
 <9871bdc7-774d-4e35-be5f-02d45063d317@fiberby.net>
 <aRz4rs1IpohQpgWf@zx2c4.com> <20251118165028.4e43ee01@kernel.org>
 <f4d147da-3299-4ae7-b11e-b4309625e2c9@fiberby.net>
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

On Wed, 19 Nov 2025 19:19:28 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> >> Also fine with me. I'd just like consistent function naming, one way or
> >> another. =20
> >=20
> > IIUC we're talking about the prefix for the kernel C codegen?
> > Feels a bit like a one-off feature to me, but if we care deeply about
> > it let's add it as a CLI param to the codegen. I don't think it's
> > necessary to include this in the YAML spec. =20
>=20
> IIUC then adding it as a CLI param is more work, and just moves family de=
tails
> to ynl-regen, might as well skip the CLI param then and hack it in the co=
degen.
>=20
> Before posting any new patches, I would like to get consensus on this.

The reason other C naming tunables exist (for legacy families!)
is because we need to give enough hints to C code gen to be able
to use existing kernel uAPI headers.

Random "naming preferences" do not belong in the spec. The spec=20
is primarily for user space, and it's used by 4 languages already.

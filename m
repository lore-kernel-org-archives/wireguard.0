Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47E8C2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 00:48:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5A52071C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 00:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=althea.net header.i=@althea.net header.b="P008fAla";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G6qwwD15"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5A52071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0078054d;
	Sun, 5 Apr 2020 00:39:44 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 55d0c5d7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 00:39:40 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9967C5C0129
 for <wireguard@lists.zx2c4.com>; Sat,  4 Apr 2020 20:48:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute7.internal (MEProxy); Sat, 04 Apr 2020 20:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=ZKeFz
 PJJrH6d2Bj/YAqTUcsxCv55/h/mD5FP/tG36mM=; b=P008fAla1Og3c0uI+mheP
 0P7zsjalHiAxkjjNpV1nd8eIVY9YfLUMXec1OZoMcNufstl0udjRN+xhzoaQqGJi
 G2ucmQxI+aI4sM7QJ+hx6nL2K2eCKMpktXq9kMZ2Gx/AIwsUM4TdL1a0dkhMcg1H
 4Dqt6hwEJfry82MAdNeLuEe52vGaC7ppMJ2FDQRyVzkq2qpEVJyKDBxag8wibGGG
 2C7S/F5xL+QJKmz0vZ2RGJmhORUU6JRHPEpBD/Mj8S3RCRQcLLfSFjjS9Z4V2iwl
 ky8HSIFJKKlcnOfBzEszpOtOsITavZ21GXeEdWYu820IZT8i6HkDB3LDuc9RGvl8
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ZKeFzPJJrH6d2Bj/YAqTUcsxCv55/h/mD5FP/tG36
 mM=; b=G6qwwD15lxi9e0zJMmFddnXK4x7qodtwUs6Em6Gaofk//oqRFkURWYLPt
 NwD4+z+IpOv8vFdXp7gBGP09hZcgC1C31HZ2gxJDobuq8iaw+TGVdXToXBpnS7Y+
 SA8/PQMYE4qpy1zLVNZKjjjS3nFHwLTN7qJ/rrESu02R3kgFUd9P+zh9cNHY/7XG
 j5Ue23XYVtqpRvL9p2dK6M5KJ/y3mK2xXIFMRI+Gp5LJWCS09kqpRKjDsIPQKd+2
 FKxHYUONYh0aP35z14NuRMCmUuzAwAQj9Sdz+nO1lL86lsXxA5Nd3ftQNfk9/Vrv
 hDq3GFVRfwffbYyfhcooqdLCC+Gig==
X-ME-Sender: <xms:0CqJXlEGbxkHiK06-QLAZ0hZIrIwf3clp8wYQ0NLCWVAeA0i0uPXDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdelgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedflfhushhtihhnucfmihhlphgrthhrihgtkhdfuceojhhu
 shhtihhnsegrlhhthhgvrgdrnhgvtheqnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepjhhushhtihhnsegrlhhthhgvrgdrnhgvth
X-ME-Proxy: <xmx:0CqJXtl-HNkNngPUxtls2D8VHsJN_UnskYu_oIU5iX3zHhIVNZKAaA>
 <xmx:0CqJXgl87xGaNzo8H0wNXkSH1YRs3vnTqi6toTJG6BPtUt6IMKfj_A>
 <xmx:0CqJXmthFV0_-Pfe1eeiD1Tr3n9Bs-i0oUZzQkW8A_RxxQsngnsu5g>
 <xmx:0CqJXhyriv4oNaByYZ9PkCllrP47P2VB5jnQBWWMZS6VU6AqbP2AYw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1C972E00B8; Sat,  4 Apr 2020 20:48:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1082-g13d7805-fmstable-20200403v1
Mime-Version: 1.0
Message-Id: <49088d54-1381-45a6-a767-8596e6e07723@www.fastmail.com>
In-Reply-To: <445BCA5B-03B7-4127-82E8-029188083D45@gmail.com>
References: <445BCA5B-03B7-4127-82E8-029188083D45@gmail.com>
Date: Sat, 04 Apr 2020 20:47:55 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Multihoming?
Content-Type: text/plain;charset=utf-8
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

Using multiple connections at once is fraught with problems in the first=
 place (see the complexities of teaming and bonding nics) but you can do=
 a simple failover system using Babeld + Wireguard

Althea uses this for failover. In earlier versions of Wireguard it was q=
uite bad (60 second switch times) but more recently handshake re-negotia=
tion is triggered on the fly.

The whole process for Babel to detect the failure, reroute to some other=
 Babeld node advertising the same IP and then for that Wireguard server =
and the client to renegotiate and get traffic flowing takes only a few s=
econds (about 5 in my experience).=20

--=20
  Justin Kilpatrick
  justin@althea.net

On Tue, Mar 31, 2020, at 3:22 AM, Alex Besogonov wrote:
> Hi, list!
>=20
> I=E2=80=99ve read the source code Wireguard implementations and it app=
ears that=20
> true multihoming seems to be impossible with the current protocol. By=20=

> true multihoming I mean possibility of using multiple connections at=20=

> the same time, preferably with configurable rates for them on both=20
> sides.
>=20
> A typical use-case would be a small office using two independent ISPs=20=

> to connect to a Wireguard server, so that failure of one of them would=
=20
> not cause service interruption. Or a mobile user with an LTE and WiFi=20=

> connections used simultaneously.
>=20
> Any ideas on how this could be implemented?

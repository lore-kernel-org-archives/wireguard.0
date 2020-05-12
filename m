Return-Path: <SRS0=yjuW=62=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFE4C54E4A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 11:14:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1602A2222D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 11:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=althea.net header.i=@althea.net header.b="keJBF4Pk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CQ4hfnnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1602A2222D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6b2851c;
	Tue, 12 May 2020 11:01:14 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50be5979
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2020 11:01:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 468A476D
 for <wireguard@lists.zx2c4.com>; Tue, 12 May 2020 07:14:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute7.internal (MEProxy); Tue, 12 May 2020 07:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Sra4y
 gl6oY4B1x9y9SXXC9hAadHtwLvVNi2FAr2WtRU=; b=keJBF4PkcGm79G9ROu4Hp
 dLOARvqZzIOnxl5IG85RuNNIiCU2Y4cCxTHWYJxgPlWgxllmilMVWMCBSTD7KVr+
 gg4677iI6FzwIp8TgqNtmKzR63PQgycng3XYvGb5V+kx51u39PBJlu/p/CqXYziv
 bFflItulB8owTAxfbzi8lgVq3xBRG87wEAvFreeJO+rRa8cA3f1mbUuJ9JdmE26i
 YxEHwJIE0fOmFLLb959ghgYcHdHRPoPnTBQ4tnQY9Xr96mm35FjDpJ8ewR6BHZaI
 yJWAtzENo1DE1OEFdQVgq+9BXumxUL4T9DeXDaE7TISX97G28rBz5dI6yGtDI+86
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Sra4ygl6oY4B1x9y9SXXC9hAadHtwLvVNi2FAr2Wt
 RU=; b=CQ4hfnnknVldTKOHq73RnRHxfyiNoYT9ItL/JkUOss5zZeLCteS8FDzXD
 Vwhf4ejzGCNJdPojNRwkuXPUaXvX8pee9XtsQgZSXOniu43XY7d8hd/vc+a53Ubx
 x9ZTPFKzIWEvYZnXHI6OVPVcWZDqzCV2PAgBHMfzBaDdYWRaDzDduFetF9XTlFxD
 LOOCdw+/YZmdDdPx07A3VfGRGJR3J9QOL7H99HRZWmp4KQ4YG+uvdX/h1D4KULut
 SFagueKFBc6mEBQgJmNPmrHlETI2h+tM/J527/tVA0r9CQ89tkEFLHBykTPyeApc
 /KrZ8w6fD145H+mPTcXnlFr9kWz3A==
X-ME-Sender: <xms:F4W6Xt317IUs48Q9GAihHAY2ka2ec8zMfZ0O9yOunFPKyUvaqWassA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedflfhushhtihhnucfmihhlphgrthhrihgtkhdfuceojhhu
 shhtihhnsegrlhhthhgvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepveeikedvjeekhf
 evieeutedtueetfeefhefguedttdejhfehhfdvgeehgefgfeegnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhushhtihhnsegrlhhthhgvrg
 drnhgvth
X-ME-Proxy: <xmx:F4W6XkFZe4Dd8oqElb4JUkXe52rLYQt0h8ixYHogobunTm7qGXkSxw>
 <xmx:F4W6Xt6-ASTfQPPqtb8CNSfqPKU_gtwa3Ok5ut2vgB6cf8gvSZrzIg>
 <xmx:F4W6Xq0kxaP4B3-IL5jUYuchaBJaHIGd5hC62tKHXTGzm6PDVuQRbQ>
 <xmx:F4W6XkFNnMxeDOhzAJkXAUnTk_I674sqPnwOnvjaSdWf8xrgj7KKRA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 77BEBE00A9; Tue, 12 May 2020 07:14:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <cc7d0e96-eaae-458f-8dc4-0cd1228e5d83@www.fastmail.com>
In-Reply-To: <CAF+AZZULw_O3wjeEkSnWsXOKs_uddr9=a0-04OroKNhsSnKqSw@mail.gmail.com>
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
 <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
 <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
 <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
 <f88c4fdf-ff31-a489-cb58-c02309016b13@pallas.us>
 <CAF+AZZULw_O3wjeEkSnWsXOKs_uddr9=a0-04OroKNhsSnKqSw@mail.gmail.com>
Date: Tue, 12 May 2020 07:14:11 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard over WireGuard
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

Althea uses WireGuard over WireGuard for mesh routing. Each device maint=
ains a link to peers using WireGuard and then also maintains it's connec=
tion to the exit over a multihop WireGuard connection.

Building working WireGuard tunnels over fe80 ipv6 link local addresses w=
as a real pain. Packets sometimes arrive only to the interfaced scoped a=
ddress and other times arrive without an interface scope. Requiring two =
tunnels to successfully listen on one port.=20

--=20
  Justin Kilpatrick
  justin@althea.net

On Tue, May 12, 2020, at 2:56 AM, Dimitar Vassilev wrote:
> Hi all,
>=20
> for my enlightenment can you please advise in which situation such
> setups are useful?
>=20
> Thanks!
>=20
>=20
> =D0=9D=D0=B0 =D1=87=D1=82, 7.05.2020 =D0=B3. =D0=B2 4:01 Derrick Lyndo=
n Pallas <derrick@pallas.us> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
> >
> > Note for the list: IPv6 has a minimum of 1280, which means 1360 in t=
he
> > outer layer. ~Derrick
> >
> >
> > On 5/6/20 4:54 PM, Jason A. Donenfeld wrote:
> > > On Wed, May 6, 2020 at 5:28 PM John Lauro <johnalauro@gmail.com> w=
rote:
> > >> Wireguard is defaulting to 1420 MTU, the ethernet adapter is 1500=
 MTU,
> > >> and I have IPv6 completely disabled.
> > >>
> > >> Can/should the MTU of wireguard be bumped to 1440?
> > > You could if you wanted. But if you don't do it perfectly on all s=
ides
> > > with total uniformity and clearheadedness about your network desig=
n,
> > > you'll run into subtle problems.
>

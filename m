Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BA8C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 11:04:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EACE23A05
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 11:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="Fp65RzAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EACE23A05
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0acee46;
	Mon, 29 Jun 2020 10:44:06 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0d4f99d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 10:44:03 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1593428620; bh=InDbuZ9lBhZ3V5CLN1tPdSwGHD6EA20/SXHj4dbC9r8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Fp65RzAx5Ca593YybbaIrGlReEVShtSqGKMuO1DiCVoxThctFBBQ0pTdXCVHBfa7G
 +lj5I5YAekUMmUA+arNIgirSLQ0sNCtXV4kusXhkXWqZmJFM+dGNiTb30mLbawaWnT
 uvHNvfvfQ1hJbnnna+TXsnZJHROyXDGgbZ3tEVxqVxMo4rU7ZgyT2fUI2V4RmODG0G
 LXoPe9m3mbqp8iYT1N/LRfMZhr8q2unGcYKwLROQNUPbGopFhBJuieiZkzNAcfT8Z7
 5puAA/Y3bQ4mWJuwlXROXoM0+7eWQsnjNNPcrcZ/56ayPrBcOWXzI3UTQeQ9ncuCLw
 Yq6HhXVJ3chcw==
To: Roman Mamedov <rm@romanrm.net>
Cc: Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
In-Reply-To: <20200629153118.4d72f447@natsu>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
Date: Mon, 29 Jun 2020 13:03:40 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87r1tygmlv.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Roman Mamedov <rm@romanrm.net> writes:

> On Mon, 29 Jun 2020 12:22:49 +0200
> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> wrote:
>
>> Reid Rankin <reidrankin@gmail.com> writes:
>>=20
>> > Each IPv6 network device is *required* to have a link-local
>> > address by the RFC
>>=20
>> Given this
>
> What you quoted is the shakiest statement of the entire proposal. Might b=
e a
> cool idea and all, but I don't think RFCs say anything about "requiring" =
that
> for point-to-point L3 interfaces, where there's no functioning multicast =
or
> broadcast to begin with. And it doesn't seem nice that submitter is tryin=
g to
> skew facts in their favor like that.

Eh? This is specified pretty clearly in RFC4291, section 2.1:

2.1.  Addressing Model

   IPv6 addresses of all types are assigned to interfaces, not nodes.
   An IPv6 unicast address refers to a single interface.  Since each
   interface belongs to a single node, any of that node's interfaces'
   unicast addresses may be used as an identifier for the node.

   All interfaces are required to have at least one Link-Local unicast
   address (see Section 2.8 for additional required addresses).  A
   single interface may also have multiple IPv6 addresses of any type
   (unicast, anycast, and multicast) or scope.  Unicast addresses with a
   scope greater than link-scope are not needed for interfaces that are
   not used as the origin or destination of any IPv6 packets to or from
   non-neighbors.  This is sometimes convenient for point-to-point
   interfaces.  There is one exception to this addressing model:

      A unicast address or a set of unicast addresses may be assigned to
      multiple physical interfaces if the implementation treats the
      multiple physical interfaces as one interface when presenting it
      to the internet layer.  This is useful for load-sharing over
      multiple physical interfaces.

   Currently, IPv6 continues the IPv4 model in that a subnet prefix is
   associated with one link.  Multiple subnet prefixes may be assigned
   to the same link.


The fact that Wireguard doesn't assign one is often a source of
annoyance, and since there already is a unique identifier for each peer
on a link (the public key), I really don't see why wg shouldn't just
assign a LL identifier and be done with it. Sure, have a config knob to
turn it off if you're not using IPv6, but let's make this the default
and have wg devices 'just work' over IPv6 by default.

-Toke

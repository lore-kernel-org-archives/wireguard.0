Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15E8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 10:31:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B07A20874
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 10:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B07A20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9258ea6;
	Mon, 29 Jun 2020 10:11:44 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc95c7a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 10:11:42 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 36F8A4A4;
 Mon, 29 Jun 2020 10:31:19 +0000 (UTC)
Date: Mon, 29 Jun 2020 15:31:18 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@toke.dk>
Cc: Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
Message-ID: <20200629153118.4d72f447@natsu>
In-Reply-To: <875zbai32e.fsf@toke.dk>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk>
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

On Mon, 29 Jun 2020 12:22:49 +0200
Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> wrote:

> Reid Rankin <reidrankin@gmail.com> writes:
>=20
> > Each IPv6 network device is *required* to have a link-local
> > address by the RFC
>=20
> Given this

What you quoted is the shakiest statement of the entire proposal. Might be a
cool idea and all, but I don't think RFCs say anything about "requiring" th=
at
for point-to-point L3 interfaces, where there's no functioning multicast or
broadcast to begin with. And it doesn't seem nice that submitter is trying =
to
skew facts in their favor like that.

--=20
With respect,
Roman

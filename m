Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A494FC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 10:23:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B186B235FC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 10:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="ZAX1W5z0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B186B235FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af618cd6;
	Mon, 29 Jun 2020 10:03:19 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b5fe084c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 10:03:15 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1593426170; bh=J9v21zUlP5W9yC/RSypYbnnjgmv6/NQ1vc2GbBAaS5w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZAX1W5z0Aha3YFQdYwknz3ziql62ijS6dxCMIkhSVv/IY0Of5UUwPPOxtPLt3BYjF
 a6jMzI1L6Iey5Bz6TP94XHCaLcpSELhDArP6+Ujgp68fqsTySuMR58cYRyWfxounpC
 ++fL9mBZKOP42Yx0WZs6Olj/r3yl7wwLkOIHdLeJpfC4D3UVBcHOIHpQmvgqBj+UIn
 trmcaGUnxDh97Z6UwtlCxukoFguZPhtXIEK5jJyZM9NZ6CYiH+v0LNtxhEwW7okSC8
 wDAe6vviDJL5qOzoHpUkD0abF62K1/oWFtA8x5LdPdCgO6g0eZqTR+RTuEpu5YMsdN
 uVNoXViZM020g==
To: Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
In-Reply-To: <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
Date: Mon, 29 Jun 2020 12:22:49 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <875zbai32e.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

Reid Rankin <reidrankin@gmail.com> writes:

> Each IPv6 network device is *required* to have a link-local
> address by the RFC

Given this, and how obvious it is to just hash the pubkey into a LL
address, I think the right thing to do would just be to take the hashing
scheme you proposed and put it into the wg kernel part, on by default.
Maybe with a switch to turn it back off for the paranoid :)

-Toke

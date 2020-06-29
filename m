Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCC4C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 12:15:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD4523B23
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 12:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="w5zyONwT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD4523B23
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f1a15cc;
	Mon, 29 Jun 2020 11:55:29 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 83d27cae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 11:55:27 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1593432903; bh=ff6qxGS+EglJGkYv715tVU8SiN1WomUNLnsbSCmdlPs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=w5zyONwTeR+8cB2yLU1KG7rIE2cqjWd+ePiSEWytQ3NpGDUPf3DnfpWhORVrLaxCG
 Jek8U5Lc55llkynvAtsi3OpZ0bILC6usryjZ5gVYX8k+rYPua5QrcvMf8e5V2ucW9T
 0TeYTNb27T5ZG3dudNQTcziYvLxkEsxpX9tG74oqfHBFEA/HBTBzh+R3pcJ4zUvQHN
 0THcs9EeVnF5FsgkIB/TNwf1jjKPq5o0VcqDHYqJXLSsQhv2chIW3fNGO/3k9tLq3e
 HDJw6ecWaUrsUdzJ5Zl94qRpELVBhjtp/N9sOiaQgJOKFF7aCCrlE2L10ua7GgN7oR
 6E0FCaqOAtoog==
To: Roman Mamedov <rm@romanrm.net>
Cc: Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
In-Reply-To: <20200629163851.41d6d755@natsu>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk> <20200629163851.41d6d755@natsu>
Date: Mon, 29 Jun 2020 14:15:02 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87lfk6gjax.fsf@toke.dk>
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

> On Mon, 29 Jun 2020 13:03:40 +0200
> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> wrote:
>
>> Eh? This is specified pretty clearly in RFC4291, section 2.1:
>
> It also says:
>
> -----
>
> 2.5.6.  Link-Local IPv6 Unicast Addresses
>
>    Link-Local addresses are for use on a single link.  Link-Local
>    addresses have the following format:
>
>    |   10     |
>    |  bits    |         54 bits         |          64 bits           |
>    +----------+-------------------------+----------------------------+
>    |1111111010|           0             |       interface ID         |
>    +----------+-------------------------+----------------------------+
>
>
> -----
>
> So should we also follow the designated format for link-locals, or
> accept that WG's case differs from what they had in mind in those
> sections.

In general I'd say that deviating from the RFC needs a good reason.
Expanding the number of bits we can use for the identifier may be a good
reason to expand the LL interface ID width (although I'm not actually
too worried about collisions even if we only use 64 bits). I have yet to
hear a good reason for not just having LL addresses enabled by default :)

> That the "interface" is a special one, with a "link" that doesn't
> function as other kinds of links do, that there's no "neighbour" per
> se to contact by an all-neighbour multicast for instance, no mechanism
> for the "all routers" multicast to work, etc (i.e. all of what the LLs
> were intended to support).

But it's not special. If wireguard is setup as a single point-to-point
link (allowed-ip ::/0), "all-neighbour multicast" and "broadcast"
already works. If there are multiple peers on the interface it doesn't,
but that is also a bug that should be fixed as far as I'm concerned.

> To be clear I'm not against adding LLs, just that "the RFC says so"
> shouldn't be considered the main argument for that when it comes to
> WG.

Oh sure, to me the main argument is also "because it's useful" rather
than "because the RFC says so". But in my view "because it's useful" is
also the reason that requirement is in the RFC in the first place, so
really it amounts to the same thing.

-Toke

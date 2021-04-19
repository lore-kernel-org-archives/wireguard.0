Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01111C43470
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 13:55:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D80611CE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38D80611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c19a5da7;
	Mon, 19 Apr 2021 13:55:27 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da83f216
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 13:55:19 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618840518; bh=7G0dgVtVdveuS7r6IaAyUFQoEVDSpDTMP6cPbWflC+o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qjO/npdplENUh+HcPp1YqA+o7I6mrmh8njOXRRfjrMfTIKBrs/1oN4pC5T8P5idlI
 6GaT1Wb7gzii2p8un4h7wfwp17wNcdE9t9nNXkxF/ri+RXKXrqPkGtXp6TsBwOyjjH
 UGAXq4ud/IkuJ+nMb2sWYijXmDbz0LKdK5w90iK/56L0P7FufxTyh4lD7ONnWkQtZ8
 vykFrCxNkHH1u37zoRUJTMuphWMW99sY5+D0f8MHSOabha8fzvUXpG3+/FvzkMPAUQ
 nCpI9AWaSKOkTZt5F5/+M2v4qYHdgMNEjLtHyNhO1nJwrTyGatJYiS1ltDQtd1JGc7
 BuR5bPxtFQOUg==
To: Ondrej Zajicek <santiago@crfreenet.org>
Cc: bird-users@network.cz, wireguard@lists.zx2c4.com, Stefan Haller
 <stefan.haller@stha.de>
Subject: Re: [PATCH] babel: Drop check for IF_MULTICAST interface flag
In-Reply-To: <YH1/umkXjyZ0AjqO@feanor.crfreenet.org>
References: <20210415134450.197661-1-toke@toke.dk>
 <YH1/umkXjyZ0AjqO@feanor.crfreenet.org>
Date: Mon, 19 Apr 2021 15:55:18 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87y2degz09.fsf@toke.dk>
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

Ondrej Zajicek <santiago@crfreenet.org> writes:

> On Thu, Apr 15, 2021 at 03:44:50PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> The babel protocol code was checking interfaces for the IF_MULTICAST flag
>> and refusing to run if this isn't present. However, there are cases where
>> this flag doesn't correspond to the actual capability of sending multica=
st
>> packets. For instance, Wireguard interfaces on FreeBSD doesn't set the
>> required flags, but Babel will run just fine over such an interface given
>> the right configuration.
>
> Hi
>
> Is there a reason why to disregard the IF_MULTICAST flag? This seems to me
> more like a bug in FreeBSD Wireguard implementation that should be fixed
> there. Is this flag properly checked on Linux, or is there some reason why
> the flag is missing?

We did fix Wireguard - see:
https://git.zx2c4.com/wireguard-freebsd/patch/?id=3Da7a84a17faf784857f076e3=
7aa4818f6b6c12a95

However, that didn't help, Babel still refused to use the interface.
Looking at krt-sock.c, the IF_MULTICAST flag is only set on
IFF_POINTOPOINT or IFF_BROADCAST on bsd. The Linux code (in netlink.c)
has a further:

      if (fl & IFF_MULTICAST)
	f.flags |=3D IF_MULTICAST;

beneath the other flag checks, so maybe that's really what's missing on
the BSD side?

> Routing protocols in BIRD generally follow this flag (and perhaps use
> it to switch to unicast-only mode), so i do not see why Babel should
> behave differently.

Yeah, I do believe I originally copied that check from one of the other
protocols. I can see how it makes sense to check the flag and change
operation mode based on it, but given that Babel doesn't do that it just
seems kinda redundant? If the interface *actually* is unable to send
multicast packets, the subsequent socket operation is going to fail, and
at least that produces an error message instead of just silently
ignoring the interface like that flag check does :)

-Toke

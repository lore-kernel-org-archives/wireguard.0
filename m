Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D3CC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:58:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D21922173E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D21922173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84815d38;
	Wed, 28 Aug 2019 06:58:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fe49e48
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:58:00 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98e58747
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:58:00 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1i2rqN-0001qU-TJ; Wed, 28 Aug 2019 06:54:11 +0000
Date: Wed, 28 Aug 2019 06:54:11 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Hendrik Friedel <hendrik@friedels.name>
Subject: Re: Keep-alive does not keep the connection alive
Message-ID: <20190828065411.GA6914@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I was asking about server ip in the live wg config
on the client, as seen in
# wg show
in order to verify the problem is indeed a stale ip.

On Wed, Aug 28, 2019 at 06:25:15AM +0000, Hendrik Friedel wrote:
> that seems not to be the intended behaviour:
> If I understand correctly, the current behaviour is:
> =

> At tunnel start the IP is resolved
> This IP is used for ever, namingly for re-connects.
This is only partly correct. The remote endpoint can unconditionally
roam and is updated by any valid packet from a given IP (if I remember
correctly).

> The probably intended behaviour would be:
> At tunnel start and at any re-connect the IP is resolved.
> =

> Do you agree that this behaviour should be changed?
> Apart from that: Can you suggest an automatable workaround?

In some circumstances a similar behavior would be a desired.

Wireguard design and implementation is layered (which seems good).
The secure* tunnel, including the kernel module and wg tool seem
to be in a reasonable state, but automation, DNS, key exchange are
out of scope for them. It is meant to be provided by tooling, which is
currently very raw.

As a workaround you could
  - unconditionally periodically update the endpoint
  - monitor last handshake time, when large update endpoint or restart
    tunnel
  - add keepalive to server - it might reduce your downtime

Regards,
Ivan Lab=E1th
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

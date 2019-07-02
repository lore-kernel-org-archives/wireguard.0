Return-Path: <SRS0=SwL3=U7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6814CC5B57D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jul 2019 20:48:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2F9218A0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jul 2019 20:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2F9218A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0646531;
	Tue, 2 Jul 2019 20:48:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0eaec14
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 20:48:12 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16fea062
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 20:48:12 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1hiPgv-0005UZ-3I; Tue, 02 Jul 2019 20:47:53 +0000
Date: Tue, 2 Jul 2019 20:47:53 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Deterministic Cryptographically Authenticated Network Signatures
 on Windows NLA
Message-ID: <20190702204753.GA20367@matrix-dream.net>
References: <CAHmME9o2Hixoo_XawTGjHoVmuV5h=VxdfN+3i9Lyc_eRuA_60A@mail.gmail.com>
 <b24e4e96-8449-9286-0c33-a23418c079be@trustiosity.com>
 <CAHmME9qoUtBVd2+Y_gqr63YWOA00DsPriOBh=N=c+WkeRXMqzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9qoUtBVd2+Y_gqr63YWOA00DsPriOBh=N=c+WkeRXMqzQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

while the idea of Deterministic Cryptographically Authenticated
Network Signatures is commendable, what is the *purpose* of the
network signature in Windows?

On Fri, Jun 28, 2019 at 10:15:39PM +0200, Jason A. Donenfeld wrote:
> On Fri, Jun 28, 2019 at 6:33 PM zrm <zrm@trustiosity.com> wrote:
> > The drawback of this approach is that if anything in the configuration
> > changes at all, it becomes a different network. In theory that's the
> > idea, but in practice changes to the configuration will sometimes happen
> > that shouldn't change which network it is.
> 
> No, that's the entire point. If you change your network configuration
> -- which public keys (identities) are allowed to send what traffic,
> then this should not map to collided network signature. You're free to
> configure Windows to apply the same network profile and conditions to
> a variety of network signatures, of course.

What would the procedure be when tweaking/changing the configuration
of the interface? If e.g. peer changes key, added ip, removed ip,
renumbered ip, ... some other trivial change. The more peers you have,
the more changes you have.

Using id from either local priv/pub key, interface name, both,
or possibly a config item seems most reasonable to me.

IMO, if you reuse the same key for different networks, then you are
shooting yourself in the foot, so it is a sufficient identifier.
Add short warning to documentation if appropriate:
"Interface public key is used as the network identifier in Windows.
Its reuse will reuse settings of e.g. firewall."

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

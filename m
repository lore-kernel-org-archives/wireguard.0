Return-Path: <SRS0=bSPH=AF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFCBC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 15:37:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BCC206FA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 15:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BCC206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=flokli.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8d10aa6;
	Wed, 24 Jun 2020 15:18:13 +0000 (UTC)
Received: from zeus.flokli.de (mail.zeus.flokli.de [88.198.15.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 53a69fa9
 (TLSv1.2:AES256-GCM-SHA384:256:NO) for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 15:18:11 +0000 (UTC)
Received: from localhost (p57939261.dip0.t-ipconnect.de [87.147.146.97])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: flokli@flokli.de)
 by zeus.flokli.de (Postfix) with ESMTPSA id B8C5BDF1461;
 Wed, 24 Jun 2020 15:37:11 +0000 (UTC)
Date: Wed, 24 Jun 2020 17:37:06 +0200
From: Florian Klink <flokli@flokli.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
Message-ID: <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
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

Hey,

>> Has anyone thought about a standardized WireGuard IPv6 ULA generated
>> from the PublicKey ?
>
>This was indeed already discussed, albeit not for ULAs, but link-local
>addresses (fe80::/64). IIRC, Jason rejected it citing the KISS
>principle -- and I fully agree with that. Adding a hundred small
>features useful for certain corner cases is a sure way to transform
>wireguard into a behemoth of ipsec/openvpn dimensions. :)
>
>https://lists.zx2c4.com/pipermail/wireguard/2017-April/001177.html

Was this really a rejection?

I'd like to join the "poking and prodding about supporting IPv6 Link
Local addresses".

Deriving a IPv6 link-local address from the pubkey and adding it to the
interface should be a no-brainer and sane default, and already fix Babel
Routing (and most other issues) for "point-to-point tunnels"
(only one peer, both sides set AllowedIPs=::/0).

Quoting the proposal from the linked email:
> # wg set wg0 llv6 on
>
> This command fails and returns -ENOTUNIQ if two existing peers have
> the same value of hash(pubkey). When this command succeeds:, the wg0
> interface receives an automatically assigned IP address of
> fe80::hash(interfacepubkey)/64. Every peer has
> fe80::hash(peerpubkey)/128 implicitly added to their allowed-ips. When
> adding a new peer, if hash(pubkey) is the same value of an existing
> peer, the command fails and returns -ENOTUNIQ.

Of course, generating these addresses could be implemented into
downstream tooling, but I'd rather see this defined in wireguard itself.
Then we'd not have multiple implementations possibly using different
hashes.

A standardized hashing, adding fe80::hash(interfacepubkey)/64 and
AllowedIPs=fe80::hash(peerpubkey)/128 for each peer would also allow
bring instant IPv6 connectivity between peers - which I find quite
appealing.

I'd propose handling the multicast replication ideas as well as the
ULA address generation as a followup, or the business of higher-level
tooling.

Regards,
Florian

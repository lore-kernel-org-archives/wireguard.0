Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6266C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 13:48:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE3360F39
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 13:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE3360F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e604bd31;
	Mon, 27 Sep 2021 13:48:49 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1f20149c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 13:48:45 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 559591E3065;
 Mon, 27 Sep 2021 09:48:44 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 390FA1E3062;
 Mon, 27 Sep 2021 09:48:44 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: WireGuard with obfuscation support
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <20210927130138.54zkvlokogcu6o3q@meerkat.local>
Date: Mon, 27 Sep 2021 08:48:38 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C6A0167-0DC0-4500-A843-AD03688FD05D@lonnie.abelbeck.com>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
 <20210927143628.36c2ceab@nvm> <20210927102157.GA23755@wolff.to>
 <20210927130138.54zkvlokogcu6o3q@meerkat.local>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.104.21)
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



> On Sep 27, 2021, at 8:01 AM, Konstantin Ryabitsev =
<konstantin@linuxfoundation.org> wrote:
>=20
> On Mon, Sep 27, 2021 at 05:21:57AM -0500, Bruno Wolff III wrote:
>>> With obfuscation there would be UDP packets of random junk, and it =
would be a
>>> much harder job to come up with a rule to drop those without =
affecting
>>> anything else.
>>=20
>> If your ISP is blocking your Wireguard traffic call them up and =
complain.
>=20
> There have been times when I found myself briefly at a location that =
didn't
> allow wireguard traffic, like an airport or a public library. =
Complaining
> wouldn't have been a useful course of action to take, since I needed a
> solution at that particular time and place.

Public hotspots may just be blocking UDP/51820, not DPI.

Some time ago Jason posted an iptables REDIRECT workaround at your WG =
"server" endpoint [1]

I have found typically either 443 or 4500 will work if 51820 is blocked.

Lonnie

[1] =
https://lists.zx2c4.com/pipermail/wireguard/2018-November/003503.html


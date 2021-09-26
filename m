Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22ACC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 00:17:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D9CE610CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 00:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D9CE610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 258e20a9;
	Mon, 27 Sep 2021 00:17:21 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c2618195
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 12:09:21 +0000 (UTC)
Date: Sun, 26 Sep 2021 12:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1632658160;
 bh=+GI+DVrLhBN2BrFYV4cFdAPbpo8TI0rba1GXz1IHOPs=;
 h=Date:To:From:Reply-To:Subject:From;
 b=LzCF42sGUL2kMpczkRID2bVPBpOOe/mwI8P4+LC2plsLbvI/Wqd38/+foUGHRn7EV
 MZxq2H9iq00Z4/UJSEx4kT5+F1m4y+FTAnviQDDMjpyt/4pRJRSOtaA607gw5VTNgL
 bH4Xid564VrN1FeD1lJl3Ee89gsoBPge+539FmUk=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: el3xyz <el3xyz@protonmail.com>
Subject: WireGuard with obfuscation support
Message-ID: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 27 Sep 2021 00:17:19 +0000
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
Reply-To: el3xyz <el3xyz@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey all,

I guess this topic is, at the very least, not new, but there is still no so=
lution. In the country where I live internet censorship increases year afte=
r year and more network operators start blocking WG. With that being done I=
'm stuck to ShadowSocks which is slower and less secure on desktops then WG=
. That said I decided to implement obfuscation for WG at least for my own u=
se and kindly asking for code review and possible improvements:

https://github.com/el3xyz/wireguard-linux-compat

To my understanding there are several ways WG is detected by DPI
* Port 51820 (easily fixed)
* 4-byte message tag
* Fixed message lengths
* MAC2 which is all zeroes, unless cookie message is received (high load sc=
enario)


To make detection more difficult two things are being done
* handshake initiation, response and cookie messages are padded with random=
 sized garbage
* Up to 192 bytes of each message is encrypted with obfuscation key derived=
 from peer public key (different keys are used in different directions).

I have tools and Linux driver working already so anyone interested can try =
this out.
Cheers

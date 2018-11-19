Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8045EC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 18:05:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC817205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 18:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="DoRmulKI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC817205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f479ca1c;
	Mon, 19 Nov 2018 17:58:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26e6f0e3
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:58:40 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6a1cb7b
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:58:40 +0000 (UTC)
Date: Mon, 19 Nov 2018 18:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1542650675;
 bh=9L76n5ew+k59XXvu92Zveihp1CNpNbviQ3OaL++Z+jU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=DoRmulKIpuhyDaVptJ+PK5lXlepNSKlTYkkHYqKp54d13KP9VpLMdK67ZiJ9GuUix
 vWE9KjKvGfro1DDYaHavtPhSr68NMESFY1Fn3qshba1tZ+jW7iI8iu8FHGFjbMxeZi
 VX4DggFsWbg7ScgofM8B5+Wu7uWNrJp4Caq6cW14=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181119` Available
Message-ID: <VE1tYzOPCJK4AHXvf6wzqzseITkoWAV3A_3BoPB5C8OhHHGDTmldi2DLkFtiljNrdHKAr6UYea2Z-qT56WEom5upq12Mr4-KpX7CKNDts6g=@protonmail.ch>
In-Reply-To: <aab31593d316f5de@frisell.zx2c4.com>
References: <aab31593d316f5de@frisell.zx2c4.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Monday, November 19, 2018 6:27 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hello,
>
> A new snapshot, `0.0.20181119`, has been tagged in the git repository.
>
> Please note that this snapshot is, like the rest of the project at this point
> in time, experimental, and does not consitute a real release that would be
> considered secure and bug-free. WireGuard is generally thought to be fairly
> stable, and most likely will not crash your computer (though it may).
> However, as this is a pre-release snapshot, it comes with no guarantees, and
> its security is not yet to be depended on; it is not applicable for CVEs.
>
> With all that said, if you'd like to test this snapshot out, there are a
> few relevant changes.
>
> == Changes ==
>
> -   chacha20,poly1305: fix up for win64
> -   poly1305: only export neon symbols when in use
> -   poly1305: cleanup leftover debugging changes
> -   crypto: resolve target prefix on buggy kernels
> -   chacha20,poly1305: don't do compiler testing in generator and remove xor helper
> -   crypto: better path resolution and more specific generated .S
> -   poly1305: make frame pointers for auxiliary calls
> -   chacha20,poly1305: do not use xlate
>
>     This should fix up the various build errors, warnings, and insertion errors
>     introduced by the previous snapshot, where we added some significant
>     refactoring. In short, we're trying to port to using Andy Polyakov's original
>     perlasm files, and this means quite a lot of work to re-do that had stableized
>     in our old .S.
>
>     This snapshot contains commits from: Jason A. Donenfeld and Samuel Neves.
>
>     As always, the source is available at https://git.zx2c4.com/WireGuard/ and
>     information about the project is available at https://www.wireguard.com/ .
>
>     This snapshot is available in compressed tarball form here:
>     https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181119.tar.xz
>     SHA2-256: 7d47f7996dd291069de4efb3097c42f769f60dc3ac6f850a4d5705f321e4406b
>     BLAKE2b-256: 7691db05dbdc6619700f8334ebf258c6160ae2d6f481ef98475f0c5c2627b3a6
>
>     A PGP signature of that file decompressed is available here:
>     https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181119.tar.asc
>     Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
>
>     If you're a snapshot package maintainer, please bump your package version. If
>     you're a user, the WireGuard team welcomes any and all feedback on this latest
>     snapshot.
>
>     Finally, WireGuard development thrives on donations. By popular demand, we
>     have a webpage for this: https://www.wireguard.com/donations/
>
>     Thank you,
>     Jason Donenfeld
>

It fails to build for me (doing in-kernel build with Linux 4.20rc3 and WireGuard/contrib/kernel-tree/create-patch.sh) with below message:


make[2]: *** No rule to make target 'net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o', needed by 'net/wireguard/built-in.a'.  Stop.

There is also following warn when applying wireguard patch:

diff: /WireGuard/src/**/*.S_shipped: No such file or directory

Jordan

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6821C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:57:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1502075B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="xWmqG6Xn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1502075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75d9b62d;
	Mon, 19 Nov 2018 20:51:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63b437db
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:51:01 +0000 (UTC)
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6986bc7
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:51:01 +0000 (UTC)
Date: Mon, 19 Nov 2018 20:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1542661017;
 bh=4wUA5da2+H793JIY+hiGPPvgpC/H1rDr4ibtznNxMxg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=xWmqG6Xn77+1ZjvYW1y+g9Iv9LHBAQCUPKvfsFNoTN7owpb2DHDqRFOC40B0fXl9s
 9JV1Kuq9r6D8ULYvtEDeQmqT0f4tpn9wdSbi1OnjYz3xTWoDHRN2hATQvH84IRGQlt
 sMDoJiKgaSJP6Tq1yAIYejGVU/xVNOxzQM7bcPtg=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181119` Available
Message-ID: <eWVtNeoI7uCtRrv_h9amEYo3gqiIRS6Zc1TtaAJOfF3Bz6sgNSauZ5pcUqyHDOlv2j5krKlXyVbxkerb8SMp9BrKMAsS9UDCvb2rh51iLAs=@protonmail.ch>
In-Reply-To: <CAHmME9puWPwmOjRYcEmmFAf2KMM2KyDiV4EJPHRBBXkNSBrZqg@mail.gmail.com>
References: <aab31593d316f5de@frisell.zx2c4.com>
 <VE1tYzOPCJK4AHXvf6wzqzseITkoWAV3A_3BoPB5C8OhHHGDTmldi2DLkFtiljNrdHKAr6UYea2Z-qT56WEom5upq12Mr4-KpX7CKNDts6g=@protonmail.ch>
 <CAHmME9puWPwmOjRYcEmmFAf2KMM2KyDiV4EJPHRBBXkNSBrZqg@mail.gmail.com>
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

On Monday, November 19, 2018 8:02 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Jordan,
> On Mon, Nov 19, 2018 at 7:04 PM Jordan Glover
> Golden_Miller83@protonmail.ch wrote:
>
> > It fails to build for me (doing in-kernel build with Linux 4.20rc3 and WireGuard/contrib/kernel-tree/create-patch.sh) with below message:
> > make[2]: *** No rule to make target 'net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o', needed by 'net/wireguard/built-in.a'. Stop.
> > There is also following warn when applying wireguard patch:
> > diff: /WireGuard/src/**/*.S_shipped: No such file or directory
>
> Ugh, sorry. This keeps happening: neglecting the jerry rig scripts,
> because they're not in src/. I need to either move those into src/ or
> add them to the CI so that this doesn't happen again.
>
> https://git.zx2c4.com/WireGuard/patch/?id=37466fb996ea174cddd3d836c2f49c53b10648ad
> should fix it.
>
> Jason

I can confirm that above fix works. Thank you.

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

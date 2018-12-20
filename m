Return-Path: <SRS0=9Sn0=O5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BA5C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Dec 2018 01:04:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C922084A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Dec 2018 01:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pRVoi/BL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C922084A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82be5808;
	Thu, 20 Dec 2018 01:04:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50d61aa7
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Dec 2018 01:04:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f5bbac0
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Dec 2018 01:04:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 770c1d00
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Dec 2018 00:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=IJsm8tYshdhDEsgB4FDxmTjdfOU=; b=pRVoi/
 BLvmzMDGUb7GMfDo3hThsYd/00q8Dql8Qv/zWhyOy2R1JcyHou7GN7/7xCC4Dahn
 sdQO3zLxh6VlibyVTHr/P5QSzaP2S/wZ34cDbmwQOcBTwwPekPdOrl5Kja6bKS1K
 hjk0dV/rdma2K2Ajk7eUsiC815u25xNiHv2a0ahSNc4MUAQs/nC1NWU7kK2k5YZE
 UQOy1Ru6oIPtinSFIwssmcnJiDFzc7vlbC95b9cig/17I1T0BYlD0xOcFe3Edk8t
 g9Ly6X8xDLLzxHOQt7w4R9F0zBpS9JQ2Ar+KPazmL1Wbg71IcENxx/7INFeEIW2A
 rI3Uw8/YjaeEleRw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9085a3ae
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Dec 2018 00:54:53 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id t5so64908otk.1
 for <wireguard@lists.zx2c4.com>; Wed, 19 Dec 2018 17:04:46 -0800 (PST)
X-Gm-Message-State: AA+aEWb7OfK3TKmahAjLfBxFiP6NiR1PGZjsXKgC/uRaXKd/T7o+U4U3
 XznUgm0BDTXHzOuVhXW2OQ5N/n487mrtUtHg1Bw=
X-Google-Smtp-Source: AFSGD/UZCah3jgoFSwK8rD8A+dKRMjphuiTru1auiLjvMjkjkTVhM3atffZYCiSh2aADSAfR9QG2atSNpYYAnI1k74Y=
X-Received: by 2002:a9d:7e87:: with SMTP id m7mr17925292otp.225.1545267885615; 
 Wed, 19 Dec 2018 17:04:45 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
In-Reply-To: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Dec 2018 02:04:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9ojT3jdxfiK6kQUn2PBtMyE_t=mf=y9vGcJazVFWnCuew@mail.gmail.com>
Message-ID: <CAHmME9ojT3jdxfiK6kQUn2PBtMyE_t=mf=y9vGcJazVFWnCuew@mail.gmail.com>
Subject: WireGuard for iOS - now in the App Store
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi everybody,

Thanks to all of the extremely useful feedback we've received during
the TestFlight of WireGuard for iOS, Roopesh, Eric, and I have now
released a beta into the App Store itself:

https://itunes.apple.com/us/app/wireguard/id1441195209?ls=1&mt=8
Depending on your region and Apple's caching semantics, this link
might take some unknown amount of time to begin working.

Apple requested a video of the app running on a physical device during
their review of the app, showing that it works. For the curiosity of
non-iPhone folks, you can see it here:
https://data.zx2c4.com/wireguard-ios-app-store-review.mp4 . It's more
or less the same interface as on Android and is designed to be as
simple and "system-like" as possible, while still exposing all of the
features and flexibility of WireGuard.

Please do keep the feedback coming. At the moment, I'm especially
interested in reports of people transitioning between mobile and WiFi
when using T-Mobile's network within the US. But generally, all bug
reports, complete with the exported log, are very welcome, as we
continue to refine these beta releases.

As before, if you're interested in doing development on this app,
please get in touch with team@wireguard.com. Likewise, we're always
looking for a helping hand with a variety of tasks, including but not
limited to:
- iOS
- macOS
- Android
- Windows
- Web development (wireguard.com could use some love)
- Various kernels
- So forth

Enjoy,
Jason

On Mon, Nov 5, 2018 at 10:27 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey folks,
>
> For the last few weeks, Roopesh and I have been hard at work on the
> WireGuard for iOS app. Today we're happy to share a
> likely-buggy-and-broken TestFlight that you can run on your phone:
> <https://testflight.apple.com/join/63I19SDT>. As usual, use at your
> own risk, especially since it's alpha quality.
>
> Please let us know about any bugs as you find them -- you can send
> them to me or to team@wireguard.com. Our current TODO list lives here
> [1], linked via the main project TODO list [2], and if you're an iOS
> person and want to contribute code, we'd be happy to have you on
> board.
>
> The app costs $3.99 and requires an email address to sign up; we
> manage all your tunnels for you in the cloud. JUST KIDDING! Like the
> rest of WireGuard, the iOS app is free and open source [3]. I make
> this rather tasteless joke, because of the rather surprising
> quantities of people encouraging me to do the iOS stuff as proprietary
> paid software, because "apple users will pay" or because "open source
> is cool, but iphone folks don't care about it so you can get away with
> charging" or because "none of the other vpn players are doing open
> source mobile implementations" or even because "apple is more likely
> to accept paid software into its app store" and so on and so forth.
> But, as usual, I much prefer for this to be a community project than a
> closed one, and so like everything else, it's FLOSS.
>
> Enjoy! And do let us know about the bugs as you run into them. I'm
> sure there are plenty.
>
> Regards,
> Jason
>
> [1] https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY
> [2] https://www.wireguard.com/todo/
> [3] https://git.zx2c4.com/wireguard-ios/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C31C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 21:27:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F137B2081C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 21:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ef7fxqEO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F137B2081C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12ae64e3;
	Mon, 5 Nov 2018 21:23:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d8dddc2
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 21:23:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e420f19
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 21:23:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e30914c
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=Y8UV4L
 gWnNoOhvBc2lYxIvLW3jM=; b=ef7fxqEO5bSlGdSKH3DOJ1i0R1ODaYMRsEtxT+
 6nFUabWouGaX4DQwJZ88cYn04s/oBTwIuTAnG6zfWIihUprkrPJSwngmz/n/lkgk
 WV1QX3KF7xBmXWYCgELHQck9/WdqLJ4c/tEInxggKMxa16I1O8TSy+xBJ1v2kgmV
 n1utZ5aJI3adoYQ092qzhKrd8oezk0lwfXLQTbiau0qS0SwXbVfBe2uKg4Hll9Be
 BevOlAngvlU9kwJtnjVLVGNAEfn3c0eV2Tdg6/TlU0V0ReZwDzbZMAe3DcDej9Xd
 HFVwEI9Yh84j9ZWTbUWC2KZI0T3XMcbpZZVQaVG6yVppOtVQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56e163de
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 21:23:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id c32so9450314otb.8
 for <wireguard@lists.zx2c4.com>; Mon, 05 Nov 2018 13:27:36 -0800 (PST)
X-Gm-Message-State: AGRZ1gLLKlFD2cCbSuS2e1bt0jPCiLphFr/kXkKDeKE6wqPmL0jURLe7
 ccRZ9WhhXJaEcToDJKEv/JBjHoKLcKEgOZnHJ7k=
X-Google-Smtp-Source: AJdET5eQs80L4F5nv+2RrYI0KGgYXnckrZkmAb3g77BPuia9yWMQH6kkABsrZ522XUA5tSXU47vn7N7FeWVVS3FRXp0=
X-Received: by 2002:a9d:837:: with SMTP id 52mr13730351oty.143.1541453256007; 
 Mon, 05 Nov 2018 13:27:36 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Nov 2018 22:27:24 +0100
X-Gmail-Original-Message-ID: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
Message-ID: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
Subject: WireGuard for iOS - TestFlight
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

Hey folks,

For the last few weeks, Roopesh and I have been hard at work on the
WireGuard for iOS app. Today we're happy to share a
likely-buggy-and-broken TestFlight that you can run on your phone:
<https://testflight.apple.com/join/63I19SDT>. As usual, use at your
own risk, especially since it's alpha quality.

Please let us know about any bugs as you find them -- you can send
them to me or to team@wireguard.com. Our current TODO list lives here
[1], linked via the main project TODO list [2], and if you're an iOS
person and want to contribute code, we'd be happy to have you on
board.

The app costs $3.99 and requires an email address to sign up; we
manage all your tunnels for you in the cloud. JUST KIDDING! Like the
rest of WireGuard, the iOS app is free and open source [3]. I make
this rather tasteless joke, because of the rather surprising
quantities of people encouraging me to do the iOS stuff as proprietary
paid software, because "apple users will pay" or because "open source
is cool, but iphone folks don't care about it so you can get away with
charging" or because "none of the other vpn players are doing open
source mobile implementations" or even because "apple is more likely
to accept paid software into its app store" and so on and so forth.
But, as usual, I much prefer for this to be a community project than a
closed one, and so like everything else, it's FLOSS.

Enjoy! And do let us know about the bugs as you run into them. I'm
sure there are plenty.

Regards,
Jason

[1] https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY
[2] https://www.wireguard.com/todo/
[3] https://git.zx2c4.com/wireguard-ios/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

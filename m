Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B67C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 08:48:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7DC20872
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 08:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RPLDzG/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7DC20872
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51ebe679;
	Wed, 16 Oct 2019 08:48:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0349b86
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 08:48:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id faaffec8
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 08:48:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 053a532f
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=byaImK
 xNNBawYAGymNrrpd0W2AA=; b=RPLDzG/cZ37bqkobaONUayJptTEUfPZFiBBvpt
 a1AZfD3s9Bt/HIzsN9iFa47hQQHGa/5HKyU5Y2TaPVz7Z4nayNYwXudQa1aGSgry
 Kz9L+9W7sYuvf/okOYSUaT9DicpFlSF3nJ8NblXi4apiNPGEp/7tgh2gQzvS7JAQ
 EboNdQJyR8bDItd47oyDYMSoP6hD1H3j+DJjICzCOKpmCBkc/kzTvG3YxT/V+bhJ
 paOZOIs1Xgf5Uupu8ldtKM8f54+ayCETu8HaU9Jng2zX6HXXpVhLts5JZby/CdTR
 yW8qgNq1OYsg6tLehdDnQ82X140h5iIryfz36eU1HZEL1eRw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ef88ed5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 08:00:10 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id g81so1163913oib.8
 for <wireguard@lists.zx2c4.com>; Wed, 16 Oct 2019 01:48:34 -0700 (PDT)
X-Gm-Message-State: APjAAAV0qUzN3wCp8X9yGevBoRqS8EqZTiRiLo0WO4XrSh2tCD9QZTJS
 TJPdQcJ4Y3Cq831zmQ+8yAMyupWEPUG1z6iVKxA=
X-Google-Smtp-Source: APXvYqxKUXIpUPL5STLCiq/4prjjKpBXJo0xaZ4wSMqSRNp/Ub0qIGcQ4lDCNNeBZ4DV9KTRx/k1As5P0OTsTJHd2Yw=
X-Received: by 2002:a54:4f04:: with SMTP id e4mr826879oiy.115.1571215713332;
 Wed, 16 Oct 2019 01:48:33 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Oct 2019 10:48:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9rcxwHNwT33cQzP6pGf64YG1Sz5iJtjQcOyFGanQf-CMg@mail.gmail.com>
Message-ID: <CAHmME9rcxwHNwT33cQzP6pGf64YG1Sz5iJtjQcOyFGanQf-CMg@mail.gmail.com>
Subject: WireGuard removed from Google Play Store, rectification in progress
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

Hi,

After waiting several days for Google to review our app -- apparently
the process is manual now and they're quite backed up -- I was
delighted to learn this morning that the app was approved. Then, 20
minutes later, I received a letter saying that the entire app listing,
not just the latest version, has been removed and delisted from the
Play Store.

They said it was because we're in violation of their "Payments
Policy", presumably because we have a link inside the app that opens
the user's web browser to wireguard.com/donations/ . I appealed using
their website appeal form. Thirty minutes later (was this automated,
unlike the manual app review process?), I received a rejection of the
appeal.

I immediately made this commit --
https://git.zx2c4.com/wireguard-android/commit/?id=f0bab44b4a17b65e9f7e718a9ba9b2bc37041268
-- and uploaded a new version. We're now waiting for a new, presumably
manual, review of the app. Until then, it is entirely unavailable on
the Play Store.

Sorry for the inconvenience. I'm sure many users are just as annoyed
as I am. In the interim, luckily F-Droid has our app:
https://f-droid.org/en/packages/com.wireguard.android/

I'll send an update once we're reinstated on the Play Store.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

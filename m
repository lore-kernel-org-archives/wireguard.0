Return-Path: <SRS0=9eeE=BB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611D8C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jul 2020 15:03:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2482065D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jul 2020 15:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GX9lvmm3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB2482065D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00f93bc7;
	Wed, 22 Jul 2020 14:40:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c6c04c5b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 14:40:42 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c335b0be
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=USF4guWeTxaS/ZDmfC+ix8+nCzk=; b=GX9lvm
 m3cfVq6SWiuEClPSMYZmczfxpnqcL9r1TI0v5Deakl8K/j2wlAgHV+5bDNwJ1bW+
 HLZ42hHNyXGtUCItSuGP/M+diAHPVVgBNKpAEVXjCvrUK/FcWRJUtyPuhoF/dlea
 QMpbxEuKRYxN/ISyg1iQPF5Eu2kg0YeZ7DTtXp4ISmFHIFVeSfLotZTt7aZXHzBl
 2XHU7eWB84ISi+DtSNuDWUk0vHAYTiyJi342LIUSXBvYE7IMcBXfRLNO2VuJNKNb
 /OQ9bwBH2kEXA7aqT1ucB+Fn6ZJD8P8gstUQ/eToWxKQY+qoDYVJ6xe0jEJrpxff
 Gqu8gz21RTNDOHlg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 427bc3a0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 14:40:41 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id v6so2892356iob.4
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jul 2020 08:03:21 -0700 (PDT)
X-Gm-Message-State: AOAM5301FDLz+ZC48I6Q8G5fdO4UCoN2VDfHrkYANPCLEYdMHaKk3ZHU
 aDE4aEZhpbVyaBC9iGhcIRkQW+cfXeg15wBeg70=
X-Google-Smtp-Source: ABdhPJy0VgnkMnwu16tuQ0zRilh2QKF6c9I7qkkGwsSXmV4ql5ZC2LbgE8yO9+o+K+wYFvDqGdRcPYXtXnWaGmxfQzM=
X-Received: by 2002:a6b:5813:: with SMTP id m19mr181787iob.29.1595430200340;
 Wed, 22 Jul 2020 08:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
In-Reply-To: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Jul 2020 17:03:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9qqvQreS6osx6xdWyBu5UYtFscNkctXZUWmY6c8e7gGbw@mail.gmail.com>
Message-ID: <CAHmME9qqvQreS6osx6xdWyBu5UYtFscNkctXZUWmY6c8e7gGbw@mail.gmail.com>
Subject: Re: final call for Ubuntu 14.04 WireGuard support
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Jasper Knockaert <jasper@knockaert.nl>, Roman Mamedov <rm@romanrm.net>, 
 Andy Whitcroft <apw@canonical.com>, unit193@ubuntu.com, 
 Joachim Lindenberg <wireguard@lindenberg.one>,
 Daniel Kahn Gillmor <dkg@debian.org>
Content-Type: text/plain; charset="UTF-8"
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

We've added a warning to the 14.04 package in the PPA now:
https://data.zx2c4.com/sunset-wg-14.04.gif

Hopefully this will encourage folks to let us know if there are
actually lingering 14.04 users.

Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF88BC35673
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 09:04:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D27E20656
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 09:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X09PVhFi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D27E20656
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 556d524c;
	Sun, 23 Feb 2020 09:00:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed14415b
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:00:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6cc03c4
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:00:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c141e23e
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=HwTZ3jDAchTwWWO1PfDerG4MytY=; b=X09PVh
 Fi1uX0ktBf6OMQ11X/UNH06gSz5O4HMwTqG0jYZyruj48McPo8tiSyfBTzS/TJqP
 BqbkbQuSzUJF6VaMSRi6j2Hwv19p59nO5QWR1/Z5n8VJpe/jpoU/Fann+fI/AwDB
 1Pm+FoAxrCjc8hju/B/1cbn3zdu1UD/I97W6JzrIka1EfgvprprVFAeIs+W+VB6I
 sNoPa5uhzEFm4yu9EmHwFMHtiqUvFf7m90T4BGMgcchNtpYu0OlOS94fenOnGoPo
 KZJIoLlm4Wj3rZjm4GelOfCUSlTpULbmbttLnWCXjmljW/uuqEi/ED59pJSeV5CE
 phXk5BClY4OdyPHg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3bbbde95
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:00:50 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id p8so6020855oth.10
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 01:04:05 -0800 (PST)
X-Gm-Message-State: APjAAAVyypdCoadv7XY4D+DwKjKvLll9nac17aV8WGX1N63ukP2VvpTv
 OnmPT66QIq6laAjRxjrVFRWw3qQYIK5+p1H+Tqs=
X-Google-Smtp-Source: APXvYqwsgySHmubVwzZDXdVErqE+znD7+tl7o0h0qx3VX/gNpZM/bNuhqOi93tpHBibXIRhoXmb/bgB8sUhifpgv2J4=
X-Received: by 2002:a9d:24c8:: with SMTP id z66mr36552460ota.52.1582448644446; 
 Sun, 23 Feb 2020 01:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20200223071116.92249-1-tanioka404@gmail.com>
In-Reply-To: <20200223071116.92249-1-tanioka404@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 10:03:53 +0100
X-Gmail-Original-Message-ID: <CAHmME9oi6Byxep7f02by06r36xEv+JxPmjpryovf5fPLcU78PQ@mail.gmail.com>
Message-ID: <CAHmME9oi6Byxep7f02by06r36xEv+JxPmjpryovf5fPLcU78PQ@mail.gmail.com>
Subject: Re: [PATCH wireguard-apple] Japanese Translation
To: Eiji Tanioka <tanioka404@gmail.com>, Roopesh Chander S <roop@roopc.net>
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

Thanks for the translation! Very appreciated.

https://git.zx2c4.com/wireguard-apple/commit/?id=9fd7e609f95150c1c30e232a884e13e6dfba251e

I stripped out a lot of those xcodeproj changes. Perhaps Roopesh
(CC'd) can have a look in case I missed something.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

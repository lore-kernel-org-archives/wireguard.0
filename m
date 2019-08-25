Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B531C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:22:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169BB206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITsLOWNu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 169BB206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdd4f115;
	Sun, 25 Aug 2019 19:22:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2ed0074
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:03:26 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c85acf6
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:03:26 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id j5so32083997ioj.8
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=84wtIiu3GD9uXD1ilqqxIRpDBpnFIYXz8uz3850Xinc=;
 b=ITsLOWNuCxQ417fMBLTizVbzK4d+SthIDjRxq27FmK2LjZQVtmepA529/1MTQfujLe
 JK+5bTeX/j2ZkS6Zlxon9KCDKPIQLIzkxW6aXfF38CwXZhmWerd75NatTLihan6PcIQm
 VhrJsp4fOuVB+dfCDcwrbZWhDpF/Y52492olFAxa11CvpF4e+PHcueJQwO3N+pdRNtF+
 NYcAKHni3lxwaXAg1lUrjCurOvaC6j4bh4UVs0Hzt4F5hUWPzFxy30fHsAuxufvT6GRx
 SM+7i5zNqxa0EJnF9a3Njd268H6YPb5CmnOeyuCQIbdlFZwiHMRyGGDSQpDkyhp26jL8
 raDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=84wtIiu3GD9uXD1ilqqxIRpDBpnFIYXz8uz3850Xinc=;
 b=TW83ZLQSyeP7bG7QANwMwnDhww/DU8QsNUd9dcyoPCjgaVNT4h1tvwBPVlNeZNcJr5
 PhXi3uJ99Z5Sc/fC2WLX4Ks/JB7GsBRu2j1feU1iwRlbe1450ZfONgTQvIc7E/sr9IvE
 t414usC+JGx1FoFgfenER+chA4nTmbYs5LVGpnW7fJIcFrAfqp1tcCcyE6/KW6iIVMVm
 UPLCdsvfQ1RlrcrUBSZmkU1F6zgFAU+1X3v+eegaV9VlUugPRM6rIWFGTHBNnC2/REMz
 HhaV5H73PNGoahCcEDh/7bVH1uARvG+TU+Izkwe+s6Pgo+ZUwQpbuUPCfdLdcFJtWcKy
 gPwA==
X-Gm-Message-State: APjAAAX/ILjn/igToIoK/rzKm6oQlkLx3UZ0Ts1vZPIY8VzcbArxYhfw
 9ez3dcrFAi1Zkl9BQNWw6dRuwmVZPf2ZcoT7njKr0Eh+HgilwQ==
X-Google-Smtp-Source: APXvYqwL/U+aUuJkFATV0m/lh7muf/Bz3eKFJFDRM3yX65X+mYkqq7jZDo3Nk0QzryEvCuQPAz4StdfsnMsoZOU+LPI=
X-Received: by 2002:a6b:3b57:: with SMTP id i84mr20625497ioa.145.1566759806466; 
 Sun, 25 Aug 2019 12:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
 <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
In-Reply-To: <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Date: Sun, 25 Aug 2019 22:03:30 +0300
Message-ID: <CANH_QeYk=1HyuOFgg2_1YxHNyR9keWH883BD90bKvQn3im497g@mail.gmail.com>
Subject: Re: Linux kernel 5 different behavior
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Sun, 25 Aug 2019 21:22:54 +0200
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

Yes. On kernel version 4, outer packets (i.e. encrypted packets) are
sent from privileged user
account credentials so they pass the iptables sandbox. On kernel 5
they inherit owner id of the user who sent unencrypted packets.

.

On Sun, Aug 25, 2019 at 9:52 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Could you clarify? Do you mean that inner and outer packets were
> marked differently in Linux < 5 but are now marked as belonging to the
> same UID in Linux==5?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

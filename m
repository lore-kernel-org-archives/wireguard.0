Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EDFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 21:59:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B84C208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 21:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CFf4FyTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B84C208E4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0af5dad7;
	Mon, 20 Jul 2020 21:37:07 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7ab02975
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 21:37:05 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb26e253
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 21:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=E8Pd1QP8AWWZvJ2cTus1hB6BCcg=; b=CFf4Fy
 Tlei/Xw0wuCeVpPbWnH0tBBNaFjUmWc4cAjnHHioVxqSvBVQmbEAegR3YpE4yk4T
 Dm7TocSF5teexAquK2wv79ZdDoFM/J7w7f22Kib6h6YaickbCGrpbcjP6JGp73Oh
 3zX2sGNeO0byvzvcTdbFykT0VJ+uw3dDVIWSWIY3vc6ydRmZ6YQObHyJ1MUr0KHf
 RYDirYeorm18UvG66PmM75Dz4Hb/qOMTr1IeV0g60NgRszpkLNg5Qw4AcB3AW8VV
 cGs4ds1lN24kpoEQ0aFFlFPPWlglhayRzld5sjffo+jFJyBIbpENB1AOSg0QWjA0
 48IPkqZNFCLWe8CQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 066132b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 21:37:04 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id e18so14671247ilr.7
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jul 2020 14:59:31 -0700 (PDT)
X-Gm-Message-State: AOAM5330vH020uV9jjpNw73Ch2fuvo5ARtFspAT0sIsfG7BL1JJTiYf3
 dF49+7S86E7ig0xZshzglERPQnFI7pQVrnOpMy8=
X-Google-Smtp-Source: ABdhPJze7ssrfVBfTELYWeFA4JOFo+cDoNET4FEwLccu2LXaW5Pcx75dJyAtodAYtkmPuR0T+CnLICCWcuBhUSzMeIA=
X-Received: by 2002:a92:50f:: with SMTP id q15mr25989817ile.38.1595282370636; 
 Mon, 20 Jul 2020 14:59:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a92:1c7:0:0:0:0:0 with HTTP;
 Mon, 20 Jul 2020 14:59:29 -0700 (PDT)
In-Reply-To: <076601d65ead$b4094d70$1c1be850$@lindenberg.one>
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
 <CAHmME9pyp7z7043ZwvRv0huy9n1zL3x6O7o4w5EsQdg5WsOsdQ@mail.gmail.com>
 <076601d65ead$b4094d70$1c1be850$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Jul 2020 23:59:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9o2Tyx2Luy_qiEcfGQ7j7DZH_VM1vyk4rzh8=+mfpMaEg@mail.gmail.com>
Message-ID: <CAHmME9o2Tyx2Luy_qiEcfGQ7j7DZH_VM1vyk4rzh8=+mfpMaEg@mail.gmail.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
To: Joachim Lindenberg <wireguard@lindenberg.one>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Andy Whitcroft <apw@canonical.com>
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

On 7/20/20, Joachim Lindenberg <wireguard@lindenberg.one> wrote:
> Would be great to have the truth at https://www.wireguard.com/install/.

Looks like Andy has already fixed the problem.

> With the addition of bionic-proposed wireguard installs, but wg-quick fails
> because of "/usr/bin/wg-quick: line 32: resolvconf: command not found".
> Looks like a dependency is not set.
> Which of  openresolv or resolvconf is the recommended path?

Both are part of Recommends: for this optional functionality, so the
dependency in the package is fine.

Use openresolv.

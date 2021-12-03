Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184BAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Dec 2021 22:22:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c32916c2;
	Fri, 3 Dec 2021 22:20:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6aa6090d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Dec 2021 22:20:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 284B1B82972
 for <wireguard@lists.zx2c4.com>; Fri,  3 Dec 2021 22:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB3EC53FCB
 for <wireguard@lists.zx2c4.com>; Fri,  3 Dec 2021 22:20:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="nGfldUdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638570023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B83XfmHsPJE5Tcjo66pWCJl2zJIfQnoVchUzigi51UU=;
 b=nGfldUdnsgJfxEFf6ww3UITZ3jUcuY7byVfYOOiu3isZSIbCWl7hg0N1h8AhQzw4qNr+BX
 QRrNZD9/oPIiW4il1MnpXzResDBnSTSH66sAZg5aKg1VUbF2dKnSx90+01ZSwlhhoN9WBI
 WAd0SUN8DkJequWMc7wadbm3qRJad8Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 626e7f26
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Dec 2021 22:20:23 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id v203so13358214ybe.6
 for <wireguard@lists.zx2c4.com>; Fri, 03 Dec 2021 14:20:23 -0800 (PST)
X-Gm-Message-State: AOAM530yqPSNKNrT+2u1sFAZNqBGyRGPqwKesfN2E9WkgsvFwoZrOOyB
 wzB/PYyC+aLaW4k+Ct4ktv9DX3Xqd6SrY7Q/kLE=
X-Google-Smtp-Source: ABdhPJzx+LR8ZnhXpNCYkEJy5IG92p1PJ2kz5qUUb6oIqyKBFuA6BHzzfPZxrtgwWyGGGtUHBCFb+wkH5vGnx1j5JoE=
X-Received: by 2002:a25:9781:: with SMTP id i1mr26379197ybo.638.1638570022494; 
 Fri, 03 Dec 2021 14:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
In-Reply-To: <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Dec 2021 23:20:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
Message-ID: <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Mathias,

This resulted in kind of an interesting regression with old compilers
on old kernel versions when I backported this to
wireguard-linux-compat:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=8118c247a75ae95169f0a9a539dfc661ffda8bc5

The 25519 tests fail for 4.8.17, 4.7.10, 4.6.7, 4.5.7 with gcc 6:

https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.8.17-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.7.10-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.6.7-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.5.7-x86_64.log

But then they crash for 4.0.9, 3.19.8, 3.17.8 with gcc 5:

https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/4.0.9-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.19.8-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.17.8-x86_64.log

And also crash with 3.16.85, 3.15.10, 3.14.79, 3.12.74, 3.11.10 with gcc 4:

https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.16.85-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.15.10-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.14.79-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.13.11-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.12.74-x86_64.log
https://build.wireguard.com/wireguard-linux-compat/e8db181d62467da6c476cf4ac21e13dd477612c8/3.11.10-x86_64.log

Any intuition about what might have happened?

Jason

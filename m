Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE59EA811B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Feb 2026 13:49:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77d7153c;
	Tue, 10 Feb 2026 13:49:45 +0000 (UTC)
Received: from mailout02.platinum-mail.de (mailout02.platinum-mail.de
 [2a0a:4cc0:0:fc1:b5ed:8d94:185a:b8db])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09134fd8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Feb 2026 13:45:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailout02.platinum-mail.de (Mail Service) with ESMTPS id 54E869A29EC
 for <wireguard@lists.zx2c4.com>; Tue, 10 Feb 2026 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=achill.org; s=mail; c=relaxed/simple;
 t=1770731115; h=date:message-id:subject:from:to;
 bh=30YWCCywsFqXOCapORxeWZBaKqh2fHSzSHefbvGyRtg=;
 b=qR2OTLE3EUKcEeFSq90w4ms2kucSx+SaP6PkgJCDDEMAJiO1S7g9mjnpDK88SZCfH/vtM++vecu
 MVsdmKqcLzKPC3T7BodGZUlTBo0boDfc8ZRq4vjBEBAhtsoOsO6fzUxDX8ZQj/RXNWFihb9VFcKGh
 Plhho+YX51ZboB1x8Ng65kxZ/3c+qXsm9c6zFUp/DAFeFm9554n+/jSlE1JuABTuE9bIDO1x0pMUy
 8nFQwBVT49BWcLVMhsQvIrXJjvtAQlp1wqU1Z0fvNu27D1ayLA/HjIj6BOa44zjDGLV7TzgBqW54k
 bTiX2lqf5h8wtcdx1DhmeEF5RZ6iHn2ki4/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Feb 2026 14:45:14 +0100
Message-Id: <DGBBSJYQAMQM.1CU0U4FRNSAQE@achill.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: Arch Linux - out of date?!
From: "Achill Gilgenast" <achill@achill.org>
To: "Christian Hesse" <list@eworm.de>, <wireguard@lists.zx2c4.com>
X-Greeting: Hi mom! Look, I'm in somebodys mail client!
X-Mailer: aerc 0.21.0
References: <20260210143016.0144acf1@leda.eworm.net>
In-Reply-To: <20260210143016.0144acf1@leda.eworm.net>
Content-Type: text/plain; charset=utf-8
X-Mailman-Approved-At: Tue, 10 Feb 2026 13:49:38 +0000
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

On Tue Feb 10, 2026 at 2:30 PM CET, Christian Hesse wrote:
> Hello everybody,
>
> for some time already I am annoyed by mails clogging my input regarding
> wireguard-tools for Arch Linux being out of date. Obviously this is not t=
rue,
> I built the package the day of release. [0]
>
> Now found the install page mentioning the package being out-of date... [1=
]
> What goes wrong and how to fix that?
>
> [0] https://archlinux.org/packages/extra/x86_64/wireguard-tools/
> [1] https://www.wireguard.com/install/#arch-module-tools

Hi, Alpine dev here. The same issue is also for Alpine Linux. It has
been up-to-date for a long while, yet people are spamming out-of-date
email to Natanael.

I could find no website development source or something, where this
behavior could be improved.=

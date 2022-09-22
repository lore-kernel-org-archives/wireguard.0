Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9426C6FA86
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 11:53:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b2183785;
	Thu, 22 Sep 2022 11:48:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d7f50b6a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:48:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3D3E62D2C
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7E9C433D7
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:48:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FYnW9ihF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663847305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TosPzQY45bZGoFaqZcePinzv4ZXOw+khGVuMYmymYSI=;
 b=FYnW9ihFFGdvnhJmCX4m9O91GkGZnfwp7QXP5NwkQAR/NHkT6TWequ75O6UuLNXWcvLVcq
 8WAgkCx309vKkgHGKUMvbTw6q3t7hMzOea7z8dK29kdwctXKWv7Aib1WNWQrhYzn4vn0VZ
 sSlYHQxRFVa5zjhD4ZxTfUiO7x0Let0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3559c86a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:48:24 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id i17so3544416uaq.9
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 04:48:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf1ucpgY8TAtRvap7eYfuEuQ0n4fzeE5sTJ3HEWIckpiTIGr66tX
 zirTX8erbOvsBp+Lp8uo/3CoSvYBlAfaLwLGur8=
X-Google-Smtp-Source: AMsMyM7nRutWwMORR6AtXA5wclkuXZJa3OZ+U+6/RnVZQklHWAp3eJp+/YTo2B8Rb0S9JseSlglcZ6MjNha8D5aqBIk=
X-Received: by 2002:ab0:6154:0:b0:398:c252:23d8 with SMTP id
 w20-20020ab06154000000b00398c25223d8mr1055744uan.65.1663847303981; Thu, 22
 Sep 2022 04:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
In-Reply-To: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Sep 2022 13:48:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9o1psix3jGC5tx81dG_7D+WVrBhjYSho-_tLGu=S7H+1Q@mail.gmail.com>
Message-ID: <CAHmME9o1psix3jGC5tx81dG_7D+WVrBhjYSho-_tLGu=S7H+1Q@mail.gmail.com>
Subject: Re: MacOS app update needed
To: Simon Karberg <simon.karberg@agillic.com>
Cc: wireguard@lists.zx2c4.com
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

On Wed, Sep 21, 2022 at 9:31 AM Simon Karberg <simon.karberg@agillic.com> wrote:
>
> Hi,
>
> I've been testing the Domain Search functionality on all 3 OS'
> (Windows, Mac & Linux) and the setting:
>
> DNS=<dns server>, <search domains>
> Is only being applied on Windows & Linux.
>
> Further testing on MacOS I've found that the homebrew installation works.
> wiregurd-go is version 0.0.20220316 and wireguard-tools is version 1.0.20210914
>
> The App Store app is version:
> App: 1.0.15 (26)
> Go backend: 2ef39d47

Huh, that's surprising. This was added a few years ago with 9231c035
("global: support DNS search domains"), so it definitely *should* be
supported. Might be a bug with the network config from
PacketTunnelSettingsGenerator. I'll look into this when circling back
to wireguard-apple development. Thanks for mentioning it.

Jason

Return-Path: mike@pmfarmwald.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a9df11f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 21:41:10 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e9a4474
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 21:41:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m1-v6so3376509wrg.5
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jul 2018 14:48:34 -0700 (PDT)
From: "mike@farmwald.com" <mike@pmfarmwald.com>
References: <131640bf823f0fba0adf5985e2e8aa17@mail.gmail.com>
 <CAHmME9r0rTCydGrf9cB474j1GOavzsdf8rDwLUhmMiK9FsTYbQ@mail.gmail.com>
In-Reply-To: <CAHmME9r0rTCydGrf9cB474j1GOavzsdf8rDwLUhmMiK9FsTYbQ@mail.gmail.com>
MIME-Version: 1.0
Date: Tue, 10 Jul 2018 14:50:08 -0700
Message-ID: <3980181ad4f2980831b273db734f7772@mail.gmail.com>
Subject: RE: Wireguard fails on recent updates for OpenWRT on Turris Omnia,
 but same versions work on other (Linksys) routers with same CPU
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: mike@farmwald.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I need to do a little debugging first, but...

Fail = no handshake, no connections. Nothing in the log that I can see. Does
Wireguard log failures anywhere?

Turris Omnia = Marvell Armada 385 (2x 1600MHz ARMv7)
Linksys WRT32X = Marvell Armada 385 (2x 1800MHz ARMv7)

Both are using 18.06rc1 OpenWRT release. Wireguard is 201806xx (25?)
release - how I tell? Wg show doesn't list the version.
Same config on WRT32x works, fails on Omnia.
This isn't time critical, and as soon I get a little time I'll get more
info.
The older Omnia is using a very old version of wireguard, probably from 2017
(again, how do I list the version?) which works.
Mike

> -----Original Message-----
> From: Jason A. Donenfeld [mailto:Jason@zx2c4.com]
> Sent: Tuesday, July 10, 2018 1:59 PM
> To: mike@farmwald.com
> Cc: WireGuard mailing list
> Subject: Re: Wireguard fails on recent updates for OpenWRT on Turris
> Omnia, but same versions work on other (Linksys) routers with same CPU
>
> Which versions are failing and which are succeeding?
>
> What symptoms precisely do you mean when you use the word "fail"?
>
> Which "Linksys" routers and "CPU"s do you specifically reference?

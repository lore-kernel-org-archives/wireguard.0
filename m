Return-Path: <SRS0=QM1B=NM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF8FC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:29:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092FB61212
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 092FB61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cf42fdc;
	Sat, 21 Aug 2021 20:23:27 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ba48fa9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Aug 2021 11:17:01 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id v16so9146795ilo.10
 for <wireguard@lists.zx2c4.com>; Fri, 20 Aug 2021 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Vmy6NA8K+lVmk3BMXPkyZCrqJYWoL66bBEjoy1jTtYw=;
 b=UzIJYhmtAvtX6CIjSJkpTs5SS3CgA0EFqurFgjR5g+qcjhhen2Stj3o+iNbX4ekGhV
 QgJPERbZa9afai+ci8E7LskiO5uCPbhP7oz9zst4WRrB0GHggeowAbYvz9bOgp44qGhK
 RzdKligu2zT0Uc4/TdcCoTVKxEH4voLZ0jsrZpfyOvNmR880bmAd0UNxaSoowX2YX+kO
 Y2VX6fLpuawADjify5NICNH11Uutip5298nHPm82Fi8q+4RDVIePrxOQ1bEd8aCaWKZP
 BoAS0M19NMe/QJ8dr0iav4Zr9bgwCU7+NSZ3xjJU92F8vXqWkp7jqYRdHGUSaJDaa9RO
 WApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Vmy6NA8K+lVmk3BMXPkyZCrqJYWoL66bBEjoy1jTtYw=;
 b=QLD+8mn4I5XvZTI2lAc0iMzMhaeWoSg0XvOjKdT9UrtKSwxv7Qtsp5MTos6pxenvsy
 6+smBicn3u74saSgSIQqztecwjIR96f9/B9cytljJ7NC4vrctN1Yk1oViueJACA9IsNn
 H3j2d6ks1p0eUokFBd0E+0JpJe0jaXpXAhyuEu3Xk6ER3amhgONnIMVHEbQ/K5nrxWw8
 SjdDV4TKOdW+A1ggdiGYxMRxSU1CJv3jYj2x2jGFF3gDvf/mJf4mtAuwLm15A6icu9we
 2v1B/VWrlj/ZjP0D7SBLvy0OKI0P6MetPckVJ267nVt0q/HDBxw947iagHZUHpYYqmDp
 Uarg==
X-Gm-Message-State: AOAM530CTJbnsc7V9/AmOUq8zWmoGj/1TIGi4KRgBmvPcqJrp5UKP90B
 tCmoCoNVI6Nb7NFVLmudzaUO3TRljg5SbvQXzFaPmdVRSeSW2A==
X-Google-Smtp-Source: ABdhPJz9t7F0FgyE2Z9O+9zpxFx/1mfqirjdlT/+mt96xDLT7mykWrf3KOa7BE+H049uwByuC0hyplL1w3OUUjMuW1I=
X-Received: by 2002:a92:da4c:: with SMTP id p12mr12262460ilq.89.1629458220436; 
 Fri, 20 Aug 2021 04:17:00 -0700 (PDT)
MIME-Version: 1.0
From: S Bauer <sanderbauer@gmail.com>
Date: Fri, 20 Aug 2021 13:16:34 +0200
Message-ID: <CA+MSESn8FSHVmOjHQGsNsQqu89ijP3uGiz3ohE3Lbh6LHM3meA@mail.gmail.com>
Subject: enabling WG0 allows telegram but impedes browsing
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 21 Aug 2021 20:23:26 +0000
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

Hello team,

Hoping you could help me out with a foggy situation.
The past week I have been struggling to get the Wireguard VPN working
smoothly. Everything seems to work on paper, except in a specific way
it doesn't. I am using Pop!_OS 21.04 (Ubuntu Hirsute).

SitRep;
I work as a freelance consultant and want to be careful about the
local networks' peeping tom when accessing sensitive work documents
from 'out of office', e.g. at a friend's place or at a hotel. So my
objective is to access my home network via PiHole and then continue
onward to access my work-related documents on a fileserver.
I was hoping this could be easily achieved with Wireguard.

Using the Wireguard VPN wg0 with wg-quick worked perfectly when I
connected to my brother's phone hotspot (4G). I could access our home
via VPN as expected and could work on my documents without any
problems.
The trouble is that I am now at a different location, working with a
fixed router from Ziggo NL. For some reason the WG0 still connects
perfectly, but after that a small mystery occurs. I did not make any
modifications to WG0.conf, so I remain stumped.
With WG active, I am no longer able to access any webpage. So no
access to protonmail\gmail, reddit or anything else. Telegram,
however, is still working fine. Internal machines on the home's local
network (IP-camera) can also be accessed directly.
Disabling the WG gives me full access to any webpage as usual. So
something is amiss that affects my browser only (Firefox 91.0).

I already did some troubleshooting. Starting with Uncomplicated
Firewall (UFW). I tried disabling UFW and rebooting, but this did not
change anything. I still lacked browser access when connected with
WG0, but Telegram still worked fine.
The output from sudo wg is;
interface: wg0
  public key: (hidden)
  private key: (hidden)
  listening port: <portnumber>
  fwmark: 0xca6c

peer: (hidden)
  preshared key: (hidden)
  endpoint: >our_endpoint_name<.ddns.net:51820
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 3 seconds ago
  transfer: 92 B received, 4.77 KiB sent

To be on the safe side, I added several rules to UFW (and reloaded UFW
each time) per advice from
https://jianjye.medium.com/how-to-fix-no-internet-issues-in-wireguard-ed8f4bdd0bd1
, leaving me with the following output from ufw status verbose. (But
like I said, the problem occurs even with UFW disabled.)
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
Anywhere/udp on wg0        ALLOW IN    Anywhere/udp
<portnumber>/udp                  ALLOW IN    Anywhere
<portnumber>/udp                  ALLOW IN    Anywhere
<portnumber>/udp on wlp0s20f3     ALLOW IN    Anywhere
Anywhere/udp on wlp0s20f3  ALLOW IN    Anywhere/udp
<portnumber> on wlp0s20f3         ALLOW IN    Anywhere
Anywhere/udp (v6) on wg0   ALLOW IN    Anywhere/udp (v6)
<portnumber>/udp (v6)             ALLOW IN    Anywhere (v6)
<portnumber>/udp (v6)             ALLOW IN    Anywhere (v6)
<portnumber>/udp (v6) on wlp0s20f3 ALLOW IN    Anywhere (v6)
Anywhere/udp (v6) on wlp0s20f3 ALLOW IN    Anywhere/udp (v6)
<portnumber> (v6) on wlp0s20f3    ALLOW IN    Anywhere (v6)

Anywhere on eth0           ALLOW FWD   Anywhere on wg0
Anywhere on wg0            ALLOW FWD   Anywhere on eth0
Anywhere on wg0            ALLOW FWD   Anywhere on enp40s0
Anywhere on enp40s0        ALLOW FWD   Anywhere on wg0
Anywhere on wlp0s20f3      ALLOW FWD   Anywhere on wg0
Anywhere on wg0            ALLOW FWD   Anywhere on wlp0s20f3
Anywhere (v6) on eth0      ALLOW FWD   Anywhere (v6) on wg0
Anywhere (v6) on wg0       ALLOW FWD   Anywhere (v6) on eth0
Anywhere (v6) on wg0       ALLOW FWD   Anywhere (v6) on enp40s0
Anywhere (v6) on enp40s0   ALLOW FWD   Anywhere (v6) on wg0
Anywhere (v6) on wlp0s20f3 ALLOW FWD   Anywhere (v6) on wg0
Anywhere (v6) on wg0       ALLOW FWD   Anywhere (v6) on wlp0s20f3

Now all these rules may be barbaric overkill, and yes I will admit
that I have a limited understanding of what everything means and how
it affects my security. Though I am a linux newcomer and employ
duckduckgo to the best of my abilities the learning curve is still
pretty much in effect. That being said, do feel free to point out any
serious flaws I may have unwittingly introduced or simply push me
towards some longreads ;)

Any hints on solving this issue are appreciated.


Additional notes;
* the DDNS in wg0.conf is properly translated to an IP address each
time. So that seems to be no issue.
* I am currently using the Dutch Ziggo network, which already seems to
have a reputation concerning the use of VPN applications. Maybe the
issue lies herein?
* Should I consider this relevant? >
https://github.com/pop-os/pop/issues/773 I am a bit cautious about
doing more random stuff before actually understanding what is going
on.

Regards,
Sander

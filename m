Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93FEC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 18:24:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A302068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 18:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A302068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78a0c19e;
	Wed, 27 Nov 2019 18:23:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b775ee8
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 18:23:46 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1677e68
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 18:23:46 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j7so20990456oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 10:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=HNGB/Z0VivoU4NraH7DCYGij5EKhUAjdshdb11CAoT0=;
 b=SPkLS6QayqxKzcWQf2m3QibbMbJv9Zwadk4VTD0KgRTkR1pBumn+MrKLioPW+0DTFp
 NG8X7L5LAs3XeyOrwOnUY5rrOO0F8ouSTb6SJ3bVcTWIf7NQButaM/ZmvYF+ZQeITY5e
 sSBhhM313/IhqVtwauzbAi4TeyFKF/Ww30JbuB0N3/NJ6MjzXCs4D9EmbbAb2+ydkj0c
 m2tmuCZcdWo8IsdLcx3Qum5aFg8v9VDl1gt7W8GXRTUmBYBbNFnlSQH02ed/NuLGl7cd
 Zi1dliwAgE+Q349XpPr/OvNdA7Wal9hvMh2Ap/W6VP2ODRhwO0mbORtYS8uutYcBk+EI
 8OKQ==
X-Gm-Message-State: APjAAAUcx9stx2EfnceNRRZBFex/k3iq/dPmc4lXks++Pz8mjEvt/GJ4
 zDa4kJwjwvE0thspXUtntzCjRF+W
X-Google-Smtp-Source: APXvYqw2s+8dyIIIM6eTOT+Lpu/61Q8SMz0B5LDibV/Y+v/J8MUVGpNGp4sXVzDkMiEW4oHjVuwbeg==
X-Received: by 2002:aca:c702:: with SMTP id x2mr5075682oif.167.1574879025632; 
 Wed, 27 Nov 2019 10:23:45 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id g19sm663325otj.81.2019.11.27.10.23.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 10:23:45 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id x21so13869945oic.0
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 10:23:44 -0800 (PST)
X-Received: by 2002:aca:1e02:: with SMTP id m2mr5363023oic.81.1574879024721;
 Wed, 27 Nov 2019 10:23:44 -0800 (PST)
MIME-Version: 1.0
References: <CAG6CVpU7L67oBqM5vi7-oXfYN=jMF9urvfxz_qZqFjdm-a+F=A@mail.gmail.com>
 <CAHmME9pzEg9sn1PJMXrmttWjYvSzsRRfXugphES5kPPhqN2WZw@mail.gmail.com>
In-Reply-To: <CAHmME9pzEg9sn1PJMXrmttWjYvSzsRRfXugphES5kPPhqN2WZw@mail.gmail.com>
From: Conrad Meyer <cem@freebsd.org>
Date: Wed, 27 Nov 2019 10:23:33 -0800
X-Gmail-Original-Message-ID: <CAG6CVpVzkmt++KR6A=gzGG_cDC9Pusw6LhwnVUBSwTgEkULhnQ@mail.gmail.com>
Message-ID: <CAG6CVpVzkmt++KR6A=gzGG_cDC9Pusw6LhwnVUBSwTgEkULhnQ@mail.gmail.com>
Subject: Re: Bug in helper contrib/examples/reresolve-dns/reresolve-dns.sh
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: cem@freebsd.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8232719944523365131=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8232719944523365131==
Content-Type: multipart/alternative; boundary="000000000000d53361059858183a"

--000000000000d53361059858183a
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing it so quickly!

Would it be possible to use env as the interpreter for systems which don't
place bash directly in /bin?  I think that's my only other significant
local modification to the script on my BSD systems.  I.e.,

-#!/bin/bash
+#!/usr/bin/env bash

Best regards,
Conrad

P.S., If it is helpful, I also have some example SystemD unit files for
connecting this script up in that universe, which I'm pretty sure I stole
from ArchWiki (https://wiki.archlinux.org/index.php/WireGuard) but I don't
remember at this point.  It might be nice to other users to shove some
version of them in the examples/reresolve-dns directory as an example for
folks on systemd.

$ cat wg-reresolve-dns.timer
[Unit]
Description=Periodically reresolve DNS of Wireguard endpoints that have
stopped responding

[Timer]
OnCalendar=*:*:0/30

[Install]
WantedBy=timers.target

# The hardcoded wgnet0 below could probably be transformed into
an @.service, like wg-quick@.service.  Also, dnsmasq.service is just a
quirk of my personal DNS configuration; others might depend on different or
non-local resolvers.

$ cat wg-reresolve-dns.service
[Unit]
Description=Reresolve DNS of all WireGuard endpoints that have missed a
handshake
Wants=network-online.target dnsmasq.service wg-quick@wgnet0.service
After=network-online.target dnsmasq.service wg-quick@wgnet0.service

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'for i in /etc/wireguard/*.conf; do
/usr/share/doc/wireguard/examples/reresolve-dns/reresolve-dns.sh "$i"; done'

# Finally, here's an example of systemd units that use the more general
@.timer and @.service (but lack the unit dependencies):
https://gist.github.com/ephemient/45ffc8c143d3c4f3d1a940f4293e4b84


On Wed, Nov 27, 2019 at 04:31 Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Thanks for the suggestion!
>
>
> https://git.zx2c4.com/WireGuard/commit/?id=d05b6606886018853da20ca3ee8bda16524b53b9
>

--000000000000d53361059858183a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"auto">Thanks for fixing =
it so quickly!</div></div><div dir=3D"auto"><br></div><div>Would it be poss=
ible to use env as the interpreter for systems which don&#39;t place bash d=
irectly in /bin?=C2=A0 I think that&#39;s my only other significant local m=
odification to the script on my BSD systems.=C2=A0 I.e.,</div><div><br></di=
v><div>-#!/bin/bash<br>+#!/usr/bin/env bash<br></div><div><br></div><div>Be=
st regards,</div><div>Conrad</div><div><br></div><div>P.S., If it is helpfu=
l, I also have some example SystemD unit files for connecting this script u=
p in that universe, which I&#39;m pretty sure I stole from ArchWiki (<a hre=
f=3D"https://wiki.archlinux.org/index.php/WireGuard">https://wiki.archlinux=
.org/index.php/WireGuard</a>)=C2=A0but I don&#39;t remember at this point.=
=C2=A0 It might be nice to other users to shove some version of them in the=
 examples/reresolve-dns directory as an example for folks on systemd.</div>=
<div><br></div><div>$ cat wg-reresolve-dns.timer<br>[Unit]<br>Description=
=3DPeriodically reresolve DNS of Wireguard endpoints that have stopped resp=
onding<br><br>[Timer]<br>OnCalendar=3D*:*:0/30<br><br>[Install]<br>WantedBy=
=3Dtimers.target<br></div><div><br></div><div># The hardcoded wgnet0 below =
could probably be transformed into an=C2=A0@.service, like wg-quick@.servic=
e.=C2=A0 Also, dnsmasq.service is just a quirk of my personal DNS configura=
tion; others might depend on different or non-local resolvers.</div><div><b=
r></div><div>$ cat wg-reresolve-dns.service</div>[Unit]<br>Description=3DRe=
resolve DNS of all WireGuard endpoints that have missed a handshake<br>Want=
s=3Dnetwork-online.target dnsmasq.service wg-quick@wgnet0.service<br>After=
=3Dnetwork-online.target dnsmasq.service wg-quick@wgnet0.service<br><br>[Se=
rvice]<br>Type=3Doneshot<br>ExecStart=3D/bin/sh -c &#39;for i in /etc/wireg=
uard/*.conf; do /usr/share/doc/wireguard/examples/reresolve-dns/reresolve-d=
ns.sh &quot;$i&quot;; done&#39;<br><div><br></div><div># Finally, here&#39;=
s an example of systemd units that use the more general @.timer and=C2=A0@.=
service (but lack the unit dependencies):=C2=A0<a href=3D"https://gist.gith=
ub.com/ephemient/45ffc8c143d3c4f3d1a940f4293e4b84">https://gist.github.com/=
ephemient/45ffc8c143d3c4f3d1a940f4293e4b84</a></div><div><br></div></div><d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Nov 27, 2019 at 04:31 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@z=
x2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Thanks for the suggestion!<br>
<br>
<a href=3D"https://git.zx2c4.com/WireGuard/commit/?id=3Dd05b6606886018853da=
20ca3ee8bda16524b53b9" rel=3D"noreferrer" target=3D"_blank">https://git.zx2=
c4.com/WireGuard/commit/?id=3Dd05b6606886018853da20ca3ee8bda16524b53b9</a><=
br>
</blockquote></div></div>
</div>

--000000000000d53361059858183a--

--===============8232719944523365131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8232719944523365131==--

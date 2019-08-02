Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD80C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D36C2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dontlookhere.net header.i=@dontlookhere.net header.b="R3VenhIP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D36C2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dontlookhere.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ebd3d9f;
	Sun, 25 Aug 2019 15:41:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e0bd206
 for <wireguard@lists.zx2c4.com>; Fri, 2 Aug 2019 23:27:06 +0000 (UTC)
Received: from buffalo.birch.relay.mailchannels.net
 (buffalo.birch.relay.mailchannels.net [23.83.209.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2cbd45b
 for <wireguard@lists.zx2c4.com>; Fri, 2 Aug 2019 23:27:05 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|max@dontlookhere.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 8874E5021C6
 for <wireguard@lists.zx2c4.com>; Fri,  2 Aug 2019 23:27:04 +0000 (UTC)
Received: from pdx1-sub0-mail-a69.g.dreamhost.com
 (100-96-11-214.trex.outbound.svc.cluster.local [100.96.11.214])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id CAE6C501D02
 for <wireguard@lists.zx2c4.com>; Fri,  2 Aug 2019 23:27:03 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|max@dontlookhere.net
Received: from pdx1-sub0-mail-a69.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.17.5); Fri, 02 Aug 2019 23:27:04 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|max@dontlookhere.net
X-MailChannels-Auth-Id: dreamhost
X-Imminent-Bubble: 2edb51885a635825_1564788424338_3047694298
X-MC-Loop-Signature: 1564788424338:2048612686
X-MC-Ingress-Time: 1564788424337
Received: from pdx1-sub0-mail-a69.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a69.g.dreamhost.com (Postfix) with ESMTP id DB0E484B27
 for <wireguard@lists.zx2c4.com>; Fri,  2 Aug 2019 16:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=dontlookhere.net; h=
 mime-version:reply-to:from:date:message-id:subject:to
 :content-type; s=dontlookhere.net; bh=CJZiZtoj/H34l7fyItF/hX7FIm
 k=; b=R3VenhIPauV+B8vX60twfIZGHoxkVbOf0v9fPIsHK1y2FMsXPQbIKgrKd1
 nAYyi/LscEQfFQLW5ihu57Z+thy03RtSWkh5FYxcSFF/p2b5hBdm5LNrRniKFWpb
 vfpS85toGCTMUzNKE/ksrssSyb7e5QKOo8lVLNge77dNjvv/Q=
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: max@dontlookhere.net)
 by pdx1-sub0-mail-a69.g.dreamhost.com (Postfix) with ESMTPSA id 8BBCC84AFB
 for <wireguard@lists.zx2c4.com>; Fri,  2 Aug 2019 16:26:59 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id r21so56180755qke.2
 for <wireguard@lists.zx2c4.com>; Fri, 02 Aug 2019 16:26:59 -0700 (PDT)
X-Gm-Message-State: APjAAAUuEajsLj/Tzw7KYfhTHkdZg1cbNo9IBnVI5exRjshNzZx5eH6Z
 0TyV9RSjqRoVODRaOu+nEO8Lh7Kb9pvsGyuWkhQ=
X-Google-Smtp-Source: APXvYqwZSdTIz4cBDTGUcKAhSpVxjDUK8kTVu+XG0im0DPyS+eif0aDEqrtIQz482klgiiwDKbs5jVr9HJUgqgre+ko=
X-Received: by 2002:a05:620a:13ad:: with SMTP id
 m13mr85152790qki.469.1564788418426; 
 Fri, 02 Aug 2019 16:26:58 -0700 (PDT)
MIME-Version: 1.0
X-DH-BACKEND: pdx1-sub0-mail-a69
From: Max <max@dontlookhere.net>
Date: Fri, 2 Aug 2019 19:26:22 -0400
X-Gmail-Original-Message-ID: <CAEKBwLpTru7RTSkcc02gkp_=n4iN=wn7m5i0noUfRQyvdS73BA@mail.gmail.com>
Message-ID: <CAEKBwLpTru7RTSkcc02gkp_=n4iN=wn7m5i0noUfRQyvdS73BA@mail.gmail.com>
Subject: Bind WG to listen on specific interface instead of 0.0.0.0
To: wireguard@lists.zx2c4.com
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 0
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddttddgvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucenucfjughrpeggrhfhfffkuffvtgesrgdtreertddtjeenucfhrhhomhepofgrgicuoehmrgigseguohhnthhlohhokhhhvghrvgdrnhgvtheqnecukfhppedvtdelrdekhedrvddvvddrudejieenucfrrghrrghmpehmohguvgepshhmthhppdhhvghlohepmhgrihhlqdhqkhduqdhfudejiedrghhoohhglhgvrdgtohhmpdhinhgvthepvddtledrkeehrddvvddvrddujeeipdhrvghtuhhrnhdqphgrthhhpeforgiguceomhgrgiesughonhhtlhhoohhkhhgvrhgvrdhnvghtqedpmhgrihhlfhhrohhmpehmrgigseguohhnthhlohhokhhhvghrvgdrnhgvthdpnhhrtghpthhtohepfihirhgvghhurghrugeslhhishhtshdriiigvdgtgedrtghomhenucevlhhushhtvghrufhiiigvpedt
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:41:26 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: max@dontlookhere.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7266938441712433444=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7266938441712433444==
Content-Type: multipart/alternative; boundary="000000000000d43cc8058f2ab12c"

--000000000000d43cc8058f2ab12c
Content-Type: text/plain; charset="UTF-8"

Hello,
  I'm very much enjoying WireGuard.  Thanks for all the hardwork!
I am currently running WG on a high port but would like to use it on port
53.  It currently will not load on 53, I think because my system has
systemd-resolved running that is bound to 53 on localhost only.

I've tried a bit of Google-ing, I've read through the man pages for wg and
wg-quick I don't seen an option to restrict the interfaces or IPs on which
wg tries to bind [the port].

Is there something I'm missing or some other solution?  I'd rather not have
to remove systemd-resolved.  I did stop systemd-resolved and start wg on
port 53 which gets wg running but breaks local DNS resolution.

Thanks,
    Max

--000000000000d43cc8058f2ab12c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Hello,</div><div class=3D"gmail_default" style=3D"font-family:=
monospace,monospace">=C2=A0 I&#39;m very much enjoying WireGuard.=C2=A0 Tha=
nks for all the hardwork!</div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace">I am currently running WG on a high port but wou=
ld like to use it on port 53.=C2=A0 It currently will not load on 53, I thi=
nk because my system has systemd-resolved running that is bound to 53 on lo=
calhost only.</div><div class=3D"gmail_default" style=3D"font-family:monosp=
ace,monospace"><br></div><div class=3D"gmail_default" style=3D"font-family:=
monospace,monospace">I&#39;ve tried a bit of Google-ing, I&#39;ve read thro=
ugh the man pages for wg and wg-quick I don&#39;t seen an option to restric=
t the interfaces or IPs on which wg tries to bind [the port].=C2=A0=C2=A0</=
div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace">=
<br></div><div class=3D"gmail_default" style=3D"font-family:monospace,monos=
pace">Is there something I&#39;m missing or some other solution?=C2=A0 I&#3=
9;d rather not have to remove systemd-resolved.=C2=A0 I did stop systemd-re=
solved and start wg on port 53 which gets wg running but breaks local DNS r=
esolution.</div><div class=3D"gmail_default" style=3D"font-family:monospace=
,monospace"><br></div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace">Thanks,</div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace">=C2=A0 =C2=A0 Max</div></div>

--000000000000d43cc8058f2ab12c--

--===============7266938441712433444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7266938441712433444==--

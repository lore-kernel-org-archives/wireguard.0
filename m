Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32855C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 10:26:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3D5206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 10:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chmd-fr.20150623.gappssmtp.com header.i=@chmd-fr.20150623.gappssmtp.com header.b="yBGOxzwI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3D5206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chmd.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0c41833;
	Tue, 8 Jan 2019 10:23:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2be59aa4
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 10:23:11 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b133b82
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 10:23:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f23so3681002edb.3
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 02:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chmd-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=3a2D+N8f5np4yj7zTpi9CoaHkFn6dCg2QEF0xsbvUP8=;
 b=yBGOxzwI/VcZOzwnSGvR47gB5pHolCCG6gAhsmpV2RRPPaQzJiN+yg3XrzcaCwdjG2
 guJnTrTpB2WiRQPH9cy5za+5O0wno2SQe2z/qTTcl8Bt9NIqe129kp5/hjCJNqjAAQ2X
 OniLkppklmu//XG84qOBV7DVNuljVghRhpSsGmTAnl7s2GFq4xyjWaLNkXt6MTPzTFvk
 4m44pZV5vCRMmdfuXosn299oXPuSMGLEE0KTziJAy0IQQY8bra5D71jxjWn8h9hbDVDm
 45/BG9yo1vC1FBVYRsvf+pcNv+fwIK7uot1bp8p5T7Mp5/i/4eNYw+orZtSE1Dv6Yble
 kRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3a2D+N8f5np4yj7zTpi9CoaHkFn6dCg2QEF0xsbvUP8=;
 b=qvqKBSZCotWHkNPgbnbA0CZxOFTHSMq/kdv8kLih8RrS07XNyJArphHlJP1Xkw2ssp
 PfyYxlPi2U4c+MCfP2e2BWr/fm6b0MmlY+tCn3JMg/L6CoOWvDKcAk/6FvD7L0Oq5QSx
 wtPBWU/GUaKiCIJFBnHh8thHw3Y6GgrJJwsqAuYXx4Mt5D+SPMLeysqEmo9RKLgzij0O
 GcRTKYKe9DokN1lCW93tanwLw5IjS0ma9HzgI8HQoCY3B1LyIu+cU2gPdc+RGgdv6aq8
 9759mU72su0KFvU7ubOdUzaBhkIwqKQdQfQ5mCz71eI+uyOtBLssUvEenAi9hjoCL9Mm
 wl6g==
X-Gm-Message-State: AJcUukdLuCtPD1tRDY8mWond6h446CcnOJ2ssZBueJfkkDlJMxQliAMl
 mfSbOk7eLThAMEH7U3tthYIQjRsucCsRR8MjKJR3rg4foqo=
X-Google-Smtp-Source: ALg8bN76xOjLakcmPWAyRFEd6TITK0DxT7ug0Df49VEIFrlNy8zVup5shPl+jfmpqafBKGD7Mqeup23b/KHOkv1H3vA=
X-Received: by 2002:a17:906:1a49:: with SMTP id
 j9-v6mr1334873ejf.45.1546943177858; 
 Tue, 08 Jan 2019 02:26:17 -0800 (PST)
MIME-Version: 1.0
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Tue, 8 Jan 2019 11:26:06 +0100
Message-ID: <CAHLp1Y=_RavxCeoV5nQ+R96GTiY+jF9gvNox25B2XO9CVU+jMQ@mail.gmail.com>
Subject: [Android] Wireguard on the Amazon FireTV stick
To: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============0845148401282583896=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0845148401282583896==
Content-Type: multipart/alternative; boundary="0000000000009aa2f2057eefc67b"

--0000000000009aa2f2057eefc67b
Content-Type: text/plain; charset="UTF-8"

Hi there,

I tried to run Wireguard on the FireTV stick. The only other relevant
reference I found for doing this was on reddit [1], where people
recommended to use TunSafe. TunSafe is unfortunately still closed-souce
(AFAIK), and the wireguard developers have already expressed negative
opinions against it [2], so I would rather use the official app instead. I
am reporting here so that people interested in doing the same thing find
this thread and know what has been attempted.

Here is what worked do so far:
- Install the app
- Load a configuration for an interface

Here is what I still cannot do:
- Start the interface
- Automatically start it at boot

How to reproduce:
- Install the app:
  - On the FireTV:
    - activate the relevant developer options on the FireTV stick (adb and
external sources)
  - On a workstation:
    - visit F-Droid [3] and download the apk
    adb start-server
    adb connect <ip-address-of-firetv>
    adb install com.wireguard.android_445.apk
- Load a configuration:
  - On a workstation:
    adb push wg0.conf /sdcard
  - On the FireTV:
    - navigated the menu to create a configuration from file, selected the
file I pushed

Here is where I am stuck:
The FireTV stick can only be navigated with their remote control, which has
a very basic keypad allowing to move from button to button with <up>,
<left>, <down>, <right>. Unfortunately, once an interface is configured, I
do not manage to navigate to the button to enable it.

And here are questions to the Wireguard Android devs:
- Could you let me know which Intent is sent when one enables the
interface? I would like to try to enable the interface from adb.
- In case Wireguard turns out to run on the FireTV, would you consider
adding code to make the UI navigable?

Cheers,
Christophe-Marie

[1]:
https://www.reddit.com/r/WireGuard/comments/9zmzgv/wireguard_on_a_fire_tv_stick/
[2]: https://lists.zx2c4.com/pipermail/wireguard/2018-March/002448.html
[3]: https://f-droid.org/en/packages/com.wireguard.android/

--0000000000009aa2f2057eefc67b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Hi there,</div><div><br></div><div>I tried to run Wireguard =
on the FireTV stick. The only other relevant reference I found for doing th=
is was on reddit [1], where people recommended to use TunSafe. TunSafe is u=
nfortunately still closed-souce (AFAIK), and the wireguard developers have =
already expressed negative opinions against it [2], so I would rather use t=
he official app instead. I am reporting here so that people interested in d=
oing the same thing find this thread and know what has been attempted.<br><=
/div><div><br></div><div>Here is what worked do so far:</div><div>- Install=
 the app</div><div>- Load a configuration for an interface<br></div><div><b=
r></div><div>Here is what I still cannot do:</div><div>- Start the interfac=
e</div><div>- Automatically start it at boot<br></div><div><br></div><div>H=
ow to reproduce:<br></div><div>- Install the app:</div><div>=C2=A0 - On the=
 FireTV:</div><div>=C2=A0=C2=A0=C2=A0 - activate the relevant developer opt=
ions on the FireTV stick (adb and external sources)</div><div>=C2=A0 - On a=
 workstation:</div><div>=C2=A0=C2=A0=C2=A0 - visit F-Droid [3] and download=
 the apk</div><div>=C2=A0=C2=A0=C2=A0 adb start-server</div><div>=C2=A0=C2=
=A0=C2=A0 adb connect &lt;ip-address-of-firetv&gt;</div><div>=C2=A0=C2=A0=
=C2=A0 adb install com.wireguard.android_445.apk</div><div>- Load a configu=
ration:</div><div>=C2=A0 - On a workstation:<br></div><div>=C2=A0=C2=A0=C2=
=A0 adb push wg0.conf /sdcard</div><div>=C2=A0 - On the FireTV:</div><div>=
=C2=A0=C2=A0=C2=A0 - navigated the menu to create a configuration from file=
, selected the file I pushed</div><div><br></div><div>Here is where I am st=
uck:</div><div>The FireTV stick can only be navigated with their remote con=
trol, which has a very basic keypad allowing to move from button to button =
with &lt;up&gt;, &lt;left&gt;, &lt;down&gt;, &lt;right&gt;. Unfortunately, =
once an interface is configured, I do not manage to navigate to the button =
to enable it.</div><div><br></div><div>And here are questions to the Wiregu=
ard Android devs:</div><div>- Could you let me know which Intent is sent wh=
en one enables the interface? I would like to try to enable the interface f=
rom adb.</div><div>- In case Wireguard turns out to run on the FireTV, woul=
d you consider adding code to make the UI navigable?<br></div><div><br></di=
v><div>Cheers,</div><div>Christophe-Marie<br></div><div><br></div><div>[1]:=
 <a href=3D"https://www.reddit.com/r/WireGuard/comments/9zmzgv/wireguard_on=
_a_fire_tv_stick/">https://www.reddit.com/r/WireGuard/comments/9zmzgv/wireg=
uard_on_a_fire_tv_stick/</a></div><div>[2]: <a href=3D"https://lists.zx2c4.=
com/pipermail/wireguard/2018-March/002448.html">https://lists.zx2c4.com/pip=
ermail/wireguard/2018-March/002448.html</a></div><div>[3]: <a href=3D"https=
://f-droid.org/en/packages/com.wireguard.android/">https://f-droid.org/en/p=
ackages/com.wireguard.android/</a><br></div></div></div></div></div></div>

--0000000000009aa2f2057eefc67b--

--===============0845148401282583896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0845148401282583896==--

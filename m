Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E0AC35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 22:02:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A272320726
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 22:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn6SLkoA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A272320726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b4c2436;
	Sat, 8 Feb 2020 21:59:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc7294d8
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:50:28 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66f83f72
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:50:28 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id v195so2789462qkb.11
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FMITklhROeW/XDVaR3f44Ok/D48SPuBtbPbdURa2rIc=;
 b=Dn6SLkoAY3wYxGiYsUudPLv/vPOvfrLGUljDKK64dVFCR9tiU5bgnA/laAOczGlmE+
 uCAhnCjj44mI1/ZzqKRtsI+xCYH1DolQYxmD9ayGgn5mOsMGiAJEB5qhTuNXIqgEeqZ4
 nYYV+GRVyTAbQu0UFLyQCCKZi6YUUhq5b3Vf7+XOLfhfHiFR0pUCioBf+BfF0VIaB26F
 bYU94Yh4fxXKTQ30lkEjUJNzeWKNbOagZbQxGj3btJ973Puh71vu6BLuxT2K91DzV2ES
 0KP11g+vWLsf1chiv8lM9HtK2o6LIWy4UiqkVm4EmqYhrC1Mj8BNyohHpyzB5L9ZA+9d
 e03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMITklhROeW/XDVaR3f44Ok/D48SPuBtbPbdURa2rIc=;
 b=XvHFKkDRyQUm/mBK67cATUNR1emEx6RNf+AKfUiTzQQkzXy9tfZq8+EYtA9A9XxAdJ
 oWmPkNW7kG7nQ2caAOVZ4JYKS9uqoA0Upxqpc/87GcikwcKNSm+dZnbxIJH2Pk37lyV9
 nJ5H5650uvaHrED0MoPvNMP8jHUzZOE5MaAp7KWP/SoIn5jz61QkiC2o4y30NouNY1VV
 bwLY/JGrUE03o9fuIaGqaYyFXQcrlUNCJU1LEBGckPNWl71CP7MyxXJBptH4zlE/XOf6
 +1BKTseRhyD2ZIAflsQxG1r4POfI3uEX9IdKle6MYAiOFYnb6VMgzUbehvVPNJJPEe97
 7gTw==
X-Gm-Message-State: APjAAAVPV5152FG/dHsEImLHhDPl0EcYt2CXsS4+ey7/3kZ5X2+jgjDA
 m8+UsRrAPoQIIP62pSZluEM/4mT9EKc3yzSsPh4=
X-Google-Smtp-Source: APXvYqwycvgMNIaCOgtsxtwSL+QvcguBbB3Vovk0MNW0NEcclt1MckkoyAgGoZrvjhUq2BYLG9NvViHAq3PKMKrC2Hc=
X-Received: by 2002:a37:6187:: with SMTP id v129mr4728039qkb.495.1581198710581; 
 Sat, 08 Feb 2020 13:51:50 -0800 (PST)
MIME-Version: 1.0
References: <CAJFy1VX+ue2JskKZEjnOkMdC6sGVLU=fUSZ_BNOqD__SpZ5EYg@mail.gmail.com>
 <CAHmME9rwuUDDRX1Z9w1ir56ZvYZB-AZcebqJX3BwyNd5wHUx7g@mail.gmail.com>
In-Reply-To: <CAHmME9rwuUDDRX1Z9w1ir56ZvYZB-AZcebqJX3BwyNd5wHUx7g@mail.gmail.com>
From: Yoni Leitersdorf <litelite@gmail.com>
Date: Sat, 8 Feb 2020 13:51:39 -0800
Message-ID: <CAJFy1VX4g3Ygf35=VXyUbryyax9ygob8kbSw8GquZ8niW9MTeg@mail.gmail.com>
Subject: Re: Usability issue in MacOS
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, alex@alexburke.ca
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:59:08 +0100
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
Content-Type: multipart/mixed; boundary="===============5064674626211162235=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5064674626211162235==
Content-Type: multipart/alternative; boundary="00000000000076ac21059e1783bd"

--00000000000076ac21059e1783bd
Content-Type: text/plain; charset="UTF-8"

The original concept behind "On Demand" is to trigger the VPN when it's
needed - specifically when specific domains are being accessed. Indeed,
Apple expanded it to even include interfaces that are connected, SSIDs,
etc, in a non-intuitive way.

However, what makes it somewhat more un-intuitive is the fact that these
checkboxes appear in the main configuration screen for the tunnel. So, one
just simply checks the boxes, thinking "I want VPN to work on-demand on all
of my interfaces". Since, this feature works so oddly (compared to its
name), I would recommend putting it under a separate dialog. In that
dialog, we can explain what this feature does, and also allow for DNS names
to be used, which is the main use case for VPN On Demand.

On Sat, Feb 8, 2020 at 1:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Talk to Apple about that:
>
>
> https://developer.apple.com/documentation/networkextension/personal_vpn/vpn_on_demand_rules
>
> I'm hesitant to stray too far from the analogies that they set up,
> even if this is geared toward developers, because inevitably people
> start googling, and I'd rather them find what they're searching for.
>

--00000000000076ac21059e1783bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The original concept behind &quot;On Demand&quot; is to tr=
igger the VPN when it&#39;s needed - specifically when specific domains are=
 being accessed. Indeed, Apple expanded it to even include interfaces that =
are connected, SSIDs, etc, in a non-intuitive way.<br><div><br></div><div>H=
owever, what makes it somewhat more un-intuitive is the fact that these che=
ckboxes appear in the main configuration screen for the tunnel. So, one jus=
t simply checks the boxes, thinking &quot;I want VPN to work on-demand on a=
ll of my interfaces&quot;. Since, this feature works so oddly (compared to =
its name), I would recommend putting it under a separate dialog. In that di=
alog, we can explain what this feature does, and also allow for DNS names t=
o be used, which is the main use case for VPN On Demand.</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 8=
, 2020 at 1:37 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com"=
>Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Talk to Apple about that:<br>
<br>
<a href=3D"https://developer.apple.com/documentation/networkextension/perso=
nal_vpn/vpn_on_demand_rules" rel=3D"noreferrer" target=3D"_blank">https://d=
eveloper.apple.com/documentation/networkextension/personal_vpn/vpn_on_deman=
d_rules</a><br>
<br>
I&#39;m hesitant to stray too far from the analogies that they set up,<br>
even if this is geared toward developers, because inevitably people<br>
start googling, and I&#39;d rather them find what they&#39;re searching for=
.<br>
</blockquote></div>

--00000000000076ac21059e1783bd--

--===============5064674626211162235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5064674626211162235==--

Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F91BC3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:42:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD55820679
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD55820679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nicolaschan.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e200ea3;
	Sun, 25 Aug 2019 19:41:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 754ebcba
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:25:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 947bffb1
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:25:17 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d16so13796218wme.2
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 12:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8HyDGWVmMAA43OSIFhIZF8T68aa2XIQZAfWVodhax8=;
 b=SosKXL2y97wi8yN3TdzGoD9tTqhGgk4llSZEuU12PQ1FeQbQGJlHgmRvISiRYcP+xa
 Z39l/XgA10zaqkfTCPcevr8FU6Pi/26j+CTlyjYDXzX60kxbc2lbWm2Ke0gdOLy7XK2u
 d1S8ynnE/qEorrKgkiF8SqGu2cAM2a7agppXovwF22mmDN/Ph736kNwMkemq99LCUWDm
 TtcLmmue27m+CYK0fDWaiLPLGbd8rDl++s9dG7wl6RFyXmNAktGqBBYZoMcZ79fuufjn
 IAqHCm62srNYWXAEyMOWzswUwwMT4fU8jJJD8LwJiRSSPPrJyZ5vC24qvpL46WsaBwAg
 LoNQ==
X-Gm-Message-State: APjAAAXMUGMbUjyVruGKa0emW3tL8tLWRCrKQQ3jKKdGNGaJRZKjO1vR
 8Qn8oZrzeRIwgoEIPDQ1oRw80+iqk3FzSNq16Xyftg==
X-Google-Smtp-Source: APXvYqy2uoKgZ8Vb6FhWz1D47K0Wx/HvwpMwij15iLE3I0AJG8yV7Mu2ApukXlc5WfMrQjim1DK41TRr2ixGsUok9D0=
X-Received: by 2002:a1c:1b97:: with SMTP id
 b145mr16700850wmb.158.1566761116981; 
 Sun, 25 Aug 2019 12:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <CABPqyTY-KfjFenwKMWK7VHw_Kqv8ax8aW8tfjgJv8iHbX-vgYw@mail.gmail.com>
 <CAHmME9oqFzDF1YRuXiOybYFuG8mRZy7Wvy6dCQr+et5qqXfCJg@mail.gmail.com>
In-Reply-To: <CAHmME9oqFzDF1YRuXiOybYFuG8mRZy7Wvy6dCQr+et5qqXfCJg@mail.gmail.com>
From: Nicolas Chan <nicolas@nicolaschan.com>
Date: Sun, 25 Aug 2019 12:25:04 -0700
Message-ID: <CABPqyTY1PgCaFgN0m=Fb0z3DnddnrNXHQ6fxB7_OOmCO0JRayA@mail.gmail.com>
Subject: Re: Wireguard causes system to hang
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Sun, 25 Aug 2019 21:41:46 +0200
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
Content-Type: multipart/mixed; boundary="===============1263739440282093907=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1263739440282093907==
Content-Type: multipart/alternative; boundary="000000000000d35e080590f5ffed"

--000000000000d35e080590f5ffed
Content-Type: text/plain; charset="UTF-8"

Thanks, updating the BIOS did the trick!

On Sun, Aug 25, 2019, 8:51 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> WireGuard uses get_random_u32 which uses rdrand. AMD shipped with a
> broken rdrand. Update your CPU's microcode or your motherboard's BIOS
> and all should be good.
>

--000000000000d35e080590f5ffed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, updating the BIOS did the trick!</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2=
019, 8:51 AM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jaso=
n@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">WireGuar=
d uses get_random_u32 which uses rdrand. AMD shipped with a<br>
broken rdrand. Update your CPU&#39;s microcode or your motherboard&#39;s BI=
OS<br>
and all should be good.<br>
</blockquote></div>

--000000000000d35e080590f5ffed--

--===============1263739440282093907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1263739440282093907==--

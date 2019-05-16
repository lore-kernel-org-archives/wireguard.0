Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71F8C072A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DA620872
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxwdyUqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DA620872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5a919d2;
	Sat, 18 May 2019 16:48:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd556e2d
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 12:00:03 +0000 (UTC)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 376c1e9c
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 May 2019 12:00:03 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id w25so1998883qkj.11
 for <wireguard@lists.zx2c4.com>; Thu, 16 May 2019 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBL3Y/dXMFln1wyYlP2r0mv6/H8rL7nFlrWOoneXNcI=;
 b=oxwdyUqIe/w+CjvC2iEVUziMW4bXwvr7Aj51s7gBMKVD+1OKtLmN22e0qY/DjGm67b
 l/HJ11tj1gtwgWGit4O26TTeCFYSLXoSvCKKMf5fgVbLwAfeIFEc+aXWzj/Sq3IY8O+U
 hzyl9tNt+E0/HgSBAmBahcPPvcS4KUWO4BAjcUlR9mfbOFD3NNgXQjJ/jpZokVxWhoHH
 LADn6PASWZj5IUlfoKJJvpdFHxW0kok30FSN1DMORGKvywAqLtCVSiFvcW1XPVEpPQrU
 H/A41QsTArFFBYZeJQ7y7YNK9xigt9TM7pmCLOCyeEmax0J7v9zGVkDM6vKxX2GPLrnJ
 GjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBL3Y/dXMFln1wyYlP2r0mv6/H8rL7nFlrWOoneXNcI=;
 b=fxxcAU3A94ucCghEWUYOogd4hoGW86DC5uevyUlZmiUyKaxCPe+snSElxUHxkigkYa
 19hfpdLpa0czt69cdkBsqtMntNbU2eqKkOSbNSzdUcdbZ9vxFLuStE1bDjBPt1SC1Z30
 nP+1RX6nJ1yPfNFwuTooZxybyBNX6v6E0TEJFvKesiuSDZkuinngrchZ4B53a6UEAPXk
 i9C2j44C8evAd0/JefsbM8PZtaVMvI0rAzbc5VfCXzEpl5sKD0qG5kcqsc4QuaWu18/7
 jShyXGcITWsZmY6p33Y8LZo05scydHZZRLE/hf7Yqtui93VQySDgv82rjizCjUhOCs9m
 0wVQ==
X-Gm-Message-State: APjAAAWb0REVE3uk78zzFIRKKDoIGtiJwLxUwgDr7G9r/Fb05e+okdb+
 M51OxCenB4wyjsuT/fX0EABB3FtxWzGtYoQhhLQ=
X-Google-Smtp-Source: APXvYqwCOzK8n0lacTpRvDOuuvcQdIPnTF0s0zTmUfQnQlKA8RRj8pQ2IXl7Bkab+knj6DuFjc6j4Kx1z0MN4WsjN6s=
X-Received: by 2002:a37:79c3:: with SMTP id
 u186mr38309733qkc.135.1558008003241; 
 Thu, 16 May 2019 05:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
 <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
 <bfead88f-3e91-6d49-ea70-e73f626468f1@nikhef.nl>
In-Reply-To: <bfead88f-3e91-6d49-ea70-e73f626468f1@nikhef.nl>
From: Lev Stipakov <lstipakov@gmail.com>
Date: Thu, 16 May 2019 14:59:52 +0300
Message-ID: <CAGyAFMW10tUVswPa8NfVieUJMm1oX1BFQaa9a0GP3NmgWpRshg@mail.gmail.com>
Subject: Re: [Openvpn-devel] Wintun performance results
To: Jan Just Keijser <janjust@nikhef.nl>
X-Mailman-Approved-At: Sat, 18 May 2019 18:48:52 +0200
Cc: David Sommerseth <openvpn@sf.lists.topphemmelig.net>,
 openvpn-devel <openvpn-devel@lists.sourceforge.net>, wireguard@lists.zx2c4.com,
 =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC/0LjRhtC40L0=?= <chipitsine@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5495272259857469140=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5495272259857469140==
Content-Type: multipart/alternative; boundary="000000000000972c7905890001e5"

--000000000000972c7905890001e5
Content-Type: text/plain; charset="UTF-8"

Hi,

However, if I am not mistaken the version of OpenVPN used in the test
> was a *Windows* build of OpenVPN3 with a wintun patch included.


Correct.


> That is not open source, is it?  I'd *not* be in favour of writing
> community
> wiki pages on the non-open source version of OpenVPN.
>

That's an open source openvpn3 test client, which is part of library
(openvpn/test/ovpncli/cli.cpp).

We'll incorporate required changes into master branch soon.

-- 
-Lev

--000000000000972c7905890001e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><div dir=3D"ltr"><br></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">How=
ever, if I am not mistaken the version of OpenVPN used in the test <br>
was a *Windows* build of OpenVPN3 with a wintun patch included.</blockquote=
><div><br></div><div>Correct.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">That is not open source, is it?=C2=A0 I&#39;d *n=
ot* be in favour of writing community <br>
wiki pages on the non-open source version of OpenVPN.<br></blockquote><div>=
<br></div><div>That&#39;s an open source openvpn3 test client, which is par=
t of library (openvpn/test/ovpncli/cli.cpp).</div><div><br></div><div>We&#3=
9;ll incorporate required changes into master branch soon.</div></div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">-Lev</div></div=
>

--000000000000972c7905890001e5--

--===============5495272259857469140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5495272259857469140==--

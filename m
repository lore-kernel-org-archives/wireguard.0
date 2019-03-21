Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE06BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:06:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1ED218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTtC0ubi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1ED218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5f4f1dd;
	Sat, 23 Mar 2019 00:05:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d4bd1a8
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 02:37:58 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8eb61022
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 02:37:58 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id c4so4021457ioh.9
 for <wireguard@lists.zx2c4.com>; Wed, 20 Mar 2019 19:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oaAi6s3HKQc0qRR8bsYeeRLQdTuCwSLlOmN/yclIoDQ=;
 b=UTtC0ubiut4HLgzBshgiSsWYRXfbcx+bMywaRWpzQSM8RYlvrFWFyYmzXgKQTbC63i
 dwl1/PyoB3ORpksPPIwsSYjcP6/vldQOpVX/SWiA0nsDTXI3j2Bg+mm2SFaWX+vsCwLJ
 TlIAq2+p0CJ6XmQODIK2xmItMyC7XN31y/xYhSiWf9ZWkaTC41TGfEElqOGkiQ91nVSM
 4bBbNSxbmC1hEEK3pxjpCjuXKkUCcOkdHYc7Zu1zNeE9MEa1YlLJCS0OmcG5SUXnMng1
 5ipWinkUk4U5O2X2wDgPReNz0y7iBIgrs1M5C/zhmO6z7kGt37Hq33JIDIpqQrynaHgT
 Gt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oaAi6s3HKQc0qRR8bsYeeRLQdTuCwSLlOmN/yclIoDQ=;
 b=C7lOKyGMr2Qy/YHZ789jPWn1F4OekkGHbDPRrEWA59Vu1SuPev6uogM8LnpnfddGbf
 5ADOggCAqO2jyOzSx5/uxxI8fkSraOY4RV6DuEGa9WAa/IHsIGVp29j/SEbRJ58Blr+G
 hihI2BF5q29uNtfHKXvSwwU4MWrZN0W4+GbjriHIvg3tVHqhlgfcYMNQqZ8T07yqA3xT
 Mx7KpLZV6h+0Xtw2kCtv39XZI5QNAzXunpEUziIgSfMC/xCaodRb/CpH/q3MJOpFAoMb
 heEs4zpnwA91mqD9HSDnQx/0/mLqoeAl4/OF2IIM0UTz35ZXZugyXPPOgv4OuEiGCz83
 qj0Q==
X-Gm-Message-State: APjAAAWX//2vK7rcB9bTKI0CWYj9OgSXFBvTi3c4g3jq3GkLBrurZsbk
 19zNw4FSK0DXrx26fcAAkrJIowrallPmfUzEXgNMbQ==
X-Google-Smtp-Source: APXvYqyMSzF3GXl+mXjqY4mWB/3j/WYf352HeI2ZKW0+moDwyk/U8jh8/YU7GUemt0IGhICkynjt/OOyKL86P0+uJfQ=
X-Received: by 2002:a6b:7417:: with SMTP id s23mr1065401iog.2.1553135899978;
 Wed, 20 Mar 2019 19:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1098.1553121386.19426.wireguard@lists.zx2c4.com>
In-Reply-To: <mailman.1098.1553121386.19426.wireguard@lists.zx2c4.com>
From: Vick Lee <confundo360@gmail.com>
Date: Wed, 20 Mar 2019 19:38:08 -0700
Message-ID: <CAB+PNJfPig2O5kC71nzp-KVWQqbWMoYpPcboSwWCHGOBFpcV1A@mail.gmail.com>
Subject: Re: Issues with multiuser macOS (Sven Grunewaldt)
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:05:45 +0100
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
Content-Type: multipart/mixed; boundary="===============1984442855578263743=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1984442855578263743==
Content-Type: multipart/alternative; boundary="0000000000009b32a1058491a166"

--0000000000009b32a1058491a166
Content-Type: text/plain; charset="UTF-8"

>
> Hi,
>
> I'm testing the official macOS application for Wireguard and seem to
> have a problem in my setup. Is it to be expected to loose configured
> tunnels when logging out? I have two users on my MacBook, one for work
> and one for private use and always log out when switching users because
> some programs (e.g. LittleSnitch) get confused when two users are logged
> in at the same time. When I do log in back to my private account, all
> configured profiles are gone.
>
> Another thing, that is probably more of a feature request than an issue,
> is that I'd love to create system-wide tunnels. Logging out and
> switching to another user always disconnects the tunnel, but I actually
> do have a tunnel that is used in both profiles. I can duplicate the
> config, but then I'm not sure what would happen if I may end up being
> logged in to both profiles. I assume it makes more sense to solves this
> particular problem with a custom launchd process and wg-quick, instead
> of using the UI.
>
> Kind regards,
> Sven Grunewaldt
>
>
Can confirm that account switching will clear all saved tunnel
configurations for all users. Hope this is not intended by design.
Currently, I have to re-import each time account switching on macOS.

--0000000000009b32a1058491a166
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
Hi,<br>
<br>
I&#39;m testing the official macOS application for Wireguard and seem to<br=
>
have a problem in my setup. Is it to be expected to loose configured<br>
tunnels when logging out? I have two users on my MacBook, one for work<br>
and one for private use and always log out when switching users because<br>
some programs (e.g. LittleSnitch) get confused when two users are logged<br=
>
in at the same time. When I do log in back to my private account, all<br>
configured profiles are gone.<br>
<br>
Another thing, that is probably more of a feature request than an issue,<br=
>
is that I&#39;d love to create system-wide tunnels. Logging out and<br>
switching to another user always disconnects the tunnel, but I actually<br>
do have a tunnel that is used in both profiles. I can duplicate the<br>
config, but then I&#39;m not sure what would happen if I may end up being<b=
r>
logged in to both profiles. I assume it makes more sense to solves this<br>
particular problem with a custom launchd process and wg-quick, instead<br>
of using the UI.<br>
<br>
Kind regards,<br>
Sven Grunewaldt<br>
<br></blockquote><div><br></div><div>Can confirm that account switching wil=
l clear all saved tunnel configurations for all users. Hope this is not int=
ended by design. Currently, I have to re-import each time account switching=
 on macOS.<br></div></div></div>

--0000000000009b32a1058491a166--

--===============1984442855578263743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1984442855578263743==--

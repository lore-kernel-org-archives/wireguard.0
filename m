Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866EEC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:55:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124CB2082C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=frederickding.com header.i=@frederickding.com header.b="kwSQXNVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 124CB2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frederickding.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c1e4e8b;
	Fri, 6 Sep 2019 21:54:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37dfa4d7
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:08:10 +0000 (UTC)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f8c59a6
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:08:09 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id n126so2761982ywf.1
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=frederickding.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lnHtFTdQBZNupMoiv6FQHdKN6GtAuICA9P/vdQRUTs8=;
 b=kwSQXNVQAfcfNTVC23IPkYn3BoeuG4jCy6JSuHh2lG8mHi4zk04k0RNH0EPKAFsbO8
 BXjeU6YN0yPzv7oGN7GaHqqt0BMO8bfXbjrqpm8t/fuPkeQLUTG2Z2iLfIOJelee+Sla
 eo3OnFTjCL7P7q48jvCDyZFceteFV+Jqy0Nj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lnHtFTdQBZNupMoiv6FQHdKN6GtAuICA9P/vdQRUTs8=;
 b=YEg148fie6DLsjGEknI9sr9RT2ZpTlLqzGP4RxEnZDrY/KayU/Mqmd6S1TI2RJlS6s
 RyZIlkDtMYENjEr/ZHsJMQuBcWwF/toMXh9mHz5PAzOMjrYdsSOebEwSom/iecyW2XuM
 OLnNgez6crXca/9aDROczVhKcu+RnZ1Id176u8b+okFQzhVMmOllIgSnrjHN0lE6nud1
 1SWdRXIFsFKOQThgN8bQ4x9g3rw34sci1ca8l2A8NCKaOW7XsI0QndboqvhicVEwfpIr
 y8SXUu4ZGAk9AYGYeWPaw34TaMLF+SMSbB73b65BwjG6rQuUVF1fq0nrgg868hwMrwot
 0+SQ==
X-Gm-Message-State: APjAAAVVnaPRgyutzdLEGi9OUuCIsepwENtu0RGv7Wwd8MYCaE+K13qq
 6GCSZJRka8aAcMhSnEhopAN+IpU8zgC9GI3xanDqC4tv9eo=
X-Google-Smtp-Source: APXvYqwLg5B3CMCZ4MW7feSw0l2cQExP6zLVZArCgTqPx0bJsiaUHjWEpOAfccDNjcjKuCakEAuPz6K6ZBexa7aDhjA=
X-Received: by 2002:a81:9346:: with SMTP id k67mr8443759ywg.47.1567804089080; 
 Fri, 06 Sep 2019 14:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
In-Reply-To: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
From: Frederick Ding <frederick@frederickding.com>
Date: Fri, 6 Sep 2019 23:07:56 +0200
Message-ID: <CAPk0gXqPUHS0ufEj7CEDHaf+_KDbzKW8Et8yHO3mtjR9SEUNwQ@mail.gmail.com>
Subject: Re: wireguard-android broken after update to Android 10
To: lists@coryfields.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 23:54:56 +0200
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============0618092701465660761=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0618092701465660761==
Content-Type: multipart/alternative; boundary="000000000000ceb9ff0591e8d5cd"

--000000000000ceb9ff0591e8d5cd
Content-Type: text/plain; charset="UTF-8"

Pixel 3 user here on Android 10. Have you checked whether all packets are
not getting through, or whether it's just appearing that way due to DNS
issues? Maybe try deactivating the Private DNS (which may use DNS over
HTTP) setting in Network & Internet settings and see if that helps? Or try
using Hurricane Electric's net tools app to try pinging an IP address by
number to see where things are breaking...

On Fri, Sep 6, 2019, 21:19 Cory Fields <lists@coryfields.com> wrote:

> Today I updated my Pixel 3 to Android 10 and my wireguard vpn is no longer
> functional. Everything appears to be working fine, just no connections.
> It's a very straightforward ipv4 setup with a Debian host on the other side.
>
> It seems maybe I'm not alone:
>
> https://old.reddit.com/r/WireGuard/comments/bnx4yy/wireguard_tunnel_broken_on_android_q_beta/
>
> Might there be some non-obvious new security setting that needs to be
> turned off (or granted) after the update?
>
> I'm afraid I don't have much other useful information to provide here, but
> I can send a log file from the android client off-list if it would be
> helpful.
>
> Regards,
> Cory Fields
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000ceb9ff0591e8d5cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Pixel 3 user here on Android 10. Have you checked wh=
ether all packets are not getting through, or whether it&#39;s just appeari=
ng that way due to DNS issues? Maybe try deactivating the Private DNS (whic=
h may use DNS over HTTP) setting in Network &amp; Internet settings and see=
 if that helps? Or try using Hurricane Electric&#39;s net tools app to try =
pinging an IP address by number to see where things are breaking...<br><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Se=
p 6, 2019, 21:19 Cory Fields &lt;<a href=3D"mailto:lists@coryfields.com">li=
sts@coryfields.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div>Today I updated my Pixel 3 to Android 10 and my wiregu=
ard vpn is no longer functional. Everything appears to be working fine, jus=
t no connections. It&#39;s a very straightforward ipv4 setup with a Debian =
host on the other side.<br></div><div><br></div><div>It seems maybe I&#39;m=
 not alone:</div><div><a href=3D"https://old.reddit.com/r/WireGuard/comment=
s/bnx4yy/wireguard_tunnel_broken_on_android_q_beta/" target=3D"_blank" rel=
=3D"noreferrer">https://old.reddit.com/r/WireGuard/comments/bnx4yy/wireguar=
d_tunnel_broken_on_android_q_beta/</a></div><div><br></div><div>Might there=
 be some non-obvious new security setting that needs to be turned off (or g=
ranted) after the update?</div><div><br></div><div>I&#39;m afraid I don&#39=
;t have much other useful information to provide here, but I can send a log=
 file from the android client off-list if it would be helpful.</div><div><b=
r></div><div>Regards,</div><div>Cory Fields<br></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--000000000000ceb9ff0591e8d5cd--

--===============0618092701465660761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0618092701465660761==--

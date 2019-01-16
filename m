Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D95C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 20:58:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF90205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 20:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eero.com header.i=@eero.com header.b="T+Irw2z3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAF90205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc3045c6;
	Wed, 16 Jan 2019 20:53:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fdebabb
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 20:53:55 +0000 (UTC)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e1ce390
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 20:53:55 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id z3so4838873vsf.7
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 12:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z2hVi6plThip2YvpjktnZuRdmy67Q9Rm8LQErOael1A=;
 b=T+Irw2z3noLCY5Ym8xrIKMAappfYtuXjHcP0kO+gD3Varsoynst237oKNAwbjC5UnQ
 4MdchGIO++6xmXM62zhk96gvYlc3k3hImjDRI4LdKVAWZDAttqJTTrhHFI23Z4jbrScX
 L76BxS0Vh82CDWqpX/Igdn+fTiwvqtOX8TsVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2hVi6plThip2YvpjktnZuRdmy67Q9Rm8LQErOael1A=;
 b=REPKAZfEuwj4aHHJfqP1+eo9ge3gDyNP8GZgfPLjM9j+Q5YjG1XrhahpXMJUSEC6SD
 W13U/KX9eR142cWC5WbvKaYTgRxXnPgaW9Gup89rGz+m1zwMn6rkS58ncnZzpMLUVqGR
 M4P0wkHGFbIzdDDF0e/o56sD+l9+SOVSmTd4PthfIbjhKc6z//DzMNBmnJn9Nq5VWdCw
 L4xl56d+xp8CuCp8+/xu0GXijmkmXLfBPFm1zfMlsOJtAZi/M4SQLz6ox/k709SlfOZo
 5X2S5AMcPQbykAMfXo5riDUNgUZv+y6bTlakSyIhuJWGL1hvfOAZsUJpDzPDB9bjVknK
 4hgw==
X-Gm-Message-State: AJcUukeMXu9DcVh6stY+auwQlMyU2tjcZsn29a8JBxklkEr2AVMWDyVL
 vwZWzoHiND7pWNNHCXXtMitMLg7GmUMHwjddGrInp1Sy
X-Google-Smtp-Source: ALg8bN5x9gIFIt0Tf+IDBQeC4NqGBtOb/kTGbpqVoyXxAq4AMLa6taA4jbVxwBoGBvX8BeV7UsPhhe2CHmtZRJ+EFKo=
X-Received: by 2002:a67:7f47:: with SMTP id a68mr4727485vsd.204.1547672286633; 
 Wed, 16 Jan 2019 12:58:06 -0800 (PST)
MIME-Version: 1.0
References: <4844f7fa-6e60-4fe3-30b3-e9f87952235b@familie-schwamborn.com>
In-Reply-To: <4844f7fa-6e60-4fe3-30b3-e9f87952235b@familie-schwamborn.com>
From: David Cowden <dcow@eero.com>
Date: Wed, 16 Jan 2019 12:57:55 -0800
Message-ID: <CACN7iOBjmzC9Ft3JRObFFABuuAbdVjD7UkaXxYcXtLE9n4WKMw@mail.gmail.com>
Subject: Re: Optional DNS-Check or Ping-test for the Android App
To: Fabian Schwamborn <fabian@familie-schwamborn.com>
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
Content-Type: multipart/mixed; boundary="===============9010339279358900682=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9010339279358900682==
Content-Type: multipart/alternative; boundary="000000000000dfbe95057f998843"

--000000000000dfbe95057f998843
Content-Type: text/plain; charset="UTF-8"

You need to setup dns for your home site then use that to connect. Or you
need to synchronize the endpoint out of band. I can't imagine this is
something wg wants to tackle--this is a general problem all software
encounters.

On Tue, Jan 15, 2019 at 10:52 PM Fabian Schwamborn <
fabian@familie-schwamborn.com> wrote:

> Hello,
>
>
>
> I have a suggestion for improving the Android app or would like to ask if
> such a change would be desirable in general (e.g. pull request):
>
> I'm using Wireguard as a connection between my home router and my mobile
> phone, but unfortunately I don't have a fixed IP address. As soon as the IP
> address changes, the app does not reconnect. (Happens once a week)
>
> Is it possible to integrate a function into the app, that pings through
> the tunnel so that you can perform a keep-alive check and reconnect the
> tunnel completely after a failure (including DNS request)?
>
> Is it conceivable, to implement a DNS-check function in the app? (E.g.
> like the existing example DNS check script for Linux works?)
>
> Then the app would have the same functionality as my previous IP-Sec
> client. This would also allow better coverage of failover IP scenarios.
>
>
> Best Regards
>
> Fabian
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000dfbe95057f998843
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You need to setup dns for your home site then use that to =
connect. Or you need to synchronize the endpoint out of band. I can&#39;t i=
magine this is something wg wants to tackle--this is a general problem all =
software encounters.<br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jan 15, 2019 at 10:52 PM Fabian Schwamborn =
&lt;<a href=3D"mailto:fabian@familie-schwamborn.com">fabian@familie-schwamb=
orn.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
 =20

   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p class=3D"MsoNormal">Hello,</p>
    <p class=3D"MsoNormal">=C2=A0</p>
    <p class=3D"MsoNormal">I have a suggestion for improving the Android
      app or would
      like to ask if such a change would be desirable in general (e.g.
      pull request):</p>
    <p class=3D"MsoNormal">I&#39;m using Wireguard as a connection between =
my
      home router
      and my mobile phone, but unfortunately I don&#39;t have a fixed IP
      address. As soon
      as the IP address changes, the app does not reconnect. (Happens
      once a week)<br>
    </p>
    <p class=3D"MsoNormal">Is it possible to integrate a function into the
      app, that
      pings through the tunnel so that you can perform a keep-alive
      check
      and reconnect the tunnel completely after a failure (including DNS
      request)?</p>
    <p class=3D"MsoNormal">Is it conceivable, to implement a DNS-check
      function in the
      app? (E.g. like the existing example DNS check script for Linux
      works?)</p>
    <p class=3D"MsoNormal">Then the app would have the same functionality
      as my
      previous IP-Sec client. This would also allow better coverage of
      failover IP
      scenarios.</p>
    <p class=3D"MsoNormal"><br>
    </p>
    <p class=3D"MsoNormal">Best Regards=C2=A0
    </p>
    <p class=3D"MsoNormal">Fabian</p>
   =20
  </div>

_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000dfbe95057f998843--

--===============9010339279358900682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9010339279358900682==--

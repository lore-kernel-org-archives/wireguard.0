Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49C9C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 22:06:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2D0206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 22:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eero.com header.i=@eero.com header.b="JHonIIqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2D0206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 170cfa6b;
	Wed, 16 Jan 2019 22:02:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfedc13c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 22:02:07 +0000 (UTC)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e5f580b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 22:02:06 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id x64so4956246vsa.5
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 14:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsT7WL+yFkgZaV82toWAvOJmmACWCf+c5J1qjmp/W+A=;
 b=JHonIIqWLuMaQMXC3WNiS6Lk2qNdlHuAGr+z3HP717sjOnANKAW5SMP8ccP0hxl37U
 1LRvdtWZtr0mtSgFWvlLLSr8pudzZstMGzXuHubs/Ansd2Y++1IQlMmXL8Y/Blctqrod
 aFqMfGYa1BZ1RFKZVwg2phXohGTXk29gAEhVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsT7WL+yFkgZaV82toWAvOJmmACWCf+c5J1qjmp/W+A=;
 b=a/2mg4LPheDtCkl7SnheLEIPNRPd6fHU0NEZq17W0MpUpd2lrljrdW1Cf/lS46nhYP
 g9BWcEbMSb2AJcd3hddy/a7xNOiEefX95c1QfqMkT3YfeazYtYrUbo75wsHNSc6uwBDL
 EMFlxsqe698qJ/SNSd2eFq4vNltbQxztlwQO1qRfMoxVgYJGJrklctzEiJ70h1yC11vc
 TTA5/XGdZQ6WYjDsmapU70FoQIVwE8eSH8ZrmDGbisoyNGZ4aYI70hp1+zNljwR+uJX7
 1u9nOgw3lub+qtKZYBbad4u/WAqpMJCFDz2cWRQwfzNbPA+zW7wXzccX5Y0CPUsxXKYy
 JFZA==
X-Gm-Message-State: AJcUuke6zfwo2NkwkKvTDKwWl04rsdKhTTEZeu8O0y41QZGU7hRnF/ts
 GMaW+zVss3e5Sq1QKkQDUtXT6JLpsW6Z3WAL8SfM9c3a
X-Google-Smtp-Source: ALg8bN7maRbrM7dhAJtqigxkZ2pq2EhPl/SfHvR/F+0klu3X0BsfcmC0HMeP51T0R/i8JjBWxQkWQenBItjtrwYUw8g=
X-Received: by 2002:a67:6849:: with SMTP id d70mr4865100vsc.199.1547676379022; 
 Wed, 16 Jan 2019 14:06:19 -0800 (PST)
MIME-Version: 1.0
References: <4844f7fa-6e60-4fe3-30b3-e9f87952235b@familie-schwamborn.com>
 <CACN7iOBjmzC9Ft3JRObFFABuuAbdVjD7UkaXxYcXtLE9n4WKMw@mail.gmail.com>
 <012090d9-5191-9741-12e0-bd7352307aa0@familie-schwamborn.com>
In-Reply-To: <012090d9-5191-9741-12e0-bd7352307aa0@familie-schwamborn.com>
From: David Cowden <dcow@eero.com>
Date: Wed, 16 Jan 2019 14:06:07 -0800
Message-ID: <CACN7iOBQP9e1Q=CB_z2nQ8B8PY_aw2HEbv_AAA2aaAqScK-=PQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8719500464270300609=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8719500464270300609==
Content-Type: multipart/alternative; boundary="000000000000cca405057f9a7ce3"

--000000000000cca405057f9a7ce3
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 16, 2019 at 1:29 PM Fabian Schwamborn <
fabian@familie-schwamborn.com> wrote:

> I think you misunderstood me. Most broadband providers don't offer fixed
> IPv4. Due to privacy considerations, even under IPv6 on normal connections,
> addresses will always change. (prefix) As soon as an address changes and my
> dynamic DNS system registers it, an IPsec or OpenVPN client on my phone can
> reconnect. (This happens once a week).
> The Wireguard app simply lacks a monitor to see if the IP address has
> changed. Therefore a ttl in the DNS was introduced .... (After a registered
> loss of the connection - also shown in the log - no DNS request is executed
> and the tunnel breaks down permanently.)
>
> I think the
>
Yes, I thought you were asking for what you already have setup. My
apologies.


> se are the most common scenarios with OpenWRT routers ...
>
> Having a DNS entry does not mean that it always points to a static ip, so
> when a tunnel disconnects, the Android-app itself (userspace) should handle
> this like many other existing VPN-Clients do by a re-query of the DNS
> entry...
>
> My question is, is there any opinion on such an implementation? Should i
> try to implement it into the android app and provide the code?
> (Unfortunately i am not a good android app-developer)
>
This sounds like something the wg-go userspace should support, not the
android or ios app ui.

>
> Am 16.01.2019 um 21:57 schrieb David Cowden:
>
> You need to setup dns for your home site then use that to connect. Or you
> need to synchronize the endpoint out of band. I can't imagine this is
> something wg wants to tackle--this is a general problem all software
> encounters.
>
> On Tue, Jan 15, 2019 at 10:52 PM Fabian Schwamborn <
> fabian@familie-schwamborn.com> wrote:
>
>> Hello,
>>
>>
>>
>> I have a suggestion for improving the Android app or would like to ask if
>> such a change would be desirable in general (e.g. pull request):
>>
>> I'm using Wireguard as a connection between my home router and my mobile
>> phone, but unfortunately I don't have a fixed IP address. As soon as the IP
>> address changes, the app does not reconnect. (Happens once a week)
>>
>> Is it possible to integrate a function into the app, that pings through
>> the tunnel so that you can perform a keep-alive check and reconnect the
>> tunnel completely after a failure (including DNS request)?
>>
>> Is it conceivable, to implement a DNS-check function in the app? (E.g.
>> like the existing example DNS check script for Linux works?)
>>
>> Then the app would have the same functionality as my previous IP-Sec
>> client. This would also allow better coverage of failover IP scenarios.
>>
>>
>> Best Regards
>>
>> Fabian
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>
>

--000000000000cca405057f9a7ce3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 16, 2019 at 1:29 PM Fabia=
n Schwamborn &lt;<a href=3D"mailto:fabian@familie-schwamborn.com">fabian@fa=
milie-schwamborn.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>I think you misunderstood me. Most broadband providers don&#39;t
      offer fixed IPv4. Due to privacy considerations, even under IPv6
      on normal connections, addresses will always change. (prefix) As
      soon as an address changes and my dynamic DNS system registers it,
      an IPsec or OpenVPN client on my phone can reconnect. (This
      happens once a week).<br>
      The Wireguard app simply lacks a monitor to see if the IP address
      has changed. Therefore a ttl in the DNS was introduced .... (After
      a registered loss of the connection - also shown in the log - no
      DNS request is executed and the tunnel breaks down permanently.)</p>
    <p>I think the</p></div></blockquote><div>Yes, I thought you were askin=
g for what you already have setup. My apologies.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">=
<p>se are the most common scenarios with OpenWRT routers
      ...<br>
    </p>
    <p>Having a DNS entry does not mean that it always points to a
      static ip, so when a tunnel disconnects, the Android-app itself
      (userspace) should handle this like many other existing
      VPN-Clients do by a re-query of the DNS entry...</p>
    <p>My question is, is there any opinion on such an implementation?
      Should i try to implement it into the android app and provide the
      code? (Unfortunately i am not a good android app-developer)<br></p></=
div></blockquote><div>This sounds like something the wg-go userspace should=
 support, not the android or ios app ui. <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF"><p>
    </p>
    <p><br>
    </p>
    <div class=3D"gmail-m_6222563726764716946moz-cite-prefix">Am 16.01.2019=
 um 21:57 schrieb David
      Cowden:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">You need to setup dns for your home site then use
        that to connect. Or you need to synchronize the endpoint out of
        band. I can&#39;t imagine this is something wg wants to tackle--thi=
s
        is a general problem all software encounters.<br>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail-m_6222563726764716946gmail_attr">On=
 Tue, Jan 15, 2019 at 10:52
          PM Fabian Schwamborn &lt;<a href=3D"mailto:fabian@familie-schwamb=
orn.com" target=3D"_blank">fabian@familie-schwamborn.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div bgcolor=3D"#FFFFFF">
            <p class=3D"MsoNormal">Hello,</p>
            <p class=3D"MsoNormal">=C2=A0</p>
            <p class=3D"MsoNormal">I have a suggestion for improving the
              Android app or would like to ask if such a change would be
              desirable in general (e.g. pull request):</p>
            <p class=3D"MsoNormal">I&#39;m using Wireguard as a connection
              between my home router and my mobile phone, but
              unfortunately I don&#39;t have a fixed IP address. As soon as
              the IP address changes, the app does not reconnect.
              (Happens once a week)<br>
            </p>
            <p class=3D"MsoNormal">Is it possible to integrate a function
              into the app, that pings through the tunnel so that you
              can perform a keep-alive check and reconnect the tunnel
              completely after a failure (including DNS request)?</p>
            <p class=3D"MsoNormal">Is it conceivable, to implement a
              DNS-check function in the app? (E.g. like the existing
              example DNS check script for Linux works?)</p>
            <p class=3D"MsoNormal">Then the app would have the same
              functionality as my previous IP-Sec client. This would
              also allow better coverage of failover IP scenarios.</p>
            <p class=3D"MsoNormal"><br>
            </p>
            <p class=3D"MsoNormal">Best Regards=C2=A0 </p>
            <p class=3D"MsoNormal">Fabian</p>
          </div>
          _______________________________________________<br>
          WireGuard mailing list<br>
          <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">Wi=
reGuard@lists.zx2c4.com</a><br>
          <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" re=
l=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo=
/wireguard</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div></div>

--000000000000cca405057f9a7ce3--

--===============8719500464270300609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8719500464270300609==--

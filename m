Return-Path: <SRS0=ZjPO=TV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC66C04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2019 13:57:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143A821479
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2019 13:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=revathskumar-com.20150623.gappssmtp.com header.i=@revathskumar-com.20150623.gappssmtp.com header.b="QHr4xJco"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143A821479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=revathskumar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 335e6818;
	Tue, 21 May 2019 13:56:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69eebb39
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 16:34:36 +0000 (UTC)
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7056402
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 16:34:36 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g8so7279535otl.8
 for <wireguard@lists.zx2c4.com>; Fri, 17 May 2019 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=revathskumar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KVsJtHRPQa4tC788T2/i0ZdbppqQEsevwnoYZQdEU38=;
 b=QHr4xJcoTcdcCYy1QSePwYpMHNxdVpn9J5NErWbiSy0TQ2Y91Dx1EPylhn/YybYraa
 vjyLc8Ul0czu5NpDSFosw4ZczZTb80HpcZUic/rA0d/c9Q0IvxriskYEtD/t/9oJJSjI
 EnrQJ4VW8QCZ+ean8N+UamChfwsOewKtYmN7PhFjaNPXqd8LaloN48gMXp86rHTHdyns
 X7Jf4+K3tfzzBc/038eT/ioOHiE3NIJfDuNaXHDNFK+X86SMKRTG6R00Bpecfxh8svkb
 0hSG+8xoxutvUAIWTIx0CUz6HWrfrwZbw+P/CVCD4S18jQEskHpAivonijYlW21hHmnK
 RarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KVsJtHRPQa4tC788T2/i0ZdbppqQEsevwnoYZQdEU38=;
 b=msbF/3wwweyYDdim/S3D/TytiKnJxU/0aDaFR9cmt8znpN6zqpZDam78oeESaY2nfH
 aDmnqiJQXu2lz8JyQ+3W9hPTst8/pXWW6JC4+NOahrv5qQWZ3wmIDqR+VrgljSR2onmO
 koBaIdqqQ7Y9KdoWDoXJaPatS1hfgCssoj0CNE7hDrJ+EzzB5OMWfYX/wSUPm/zq61YT
 /mDeeYwlfcmWhsXKTdkzsPDKvCDg0pW3bLP/QIyMy04BU9Qv/M2neDx3vTtBNTJMeMG2
 4sjCvzZMo5n2lp8IntRMatm9cyBqoCJqS/4CWpVWrZTMMNXFx36G6lZKRSmgk+gm/CAE
 DkIw==
X-Gm-Message-State: APjAAAVw1T2uT+m6hOLPJLjzH7of35qpCb09JGWAuibR/yzcFAQo3it7
 dHaaEosYDY+KtjAypWc/RtK8MiOMP3wEiUtNVu4HWFpswwq1UO9z
X-Google-Smtp-Source: APXvYqxr1+Z6fwqDLteLVcKPP6xifzt28ox9mTUrxNfXsw9VcHLAE2TsSddAYe6B+5cHECA/iBnMr9qC8XUKk3bLk8c=
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr8962162otc.128.1558110876186; 
 Fri, 17 May 2019 09:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
 <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
In-Reply-To: <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
From: Revath S Kumar <gmail@revathskumar.com>
Date: Fri, 17 May 2019 16:34:24 +0000
Message-ID: <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
Subject: Re: Wireguard andoird and Fire TV
To: Samuel Holland <samuel@sholland.org>
X-Mailman-Approved-At: Tue, 21 May 2019 15:56:58 +0200
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
Content-Type: multipart/mixed; boundary="===============1656189817704841629=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1656189817704841629==
Content-Type: multipart/alternative; boundary="0000000000004bce49058917f557"

--0000000000004bce49058917f557
Content-Type: text/plain; charset="UTF-8"

Hello Samuel,

Thanks for the reply. That tip helped me.
I am not a Andorid developer, but tried to look into the code to fix
this problem with help of some friends.
Seems like the issue is due to `
android:descendantFocusability="blocksDescendants"` in tunnel_list_item.xml
[1].

Is there any reason why the value is `blocksDecendants`?
When I remove that line it seems to work fine (gif link)[2].

I can send a patch if this is the only change needed.

[1]:
https://git.zx2c4.com/wireguard-android/tree/app/src/main/res/layout/tunnel_list_item.xml#n32
[2]: https://imgur.com/a/f3nbA7R

with regards,
Revath S Kumar,
JavaScripter / Rubyist

On Sun, May 12, 2019 at 5:37 PM Samuel Holland <samuel@sholland.org> wrote:

> On 5/6/19 4:27 AM, Revath S Kumar wrote:
> > Hello all,
> >
> > I tried to side load the wireguard android on Fire TV stick.
> > I was successfully able to install and create a new config.
> > But once the config is created I was not able to enable the config.
> >
> > The navigation using the FireTV remote never gets focus on config toggle
> button.
> >
> > Any plan to support TV sooner?
>
> See https://lists.zx2c4.com/pipermail/wireguard/2019-January/003768.html
>
> It's possible to get it working with the remote, but that would require
> someone
> to write (and test!) the code to do so. Right now there's nobody working
> on the
> Android app.
>
> > with regards,
> > Revath S Kumar,
> > JavaScripter / Rubyist / PHP
>
> Cheers,
> Samuel
>

--0000000000004bce49058917f557
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>He=
llo Samuel,</div><div><br></div><div>Thanks for the reply. That tip helped =
me.<br></div><div>I am not a Andorid developer, but tried to look into the =
code to fix this=C2=A0problem with help of some friends.</div><div>Seems li=
ke the issue is due to `<code>android:descendantFocusability=3D&quot;blocks=
Descendants&quot;</code>` in tunnel_list_item.xml [1].</div><div><br></div>=
<div>Is there any reason why the value is `blocksDecendants`? <br></div><di=
v>When I remove that line it seems to work fine (gif link)[2].</div><div><b=
r></div><div>I can send a patch if this is the only change needed.<br></div=
><div><br></div><div>[1]: <a href=3D"https://git.zx2c4.com/wireguard-androi=
d/tree/app/src/main/res/layout/tunnel_list_item.xml#n32">https://git.zx2c4.=
com/wireguard-android/tree/app/src/main/res/layout/tunnel_list_item.xml#n32=
</a><br></div><div>[2]: <a href=3D"https://imgur.com/a/f3nbA7R">https://img=
ur.com/a/f3nbA7R</a><br></div><div><br></div><div><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr">with regards,<br>Revath S Kumar,<br><div><span>JavaScripter / </span>Ru=
byist<br></div></div></div></div></div></div></div></div></div></div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, May 12, 2019 at 5:37 PM Samuel Holland &lt;<a href=3D"mailto:samuel=
@sholland.org">samuel@sholland.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 5/6/19 4:27 AM, Revath S Kumar wrote:<=
br>
&gt; Hello all,<br>
&gt; <br>
&gt; I tried to side load the wireguard android on Fire TV stick.<br>
&gt; I was successfully able to install and create a new config.<br>
&gt; But once the config is created I was not able to enable the config.<br=
>
&gt; <br>
&gt; The navigation using the FireTV remote never gets focus on config togg=
le button.<br>
&gt; <br>
&gt; Any plan to support TV sooner?<br>
<br>
See <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2019-January/003=
768.html" rel=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/pipe=
rmail/wireguard/2019-January/003768.html</a><br>
<br>
It&#39;s possible to get it working with the remote, but that would require=
 someone<br>
to write (and test!) the code to do so. Right now there&#39;s nobody workin=
g on the<br>
Android app.<br>
<br>
&gt; with regards,<br>
&gt; Revath S Kumar,<br>
&gt; JavaScripter / Rubyist / PHP<br>
<br>
Cheers,<br>
Samuel<br>
</blockquote></div>

--0000000000004bce49058917f557--

--===============1656189817704841629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1656189817704841629==--

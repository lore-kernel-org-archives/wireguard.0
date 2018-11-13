Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81761C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Nov 2018 19:25:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A20223C8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Nov 2018 19:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paZFaHrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A20223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26521a5b;
	Tue, 13 Nov 2018 19:19:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c662182
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Nov 2018 19:19:27 +0000 (UTC)
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 467814bf
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Nov 2018 19:19:26 +0000 (UTC)
Received: by mail-it1-x12f.google.com with SMTP id m34-v6so20091601iti.1
 for <wireguard@lists.zx2c4.com>; Tue, 13 Nov 2018 11:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=hBp/cs9GA4NaTXXe9JDW/7x/2SFQXyHm9QsAxWn9Mtg=;
 b=paZFaHrP0KMguX0ZJ37+xGTkfGpG/v4CKOfoyQpeYXbnIC2PyxHvip65xOS2mkxms1
 AKraJwQA6MFDyANxIZcH9xGC5rTOPtxm66J7mcjezwZy+76+TqNWbmOUozvZ5xdYH13z
 rq6L3gnl99EaZ30G+04SoJp30doNV0nqj6rzgQk46+TtGTd4TmOUGH5pWlc+XTkUhprr
 sB5oiZV07/MJIqod6ZquReOqS82DpYwyhMoT4EnL4G96k5ulyEW1G2WOwOT88917pSB3
 lwtOY9t10aMvlaMMQbOrHJfQY9O5Bgejrnw3ESZECYJVap7l5M8WOGDqYh86tRwBiWuf
 JlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=hBp/cs9GA4NaTXXe9JDW/7x/2SFQXyHm9QsAxWn9Mtg=;
 b=lG43Q917mi3Xg0VbEUVZaB7bco2gEKc1y9y9GIrWId4RI5HrTN9vq+3lkWGHTvloXs
 d6ZDG5HpGLAEXkXRfwEKB7dKq4cSyRc3H4ae5Ph8pk7NMvVQbhRvk36fYYuBYapLwdgV
 Jum+4rUvIrOgHc25d289HGmJkL4DrRnkNX7QHkkm+wBi9vWqvIuK3kzUm0VQwRBlY13z
 TkPVurKNcr8+qf1ZxKN8vgNTaSVehbUvZdSyT/SnF7SSarQs/wcEPYXDfZZgvHSrLW1d
 RxIj2hImgD0AYawjza4mJPeXC1xf/+h1rj3dmg9VU1D1pitp0fWLKEhZ2fqvOFfhuA/Z
 V2Hg==
X-Gm-Message-State: AGRZ1gJDGyvw5+20Eyo+9YcQe0RAjhn95CMrXfAu0aFgIkTPfL1TduWP
 gY3mFZlijFBXUNuP2ykcUQM2NhH1325OQo6iXBzQCA==
X-Google-Smtp-Source: AJdET5ekAehyC7oCcfpxK8gUgajdzRlGyEDqPL4Z8I/6jwlgSzTWZeB4aM0w4t50eojkaZ/LRyTHXfZOAckELDXq+Mw=
X-Received: by 2002:a02:5953:: with SMTP id
 p80-v6mr6149641jab.111.1542137080898; 
 Tue, 13 Nov 2018 11:24:40 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce2R2W+WkXm26Jo2RTmTkyG=rO7tc2jFf0s7-4pxPESTqw@mail.gmail.com>
In-Reply-To: <CAPRZce2R2W+WkXm26Jo2RTmTkyG=rO7tc2jFf0s7-4pxPESTqw@mail.gmail.com>
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Tue, 13 Nov 2018 14:24:02 -0500
Message-ID: <CAPRZce1JNxoegq1ipopd1RMe47JRNXCYj9n+DsAzAA8Q-uZW4Q@mail.gmail.com>
Subject: Re: how to diagnose lengthy ping times through a complex network stack
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============5499651636074615190=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5499651636074615190==
Content-Type: multipart/alternative; boundary="000000000000e6eba9057a90c4a8"

--000000000000e6eba9057a90c4a8
Content-Type: text/plain; charset="UTF-8"

Replying to my own email -

This latency problem I reported was not Wireguard's fault.
What happened was that one of the floating IP addresses
that was assigned to the VM was attached to an OpenStack
controller that had been provisioned in the wrong data center.
Amazingly the whole setup did continue to work, but the
ping times reflected pessimal routing, with the ping from
New Jersey to New Jersey going via Tokyo.

No individual component was anywhere near as slow as the
speed of light under the Pacific Ocean.

Note to self: if you can't debug the problem within the virtual
machine, start to look at the physical machines that provide
the virtual machines, and make sure you know what (and where)
they are.

Ed

On Fri, Nov 9, 2018 at 11:56 PM Edward Vielmetti <edward.vielmetti@gmail.com>
wrote:

> I have a network with several machines in it all running Wireguard.
>
> The latest device I've added to this assemblage is a virtual machine
> provisioned under OpenStack. It has 4 ThunderX cores (2 Ghz armv8)
> subdivided off of 96-core machine. What I notice is slow network
> performance through the Wireguard interface - 200 ms round trip VPN ping
> times to a machine in the same data center, compared to 1 ms when
> I don't go through the VPN, and only 45 ms when I use a different
> machine in the same data center to an even slower Raspberry Pi 2 in my
> attic.
>
> I don't claim to be an OpenStack expert, and I know there is some
> considerable complexity hiding in its network stack that might not
> be visible within the VM that I'm running.
>
> I guess the question is, what's the best way to start to make sense of
> network performance within Wireguard (and if anyone knows the answer,
> also within OpenStack?!).
>
> thanks
>
> Ed
>
> --
> Edward Vielmetti +1 734 330 2465
> edward.vielmetti@gmail.com
>
>

-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000e6eba9057a90c4a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Replying to my own=C2=A0email -<div><br></div><div>This la=
tency problem I reported was not Wireguard&#39;s fault.</div><div>What happ=
ened was that one of the floating IP addresses</div><div>that was assigned =
to the VM was attached to an OpenStack</div><div>controller that had been p=
rovisioned in the wrong data center.</div><div>Amazingly the whole setup di=
d continue to work, but the</div><div>ping times reflected pessimal routing=
, with the ping from=C2=A0</div><div>New Jersey to New Jersey going via Tok=
yo.</div><div><br></div><div>No individual component was anywhere near as s=
low as the</div><div>speed of light under the Pacific Ocean.</div><div><br>=
</div><div>Note to self: if you can&#39;t debug the problem within the virt=
ual</div><div>machine, start to look at the physical machines that provide<=
/div><div>the virtual machines, and make sure you know what (and where)</di=
v><div>they are.</div><div><br></div><div>Ed</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Fri, Nov 9, 2018 at 11:56 PM Edward Vielmet=
ti &lt;<a href=3D"mailto:edward.vielmetti@gmail.com">edward.vielmetti@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
">I have a network with several machines in it all running Wireguard.=C2=A0=
<div><br></div><div>The latest device I&#39;ve added to this assemblage is =
a virtual machine</div><div>provisioned under OpenStack. It has 4 ThunderX =
cores (2 Ghz armv8)</div><div>subdivided off of 96-core machine. What I not=
ice is slow network</div><div>performance through the Wireguard interface -=
 200 ms round trip VPN ping</div><div>times to a machine in the same data c=
enter, compared to 1 ms when</div><div>I don&#39;t go through the VPN, and =
only 45 ms when I use a different</div><div>machine in the same data center=
 to an even slower Raspberry Pi 2 in my attic.</div><div><br></div><div>I d=
on&#39;t claim to be an OpenStack expert, and I know there is some</div><di=
v>considerable complexity hiding in its network stack that might not</div><=
div>be visible within the VM that I&#39;m running.=C2=A0</div><div><br></di=
v><div>I guess the question is, what&#39;s the best way to start to make se=
nse of</div><div>network performance within Wireguard (and if anyone knows =
the answer,</div><div>also within OpenStack?!).=C2=A0</div><div><br></div><=
div>thanks</div><div><br></div><div>Ed<br clear=3D"all"><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"m_-3700059037923505429m_8796955196307804975gma=
il_signature" data-smartmail=3D"gmail_signature"><span>Edward Vielmetti=C2=
=A0<span id=3D"m_-3700059037923505429m_8796955196307804975gc-number-1038" c=
lass=3D"m_-3700059037923505429m_8796955196307804975gc-cs-link" title=3D"Cal=
l with Google Voice"><span id=3D"m_-3700059037923505429gc-number-1049" clas=
s=3D"m_-3700059037923505429gc-cs-link" title=3D"Call with Google Voice">+1 =
734 330 2465</span></span></span><div><a href=3D"mailto:edward.vielmetti@gm=
ail.com" target=3D"_blank">edward.vielmetti@gmail.com</a></div><div><br></d=
iv></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Edward Vielme=
tti=C2=A0+1 734 330 2465<div><a href=3D"mailto:edward.vielmetti@gmail.com" =
target=3D"_blank">edward.vielmetti@gmail.com</a></div><div><br></div></div>

--000000000000e6eba9057a90c4a8--

--===============5499651636074615190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5499651636074615190==--

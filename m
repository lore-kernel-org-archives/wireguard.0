Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F25C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Nov 2018 04:57:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2177620818
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Nov 2018 04:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WppyGTGr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2177620818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9abdec9;
	Sat, 10 Nov 2018 04:52:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24de0875
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Nov 2018 04:52:39 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8a5d08a
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Nov 2018 04:52:38 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f12-v6so2816193iog.0
 for <wireguard@lists.zx2c4.com>; Fri, 09 Nov 2018 20:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hd8KEseovn6nM3CWZBN+JU0hvbpjisqxDC7CozWBISk=;
 b=WppyGTGrBuxKoDCGHuI60tTqoimM+HG9ERqAhgzfpu73KuXGIfRxrUvPiVCZ4nX/VR
 gRNb+Vql8EEGP8BXOiHlf+sARnuZ1Qr4wrSBqNrzINyI/r1h1bLwCHpYFJjrqzwN5FZA
 6ikgxWobsxt/nzYOgL/zxgo11VQxdkh1yjE2UjE4ZOUb5Ax+ajB0CAxHMuTLwJEdPEM8
 8yz+ue7kbJmdBKEOyZ8XJ2JMtRyR1f6VIfs2zSe+CsbCsGd+V2yZjfehIP08q5uFc5Au
 r5rYP70kQhVVcMi49K+cuggaQpDGemS+BKHKOkJkNH5gT8h5HepliZy0veimbUGJa9w3
 QhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hd8KEseovn6nM3CWZBN+JU0hvbpjisqxDC7CozWBISk=;
 b=U6CmohlTCuTZLRgQBPXeY3eah5pvmkkRPSE7nI6njqbhGXOvBbtOh1YCHDUJmPVRTW
 j6ynF8JmMgz40TH3132gM8Es8evSky+UYBC7lGsnJvbU+ZkyHD1cqaPNp4AEU3XpogRe
 q8CDyqgmZv2ZUk+cKhBPGBuQ6SYE8l4Qfv73rZUB2wyJjnJ8NDCSSndwo/dRM3nDPaTN
 s7pYiPEhBMUcYnDrlUhbxb//V/tcwymv8GFG9M/4IN8kB0/a9eOQPropCCMPUrVzRUbu
 pZPJHNzEShU+6PKnr/WF1WH8k+qkHssGYm+Q+5YaxFMRRjYXyQE/tGvqxsXvvtjnHejv
 9w7A==
X-Gm-Message-State: AGRZ1gLnrxp3zA3Skfxz1+9Zj/mHG3XRYzH/cIL5IPbNQ7UsfLMOZkWJ
 6HJdpHkbG6D3duOLtq4T9Vb4zEh5jznYyD737ph17g==
X-Google-Smtp-Source: AJdET5fLwhMPC9m7aQAUy5Dc6AUN+aRe1qZ7ogRlsFRnYC8lwNLO57OYO290/tNvn8XXDBG82LGWDlAy2bqiOi/5vX0=
X-Received: by 2002:a6b:440c:: with SMTP id
 r12-v6mr9381529ioa.35.1541825845731; 
 Fri, 09 Nov 2018 20:57:25 -0800 (PST)
MIME-Version: 1.0
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Fri, 9 Nov 2018 23:56:47 -0500
Message-ID: <CAPRZce2R2W+WkXm26Jo2RTmTkyG=rO7tc2jFf0s7-4pxPESTqw@mail.gmail.com>
Subject: how to diagnose lengthy ping times through a complex network stack
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
Content-Type: multipart/mixed; boundary="===============1156627357789697127=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1156627357789697127==
Content-Type: multipart/alternative; boundary="000000000000d72b0f057a484da5"

--000000000000d72b0f057a484da5
Content-Type: text/plain; charset="UTF-8"

I have a network with several machines in it all running Wireguard.

The latest device I've added to this assemblage is a virtual machine
provisioned under OpenStack. It has 4 ThunderX cores (2 Ghz armv8)
subdivided off of 96-core machine. What I notice is slow network
performance through the Wireguard interface - 200 ms round trip VPN ping
times to a machine in the same data center, compared to 1 ms when
I don't go through the VPN, and only 45 ms when I use a different
machine in the same data center to an even slower Raspberry Pi 2 in my
attic.

I don't claim to be an OpenStack expert, and I know there is some
considerable complexity hiding in its network stack that might not
be visible within the VM that I'm running.

I guess the question is, what's the best way to start to make sense of
network performance within Wireguard (and if anyone knows the answer,
also within OpenStack?!).

thanks

Ed

-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000d72b0f057a484da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a network with several machines in it all running W=
ireguard.=C2=A0<div><br></div><div>The latest device I&#39;ve added to this=
 assemblage is a virtual machine</div><div>provisioned under OpenStack. It =
has 4 ThunderX cores (2 Ghz armv8)</div><div>subdivided off of 96-core mach=
ine. What I notice is slow network</div><div>performance through the Wiregu=
ard interface - 200 ms round trip VPN ping</div><div>times to a machine in =
the same data center, compared to 1 ms when</div><div>I don&#39;t go throug=
h the VPN, and only 45 ms when I use a different</div><div>machine in the s=
ame data center to an even slower Raspberry Pi 2 in my attic.</div><div><br=
></div><div>I don&#39;t claim to be an OpenStack expert, and I know there i=
s some</div><div>considerable complexity hiding in its network stack that m=
ight not</div><div>be visible within the VM that I&#39;m running.=C2=A0</di=
v><div><br></div><div>I guess the question is, what&#39;s the best way to s=
tart to make sense of</div><div>network performance within Wireguard (and i=
f anyone knows the answer,</div><div>also within OpenStack?!).=C2=A0</div><=
div><br></div><div>thanks</div><div><br></div><div>Ed<br clear=3D"all"><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"m_8796955196307804975gmail_sign=
ature" data-smartmail=3D"gmail_signature"><span>Edward Vielmetti=C2=A0<span=
 id=3D"m_8796955196307804975gc-number-1038" class=3D"m_8796955196307804975g=
c-cs-link" title=3D"Call with Google Voice"><span id=3D"gc-number-1049" cla=
ss=3D"gc-cs-link" title=3D"Call with Google Voice">+1 734 330 2465</span></=
span></span><div><a href=3D"mailto:edward.vielmetti@gmail.com" target=3D"_b=
lank">edward.vielmetti@gmail.com</a></div><div><br></div></div></div></div>

--000000000000d72b0f057a484da5--

--===============1156627357789697127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1156627357789697127==--

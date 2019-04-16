Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5745BC04AAE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA14B206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA14B206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zarzycki.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d543e541;
	Mon, 6 May 2019 20:35:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea3d65d2
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 00:30:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebea5e9d
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 00:30:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v14so22713047wmf.2
 for <wireguard@lists.zx2c4.com>; Mon, 15 Apr 2019 17:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hzY7/XS1CM28+8p/B5flt7OZ6fG8dCrYif4NSCs5++c=;
 b=ZJwmunsKsn3S1PnBTpMrfPtMAGVPJ7x7FlQYzzFNtin+Qqct3/nZmrdnqKqVmU5sRr
 6lcvH24bC7DuFrtWEv/Z2fnKxrTKUx7nrM51X+jYQG1Yw0O1IyvBzrQSpW7olMMADFMh
 Tv7Gwl8Fh7duoNtYQpfnT468EiE8+wfHrdj89wcrYiehJXAP2UpBnOwtX5QeAmJWlNRE
 TGusMmg6phOr685NRZXaRFZlqyZhSu0orvVdhohOr4AvdzJKyq1yGrQqtyyihBlh1Qj1
 2CdceIV0LSH+ycipl3Wox0ybfm/0xzZUQocgYUqTpFxlZ/tEP4i16suMB8knhrftMBeS
 aaTg==
X-Gm-Message-State: APjAAAUr1aJwJIasnEjSY6q+WyWymNNtStQFjq/MJShomhB8oCfmIHgL
 FGAvl8qciEwjj0rG7PYuhygttIZT/fLI0cmUXabD5c0e
X-Google-Smtp-Source: APXvYqzwZfS0S7fRmVDeFE682c+keRApJ7giAFeWbbhVVy6RUIyy8aiaHFPHWNRKNizDvAvlnFdc6qHL7pZNmT9tw8k=
X-Received: by 2002:a7b:c446:: with SMTP id l6mr25240184wmi.80.1555374623941; 
 Mon, 15 Apr 2019 17:30:23 -0700 (PDT)
MIME-Version: 1.0
From: Benjamin Zarzycki <ben@zarzycki.org>
Date: Mon, 15 Apr 2019 17:30:12 -0700
Message-ID: <CALt6Z-Z2WvbZ8ru0W9Xqtgkmt_Oqwpq03=k1Y3r-BQPtXnbddA@mail.gmail.com>
Subject: macOS/darwin kernel module (kext)
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:35:06 +0200
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
Content-Type: multipart/mixed; boundary="===============8575550708701879561=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8575550708701879561==
Content-Type: multipart/alternative; boundary="000000000000f3ebe005869adf43"

--000000000000f3ebe005869adf43
Content-Type: text/plain; charset="UTF-8"

Hi Folks,

I'm new to the mailing list and community.  If I missed some rules or
otherwise commit a faux pas, please let me know.

I searched the mailing list archives and didn't find any discussion of a
MacOS/darwin kernel module (kext) for WireGuard.  I see it was implemented
using Apple's Network Extension API in the wireguard-ios repository and
there's the wireguard-go implementation as well.

I'm not an expert. Would anyone care to share their thoughts/opinions on
using Darwin's Network Kernel Extensions to implement WireGuard?

Thanks,
Ben

--000000000000f3ebe005869adf43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Folk=
s,<div><br></div><div>I&#39;m new to the mailing list and community.=C2=A0 =
If I missed some rules or otherwise commit a faux pas, please let me know.<=
/div><div><br></div><div>I searched the mailing list archives and didn&#39;=
t find any discussion of a MacOS/darwin kernel module (kext) for WireGuard.=
=C2=A0 I see it was implemented using=C2=A0<span style=3D"color:rgb(0,0,0);=
white-space:pre-wrap">Apple&#39;s Network Extension API in the </span><font=
 color=3D"#000000"><span style=3D"white-space:pre-wrap">wireguard-ios repos=
itory and there&#39;s the wireguard-go implementation as well</span></font>=
<span style=3D"white-space:pre-wrap;color:rgb(0,0,0)">.</span></div><div><f=
ont color=3D"#000000"><span style=3D"white-space:pre-wrap"><br></span></fon=
t></div><div><font color=3D"#000000"><span style=3D"white-space:pre-wrap">I=
&#39;m not an expert.  Would anyone care to share their thoughts/opinions o=
n using Darwin&#39;s Network Kernel Extensions to implement WireGuard?</spa=
n></font></div><div><br></div><div>Thanks,</div><div>Ben</div></div></div><=
/div></div>

--000000000000f3ebe005869adf43--

--===============8575550708701879561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8575550708701879561==--

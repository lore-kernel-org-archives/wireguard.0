Return-Path: <SRS0=11GK=3V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ADCC33CB3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Feb 2020 19:10:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4832064C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Feb 2020 19:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=davz-net.20150623.gappssmtp.com header.i=@davz-net.20150623.gappssmtp.com header.b="0UHBBA6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C4832064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davz.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af3bf08c;
	Sat, 1 Feb 2020 19:10:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b20bcfa8
 for <wireguard@lists.zx2c4.com>; Sat, 1 Feb 2020 19:10:11 +0000 (UTC)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9078d003
 for <wireguard@lists.zx2c4.com>; Sat, 1 Feb 2020 19:10:11 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id s85so5744031ill.11
 for <wireguard@lists.zx2c4.com>; Sat, 01 Feb 2020 11:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davz-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jrJjXL/FkVhTfqHWaHh415v5kVur74KSrpgMMbB3CQ=;
 b=0UHBBA6MkstxieIfNIGyE+kSnVAHmwFziMzd8Z/eGjODcQnTc7pf2TPT1DPYjgVCjC
 UoM4+it7i/7EoJpriHW69VCz/tLr06gu5+Z6Tu3A9C9+5+jwn4BlJvAP/InEhelGZc1J
 FO6WA5Zs6yXEm/29cnR5+ZXsG9QpIO85RwKn7/Y4lCbGofasMq8K9t6bVIJpGPLG+rBT
 wren1DPrgYs6exO4j9bQw6wvrukj2v/EW1Or5eTCtiuA1NV6TsgotTywUl0Hm8WpPs3N
 cSyHPXZmmSWTjcCXrpZqD8NbG4BnzNkgiLNYzaN4yyBmEKrCJ9OMUGkC92239BDTLEOS
 byaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jrJjXL/FkVhTfqHWaHh415v5kVur74KSrpgMMbB3CQ=;
 b=m4hazADMG3lf31lIWJuIctY6HbJbq5Rx8GpnOvUSsUpsXSQEf8E8wHfts9okUtizYO
 YRUh9NDFtyoVgjMzcIJmvOQin5R9wznqrxVoaXvtEBhXq7SEhnIV2LM7oaVw9LzpVtnI
 ZrxLhkKzB1hwRrZiBCQjHvtN69Ne0tqutmsRLG6dp6DB8G7o0VQhGeXoVpGOHNZm6HiN
 wHUN5DQ+/4BUrgTsmkRK/dyq0VAYgrd2Q4XtbAeS+3QYhHgk/q05/yWM2edr8OfqXJSz
 uwQC5nqfph1T44waILit0wLBz29KL0ZAIr/5xmrzL7mi4xANp4vean5CyVFkPAdIqq8z
 XHSg==
X-Gm-Message-State: APjAAAVdVRkD2ColDd2fK+3O4TZF8Sfejq/NAWV94ckOTPWnDvVR991M
 j1vccD+AXvZnBaxGZPHBdmHTG1QQHtwk57+YfY/TzQ==
X-Google-Smtp-Source: APXvYqzjsP7FB3JczlqKTR5uAiAvBNZL7rb9Wcszalah5kxt1QY6BNw0uzB9bGV6PAke4cI/ryaAFIXVAdAF0avZ4tQ=
X-Received: by 2002:a92:7606:: with SMTP id r6mr14605123ilc.120.1580584237055; 
 Sat, 01 Feb 2020 11:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20200123111825.17435-1-ilie.halip@gmail.com>
 <CAHmME9rTD=zCpw5fkw-baUHBuutWzg18aJ-8KvnPHzNpJDTNHw@mail.gmail.com>
 <CAHmME9pcSBi6XJn0AUHg6YPD+nBCm8pnhS6QC-Dz4Md5YX_dxQ@mail.gmail.com>
 <CAHFW8PQ3=-f4aSxfSj1DEPxiM_yJgyiVubLmFdbGxYUDA_ST-w@mail.gmail.com>
In-Reply-To: <CAHFW8PQ3=-f4aSxfSj1DEPxiM_yJgyiVubLmFdbGxYUDA_ST-w@mail.gmail.com>
From: Alex Davies <alex@davz.net>
Date: Sat, 1 Feb 2020 19:10:26 +0000
Message-ID: <CAHwDNp0nBRsyksGMNyL-fLoY_5e2AQvqm2xTSSb=umPMXSZ3KQ@mail.gmail.com>
Subject: Re: [PATCH] compat: support building for RHEL-8.2
To: Ilie Halip <ilie.halip@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1913715157910708603=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1913715157910708603==
Content-Type: multipart/alternative; boundary="000000000000fcdef3059d88711a"

--000000000000fcdef3059d88711a
Content-Type: text/plain; charset="UTF-8"

Hey All,

Its worth remembering that the RHEL release date and the CentOS release
dates are months part, for example:

RHEL 8.1 released: 5 Nov 2019
CentOS 8.1 released: ~15 Jan 2020

Much as I dont like this, the reality is that most RHEL/CentOS users will
not immediately upgrade to the "latest" kernel/release and even if they try
they cant for months unless they are paying RedHat money.

For what its worth, we are using our small influence as a paying
customer of RedHat (we have many thousands of host subscriptions) to ask
them to merge the (now upstream) upstream patches into RHEL8 (and then
manage it like everything else in their kernel), probably initially as a
Tech Preview, which is the real fix to this. If anybody else is also keen
to see this and is paying them, feel free to message me off-list and we can
get our TAMs to work together!

-Alex

--000000000000fcdef3059d88711a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hey All,</div><div dir=3D"ltr"><br></div>=
<div dir=3D"ltr">Its worth remembering that the RHEL release date and the C=
entOS release dates are months part, for example:<div><br><div>RHEL 8.1 rel=
eased:=C2=A05 Nov 2019</div><div>CentOS 8.1 released: ~15 Jan 2020</div><di=
v><br></div><div>Much as I dont like this, the reality is that most RHEL/Ce=
ntOS users will not immediately upgrade to the &quot;latest&quot; kernel/re=
lease and even if they try they cant for months unless they are paying RedH=
at money.=C2=A0</div><div><br></div><div>For what its=C2=A0worth, we are us=
ing our small influence as a paying customer=C2=A0of RedHat (we have many t=
housands of host subscriptions) to ask them to merge the (now upstream) ups=
tream patches into RHEL8 (and then manage it like everything else in their =
kernel), probably initially as a Tech Preview, which is the real fix to thi=
s. If anybody else is also keen to see this and is paying them, feel free t=
o message me off-list and we can get our TAMs to work together!</div><div><=
br></div><div>-Alex</div></div></div></div>

--000000000000fcdef3059d88711a--

--===============1913715157910708603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1913715157910708603==--

Return-Path: <SRS0=Gm1R=NW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963EBC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 11 Nov 2018 02:56:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6882208A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 11 Nov 2018 02:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvHtdRRJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6882208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49ed1638;
	Sun, 11 Nov 2018 02:51:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05bd488e
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Nov 2018 02:51:45 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a7dfd09
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Nov 2018 02:51:45 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 189so8182105qkj.8
 for <wireguard@lists.zx2c4.com>; Sat, 10 Nov 2018 18:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8mq5dZ6dhCoo3qNQ/XshxGDk+RWMj4CK7yEAG5kpQ9o=;
 b=XvHtdRRJTG1kazI7YbGFolOiBLWeq+X5QjrXj3brfv1AS2g+7iq+5K1ilu+MIMPraq
 WL+ED4TMpmb7PyBHR7UhqAHakKCvw621ROsOgkVrsuVt14sibKKghXnNiC6mnm05yRcj
 at5xzgzA8nyLlhqZvHtkEifJ789d5pflVGM87QW2IpVE0pACCIVsSjjGi9WYxFy8/T+t
 fed7tnKcXUJ44zI3ZYaWCU81Q4dyp5ZsHX0myJZBMfdAZdTEctWdbDVj1JtFOdaOpV7d
 Z3L/mCxaR1gWzyyMuqoYxaVg+d0wcs4FoL5OzrTctKm4o5rG66yUfo9LHmSz4RCMck1g
 ddTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8mq5dZ6dhCoo3qNQ/XshxGDk+RWMj4CK7yEAG5kpQ9o=;
 b=fvykNLdxFl0uxSZJSVRRvHWWv6LC9tMujpnk+ZQrFeXfJmvjTz0fMw3CB/ZgGmSYeV
 yi13I/e5yQ1CbIoVJunAKe5csdkK0r+y920sKVReH20ePAdwuR1JArRKcnPDdBaBz1t0
 8fFwzqwzXmXwoKhFdmx38QuY7TV4vc9CIUOy0nrDIHDAMPkCiByVyImvHwPzpdCSjpRa
 G3iLzfSA3G1KI/+iLOmh6O15aYcpA8i2fvvrCOXS22Z7A3SW3t4EJtzaKFn0y/IejlOi
 CM+2fSIHw9ltdbPXh0Ry3AO+jQKFlUh9NfBTcvbPkOX8YuhhNobEbjZ+hVg2DCCn2LfE
 3HNg==
X-Gm-Message-State: AGRZ1gLKRKmhylHzrB0CKniGgmIiTeJcIebkW/5BZ6/H4FM1zl9z3OII
 i3vwsAo1C+8R5kuerDqXVwSXVHR3hbkCPt/+WWu1BhNeSDo=
X-Google-Smtp-Source: AJdET5ftpvL9x37tKg41yCe1B+JiUd0mP+2RRx8DBaeLKoMkjRn7NJNUPkX8uE1SR2cDtD9xGnD8YC3tfDs9CB2r0Zs=
X-Received: by 2002:ae9:d8c2:: with SMTP id u185mr6530001qkf.107.1541905000211; 
 Sat, 10 Nov 2018 18:56:40 -0800 (PST)
MIME-Version: 1.0
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Sun, 11 Nov 2018 04:56:28 +0200
Message-ID: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
Subject: Debian unstable Pin-Priority too high in Installation documentation
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============7843078253438989392=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7843078253438989392==
Content-Type: multipart/alternative; boundary="000000000000d0a8c8057a5abb70"

--000000000000d0a8c8057a5abb70
Content-Type: text/plain; charset="UTF-8"

Hi,
On the Wireguard site the Debian installation Pin-Priority is at 150 - this
is too high because the official Backports (Stretch-Backports currently)
has a default of 100. This makes certain packages such as kernel images to
be pointed to Unstable instead of Backports.
I believe a number such as 90 should be better choice.

For example for the package linux-image-amd64 we have:

# apt-cache policy linux-image-amd64
linux-image-amd64:
  Installed: 4.18+98~bpo9+1
  Candidate: 4.18+99
  Version table:
     4.18+99 150
        150 http://deb.debian.org/debian unstable/main amd64 Packages
 *** 4.18+98~bpo9+1 100
        100 http://ftp.debian.org/debian stretch-backports/main amd64
Packages
        100 /var/lib/dpkg/status
     4.9+80+deb9u6 500
        500 http://ftp.debian.org/debian stretch/main amd64 Packages
        500 http://security.debian.org/debian-security stretch/updates/main
amd64 Packages

But if we lower the Pin Priority to 90:

# apt-cache policy linux-image-amd64
linux-image-amd64:
  Installed: 4.18+98~bpo9+1
  Candidate: 4.18+98~bpo9+1
  Version table:
     4.18+99 90
         90 http://deb.debian.org/debian unstable/main amd64 Packages
 *** 4.18+98~bpo9+1 100
        100 http://ftp.debian.org/debian stretch-backports/main amd64
Packages
        100 /var/lib/dpkg/status
     4.9+80+deb9u6 500
        500 http://ftp.debian.org/debian stretch/main amd64 Packages
        500 http://security.debian.org/debian-security stretch/updates/main
amd64 Packages

--000000000000d0a8c8057a5abb70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Hi,</div><div>On the Wireguard site the Debian installation =
Pin-Priority is at 150 - this is too high because the official Backports (S=
tretch-Backports currently) has a default of 100. This makes certain packag=
es such as kernel images to be pointed to Unstable instead of Backports.</d=
iv><div>I believe a number such as 90 should be better choice.</div><div><b=
r></div><div>For example for the package linux-image-amd64 we have:</div><d=
iv><br></div><div># apt-cache policy linux-image-amd64<br>linux-image-amd64=
:<br>=C2=A0 Installed: 4.18+98~bpo9+1<br>=C2=A0 Candidate: 4.18+99<br>=C2=
=A0 Version table:<br>=C2=A0=C2=A0=C2=A0=C2=A0 4.18+99 150<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 150 <a href=3D"http://deb.debian.org/debian"=
>http://deb.debian.org/debian</a> unstable/main amd64 Packages<br>=C2=A0***=
 4.18+98~bpo9+1 100<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100 <a hr=
ef=3D"http://ftp.debian.org/debian">http://ftp.debian.org/debian</a> stretc=
h-backports/main amd64 Packages<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 100 /var/lib/dpkg/status<br>=C2=A0=C2=A0=C2=A0=C2=A0 4.9+80+deb9u6 500<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 500 <a href=3D"http://ftp.deb=
ian.org/debian">http://ftp.debian.org/debian</a> stretch/main amd64 Package=
s<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 500 <a href=3D"http://secur=
ity.debian.org/debian-security">http://security.debian.org/debian-security<=
/a> stretch/updates/main amd64 Packages<br><br></div><div>But if we lower t=
he Pin Priority to 90:</div><div><br></div><div># apt-cache policy linux-im=
age-amd64<br>linux-image-amd64:<br>=C2=A0 Installed: 4.18+98~bpo9+1<br>=C2=
=A0 Candidate: 4.18+98~bpo9+1<br>=C2=A0 Version table:<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 4.18+99 90<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 90=
 <a href=3D"http://deb.debian.org/debian">http://deb.debian.org/debian</a> =
unstable/main amd64 Packages<br>=C2=A0*** 4.18+98~bpo9+1 100<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100 <a href=3D"http://ftp.debian.org/debi=
an">http://ftp.debian.org/debian</a> stretch-backports/main amd64 Packages<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100 /var/lib/dpkg/status<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 4.9+80+deb9u6 500<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 500 <a href=3D"http://ftp.debian.org/debian">http://ftp.deb=
ian.org/debian</a> stretch/main amd64 Packages<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 500 <a href=3D"http://security.debian.org/debian-securit=
y">http://security.debian.org/debian-security</a> stretch/updates/main amd6=
4 Packages</div><div><br></div></div></div></div></div></div>

--000000000000d0a8c8057a5abb70--

--===============7843078253438989392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7843078253438989392==--

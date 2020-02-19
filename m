Return-Path: <SRS0=OdKV=4H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7958C34056
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Feb 2020 20:32:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00393208C4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Feb 2020 20:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AxPDrn78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00393208C4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dde16b52;
	Wed, 19 Feb 2020 20:29:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93f5fa0c
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 20:29:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94844501
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 20:29:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0763d023
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=R2DV4r
 h7A1HSX2daOMVkD6hLC/s=; b=AxPDrn78XALR5uClGIDh2Yfdf5dymOnCifzPw0
 Wb9xb+nnn/dOr1B3lDu5TN9NoTToDZJGseb0oZLga8fvci0iQ0HKliZNIVp0wwqR
 n6jkIhL0S8RUPFGuZHjY1Iy2KioH+66AoB6FTVtmEpDqM5FYykX0eAZ5kCuVGsy2
 cbMPwqId9/SQ0LjHaqa98vidygv3dA24dyF/LpA7doJP2npGi/BPUGyVZFGOF0Xw
 XEE8IhowfLcrUITLkGx6bIFWkA199f2dlRXLCTd20C1Bsh7Tb+i2AOGhKrvJVVAI
 YJH+ubecmZN4Awl9unTxDAQTdUYAiY4IXmKdwJ4f/UP0fuiA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32a73a16
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2020 20:29:39 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id r16so1493442otd.2
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2020 12:32:26 -0800 (PST)
X-Gm-Message-State: APjAAAWT6veWhXK7zOCisAefadN+04TN6x04mLDF2c7dwHNN6MvgvTZI
 oxyHT6gvRmN9PZEUrEHkL23LaWZao9WHFiEivNw=
X-Google-Smtp-Source: APXvYqxHCgufGRRDHfAEg+5kQfKlFZ2/3T7EdmSHhwXVyWXxaWjQx36jkdKyfRG/DvdpXj1G0HFReNGfA+Tyn+24I/o=
X-Received: by 2002:a9d:6a53:: with SMTP id h19mr21750823otn.120.1582144346319; 
 Wed, 19 Feb 2020 12:32:26 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Feb 2020 21:32:15 +0100
X-Gmail-Original-Message-ID: <CAHmME9rAVrEUsRibMJ30UBJbsYfD4FaAcpcqmSGR4JMvJ2=_bw@mail.gmail.com>
Message-ID: <CAHmME9rAVrEUsRibMJ30UBJbsYfD4FaAcpcqmSGR4JMvJ2=_bw@mail.gmail.com>
Subject: build breakage on Ubuntu 19.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi all,

The Canonical kernel team is a bit behind in deploying fixes (i.e.
bumping the wireguard package version) for recent breakage they
introduced. As a result, WireGuard will entirely stop working when
people update their systems. It's been like this for at least a week,
as far as I can see, and the emails keep piling up, so it seems
prudent I send a warning about the issue.

As an interim fix, Unit193 very nicely got our usual PPA making
packages for Ubuntu 19.10, which you can use in place of the packages
from Canonical. To activate this, do the following:

$ sudo add-apt-repository ppa:wireguard/wireguard
$ sudo apt-get update
$ sudo apt-get upgrade

That should result in updating your wireguard package from Canonical's
to the working and up to date one inside of the PPA.

Sorry about this. For 20.04 LTS, Canonical will be shipping wireguard
along with their kernel, and we've also discussed them doing the same
for 18.04 LTS. This means that it'll be built as part of their CI and
distributed normally, so problems like this shouldn't come up again.
And of course, with WireGuard being upstream now, as Linux 5.6
trickles down into the distros, this class of problems should
disappear entirely.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1B8C04AAB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5DE620830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5DE620830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d8d484c;
	Mon, 6 May 2019 20:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e86d8b7d
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Apr 2019 10:20:27 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d01f2d47
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Apr 2019 10:20:27 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id f13so1187209qto.6
 for <wireguard@lists.zx2c4.com>; Thu, 18 Apr 2019 03:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=S7JcrLnpQoYx9HvrFSyZ81m898FzbHS9EU7LXrGGSNI=;
 b=WySQRtBUFj5Y01otIiMR+CF2wsKp4uHLxWedgYfFVmaPEO1Na9INaj0PDU/Qz2lLYi
 TMFgELpteAX4pzQE1G4RmCCR5gFQ3u6+0+pQqyDEtXASB1NAcrr8kQJYkx6jpKhHnaiq
 DT6bMETYlYb93UCHCiwJPJ4nzlZ7pFlzbvViUfx+tcNjJ2zAt2saqTFS+9c2v2jjoCg4
 6UkwLhNFB7yyWaIlNU9+aw2tXsBLmN5teINOPy2odlMJcyvV/u+9t4C/362XMJ+CC2cv
 RkLUIKlxXjmbPteAJ2Bg7piX4phdAIsb85V3btzf8dy3Knam8e7AkZxZrZnB7Il/89SZ
 hs5A==
X-Gm-Message-State: APjAAAUp58BjTks05MuZ3hJnJfypATi23yMqEDZ697SZmLTvsPx+Yko2
 shDzmBKxRP07Vn5x/xYdq86F7KtGAqk=
X-Google-Smtp-Source: APXvYqyFL0yJLaBK7/JX2OHJ5BgGbQDMPYiXQiYDmHfEW6qxkLhRHRFa8HEiC9mQYb9vaAwJ5KC8ew==
X-Received: by 2002:ac8:4547:: with SMTP id z7mr77484715qtn.295.1555582826229; 
 Thu, 18 Apr 2019 03:20:26 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176])
 by smtp.gmail.com with ESMTPSA id e4sm829879qtb.61.2019.04.18.03.20.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 03:20:25 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id k14so1588491qtb.0
 for <wireguard@lists.zx2c4.com>; Thu, 18 Apr 2019 03:20:25 -0700 (PDT)
X-Received: by 2002:ac8:325c:: with SMTP id y28mr80305239qta.40.1555582825495; 
 Thu, 18 Apr 2019 03:20:25 -0700 (PDT)
MIME-Version: 1.0
From: Jari Tenhunen <jari.tenhunen@iki.fi>
Date: Thu, 18 Apr 2019 13:20:14 +0300
X-Gmail-Original-Message-ID: <CAFC8xAL5U0enO9+-rKGz4xhXnNLsr1rkQ_Z+fFSWMp=4=gtNGA@mail.gmail.com>
Message-ID: <CAFC8xAL5U0enO9+-rKGz4xhXnNLsr1rkQ_Z+fFSWMp=4=gtNGA@mail.gmail.com>
Subject: Very modest performance observed on macOS
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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
Content-Type: multipart/mixed; boundary="===============1388282142612047465=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1388282142612047465==
Content-Type: multipart/alternative; boundary="000000000000bb84f70586cb59ea"

--000000000000bb84f70586cb59ea
Content-Type: text/plain; charset="UTF-8"

Hi,

I experimented with WireGuard on a 13" MacBook Pro (2018, core i5) and was
surprised to see that all implementations running on macOS (WireGuard app
from App Store, Boringtun, and WireGuard-go) achieved a max throughput of
only 80-100 Mbit/s. And what is even more strange, when running these same
implementations in a Linux container on Docker (on the same machine,
against the same peer), the performance is clearly better, close to 150
Mbit/s.  In the latter case, it is probably limited by the peer HW
performance (Raspberry Pi 3B), so it could be even higher. I got these
throughput numbers by running iperf inside the tunnel.

Do you have any idea what is limiting the performance on macOS? Inefficient
utun driver?


BR,
Jari

--000000000000bb84f70586cb59ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>I experimented wit=
h WireGuard on a 13&quot; MacBook Pro (2018, core i5) and was surprised to =
see that all implementations running on macOS (WireGuard app from App Store=
, Boringtun, and WireGuard-go) achieved a max throughput of only 80-100 Mbi=
t/s. And what is even more strange, when running these same implementations=
 in a Linux container on Docker (on the same machine, against the same peer=
), the performance is clearly better, close to 150 Mbit/s.=C2=A0 In the lat=
ter case, it is probably limited by the peer HW performance (Raspberry Pi 3=
B), so it could be even higher. I got these throughput numbers by running i=
perf inside the tunnel.</div><div><br></div><div>Do you have any idea what =
is limiting the performance on macOS? Inefficient utun driver?</div><div><b=
r></div><div><br></div><div>BR,</div><div>Jari</div></div></div>

--000000000000bb84f70586cb59ea--

--===============1388282142612047465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1388282142612047465==--

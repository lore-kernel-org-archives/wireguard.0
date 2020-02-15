Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0354DC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:29:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E06C2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvUA6ZmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E06C2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52a74902;
	Sat, 15 Feb 2020 19:25:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e91b695a
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 17:40:45 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 538b9b68
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 17:40:45 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d11so12356305qko.8
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HgutHtxV/eRkMCvWxikzs7c7tVICc4HtZt2CAObW0C4=;
 b=mvUA6ZmKqKXQ2CWxEq+zbZkGMcL7EASozHT52bwlnRCpyhM9/h0wwFw9ekl5gCLkwm
 b1mslsj8uRqj2Niedtvx7GnI/IOecY3/QiGz05lCewN0q56kMK0Gcdl08nuwsb4Anr4J
 WRmVQJWJrmGY2q8vrvfa4sMZcLXxqzz1Ikmc7aaWnqhvSNQ3FO1WF8rX7eivILi4Az5c
 M906oD/l1BJ6XUjkAdSzb+04ryM+pivz0QkE+u6V1E9NS3/vJ161Ftn/jbHacovwJlyu
 DqVl22W+6ym6D6mWVfRGaFu+OblwCk44wrvZtIJjg08WCqJcoYHqyDi+hhU8G3bI5Kb+
 Fb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HgutHtxV/eRkMCvWxikzs7c7tVICc4HtZt2CAObW0C4=;
 b=ds7W15DhRm1zLRFjBT/KRtW4lV5bgO2o95UeSTXjasUgGEKijTsfxzYXEnuwf7onnP
 PxZ1t3Tw9WarmWqthK11qOQ7Vv+N3uOBYEM6i8Bb6+2CvQt7GCpm3pJ1V/1bHKxYlcTJ
 AoMRmUP/ARNjR+xLHzkRcW2nTNc+NSgeNcCzhFoN8FtxMfeX6Y/MitArpAeuEq5M5+RC
 xJ0u+Jz2WqaP5f/GUsmF/seGQ8V9U5l/04zRrKrTBMtXE3r6wBqDPozkt5KX692dBH0R
 eIvi7C3anaGQCtbCvfsQbM73W/t6Fu5yMA4tACkXvVh5jGZRtSnB0GFbyUaBxu/uXsY+
 b1XA==
X-Gm-Message-State: APjAAAUuxoHVpcFAzBtwbrBVwYOZm7QF/rTwpPZVcwwuVAId57gtpfVV
 cP2rNpf8PfimIsR5HHTeWycrfxkzW0sCE/gnLkDEcd3P
X-Google-Smtp-Source: APXvYqyL+dgC8ByAQrLTPPZhxJ64a0XqrFdkdJoqDRKaFvljo9M0rRcqNp0WYLzxMM/Mbzic2HnHeI+/m9JKOXYNr/Q=
X-Received: by 2002:a05:620a:13a7:: with SMTP id
 m7mr7769428qki.500.1581788580488; 
 Sat, 15 Feb 2020 09:43:00 -0800 (PST)
MIME-Version: 1.0
From: Lars Bonnesen <lars.bonnesen@gmail.com>
Date: Sat, 15 Feb 2020 18:42:45 +0100
Message-ID: <CAFOG8dP4+9=S69bgs53Xqdfi4bKyxayR_cuoFvXjyQQ08ujzwA@mail.gmail.com>
Subject: Starting tunnels without being admin on Windows
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 15 Feb 2020 20:25:48 +0100
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
Content-Type: multipart/mixed; boundary="===============8073974404893216671=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8073974404893216671==
Content-Type: multipart/alternative; boundary="000000000000732ad3059ea0dab7"

--000000000000732ad3059ea0dab7
Content-Type: text/plain; charset="UTF-8"

Hi. Based on a recent chat on IRC, I was suggested to discuss the idea of
having non-administrative users use Wireguard.

The issue was the same with OpenVPN which I have been using until now. I
want to be able to distribute a VPN configuration as an administrator to a
non-administrative user so that he(/she) can initiate a tunnel on his own.

It seems I can't do this with the current version of Wireguard, as I am
told to run the GUI from a desktop logged in as an administrator.

Regards, Lars.

--000000000000732ad3059ea0dab7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi. Based on a recent chat on IRC, I was suggested to disc=
uss the idea of having non-administrative users use Wireguard.<div><br></di=
v><div>The issue was the same with OpenVPN which I have been using until no=
w. I want to be able to distribute a VPN configuration as an administrator =
to a non-administrative user so that he(/she) can initiate a tunnel on his =
own.</div><div><br></div><div>It seems I can&#39;t do this with the current=
 version of Wireguard, as I am told to run the GUI from a desktop logged in=
 as an administrator.</div><div><br></div><div>Regards, Lars.</div></div>

--000000000000732ad3059ea0dab7--

--===============8073974404893216671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8073974404893216671==--

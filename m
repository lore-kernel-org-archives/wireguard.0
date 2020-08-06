Return-Path: <SRS0=Qc6R=BQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87179C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 14:18:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C6523121
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 14:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccqyYyCv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C6523121
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dcb2a21;
	Thu, 6 Aug 2020 13:53:42 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0925d836
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Aug 2020 07:37:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i80so25626919lfi.13
 for <wireguard@lists.zx2c4.com>; Thu, 06 Aug 2020 01:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LOn3ftASjuIpH1D0XT156vyPW7AkwrbUPZyzLL2YyLg=;
 b=ccqyYyCvUI7I1bp8JANaZxfnFq2SRNdTikUP97GZjxiQhgo7hGUUNLzQS6EWsh4NLH
 NIRdrHBGUxHV2u7wizSk9Ew/VEbEGmN9JXGZTnSoqTvVdnF4CWZ+kU6FwWzuQqRi0o2P
 GumsJetXmF6xvhs2Sx0tpjePqUNEfHI37/0JSQrRuPP+BsiDvS1l0aZoHsTZr5PaFRlg
 aWx54EujwIOkodq8xDzslLCEZr8XGcU8Mo9XQJVr+xJ2h5wrKYJpAoXP6Vwbs9/TiieU
 WMQSaPhu83BnS6f59DP8Mngy17Dr5RAFLCZ2F5RHLH/BBiIaA0agskiqrKAv4M17o7dL
 mdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LOn3ftASjuIpH1D0XT156vyPW7AkwrbUPZyzLL2YyLg=;
 b=PhoQJ69CTnvtrdjxELzSagGhPXRiWGHhPTSVsG9Aq8lsJEZEM7UThJL0Egl5EgD6xe
 0DQaGMCW1/mwvUul4scnNrVtXine/ARP5SZalbSkwM5SkCh0juLYKdv2lea140hSlWEf
 d7UshEOq+01XlJYrfPFmAOS5H1uXClt4Dl/UmLOLC8Xr1Ak8S5cce9sZQYt4cpfamgsr
 TCZWlq7HDeZlauru87fFBGuweFaPoLEPDjH6MWV4oHkZT+HXZp01K6SzgAQ4Ge+N2UjY
 YEpoRyW9mKgN4/UivDI176UZWTPU/UEQQNehZCXxKxre57SdRK939qj/lc8jxZqcAeL5
 HMlQ==
X-Gm-Message-State: AOAM531bWcJNjhFFMPWxOiQh727ahpHhhh8y1QBatVAH+yduLqWulzSf
 EKlvMFOo91xFNEAi8qnE6fYLkPUNX9ZrJZnO4+Dkob9sJC0=
X-Google-Smtp-Source: ABdhPJxA1gtEk3Igs8bj5/1Ylce+zyMQxm/k9U//YugUrbGpyJnirIWlwZGb8cal1xLNwoCDiHG4TSYRZqiLzUQQ3z4=
X-Received: by 2002:a19:ae06:: with SMTP id f6mr3326018lfc.42.1596700940659;
 Thu, 06 Aug 2020 01:02:20 -0700 (PDT)
MIME-Version: 1.0
From: Ryuichiro Nagasaka <r.ngsk.todo@gmail.com>
Date: Thu, 6 Aug 2020 17:02:10 +0900
Message-ID: <CAODy9c4WjuE2dJrXaJQeVn_WZXrk5ewpnqcsj1R024GT78ERGw@mail.gmail.com>
Subject: Problem with connection from android phone to IPv6 endpoint
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 06 Aug 2020 15:53:39 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

After upgrading Wireguard Android app to v1.0.20200724 by Google Play Store,
The wireguard connections with multiple hosts via IPv6 network failed
to establish.
Using IPv4, the connections had no problem. Also, the ones from iPad including
IPv6 were good.

Before the upgrade, the app version was V1.0.20200407, which could establish
connections successfully.
# reconfirmed by manually installing the old version of the app.
# The IPv6 internet connection from my phone is always quite good.

On my router, I used tcpdump to check whether packets emitting from my phone
were observed. But, no packet was found.

Android Phone's configuration (Zenfone 6):
=============
[Interface]
Address = 10.xxx.y.z/24, xxxx:xx:xxx:xxxx:yyyy:y::z/96
PrivateKey = (hidden)
DNS = 10.xxx.y.1

[Peer]
PublicKey = (hidden)
PresharedKey = (hidden)
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = [xxxx:xx:xxx:xxxx:yyyy:yyy:yy:y]:1194
==============

Router's configuration on /etc/wireguard/wg0.conf:
==============
[Interface]
Address = 10.xxx.y.1/24, xxxx:xx:xxx:xxxx:yyyy:y::1/96
ListenPort = 1194
MTU = 1372
PrivateKey = (hidden)

[Peer]
PublicKey = (hidden)
PresharedKey = (hidden)
AllowedIPs = 10.xxx.y.z/32, xxxx:xx:xxx:xxxx:yyyy:y::z/128
==============

Is anyone else having the same problem?

Sincerely,
Ryuichiro

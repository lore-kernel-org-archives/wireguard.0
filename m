Return-Path: <SRS0=HOwu=BI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA8CC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 08:29:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 239CD206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jul 2020 08:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UPeacoJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 239CD206D4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0c0b4cc;
	Wed, 29 Jul 2020 08:05:15 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 019c40ae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 08:05:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6059c02b
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=XPm5xX
 LPgmTTbY9tWZ3DXcpU4h8=; b=UPeacoJqMV+6P67lzZlMWvsyzUg3s8ZD2PGLN0
 /1/EgHh8yt3SB4/bRsfvLFcBxNow1uAWAIZESos3NQhWMdnFJCdEO2wxFbx1Su7K
 EUXB0VddiGgMsbmLo17tKr7fw2eDSWMBmvErc65qKx+rmh+wPcnaVjkWJytng5Dl
 4+mfkAu3geoHKNMpN10OLr4tsQdDfl/JDPahcFWtZdIUN7DyQdUBJO4oliB2I3ph
 e7Q6T2EdQPSinhqHkdeIVvQXrTAGJCsj5YX1M4xk9+QSwATKIvy7pvLYS5/FOpAx
 DB7ky45RLXRYAQLsq1EsSyyDSfDxYOE7ynBV2WJQ09RsFzxw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d18f04b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 08:05:10 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id t15so14716100iob.3
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 01:28:43 -0700 (PDT)
X-Gm-Message-State: AOAM532n+kX2tZIUcIsWZFaRnqUn2cJ8fuWPVd4HK4BzTbUjpdyrhgXo
 S0JcQzUIytqtBCPpSaRVdDAm7b0LFupidpezQFI=
X-Google-Smtp-Source: ABdhPJzuwA7ZjM28B7IrTmFB5FSYxUiGAsbRf0GK3W6Sdw+hzJKJOSiaboHSo+FXVRac7v3gRforMwgRnk4iK+ui1Jc=
X-Received: by 2002:a6b:5c17:: with SMTP id z23mr32729235ioh.67.1596011322708; 
 Wed, 29 Jul 2020 01:28:42 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jul 2020 10:28:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9rLTpy2YtC4a37jpYfhy80r9Jn5kJfkiy+k2W4wbBGTaw@mail.gmail.com>
Message-ID: <CAHmME9rLTpy2YtC4a37jpYfhy80r9Jn5kJfkiy+k2W4wbBGTaw@mail.gmail.com>
Subject: sunsetting SUSE 15.1 support, now that 15.2 is out and deployed
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I released a new wireguard-linux-compat snapshot today, which has
support for SUSE 15.1. With WireGuard being in SUSE 15.2 natively,
it's time to sunset our compatibility support for 15.1. Therefore, I
intend to drop support for 15.1 in either our next release or the
release after the next release. If this poses a _major_ problem for
anybody, please speak up, mentioning why it's inconvenient for you to
update to 15.2, as well as the size of your deployment. Feel free to
email me privately if these aren't details you can disclose publicly.

Thanks,
Jason

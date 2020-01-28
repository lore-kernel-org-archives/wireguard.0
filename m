Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40395C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 14:14:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6D024693
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 14:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bA26mkml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6D024693
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57a14cfb;
	Tue, 28 Jan 2020 14:14:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 952506a8
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 14:14:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b80c2bb6
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 14:14:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27519b07
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=cDwRIzlvPkl1U8TxK/dAda/Ba2I=; b=bA26mk
 mlJk90GgYPmtaxCMuKiwq5IwpdXFgyDa36F27tkBR3SB+xbCyMHJgSe6KjkWGN8m
 nb833+d/P7TmxfCzYF1HF1wUArxM4BM+03Y8rBQUV5hbH3cyCUAY22saMv2HSX5K
 3N2BhPI/y6XCU93eCovGtSd8KrFlzSWCxkTl46QMM0/ygkn0vESnJQY2WRxDLCho
 NVAfcPAdh7VWcWgVIcPSMtLvVzltcVejGdzoQwsCs9BzWlPm+ZFFWg6SG3/bReoQ
 jwKoX2+v+fUUstbjlXixBziU3XWeGoLy3n3yEKk3ueOxij6EzmgZZcsaIM56T/zG
 xshL7G0zYk3PKuvA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4250932d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 13:12:20 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id d62so10367492oia.11
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 06:14:11 -0800 (PST)
X-Gm-Message-State: APjAAAUlgB6vM2xX6zvPOni3C/4QcsVcH/OXZGdZ27iZMUmtSv9yB4P3
 u0tpWBMuQRIIBC5H1YmArM1D6C894m1VpQZMCMk=
X-Google-Smtp-Source: APXvYqw1CxPIxqoDFwM/zhqOCITnixlz79+retO3fykn2lCP4vttPikuo5o5jsPwPWfw73QQFSmVvZ0rhlzhjka4v8E=
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr2910478oij.66.1580220851154; 
 Tue, 28 Jan 2020 06:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20200123111825.17435-1-ilie.halip@gmail.com>
In-Reply-To: <20200123111825.17435-1-ilie.halip@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jan 2020 15:14:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9rTD=zCpw5fkw-baUHBuutWzg18aJ-8KvnPHzNpJDTNHw@mail.gmail.com>
Message-ID: <CAHmME9rTD=zCpw5fkw-baUHBuutWzg18aJ-8KvnPHzNpJDTNHw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Ilie,

Thanks for this. Usually we don't special case RHEL point releases and
just maintain that wireguard-linux-compat only works with the latest
RHEL. Could you resubmit this using the normal ISRHEL check instead?

Do you have any idea on RHEL8.2 release date?

Thanks,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

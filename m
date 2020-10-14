Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A57C43467
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:17:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36728207DE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYIEKcyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36728207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1481543;
	Fri, 16 Oct 2020 13:16:54 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2dffae7a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Oct 2020 23:50:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dt13so930863ejb.12
 for <wireguard@lists.zx2c4.com>; Wed, 14 Oct 2020 16:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zOhZA6BBT6c2LVR3QmA/IZh+72qSPUreXetA62Gz3zQ=;
 b=iYIEKcyVCb6FzOk73nGUJHZoDqcLoH0vQhExiWomsPgL57aU6eLMemp2mHyCDluZuq
 4NJyPipct7i4vveaX/1DpbZNpQA5nbY4E03KlwvcSl7t/NC8hntB9Mt0R4DpLsuXDpt5
 COQGiiEKvjrcpFccMD1MtLnbmOOEWmCElczPIz3PGth0Zxi99MVBc+LIX9oKtyt371PB
 wKXqUz1F84yQpfGOyG04c9coO6/Qi6hYKehKlJYPvsoZ0BQPa0Pe7mwRVN3ccNEC6hsn
 KMY2vOYOnN+NZs5lvhXAIFg8RfROFPwcy6/AITdZUyQ0P40Dobq+DHBCIghBI/Y7cOlY
 TjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zOhZA6BBT6c2LVR3QmA/IZh+72qSPUreXetA62Gz3zQ=;
 b=iQI7nJd/9odUVZdAvGMejllqhWtWdPifG0M1ay+Yb88Y5KkSrKUNlDtNtaSt1FpmzN
 sdBLblukL45Dlc6OGLe2OB60xgpJzmGhVDHmcOCZRbKYJglUC6aCsGLcw9aPlK+gjq+X
 g9sELK0ET6s8S5mM38DfWH6KFQ2OeempSF9tchgIZ8yzKu9Z3UCPwscwvsYr0RrAN9pF
 u9PQKyaD+XI8nD87q+JvOPJ9PQ0qhjjbf0+yMJ3FtCjdxdhMX7yEK+62h+EGaPw3mSR4
 +iAcUvN1rf9R9otzDtEEz5muwI/laKRWsqw42SHum8AuMPACfA8wmRIE8y4DCtV6dgI2
 8v+g==
X-Gm-Message-State: AOAM533jKxdrD0c8bJGIq4r3sOGWDagL8mIj02lcho3CFejyUNAjH5I0
 GjKkMPW/CHj69lFNXa+Q6pRK+DrWpP17cFRqtvdNd6mU9NgjqUy3
X-Google-Smtp-Source: ABdhPJwwGqFCygbf5Rxd8tSiZRvPZ38nNvS5D2WipB0dToRZW3DVCngaKLMFNiOKeK8UVr9YM69T/41JxCkihdfbtGc=
X-Received: by 2002:a17:906:4a4c:: with SMTP id
 a12mr1595541ejv.392.1602719444976; 
 Wed, 14 Oct 2020 16:50:44 -0700 (PDT)
MIME-Version: 1.0
From: Enzo A <r33int@gmail.com>
Date: Thu, 15 Oct 2020 01:50:09 +0200
Message-ID: <CAC=m+TgmYJu77UUc0D7ZCQpBMQj4GbmVpOPXJeqT2J6PFaYsXQ@mail.gmail.com>
Subject: Weird behavior with IPv6 on Windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:49 +0200
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

Hello everyone,

First of all, thanks a lot for developing and maintaining Wireguard.
It really is an amazing product!
I am running with a strange issue with Wireguard on Windows. When my
tunnel is enabled, DNS-resolving hosts that are in AllowedIPs results
in the A (IPv4) record of the (sub)domain being resolved over the AAAA
(IPv6) record, which gets ignored when wireguard is enabled.
The intended behavior is that the AAAA record always gets resolved in priority.

Here is my client config: https://del.dog/easocerran.txt, and here are
also some screenshots of an example ping showing the issue:
https://imgur.com/a/dnlg6nd

Thanks!

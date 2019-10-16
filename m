Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC872FA372B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:24:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550A721835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Y0ap+8c5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550A721835
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60127cf4;
	Wed, 16 Oct 2019 20:24:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f72f9ee
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:24:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0934259b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:24:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9280a53c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=7rYeX+cVK25S99L1l9LdL4DVBXg=; b=Y0ap+8
 c5+uW+OI6UhoximHEy4Vs5U5UNLos42O6OrvlxwWrkPUhRhwKsoasWo1S2LvKhgZ
 RDxHjNx2OldQqkIA56msu6f9dcvRh5jOluVzJveCAchG4u3D59UtLZx8EoNkwkFd
 dkpPtLxkSjZTdrWLjs8DY3A+o1Zjmdc20P8QAvV0om2HqnsnPe6iZOa3mmSGhmEH
 Lj+rXybzfpZdzTZR92LwicAjG7tjliYmodAthTwct8dhuSMz1i72D5Ckuu03k4t+
 fKbP69x0pz6Gqc2w7UQrxQGurWoPcEWJcDdgADtOxn5sRKErTOChWf4wphKceUa5
 sUGQ4XDFAqTUx7GQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d66c9ac
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:35:40 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id g13so21327622otp.8
 for <wireguard@lists.zx2c4.com>; Wed, 16 Oct 2019 13:24:08 -0700 (PDT)
X-Gm-Message-State: APjAAAUq40ZQLRWu08tmNQ/SObvCRs9z+1lMi1lveEKgomk2qunAnHLQ
 Wlu0FV/J3R9hCYo6zhCiG6KtR39yvbpYwBQu8d8=
X-Google-Smtp-Source: APXvYqzBl03LzbFaAMXoTmN9vgtz+6fsnkMmcVkUTo+pwTtruEW2pY42Xfh7dtJJHuSPbGS3oN95t/ADFCUD10d0CdI=
X-Received: by 2002:a9d:6a50:: with SMTP id h16mr104644otn.120.1571257448198; 
 Wed, 16 Oct 2019 13:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190926214916.7zazh6nzzxuqcwl4@martini.nu>
In-Reply-To: <20190926214916.7zazh6nzzxuqcwl4@martini.nu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Oct 2019 22:23:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9o9Kp6e_=Q_NGduKNJi2M+QH41A6qzuG+hveL5MUNwF=g@mail.gmail.com>
Message-ID: <CAHmME9o9Kp6e_=Q_NGduKNJi2M+QH41A6qzuG+hveL5MUNwF=g@mail.gmail.com>
Subject: Re: Android 10 and DNS
To: "Mahlon E. Smith" <mahlon@martini.nu>
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

Android 10 sometimes tries to forcibly enable the DNS-over-TLS or
DNS-over-HTTPS setting. Maybe try disabling that. Another gotcha on
Android 10 appears to be the Data Saver setting.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

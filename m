Return-Path: <SRS0=+wDI=VW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D1EC7618B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Jul 2019 14:22:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C2421734
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Jul 2019 14:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQHAH7Vv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C2421734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dde902e2;
	Thu, 25 Jul 2019 14:22:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9d74d9c
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jul 2019 14:22:09 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc1aff38
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jul 2019 14:22:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s49so15578117edb.1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Jul 2019 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uX5tbBLMyDaJLsEwLoLWkkLiuhKI/1FfP0E7d079cMQ=;
 b=CQHAH7VvL9RQQtes/sapJCoZla2v72qWjWdB2wEm5IGSy/diOgAUwiwpyaHK2Xysd0
 c5A3YNqo3q0Ojmaf6pF2Wnbi8g5oVSCg8JKSOboCVhcq5AUr4GOsxe5dGony1EiTnG8m
 7v/Nwl2mtSPrHelqcoCT0Uda0XxOVk9RvDZbImBkU9dBK63QhYfNxdAsBJvb4YBvR7Jk
 Jtv1SZboW7/5R2wmjKHEw12SjJdZyZQUDAJlcib5tCHaoRgJzOae7szaaqcB7uqq30Th
 CBssZaKLVfWflh2HV1UBEM59xAz946Foh6Tlc/WPBARc6k1nh2/B2cxS4paHJty+hzDV
 x0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uX5tbBLMyDaJLsEwLoLWkkLiuhKI/1FfP0E7d079cMQ=;
 b=XWgJjdirV7sw/iIx/xiPdEQm03D+H71qNW4yJTdRS96aXG4PIacR12qwst0H8mbBfA
 4rEintMQl8H8yad2WNOntS4e/tw7DyXPbKI6/hVVyKbBvwA+vJLl3uNgnYyjFnfBkfep
 vjvGM7A8IGFeAv/oTxoAXb/RPZ9NZsgiK8eb5BBkpdPuvubCiFUJly15x3g+QCJq7P9E
 Eb4b7/cWiiTDodvRdOdSX6IqHTv5vspGScTTBZv+uRlqwvf8sPwdC56rnxvnUeSe6GE9
 o1oxfxW4UZBQZSRacf+rpaDKQKqwbBpUmFE9czzuRflqkK2HDUz11fH22Vqg50A88bRc
 koCQ==
X-Gm-Message-State: APjAAAV5gKYS1X8V7I3SPTIXnuY/dNP9TqAgtseN2HxRvFTMlWiu2cMU
 srmjCtvKVFmxw6PaVyCMC2IQXy1rA76ZJBxBEpH9MQ==
X-Google-Smtp-Source: APXvYqwt9sanyg+A0W5voCE721YXKEKBykXv28x/WeRQ7NirXwMi7zbP3rDtjznakVTu56hfh+BU+BRbgWW8DD9xuJQ=
X-Received: by 2002:a17:906:7f16:: with SMTP id
 d22mr68141113ejr.17.1564064527366; 
 Thu, 25 Jul 2019 07:22:07 -0700 (PDT)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 25 Jul 2019 16:21:56 +0200
Message-ID: <CADdae-jgnotykgx+XghZm39zmHcpB6Qvtw1EP9+L_DGurMUatA@mail.gmail.com>
Subject: Usage Add/Remove Allowed-ip
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

Hello,
Is it possible to add/remove Allowed-ip in peer description without
modify configuration file or using wg set command,
I think about wg peer add|remove allowed-ip

Regards,
Nicolas Prochazka
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

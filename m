Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB09C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 14:30:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A336142A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 14:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A336142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bb7aff4;
	Sun, 6 Jun 2021 14:28:15 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b7b5d32
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 14:28:13 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id u126so7157971pfu.13
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jun 2021 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yFGnl0wVMJE5lPdpKqOxzY6fZxnqgZcqGe+bk7kdp58=;
 b=RwQItaz/oGHnffevU1/D1TzuSnkdFfTIO78taCkBL6/vLhuDWUi768lwSur3C1ahjm
 2ZtuloUCZYdTV033XB3cbdgx7mN0fh2RrCuwMnq1Kss7l0dP8KWCch0ZMYw9h/VXXNy6
 nyC2iPv0RQJGnrg4C3cnOySp+OSqdX6pZ18VcbDQ0slf92ZSJSc/xIhTIYGoXYMrTgso
 qm5yjOlwQhy4wTw5xSqnsCMBEI2JjVSvMKE5BQ4Ixs36fuWCkDJ9MZ+J5KohMUQLcpW7
 N4pDODhJ7g8iqSeHoy1cNK2cO+UF01kmkwwhxaKbT28yjXivOFtk++sg/fshcUPhEh8p
 KS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yFGnl0wVMJE5lPdpKqOxzY6fZxnqgZcqGe+bk7kdp58=;
 b=QZUAPf7tx5QdOU2qKELyu27Zv9rk9mCU99fGkwjztwKHxwjYLcr35ikhn0d6Gokdox
 motyuI6CGznqDkCfU99HCs2LC6cu5icDWCdNLOqZ7nSQ8Awde0kyLCs4jG6T8JTrtM18
 h7IGxoROmXCf2BkOB/Xyqnn9q3vAIo9SBqp4iCOE/iQkKEZZGTgunP5TvOQ/ogydh+Gu
 RfpaFEmHLDNr2uBJEyK+/tpc2NyTqjKMOx6y5dNUrxs17qYmVDSDmcOFJeL80PBmecka
 dc/dTrlQU9R29HwIQd9J1JYJVo/C9bS8wo7SBG73jop55M/xttcXhbOt3aHXn9+ZiALJ
 gnTQ==
X-Gm-Message-State: AOAM530kLggP51OVrgl0aM2dAenkzYpJxw2YKj+MrZrDbiNp8y8o6WvW
 UDa8w5Y1mWFa07NWja0ep4oQ1WBRQFU/DdhfnQr2l3rL/oaw4g==
X-Google-Smtp-Source: ABdhPJwmorHhql7T6Y3ouD9z+j+Jz/v/jBI0xUO2wa/5KaJvsbg0nmU4K8KOwa7ZQ2wjrj7xsHAVF0rlIBx4tOgaqwQ=
X-Received: by 2002:a62:6d07:0:b029:2e9:1e3c:ad54 with SMTP id
 i7-20020a626d070000b02902e91e3cad54mr13295555pfc.46.1622989691351; Sun, 06
 Jun 2021 07:28:11 -0700 (PDT)
MIME-Version: 1.0
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Sun, 6 Jun 2021 10:27:59 -0400
Message-ID: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
Subject: Certain private keys being mangled by wg on FreeBSD
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
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

Hi Jason,

I've got an interesting case here. I've got what appears to be a few
private keys provided by Mullvad that are being mangled by wg(8) on
FreeBSD12.2 (pfSense 2.5.1+).

Private key ```Lm0BA4UyPilHH5qnXCfr6Lw8ynecOPor88tljLy3ALk=``` ...
becomes ```KG0BA4UyPilHH5qnXCfr6Lw8ynecOPor88tljLy3AHk=``` on wg
showconf

another example is ```zQwldrChCYP3P2fZeTtHmj3c/88hxM+TaLIq1mJ28ZY=``` turns into
```yAwldrChCYP3P2fZeTtHmj3c/88hxM+TaLIq1mJ28VY=```


I must have just gotten lucky with the keys Mullvad provided to me, as
those worked and continue to work fine for me.

ref : https://github.com/theonemcdonald/pfSense-pkg-WireGuard/issues/105

Best,

--
R. Christian McDonald
E: rcmcdonald91@gmail.com

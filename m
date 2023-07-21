Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE42C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:01:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a22a8e4d;
	Wed, 20 Dec 2023 04:58:54 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a2bcea0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2023 14:06:22 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b73564e98dso28710511fa.3
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jul 2023 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schooley.com; s=google; t=1689948382; x=1690553182;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLtlnjAeB4sZEt3Hdseg4eq8HC+IH7XwTErcZsgRpLU=;
 b=LlIAZF5DrrCljGhPS38aXe6DEf6kuw4jTq3vqnNr8EV+kmNzUjf5V9R+t3qhu7yuvW
 UyF1OeXlqZSk3qPlmOvcENxJqlqqXWGFuVFOpnuuTikWgStj3LxZ1FuRZgMmUHZ/AwiK
 9gcW51yO/u5ZlO5TwtsmkR+YXtU8E311BxM5n+inW/CsWR7XsDo47PEOQb8YH3QOwrXd
 QcqIUt5uCdqO1lA5BjzyarwSwG/ObpVTvlOkzLn/CpYwZGLLnvzOyOthed5LsicWvK5/
 wS5AFw4vtDUo83fbcQOQ3/IoI4wa1rFgXz2EZsJGcbdhVqrgcV1jszxeLOojYrqRtXaU
 23+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689948382; x=1690553182;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLtlnjAeB4sZEt3Hdseg4eq8HC+IH7XwTErcZsgRpLU=;
 b=a0DZhM9mSpz4SlXCiF12+Mo8nbUhbkJV0cZSGcQblFdaj5ur/3+z4dYNjdLgTWahkD
 TEQncf9FLVcge0pDwjqpT8e0eoOgwGlXIJ9GqvwLLAfmWQpykUpnuulxiFsfTyut3eJX
 bjLhnrIZwNcCKMze1kKzinW2ODd17xzH9F6kB35DY0gG856WvAqSMbaGTwPqqlK/D2Vz
 tpg67lVdrWnRDIIozcyrUepBDAXqBx6lPUPnQIQWJsHGDFQxAqgJudexGKjs1CysyrPL
 1ImnC3caA3FHmNGzfuxbRf5F9fxQGTc8DE2Zo/EzWw03U++YVqJxqqm4jFLkfuHKAQ8n
 wIvg==
X-Gm-Message-State: ABy/qLaSmi0SntqIeZ8oLz0wslvtUaIU03yNphXSAZj2nPXtMy97Z83d
 Kaq1Vk3a2Umq3kqRDJXm5js2RWLS6uh/nI/qBtNzNbM8+1E0tlmpEhQ=
X-Google-Smtp-Source: APBJJlHzgnmYJcbtfA7FTpm0/DbzXgUgTHkYOD8Zphx1fWESEcw8G8HKN4df/iHUZI4noG5+g0GGxRkB4Erjcnem/Jw=
X-Received: by 2002:a2e:90da:0:b0:2b8:4100:b565 with SMTP id
 o26-20020a2e90da000000b002b84100b565mr1854577ljg.15.1689948381665; Fri, 21
 Jul 2023 07:06:21 -0700 (PDT)
MIME-Version: 1.0
From: Jacob Schooley <jacob@schooley.com>
Date: Fri, 21 Jul 2023 10:06:10 -0400
Message-ID: <CAAvyDFtz85toVPLBk_P0FMQ1BCE2UBOoLRAX2M-YKWYe5BstGA@mail.gmail.com>
Subject: Search domains in iOS client
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Hello all,

I=E2=80=99m trying to figure out how to get search domains working. I
configured mine in the DNS line, but it only seems to work if I have
all traffic routed through the tunnel. If I set AllowedIPs to only
route specified subnets, I can=E2=80=99t resolve hostnames without the FQDN=
.

It appears this was brought up a few years ago:
https://lists.zx2c4.com/pipermail/wireguard/2021-July/006927.html and
it has not been fixed.

Jacob

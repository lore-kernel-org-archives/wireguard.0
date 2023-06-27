Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4656EB64DA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Jul 2023 19:31:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20264922;
	Sat, 8 Jul 2023 19:31:22 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9c4fd272
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2023 12:02:29 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-26314c2be8eso520349a91.1
 for <wireguard@lists.zx2c4.com>; Tue, 27 Jun 2023 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687867347; x=1690459347;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ea49Ht+coMzb4H1KclTdiZtyqXj3uSCDOBKWk25uxy4=;
 b=BC1d/dtlzYABRRE+ZU1ChmvzJ1Ouo2Qdg1VlUE5bEtKpLnLflupOWQ05RG5qVIV9VO
 uCI0/WL3SXdMLBsP4rmB/lkv29yy8Pu6jgljk5Yn0SM0KUt2liev+mWXhXl6GDs18J7O
 9iXwv/Bya6wkJNNlamktGSSqwFYB/4mr0+FJk1Ji2o92k0U2dc0Kam+588l9GsY7VQGE
 eeiyrexbb2CQzO5WVPj5xHqUYqgy/+yiwj9w1nQJF3lHj4764nMhQR+TeETfuzHKjaEw
 RZs6OdE1lQYx1GkBjMhay7YQNOFV9c8VFujlcC/+UKvzHeoHCWtD9iv7obWdNydXQAqp
 0gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687867347; x=1690459347;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ea49Ht+coMzb4H1KclTdiZtyqXj3uSCDOBKWk25uxy4=;
 b=CScVzfNYSVoPPxKe4KioqF4dDB087EH+vG21NO00k06Capvv7Juwymsm98icz5WLK2
 og48pP8A8RimOC+L6GCoBEv61I7s4p0+UZlkJFEDJcley2y8wwN/0dm4Fj+KDZO6UVwv
 SYRr3J8cZZRmWa9E2RGYHy+QoRRKa43OWuai2MrtYzKo0iYM0hO+ghDo7qM6sO9rL8D8
 EZKDwWT28/8vZXogmfFLqs13sikfvzJCoPA3EJ8W7NB2nJdRoTsi0kYl/BNjHemGwFtK
 f62e96L568XDWCsDCRYlgoK3zwMTjec/XC+gJMukHToH0yeRyIVoRfYunWVS7ei3IyRZ
 +TtA==
X-Gm-Message-State: AC+VfDxKa/5Gqct7V0ogD0AJ1h0yw5iebGKRg54yYBT0TsgW356Qm7Wi
 5MURF4G4AkQBjwvhMNtRP/BYHsk2D5+kq2InQFX32z//W1XbBA==
X-Google-Smtp-Source: ACHHUZ4Sj7WGMAGSKIEY9l2WVOQURmbyfyuR+TJw6fNMxpwFVBHBo5Pufyw4NhLC/BB3ZKgiZrSK3O6TjgyufDhkc6Y=
X-Received: by 2002:a17:90b:3b8c:b0:260:d77f:cc1f with SMTP id
 pc12-20020a17090b3b8c00b00260d77fcc1fmr12958499pjb.42.1687867346785; Tue, 27
 Jun 2023 05:02:26 -0700 (PDT)
MIME-Version: 1.0
From: Adrian Popa <adrian.popa.gh@gmail.com>
Date: Tue, 27 Jun 2023 15:02:15 +0300
Message-ID: <CAOKso16oBQ+kOS87pGOpAgBZDgQo1gohFMaiyL+AOG1bYY7szA@mail.gmail.com>
Subject: Make error on extract-handshakes
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 08 Jul 2023 19:31:21 +0000
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

Hello everyone!
This is the 4th time I'm trying to post this to the list - the other
messages got held up.

I'm trying to do packet capturing of wireguard traffic and have it
decrypted by Wireshark (for educational purposes), so I'm trying to
compile extract-handshakes with the following commands:

$  git clone https://git.zx2c4.com/WireGuard
$  cd WireGuard/contrib/examples/extract-handshakes
$  make
make -C /lib/modules/6.0.8-060008-generic/build
M=/home/adrianp/temp/extract/WireGuard/contrib/examples/extract-handshakes
offset-finder.o
make[1]: Entering directory '/usr/src/linux-headers-6.0.8-060008-generic'
warning: the compiler differs from the one used to build the kernel
  The kernel was built by: x86_64-linux-gnu-gcc-12 (Ubuntu
12.2.0-9ubuntu1) 12.2.0
  You are using:           gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0
make[3]: *** No rule to make target
'/home/adrianp/temp/extract/WireGuard/contrib/examples/extract-handshakes/offset-finder.o'.
Stop.
make[2]: *** [scripts/Makefile.build:440: __build] Error 2
make[1]: *** [Makefile:1858:
/home/adrianp/temp/extract/WireGuard/contrib/examples/extract-handshakes]
Error 2
make[1]: Leaving directory '/usr/src/linux-headers-6.0.8-060008-generic'
make: *** [Makefile:14: offset-finder.o] Error 2

Any ideas what I'm doing wrong? Is this the correct repository for
extract-handshakes? Do I need other steps before make?

My build environment looks ok as far as I can tell:
$  ls -l /lib/modules/6.0.8-060008-generic/build
lrwxrwxrwx 1 root root 43 Nov 10  2022
/lib/modules/6.0.8-060008-generic/build ->
/usr/src/linux-headers-6.0.8-060008-generic

Thanks for your input!

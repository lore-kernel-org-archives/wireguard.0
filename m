Return-Path: <SRS0=PPOQ=IV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAB8C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 02:33:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86384619AB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 02:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86384619AB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb9fdc6a;
	Tue, 23 Mar 2021 02:33:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73fa477b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 02:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616466786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D5fDhmwIy4cSQClNxK3V+rtBzM9bwPl/wCnQPz3CQFk=;
 b=UJreDCFES2Ve5PcJLqj5SgwmCUz5ZuDpZZP9A6gKoJ0F6exZs0QrYg56NZnjxyHou9843a
 pQZikZYBff9/cach/6WMn0kTg90rm7MGtbUyRQij5j4PlNgZ6WedoA8FVSnQp6mE3zU7Bn
 dRK6LO2sADQOLkbK7JJs2D/ut5FDCSE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3dd557b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 02:33:06 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id x189so1418306ybg.5
 for <wireguard@lists.zx2c4.com>; Mon, 22 Mar 2021 19:33:06 -0700 (PDT)
X-Gm-Message-State: AOAM533THrcmx1TYwcckrs3v8dCgBKJyF+QiBXlmMrHdMqAO949jXgmK
 qikglvO+a5nHEjCfICoYVPTXRkZlyGOfROvqjJU=
X-Google-Smtp-Source: ABdhPJzOyAtm+cgNRpSnR/ZqQQU+AMFy5Oehv8EQ2He7Jc85cda47/hP0MoLuSj8Gn8mh/FCB56KJYvKK9NKZyfNvGU=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr2029690ybb.49.1616466785701;
 Mon, 22 Mar 2021 19:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
 <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
 <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
 <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
 <CAHmME9qvh8PBGX-0mrnHDhxMF_+Do0JzjUf0L+hJkeiNfViqCw@mail.gmail.com>
 <LPfKC3Tqkdr8gYTfUyIox24RcE7O3rmYx4FbE-Js2TAQDlLFY-nEaj2PBum1YoZjv6oHyhPGQRDVOL0wNE2wD7BildydzjZ2d0qNVA8WhAs=@protonmail.com>
In-Reply-To: <LPfKC3Tqkdr8gYTfUyIox24RcE7O3rmYx4FbE-Js2TAQDlLFY-nEaj2PBum1YoZjv6oHyhPGQRDVOL0wNE2wD7BildydzjZ2d0qNVA8WhAs=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Mar 2021 20:32:54 -0600
X-Gmail-Original-Message-ID: <CAHmME9quO_Do25BaGOHX3Vdh3PPYRUeQR+U490HMYUpwemJKow@mail.gmail.com>
Message-ID: <CAHmME9quO_Do25BaGOHX3Vdh3PPYRUeQR+U490HMYUpwemJKow@mail.gmail.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
To: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Mar 2021 02:33:21 +0000
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

Hi again Bradley,

https://github.com/golang/go/commit/78afca22c9485dbd44da3b909866bbb9c1eaf440
was committed, and so WireGuard for Windows v0.3.9 was released. You
said that you downgraded to some earlier arm32 version, so I imagine
you've just been ignoring the update notification. Try updating now,
and see if things go well.

Jason

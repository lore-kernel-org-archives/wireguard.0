Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13A0C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 12:30:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DB4D20731
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 12:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WBjxtd6W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DB4D20731
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b472a45b;
	Tue, 10 Nov 2020 12:26:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b7fd6ad4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:26:11 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31e22f64
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=YzgELJ7ylEabPOcZlCo18et2KoY=; b=WBjxtd
 6W0g+c0z/1xGEhuGJs9o/jvazO/jYh62aUJFh7Y0ZvDpgwDaLQTrUxfBvdIMSZ+1
 a3PKYxLztMSec32GXZLkI0whEYvdeWRFuBZhmVK1/cDe/FqNwJ9AgDReQOAny5nc
 7suGQfqMzB7naiSHkqNR1Nj4zsSJUOkePxhT0gHOp//o6kyMrg7iNardP5nSAj6i
 huu1TFckHXVfjXbfCH0etbFps/TaMumiwkMkDG/H+GoiIzRvEHRQQLvHq+VAparY
 vosBKlMH41bZi1lHU7TF0J0bnc4MvpX73giD+Vac4s3rQH252yGkAzIHCA42f5vx
 YG8jOIzA1TbSZS5w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b213544c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:26:57 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 2so7397271ybc.12
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 04:29:53 -0800 (PST)
X-Gm-Message-State: AOAM532coM2ohloW9A0B0w40CULMnhVqNYtgWANOFy0fzsWoHUaNcmkU
 YwPD2CwBitqt96Q/IpvbR34uoscBMvPoxs5szZU=
X-Google-Smtp-Source: ABdhPJxUEae0A+fdf0YSnYoTpZqZcCpZqJYzVJL7j3pYEaDgphVE2z74+IWj/x4fh82HFVi6DYEpmn2tmc3vLV988SU=
X-Received: by 2002:a25:6cd6:: with SMTP id h205mr23667681ybc.49.1605011392369; 
 Tue, 10 Nov 2020 04:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20201110035318.423757-1-sashal@kernel.org>
 <20201110035318.423757-26-sashal@kernel.org>
In-Reply-To: <20201110035318.423757-26-sashal@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Nov 2020 13:29:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9pPbitUYU4CcLaikQLOMjj-=b16nVXgp6+jh1At4Y=vNg@mail.gmail.com>
Message-ID: <CAHmME9pPbitUYU4CcLaikQLOMjj-=b16nVXgp6+jh1At4Y=vNg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.9 26/55] wireguard: selftests: check that
 route_me_harder packets use the right sk
To: Sasha Levin <sashal@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
 Chen Minqiang <ptpt52@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, linux-kselftest@vger.kernel.org
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

Note that this requires
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=46d6c5ae953cc0be38efd0e469284df7c4328cf8
And that commit should be backported to every kernel ever, since the
bug is so old.

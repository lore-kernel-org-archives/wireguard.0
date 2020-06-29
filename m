Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7DFC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 18:01:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035A9255CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 18:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eOrCVxnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035A9255CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1178bd42;
	Mon, 29 Jun 2020 17:41:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7f63372
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 17:41:34 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83e07f0e
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NBeHt9zJJWj3PtIw/UXAb0IrygI=; b=eOrCVx
 nkffLMbppX3OicRf8dLJTTzpJ6M9vCk+KJ4ChY8ze+0h/h+JKa4FJGknkX9Mm3dv
 kotWoDI1fEOqzBcxHPW2dTtxAWPYY8fAGj/Kge8avHs/Ocf6yfbVQyMovsZ2lAAk
 6LcbD4JvAN8NaDH/wTNUNgkmGVEGe5ziE7bRa17rv84+4DVIC0wTGaMQPqREqcrh
 DrBNtEFK3bwTsQG2vs4K/9pGhcp90tGq627eWAJCQp3/1/P/mo4VEVArsEbs9GV4
 v7BttUqjhguDz2erq3UvaV3c+sNMcahexSez9IwnAFSjMWNDD7TGts+DvsKw7cnB
 8emcDRMkXzuBxeZw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c838fa8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 17:41:34 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id o5so18092003iow.8
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 11:01:15 -0700 (PDT)
X-Gm-Message-State: AOAM533qK2GN8vzLdTF8JR/ZzMmnDUeSmMAmklEamOgfCSRpNGJ46tq1
 YZf7B5pyoXj7h7p17/FKizd6vEGIf8as3Ho06WU=
X-Google-Smtp-Source: ABdhPJy4oaV0Lf25lQiJvuyH0jXG8aSFgvWgnJG1u/DDCHO3KWBG9Q9yMJrvifY8bhYY7y/+P2ynhnr67oZyW5VekII=
X-Received: by 2002:a05:6638:dcf:: with SMTP id
 m15mr19258381jaj.86.1593453674673; 
 Mon, 29 Jun 2020 11:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk>
 <20200629163851.41d6d755@natsu> <87lfk6gjax.fsf@toke.dk>
 <910f09eb8b67bef5cc55114fe1b0bd6297ea2ec4.camel@gmail.com>
In-Reply-To: <910f09eb8b67bef5cc55114fe1b0bd6297ea2ec4.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Jun 2020 12:01:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9rsiejKsNw9Wq6noNPf46m=2eYu9o4e0EHj_=ek5phZig@mail.gmail.com>
Message-ID: <CAHmME9rsiejKsNw9Wq6noNPf46m=2eYu9o4e0EHj_=ek5phZig@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 Roman Mamedov <rm@romanrm.net>, Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk,
 Arti Zirk <arti.zirk@gmail.com>
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

Hi folks,

We're probably not going to do this, for two reasons:

1. The security model of hashing keys down to tiny hash lengths is
dubious, and opens us up to all manner of interesting collision
attacks. Cryptkey routing implies a strong binding between IP and
pubkey. A hash with collisions means a weak binding.

2. There is very little practical utility. In WireGuard, both sides
must _already_ preshare their public keys, and there's no way around
this. So, at the same time that they preshare their public keys, they
can also exchange randomly generated LL or ULA addresses. (Notably,
this is how wg-dynamic works.) In other words, both sides are already
required to know 32 bytes about each other in order to communicate;
tagging on an additional 16 to whatever mechanism exchanges those 32
should not be a problem anywhere.

Trying to shave off 16 bytes of an initial communications setup by
adding complicated hashing schemes and collision issues seems like not
good decision making.

Jason

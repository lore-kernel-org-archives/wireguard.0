Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD843C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:17:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8AC2184D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="w1oOlHR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8AC2184D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5420c147;
	Fri, 9 Oct 2020 11:43:25 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f684d931
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:43:23 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f542ddf
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=rbgVqj5b3F+uq3opUwYXzJxo9s0=; b=w1oOlH
 R2VUrqYns+ibzxVS3rvEkqIarZkBnL8eG1ljl6vVae18DirvhTg80tAOkNyEGMAm
 7ARrn1H5k8vtKO8QO8DAaZPG30RyafjlOvwmLZr/a74XjEpItXrvLZmdxCvoKvw3
 SMmrHs8hak2IzPCnh9/YtP076I1kGEF85Et4NDAewqicDTJev7lFs3yd+2Z7ql2z
 DKuqKqv8usqYVxAuquF52UlCTa3RByUA5Ia2+pFxZdCEe/IxoB5yw4M/ICUGj5ZJ
 HBQDROTh/Lna+krXbNGU0RapNm8ulUJU+q0VD+6QFIZdHpxSEuNKVHdYO5PUulER
 u0z/SSTwkdwmTAcA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 70e9e370
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:43:23 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id k6so9855476ior.2
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 05:16:16 -0700 (PDT)
X-Gm-Message-State: AOAM532rqtq6mjeT51qyyFdUGZq1gTSHks9oUoXImjC+LEJoegMPKCBK
 6A8pYMwZziAVCB8jHRLKnzo0/gLa/sDsaYd3uYQ=
X-Google-Smtp-Source: ABdhPJxz10vX/pC7/8pH8ifkpMznLgZFBWMsS3PwH9Qwj7PZtkmamXJ0F1yMHR6q02YOhbAJVbuC9Zbnj3bfsDhnSgg=
X-Received: by 2002:a6b:3fd6:: with SMTP id m205mr8763593ioa.80.1602245775628; 
 Fri, 09 Oct 2020 05:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <FFDJHQ.8MYPV8KOQRZK1@mayam.com>
In-Reply-To: <FFDJHQ.8MYPV8KOQRZK1@mayam.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2020 14:16:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9r+z7tVE2ZxBU279JG-tK3T4-nMn-3kdqtXspMO7mKZEA@mail.gmail.com>
Message-ID: <CAHmME9r+z7tVE2ZxBU279JG-tK3T4-nMn-3kdqtXspMO7mKZEA@mail.gmail.com>
Subject: Re: wg-quick leaking DNS on Fedora33
To: Mattias Eriksson <snaggen@mayam.com>
Cc: wireguard <wireguard@lists.zx2c4.com>, Joe Doss <joe@solidadmin.com>
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

Hi Mattias,

Joe and I discussed this on IRC following your bugzilla. F33 uses
systemd-resolved, which comes with resolvconf. Prior, there was no
reliable resolvconf available on Fedora, so we introduced the "dns
hatchet" to the package, which did unseemly things. Now, the hatchet
has been removed for the F33 package:

https://src.fedoraproject.org/rpms/wireguard-tools/c/d46175da15314d0795c529055d2ba3a2867bd309?branch=f33

This was built here:

https://koji.fedoraproject.org/koji/buildinfo?buildID=1622021

And it was released to stable a few minutes ago here:

https://bodhi.fedoraproject.org/updates/FEDORA-2020-bee898883c

So things should now be working.

Jason

Return-Path: <SRS0=rROn=AC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D47C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 19:19:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF3025232
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 19:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fe+46SAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF3025232
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e1591c2;
	Sun, 21 Jun 2020 19:00:16 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ee841a8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 19:00:14 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 077e5e55
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 19:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=yWU
 MKtt9DnMG9F8JfrwI+JNDMnQ=; b=fe+46SAdieFxyfBc7+E+n0RdBz8mQZtb7eZ
 6e5Dm/PmSo88V3VAUIOKfmFCRzpEdcZTzUzueWTJVQLQ5/hRbHtLbD4gslZ43TrH
 8ba6ie0lb1zsQheM8O2kO113VLCYCwsf7ZhO0coDZk5eVqZzH0L7K4tvTiVtNYta
 iYHc5+vPZ7YUWpc7ylMgYAMRdmYjfGy65YgkckIo6usIEwJikIDuLo+Ged+CsEwy
 pe0Ev7MdkqnDbjWECMzYjKb5E3PPEwW+Xqyz0h0wf0yNn0OyhixpVPRYesqJSbVF
 7kyma7TrbJQCmcAZY4XzlY7TPMNNAt3VucYGUU0zd10yvBV9QnA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80877cb0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 19:00:14 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id l6so14120574ilo.2
 for <wireguard@lists.zx2c4.com>; Sun, 21 Jun 2020 12:18:53 -0700 (PDT)
X-Gm-Message-State: AOAM5302WJC9kbF7Z4F5Q3eQo4UWg2zL0tNOUWcDqaPiZR95mYKPvk+k
 2tzEAsUsuT2M0VFfttPkzfXDDrnvqolZV4gLhtY=
X-Google-Smtp-Source: ABdhPJyF16qHfR4/DWF9IoHINmaPbrg9LiqExhIeF4wHbeWP9bwUYrExywCm+9QnfChTj8zaAWJeRVl2cynSBdVnYq4=
X-Received: by 2002:a05:6e02:1189:: with SMTP id
 y9mr14213970ili.38.1592767132536; 
 Sun, 21 Jun 2020 12:18:52 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 21 Jun 2020 13:18:41 -0600
X-Gmail-Original-Message-ID: <CAHmME9pAwNty0q_+WD8RebgfdMdaFbh-OsKXaAb7wdhKBR+6Sg@mail.gmail.com>
Message-ID: <CAHmME9pAwNty0q_+WD8RebgfdMdaFbh-OsKXaAb7wdhKBR+6Sg@mail.gmail.com>
Subject: [ANNOUNCE] WireGuard Merged Into OpenBSD
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Matt Dunwoodie <ncon@noconroy.net>
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

Hey everyone,

I'm happy to announce that WireGuard has been merged into the OpenBSD
kernel, with integration into userland as well.

https://marc.info/?l=openbsd-cvs&m=159274150512676&w=2

Matt Dunwoodie and I have been working on this for quite some time
now, with at some point Matt even showing up at my door in Paris to
push the effort further. This marks the culmination of quite a bit of
effort, and certainly a multi-year project for Matt. I should also
note that the upstreaming process to OpenBSD was extremely pleasant.
We did three patch revisions, with useful feedback on each one and a
very supportive community.

I imagine that this work will ship with OpenBSD 6.8.

Enjoy!
Jason

Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C3FC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 22:04:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2FB2076D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 22:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="E5/WzDpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E2FB2076D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fabac57;
	Wed, 15 Apr 2020 21:54:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a4d3b04
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:54:19 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9261072a
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=MH181pZ/KEY55as29+KpE/kP2dk=; b=E5/WzD
 ptSuYkB0AwRT4sRkexdvXIe1IifTma4gucsILRmQYiboxlr5isE9LFb0Xz9X50Xl
 gf0uU14ufQfn1jXEjSeqIZP8Gj2Evp7LxaXITyyzXzVaoNm0XciMxXs5hlaQKT+o
 +4YUf6K56aV46x26+/6CJtzhZ5YH10TCMjaMnaGMiXmh1qQabvPyzXTrtcnHAdiI
 oLvZR/84mb5+vRrqrKM8z+SQFnlvI38pEmr/b+6vpcdPKWydkAyEyWmI9fizq4IJ
 B3J2QlvM10Gi5GoXwV9c/v+anEgXZy3eeEhNwH2kKv8cTxWI8Q3Cv/TcHj9/+swu
 3LrsRvPz+PkW7enA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8e3172ec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:47:39 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id 19so3016629ioz.10
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2020 14:57:40 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ2jN2EdYAE6YSvWyG2sLTO/4vOCB05NUQfCaVqF6qEKi2PfF9Q
 KOtxW8O5WKmbJ5ZFAEhBF9QkIZ1V1bT9X7cTDks=
X-Google-Smtp-Source: APiQypKajX08nvGTOdZtAf4WxQaTFQ+KhCYpUwE5Im7N5Qb/L68p2yKcFgH/0OYkkR8N8IH//QziCyWQ83rWCGgpYkk=
X-Received: by 2002:a5d:9c16:: with SMTP id 22mr27157624ioe.79.1586987859507; 
 Wed, 15 Apr 2020 14:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <50d9516e-9546-07ce-d0f4-434e5893f2a9@attglobal.net>
 <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
 <1a6e785f-9c33-e0e2-d267-4f857040ed20@attglobal.net>
In-Reply-To: <1a6e785f-9c33-e0e2-d267-4f857040ed20@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Apr 2020 15:57:28 -0600
X-Gmail-Original-Message-ID: <CAHmME9pO8D-PAP4JNY3GwXo=khKCROKFrXZhy95nwhB6DBHGzg@mail.gmail.com>
Message-ID: <CAHmME9pO8D-PAP4JNY3GwXo=khKCROKFrXZhy95nwhB6DBHGzg@mail.gmail.com>
Subject: Re: kmod-wireguard 20200413 fails transaction check
To: Eddie <stunnel@attglobal.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, Apr 15, 2020 at 3:56 PM Eddie <stunnel@attglobal.net> wrote:
>
> On 4/15/2020 2:39 PM, Jason A. Donenfeld wrote:
> > This is because ELRepo is a crumbling mess held together by bubble gum
> > and scotch tape. Run this:
> >
> > $ sudo yum install yum-plugins-elrepo
> >
> > And then try again.
> >
> Much better this time, updated successfully.  Thanks.

Whew!

The verbosity of that plugin will be decreased in the next release, by
the way. This was just merged:
https://github.com/elrepo/packages/commit/5ecf463d01a9a66a96d220c4116af884bfc917ee

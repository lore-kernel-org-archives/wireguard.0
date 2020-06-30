Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE60C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 12:29:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEF320672
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 12:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4inNlgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEF320672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39ab5000;
	Tue, 30 Jun 2020 12:09:40 +0000 (UTC)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b65ecbc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 12:09:38 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q15so344985vso.9
 for <wireguard@lists.zx2c4.com>; Tue, 30 Jun 2020 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ydhi6RedoJhsU1fI5WPAWu0K+/1r2GzkYFhmDmhdBxQ=;
 b=I4inNlgH0YtKdBajeqW1g3yck4miNSQx31P/QiDZPdlAXmz43Qi23Qa4qUNuOE8PhF
 TVoL3oa7U5HeuX2V3mW1q28eze9TdbD9zFc+eqcpo0ZCIZxpRIxZhbuADbE11AUJfAeh
 5K4AhgUqzlu02qM2s3pieO0kk5+j21J/y4FG2p4yNzHwdM+dYM7fPPEr7aIB7TeSHB97
 IQqooTAHJoVC8P5SmGBwM45fwWQLBVr51xx4SVEXPSBYqQyJzJAFWPfFXu9nWqVBkXTZ
 rF7HwF4Ujiquh/YL3TiDTxpk3UxmcvKNe00/De3TK6uEfOd5h7hOuAUtqDXzE3xHBpnn
 EOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ydhi6RedoJhsU1fI5WPAWu0K+/1r2GzkYFhmDmhdBxQ=;
 b=ZejOuFUBX60sQNb6kXP2Hv5+udSA2+g7b61uh+CPapqd4v6Mlop6WlFse5aLLAZ4rv
 ow50mkNuL0pJICqs6qGiNXF5lguuUDOS8Upf0sMCusMauO3+6YPeLAFTo8/W+ExhK6nR
 Kijps2glLZoedFpgCTv911zWXX/CB+ucOomSBA40T6TVhVSbcJd5wsSCUQd1JyVKavtA
 1brcQeNprExZir2PQylH09KjyiQECgNzPLqTmmLyGhlCOoGOsrFDUWRKfpylOZ7sGp1M
 rMeuXJ1iMARoeS1M9VQ7wIx+Ye3QbCDwW4ci83uFgAgYxUD7EAglTf4HR4Oi8qDdjSnY
 wqkg==
X-Gm-Message-State: AOAM5330EApX2Do9RgI5/I/HKY9b/1G20p5Hew/ghO1M0Q2o3ReppVt8
 XPzvRHrtNAUyyGYMnRqH+0Z4i5fNINdoccPAiLGbbA==
X-Google-Smtp-Source: ABdhPJzPz2J8P0TfYbLXx23Fbtn0KDQaZ2axn+ufm0CT1wJdN79DNb75cS3SBEypsDEdnGKcapWWx8zt349YhtDsLeU=
X-Received: by 2002:a67:ec0a:: with SMTP id d10mr9586025vso.130.1593520164477; 
 Tue, 30 Jun 2020 05:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALJizUM+ORyc5V-J5eqNqYbPEPDcruZOkvv3iv1KPJOi60YYyQ@mail.gmail.com>
 <CAHmME9qV9iacebrz6MNjbYBmPGhLs7hs0MFaTKJs0C1sPZxe1g@mail.gmail.com>
In-Reply-To: <CAHmME9qV9iacebrz6MNjbYBmPGhLs7hs0MFaTKJs0C1sPZxe1g@mail.gmail.com>
From: Felix Tang <felix.gofaster@gmail.com>
Date: Tue, 30 Jun 2020 08:29:12 -0400
Message-ID: <CALJizUNVdya=vCKHAJczP4xYys9ANt-+8hr7oh0cDfdg_t7L2g@mail.gmail.com>
Subject: Re: DKMS build failure 1.0.20200623 on Ubuntu 16.04 kernel
 4.4.0-159-generic x86_64
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

I took the opportunity to update to the 4.15.0.106 HWE kernel.
Wireguard builds fine.  Thank you.

On Mon, Jun 29, 2020 at 7:04 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Works fine for me with 4.4.0-184. Try updating?

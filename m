Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DFDC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 18:49:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7020C239EB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7020C239EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddcf9a31;
	Sat, 19 Dec 2020 18:40:00 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [2607:f8b0:4864:20::d2b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dca597fb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 18:39:57 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id i18so5247787ioa.1
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 10:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Oiwbc08BTbF43yzfLrXV5WApIcuC2I8Nuo02/mzNNqI=;
 b=TeBi40awI0ZtZIe8K+NSGV9NAEDPXu+eWRlHygwPYAD83sXV5gt+HUAHAvIAMhNOPD
 X33RacyrM3C07erveDyPJn/aLVYVTfRAPRSdOKUEcheEvQXACNJ/dRfObWRdiR2l3zvY
 4TvnUFi50NYKmC6Najga3ZCL/rUAfQ8XycfrhHLBFgG2DPCJVfE9Ym4ASqt8T+fl5rvv
 YLbQljTKie4BOKSQ+4YAYKRLeiO57hx4XyHLOs5cdLL91OgEizkesKXWTRRqhefEYHdj
 +2CXFYic5SpugdCkhPR8tNgW4uMw8VXq9qA85SJnG3ZSW+xRLfTlJEMDpBkVCH9bfhhA
 48OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Oiwbc08BTbF43yzfLrXV5WApIcuC2I8Nuo02/mzNNqI=;
 b=WGhR+r9mGORhYPsUXb91LqqJsk7wOp8DoBxLqswgpp0uin3qKZlTYfXy2dU+buzjC/
 QVpY0wHqt5n7IKHpOUYNOooQlv8+9EjVwjFDj+m9Jn7T8R+h5qQTL3kaeiDT2YwYoHr8
 2vti5Q/qS432/iZFIhw8KJorkeI4FtLIea/gQeXH2y6ft5M/5OTsVVWoEjsoAYAN1OZz
 /M/pJekmapnObd/a6IwdextMSVgFT3K64SJXNBAR6axb+MLflXGWtPQYg+OvRg2YdASP
 iB1RMXFEnFl60c9jSvEBRJzMT11LP9EWr0n8O0P5sconSONcbXuFxvMVrHCxOj/un6VE
 bjeA==
X-Gm-Message-State: AOAM530q+66CQ81wAoF/iwrHlXfHm60Q8m4nfV4owlX2Tl6RffDIV+Fq
 kq/KWjIqjDEx7aJl0vb/gEvCRteFtLyw+WkNuU8=
X-Google-Smtp-Source: ABdhPJzxU7nY76UkhcXj+js7eqQYBmyg09+Ogrbztto4vXzNNdQbCFNBro2AuxLqQqRbN/jmtsGMadJelqai29NmJ+4=
X-Received: by 2002:a05:6602:2c41:: with SMTP id
 x1mr9050337iov.125.1608403725598; 
 Sat, 19 Dec 2020 10:48:45 -0800 (PST)
MIME-Version: 1.0
References: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
 <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
 <ruafXiXluY0DZUNuLCh3Pzrxpk8CIkHqfrDjsnZ1IOfobylVKP0wc8w_lfT4JlpTbIC1nZ3mjeGb4t2fYfOBEqARrKvZ1_cHIlXBatZKZlU=@protonmail.ch>
 <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
 <C1A15065-7B91-437F-8B83-FF2EB10DD33E@kloenk.de>
In-Reply-To: <C1A15065-7B91-437F-8B83-FF2EB10DD33E@kloenk.de>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Sat, 19 Dec 2020 19:48:34 +0100
Message-ID: <CAA6-MF_ABTnarK6886G_SSxnpcqF6zcspDvzYfzR=O_f8uk_ug@mail.gmail.com>
Subject: Re: MacOS and wg 1.0.11 issues (for me)
To: Finn Behrens <me@kloenk.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Den l=C3=B6r 19 dec. 2020 kl 12:56 skrev Finn Behrens <me@kloenk.de>:
> I see problems regarding DNS resolution when setting a DNS entry into the=
 config. But pinging my wg hosts via ipv4 addresses in the tunnel works. Di=
d Janne set a IP address or a hostname for DNS?
> Not sure why my system does not work when setting a dns, but as I don=E2=
=80=99t use that feature I did not debug it yet.
>

I set ips on my DNS config, and it prevents the tunnel from
activating, which is easily seen on the gui since no data ever gets
"received" and no data after the initial handshake gets sent no matter
how much I ping.

--=20
May the most significant bit of your life be positive.

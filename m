Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0285CC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:47:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C597206FB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ8/zkFl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C597206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37acda01;
	Thu, 12 Nov 2020 08:43:16 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a0e3b6ab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:43:14 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id q19so5133324ljc.10
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 00:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X34Bunb5zhxfILNP4FqDaHzLUIZRVmHgRkMp2PLVtjY=;
 b=RQ8/zkFlSyXfI6Dcg8edn0I7CAyhuy7Jrit3BzSsPiZYlmTx6yrvZYRt17ZiCE1LyK
 gowHy1rBWj5uew5n9GZ4LUg/rTxtq+BmssfWVIVCa506+7h+JwySynVrXfFk7rpNAP0o
 Y7oxi2hDzeVnBaqDZTipJykMYZ8I+7pCsq40dYXt2mPk2sSWmlUgVeW0sfW4uXVMDq6F
 1SzEuwIBuDcxidKIDPdzOx4j+mYBO16OwraK0x5dgiacJXkdbs28sdctuVAChzUaXi5D
 +MT0l9P0oNBAini6yVL0c2K5U/eVULsAR02tO/TVjqQwKB45GDYPWrEp1Oy+L7HoPjB7
 ha1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X34Bunb5zhxfILNP4FqDaHzLUIZRVmHgRkMp2PLVtjY=;
 b=jvjeVZuOg3TAY62G0Y1I0vjomIp25/R9ygLfCGI2mJJSfwebZllMoQZZM7J9XuX8Vw
 Zws8kpeNwadQyf8KauAQqcI8cnh6HiOGJ4Om82YQg2OS4oziPaiSbTOlg+vkm1mefIpi
 5PoOdp1XhqqLZi4JS+llEgTBSs8o2PLBI9d4Ll0kQOrVc1SqMxiC3Kwqy/91UBrIZTaA
 fHpIgDufHRlXlTT/j0MPKz2/Xl4UyxQtZrntmyVShjWC3Wr1kGxWQFb1211GbnlHGi3E
 0ApUUPSnE/cm9b1ZiYs2PnI+JhEfkxNZksxe3Sr5RRIDE/gVzxQTeuDCUBRUNya4fuup
 v0Vg==
X-Gm-Message-State: AOAM530wMG1734v0VJpUALQzO+z3OJFJ3Kgip04SxYgN8kOZiqEghl51
 CqMAWn23d6QxZtSJu7zDJZDXRTpsRPgUmp9Ar8A3qX/elWhn8aSH
X-Google-Smtp-Source: ABdhPJwwxXKSQuGkYDgH/FMZYR8WJX3q2Ed3v8hJ7YutC0VAc5ZuVTJnGzC055ZIxcJWwyLea+caN7Omj1wdynOSuN8=
X-Received: by 2002:a05:651c:207:: with SMTP id
 y7mr7898170ljn.428.1605170828569; 
 Thu, 12 Nov 2020 00:47:08 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
In-Reply-To: <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Thu, 12 Nov 2020 09:46:32 +0100
Message-ID: <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Fried <afried@spamteq.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Take a look here

https://gs.statcounter.com/os-version-market-share/windows/desktop/worldwide

Would seem to suggest Windows 7 is in decline but still represents
around 25% of OS footprint out there.

On Thu, 12 Nov 2020 at 09:39, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Andrew,
>
> On Thu, Nov 12, 2020 at 9:29 AM Andrew Fried <afried@spamteq.com> wrote:
> >
> > We recently began deploying clusters of recursive DNS "firewalls" that
> > use wireguard to secure and authenticate all traffic between the client
> > and servers.   What we quickly learned was that virtually the entire
> > customer base in India uses Windows 7 almost exclusively.
> >
> > I can certainly understand the desire to streamline development and
> > focus on current versions of client operating systems, but by
> > deprecating support for Windows 7 you would be reducing the number of
> > potential Wireguard deployments by hundreds of millions of users,
> > particularly in Asian and underpopulated communities in Africa.  Most of
> > the end users there simply can't afford the cost of updating to the
> > latest version of Windows.  I personally wish this were not the case,
> > but it is what it is.
>
> Thanks for that info. This is by far the most compelling point brought
> up so far and is one likely to keep us supporting Windows 7 for some
> time. I assume your deployment to those parts of the world is quite
> large?
>
> Are there any websites or other sources you used to find these
> statistics about usage per region? It sounds like that'd be useful to
> look at.
>
> Jason



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.

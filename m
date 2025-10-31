Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42731CCF9FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Oct 2025 13:14:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11f71555;
	Fri, 31 Oct 2025 13:14:45 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6906d48
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Oct 2025 13:14:43 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-430cadec5deso20675465ab.1
 for <wireguard@lists.zx2c4.com>; Fri, 31 Oct 2025 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761916482; x=1762521282; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHSXt+n2A0K4UuF+l0kY9c5fW/J6PA7UnobYNkySiwA=;
 b=D7JR4H6zyyrZ1C/Y1kIM8m29Nh0hEOMe8C/ozX8Yv+f9Cksmh2WV4VdfJIrhI5JPSV
 gayzQjkA+0yDvezfmiMnSXjrW9yhid9jVM5e1ZwLUznKXn6ZleaJgdbq7MdEhtoj2dm4
 aSrXJGZNVDodfVmwITJbujCaDd+E179cG55xiUx6JMN8jVUVOSnLbEHAKaywbSiZaMUQ
 b6RRsNdVbSzvdPxyp7iDlgD2qTJuBY1Z50frQYdcBLy95worMeu6lEqx3aae5wajUi8O
 6ckDWq5TY9agHBrk69MgH1V6lyEl+uwOTmT4SbcobzeNsETfKpV/6V9qO12lcVH4VyRN
 LDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761916482; x=1762521282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHSXt+n2A0K4UuF+l0kY9c5fW/J6PA7UnobYNkySiwA=;
 b=wRBYGd2mFFfRazC/+GAv+lzhHNpbPOU+y9Jgg6T6KdCixFydd4vLEJyRRwPBKgyEnT
 qdvNx/ayW7H0qOFtpyPxPh0jJej8AFM2vQoFd5D2OUAeVMeXICD3r/N86N6XW/dOiDYq
 xd8isBfF+afl+piDdA1HuztZtYZK5hMZifSz2T5IPv44wnkGpvu7QDsrnuK04muoi+Ku
 LrEu3qT9eTrAkUK0pCUVcQMPvx47XtPVCDSGdVza58yUCdPKfiuoe4LsP4G6RwAL9H4p
 p9iqk8K4M9DR9YJK5V+CQpeoMCouqQzMvw45FatZRiFMx6lVlaZ2Gocl3xgJUumI1eeA
 fRFw==
X-Gm-Message-State: AOJu0Yx/uOsoI4B3bEE0KELqbtZ7TSBBTEAN9odADMoiBI09D+ldkJgJ
 2qORyCjL+muO5KMNPsenCueoJFLMMjECIKJNvMQEVglPLa3BR5lRDCHAWQEpafSxEvJ1NA/taNP
 B869ioiB5XJYUA2XStZG7h75lpSHGSXI7TTc+
X-Gm-Gg: ASbGncsf3UQVypBIVxo/StD12k+qvuNYsn+rC/eK9bhfxWqZvpM62DGIfgaGHEgTYBD
 outB1Nlh4M8U7so71a7q00fpU9oMYJVrMED83s9zCIySiMOf2ALPFeiGFYTU/msiyp3N9H6x1+3
 0G+JVa7ihlngrPYo9AmDm0/VlUT5jCKFj55/DeN/TAOi3VLlIEdrMdC3Ebf1+9i9fj70JSsk6qb
 bxsdR2UYVK7JKXcztS/jwW6SP1PMNCHB2AcuvtstdD+vnK7h52uf+VPkD99gg==
X-Google-Smtp-Source: AGHT+IGAWA3kZl9y793CT7XU1JMKLElHkjU5g1yZjJTIqpYDCEovk8yJ2EoWlAPJh3BNwcvyK+GEmaptLVgFaoc2s6I=
X-Received: by 2002:a05:6e02:1d9d:b0:42d:86f3:a2d1 with SMTP id
 e9e14a558f8ab-4330d1c9dc2mr52392915ab.25.1761916481635; Fri, 31 Oct 2025
 06:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+FdXqkOP3rxOOdVY6Q28g7eDsmqkwg38PzZ+rKbdG8DZs0KA@mail.gmail.com>
 <d19c02a02c61469499c5f8183ce0f079@rozman.si>
In-Reply-To: <d19c02a02c61469499c5f8183ce0f079@rozman.si>
From: Anthony Paul <anthonypaul@gmail.com>
Date: Fri, 31 Oct 2025 10:44:14 -0230
X-Gm-Features: AWmQ_blHPJNCAuCM5CVaYWHzbfi28G6SA8yYaNSxCzW85MSoEZxxqEs85TO6gAo
Message-ID: <CAA+FdXoVKcB4pZmjK02shnEZcQuYL86iLJGB10ngk_4mc0Rruw@mail.gmail.com>
Subject: Re: Crash on Windows ARM64 when Import and potential fix
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Simon.

WG for arm64 windows still has all the issues with the file selection
stuff...  Any way you could get this patch pushed through?  Anything I
can do to help?

Thanks,
Anthony


On Wed, May 21, 2025 at 4:55=E2=80=AFAM Simon Rozman <simon@rozman.si> wrot=
e:
>
> Hi,
>
> > There are numerous reports that the import function causes a crash on
> > Windows Arm64.  (I believe it is actually the file selector that causes
> > the crash)
> >
> > https://www.reddit.com/r/WireGuard/comments/kwqnb5/wireguard_client_cra=
s
> > hes_when_trying_to_add/
> >
>
> Thanks for reaching out.
>
> We already have a patch for this in the wireguard-windows repo:
> https://git.zx2c4.com/wireguard-windows/commit/?id=3D8e6558eba6665b51de35=
779bffa46803dbc4c10d
>
> It is pending review and official release.
>
> Best regards,
> Simon

Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1291EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 09:36:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78B923383
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78B923383
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fb8e885;
	Fri, 8 Jan 2021 09:33:34 +0000 (UTC)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ff69f96e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 09:33:32 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 186so7960009qkj.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jan 2021 01:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PnLbusFPw0NqkYaHXS7jwwZf+CC6BlEDfblZZAjXZmc=;
 b=EiBwMyvADldbeeFFxd7qdO/JeI9YJxmiB/3XltO54PGT472GgYmaCBo7qmcebT4h1n
 bDBFVu0K/N7UpktoNxNwYewCXwYV+Fu3MNtmafhcCjapYKDrlK5SaYOE1wU7CNG5L3XG
 /w4MdA5Jm2jHUIbk3py1Q1rNJbPYQTEzUNVTrwLj1mPOdd1QctK+P7SmlRGX3kdFEfz2
 VdAj9ZD1Y9W2VfMxbekDvMu76cF1bG9l2KqGypVYuCk/0Ca3LD6eTol2/zIz8ZEq3XB9
 CGip9DcjXHs3p7qJN4WWrPDon/HJYCLrPyR6vVErKNAOqOH3aWR2lg9hMGAEmGGHs28c
 ksOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PnLbusFPw0NqkYaHXS7jwwZf+CC6BlEDfblZZAjXZmc=;
 b=UgZm35fyLPeH9MK62ys79H4GdIO3/JHdkD4sK44JZzH39lLZjwR0b5fMe1PVgAA+Wn
 ESdi4L8vodxJxdvWCo5+sq3H41XyyJj9WDPV8C/vDijyHMx33n9GQs0edzEQ3B/bNOUX
 vdAkOZB2LVehZzp6CO/ujiOD4I0aIQtul4kWoy1ObfvmBdxgZP4AI+jui+ZDiLdY8itj
 2Y6v6zXFgXWStAAbGz98OluaWyQbSc1HFM5H5frwqcuoZu99SZD29o62k9cir24C+9u3
 Vy7/54wJLe0XkY4QdX6LxijRK0pGV0uznpL8FPwfek0sr3/qbbSPhV1KdHQGl1jiDKCD
 TAJA==
X-Gm-Message-State: AOAM533kVp0Fmh6YecZql843ywTQ7kxYH7e4PlnzAPbxiavThQz0vTbv
 kGSLdjBtcwTuomQZbLu0WiiUEb4+QL3d0mu9WwJlBA==
X-Google-Smtp-Source: ABdhPJwoR7gUITNVyUOAEyZRNWl7p5el7UTrmj/K02apfnRIgeVk0q5jElVkY1Q+z4CE+Pb2RUb0XwiJc695IHluFnw=
X-Received: by 2002:a05:620a:983:: with SMTP id
 x3mr3074511qkx.231.1610098410717; 
 Fri, 08 Jan 2021 01:33:30 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
In-Reply-To: <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 8 Jan 2021 10:33:19 +0100
Message-ID: <CACT4Y+ZRfQkPYoO+cgygsTLFLSbnyPRqHw3mVdVDg6zVAs4s2A@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: noloader@gmail.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Netdev <netdev@vger.kernel.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
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

On Thu, Jan 7, 2021 at 8:06 PM Jeffrey Walton <noloader@gmail.com> wrote:
>
> On Thu, Jan 7, 2021 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > >
> > > > ...
> > >
> > > These UBSAN checks were just enabled recently.
> > > It's indeed super easy to trigger: 133083 VMs were crashed on this already:
> > > https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
> > > So it's one of the top crashers by now.
> >
> > Ahh, makes sense. So it is easily reproducible after all.
> >
> > You're still of the opinion that it's a false positive, right? I
> > shouldn't spend more cycles on this?
>
> You might consider making a test build with -fno-lto in case LTO is
> mucking things up.
>
> Google Posts Patches So The Linux Kernel Can Be LTO-Optimized By
> Clang, https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Clang-LTO-Patches

Hi Jeff,

Are these patches upstream now?
syzbot doesn't enable LTO intentionally, nor I see CONFIG_LTO in the
provided config.

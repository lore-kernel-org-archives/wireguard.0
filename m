Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DEFC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 01:03:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BABF02076E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 01:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BABF02076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ffde028;
	Fri, 8 Jan 2021 01:03:14 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 76fefe22
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 01:03:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x20so18985048lfe.12
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 17:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6FAgd01oLjONpUSdzrjOz0khp0zDApEx5a0oh+aA2/M=;
 b=T8Vg5+ad11GIiPOln6aeEZzf6/ZLkdVFaSKxWjYwjGImAzjAZERO6ElXhtXt3WcwIp
 u6A16xbDKoIwIO1rNUrc8sdst5RjCAagMENbjSO/knI3PO2zjSnJX+2mtNR3ZUvjqGRw
 W53xcyUPpxCkmMshbfmpppy8mV9362p59mCV3zgsQwvOc+97PAmA/5Qlc/3XIcETClGJ
 kMweM7uerwdeTgjvZhvL7Uedp/MOrTrcHCS/4/fEPsFrIG0HYAzJPZuXrPy4PsT2OXPr
 ip9GsfFHkMejf1XZv/hM1arcx4MDI9IIOofqIineK1CfQBZxTInetndetv4ejXAsJ6vO
 nRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6FAgd01oLjONpUSdzrjOz0khp0zDApEx5a0oh+aA2/M=;
 b=K7kIjiPFy8F3w2K9Ep4+0ycT7fH1sGEUhBDVmNLB8N+Ettc8MmL5g+yEJyHJiBXsiC
 gL1Iv2DAMJa8fmcfsx17s+zpuwCEx9lzhXHkxnwzKlgEylXamj7VXDjAT8Wz6kxASylJ
 /ihm2DsvSFBsIHhA7k08hJy4ReK09M4h3iR5pbfHLxLo8WY/7iMe0Y6gxzAo5YMHMj3a
 ra6raTRC/SxPncQ+OPbxOELrziQW6/eNrvzT6GJCCaqzg7E+uj/Q3IxH56XJYZ8RCFBv
 RVKn17a9QjHKUQ1TJovsHTozLjA7IvXL8la1q0eofXUmL6a751m91HbIfo1uUHA3NXKm
 vwKQ==
X-Gm-Message-State: AOAM530q/ZKYGcv6iR7p6Ukz60dXJC5rYqQUATOV+aONtYKpeaUOIKbB
 iR+bB8ZQU3kPrD50A2oG73Pg/H4hW9kbviHqaRA=
X-Google-Smtp-Source: ABdhPJzVwT7mkUrvF39uEvzSiwXiGP60OKgSihu8YxUBg6NJDD7dYjqPiqGhVyJnu7ocznmnTZDcLLR9/zR4Pe/EluM=
X-Received: by 2002:a2e:86d1:: with SMTP id n17mr432527ljj.120.1610067792278; 
 Thu, 07 Jan 2021 17:03:12 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
 <CA5B0431-801C-4F2E-85F5-E329F02D364A@morsecom.com>
 <0029bece-0f7e-4467-948d-b48af50e5bca@www.fastmail.com>
In-Reply-To: <0029bece-0f7e-4467-948d-b48af50e5bca@www.fastmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Fri, 8 Jan 2021 02:02:40 +0100
Message-ID: <CABtXGiB93kHQGC4Tg+Np=sJSo-HDb99wGWbsm25pHU88PwggCg@mail.gmail.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: Eric Light <eric@ericlight.com>
Cc: Corey Costello <ccostello@morsecom.com>, 
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

I went and did it for you. You should have a confirmation email to
respond to. Check your spam.

On Fri, 8 Jan 2021 at 01:49, Eric Light <eric@ericlight.com> wrote:
>
> Corey - have you tried unsubscribing at the unsubscribe page?  https://li=
sts.zx2c4.com/mailman/options/wireguard
>
> Hope this helps,
>
> E
>
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>
> On Fri, 8 Jan 2021, at 13:34, Corey Costello wrote:
> > Get me off this fucking list ffs.
> >
> >
> >
> > > On Jan 7, 2021, at 2:06 PM, Jeffrey Walton <noloader@gmail.com> wrote=
:
> > >
> > > On Thu, Jan 7, 2021 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com> w=
rote:
> > >>
> > >> On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com> wr=
ote:
> > >>>
> > >>> On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.co=
m> wrote:
> > >>>>
> > >>>> ...
> > >>>
> > >>> These UBSAN checks were just enabled recently.
> > >>> It's indeed super easy to trigger: 133083 VMs were crashed on this =
already:
> > >>> https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fsyzkaller.app=
spot.com%2fbug%3fextid%3d8f90d005ab2d22342b6d&c=3DE,1,RVpgZsRUCGs2jKlumiMAM=
npeOF4QdiW5h8GDIsBJPz-orFNwvwCXnceC9n5Bhr1h-G2EsU0tlC7N4QUpHuF6tIMI7tTnBoRj=
Ao5tT-Bk9-Fhe8CppuOL4mqdkA,,&typo=3D1
> > >>> So it's one of the top crashers by now.
> > >>
> > >> Ahh, makes sense. So it is easily reproducible after all.
> > >>
> > >> You're still of the opinion that it's a false positive, right? I
> > >> shouldn't spend more cycles on this?
> > >
> > > You might consider making a test build with -fno-lto in case LTO is
> > > mucking things up.
> > >
> > > Google Posts Patches So The Linux Kernel Can Be LTO-Optimized By
> > > Clang, https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2fwww.phor=
onix.com%2fscan.php%3fpage%3dnews_item%26px%3dLinux-Kernel-Clang-LTO-Patche=
s&c=3DE,1,7u3-jWadklYo8ai_XrPNvjnu46LLAyg0hqsGIaMPaoQ5UxtcNM84jrHUgSg4VciXK=
k9XVpwgyBwD85LbbW5_j195jSH6RrAej45I1kr_XfQ,&typo=3D1
> > >
> > > Jeff
> >
> >



--=20
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.

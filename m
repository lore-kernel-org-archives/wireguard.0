Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC03AC47088
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 14:53:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef7ceb98;
	Thu, 1 Dec 2022 14:53:44 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cd9fcdb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Dec 2022 14:51:18 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso5490049pjt.0
 for <wireguard@lists.zx2c4.com>; Thu, 01 Dec 2022 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDAa0kKSqqV8mXtqj34qGPM9gY4UZ1/nRGkIoZZHSrs=;
 b=O0zKSgCAr5xDAxd2KZrCuA4WwXyeOsR9IRfu0RKE5bXyHfr5Lon/JQGp8W9seHdP9l
 pk1VkPZaT1o0YXENxMl1PT3wZMefkbbKsSbeLZWXlL16GvX43yTrCytfKMfKsIfj5Jbb
 NOVf7PhVwI4Fqeg5qfbFH3QbYkmS6Om3RgkHj1L+lLgurvHSvIOKgFsNwhZGCM6bAZgz
 /6JapS4n/asB5mU0R3Q8JsqheyCn/RFSqjow1ZMioYBuNcpJ02MzH83XQNeXfV39nHdA
 +SzMzaYHOxjE1dQ/aPznym+kfFFsb+odKPmNszGEO4WyWhP+pSFXBYPHiQ9U2TenU44Q
 Sh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDAa0kKSqqV8mXtqj34qGPM9gY4UZ1/nRGkIoZZHSrs=;
 b=74hv6AzDt5UK1LQN6O5ubup1ccjUS1lb8QKfPLmRhX/XuQsYd1VqzXITWDuBPxMpyW
 O+sqDU8aFd44QZ2EmBh3UECBmd9MCzsiUlIWlsbIixTQS3d62KHwDiK+FJ1DgWcUTvPb
 34U50N80o9Sr7FIYsxB73IXqkvz39xGwBdbl8ndYXt1h4vu8lz69op4wKX9CdEYGLDBx
 QVjdJTOZLEyb0vyQ/IVi3Bxlxu3as9YpJYrfdxlNa0FrZ5vti1kPXJL/FQctF1vC3sfS
 5z/vzQr/2ocMALts9YO3QzDemQqg+NLPH2OID6gXFdVBBG5nAPNghpO1qEM2m68H4a2m
 xeTA==
X-Gm-Message-State: ANoB5pl7kOuOSre2JMpHhStqjbbLusTFkX0apYNn3tANMHXablkLV9sn
 Hh4Ejl98W2OyUoUmCDeLUXDwyAW2RrlEBQSeV28/bh3fz8M=
X-Google-Smtp-Source: AA0mqf41uIJNbh5MT8caLnoNOSspT+AdtqoSc6ZRAEIikBMGOYilxWj5DfGJhr0UFqQbNW7UNpAXqeQnlIcXmBgXDW4=
X-Received: by 2002:a17:902:7c0e:b0:189:907c:8390 with SMTP id
 x14-20020a1709027c0e00b00189907c8390mr19386697pll.126.1669906277209; Thu, 01
 Dec 2022 06:51:17 -0800 (PST)
MIME-Version: 1.0
References: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
 <Y4inPePWAWCQ/Ejp@zx2c4.com>
 <CADo9pHij0DqLsHswwquhesi3N1L8v1n7-eaCjNQ=rV1vgO_Y-A@mail.gmail.com>
 <104a34b9-f27e-0daa-4ef2-d5e71af65639@tootai.net>
In-Reply-To: <104a34b9-f27e-0daa-4ef2-d5e71af65639@tootai.net>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Thu, 1 Dec 2022 15:51:06 +0100
Message-ID: <CADo9pHi_42SWhMBTzWDfxeWO+pVr5kniXOBELOjwyzUdk2jLwg@mail.gmail.com>
Subject: Re: Wireguard on Asahi Debian
To: Daniel <tech@tootai.net>, wireguard <wireguard@lists.zx2c4.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Dec 2022 14:53:39 +0000
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

Ah i see

On Thu, Dec 1, 2022 at 3:49 PM Daniel <tech@tootai.net> wrote:
>
>
> Le 01/12/2022 =C3=A0 15:26, Luna Jernberg a =C3=A9crit :
> > Thats Asahi with Arch Linux however and not Debian
> https://git.zerfleddert.de/cgi-bin/gitweb.cgi/m1-debian/
> >
> > On Thu, Dec 1, 2022 at 2:10 PM Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
> >> On Thu, Dec 01, 2022 at 01:24:07PM +0100, Daniel wrote:
> >>> Hi All,
> >>>
> >>> I installed Asahi/Debian Bookworm from
> >>>
> >>> https://git.zerfleddert.de/cgi-bin/gitweb.cgi/m1-debian/
> >>>
> >>> and face a problem: installing wireguard shipped the Debian arm kerne=
l
> >>> and I can't get wg to work.
> >>>
> >>> Is there a solution for this ?
> >> Appears to be available in Asahi's kernel:
> >> https://github.com/AsahiLinux/PKGBUILDs/blob/9fb6fddfdd388190c099a723f=
046acf7b8b6bd39/linux-asahi/config#L2462
>
> --
> Daniel Huhardeaux
> +33.368460088@tootai.net              sip:820@sip.tootai.net
> +41.445532125@swiss-itech.ch                tootaiNET

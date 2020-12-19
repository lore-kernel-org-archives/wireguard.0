Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10C5C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 00:27:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B50723B99
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 00:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B50723B99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 650523b4;
	Sat, 19 Dec 2020 00:18:28 +0000 (UTC)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ca393933
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 00:02:27 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id z11so3840038qkj.7
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 16:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=svW6pGDqyhvP8U/EVX0Wufr91GNeJl+RJSWfoa+Lk+4=;
 b=c1T2qKKOfTytM3fsJyJ+MYmivRBxxMQ46DNelh4uzYJxDCk5TnzOQ1ytnNTnIv+ObW
 ZDN/GplmmgwCi1/n83BgmOlmyhDIF2fVeCjMt3FhAQSHWuCdPvjp+JomWQ6D16pfmBsh
 lA1SL+qoe5Ad5CgCcKG8ZETwbgguFpF1cyMiusc/bBlMeQe3Nk3hLEGBNECzClND5GRm
 BLCnOR43cFV9nfsymljqZFxREs8D+s//1IsBSFpGDouy1wiiB20cHFA40GTsEbWGnUQ+
 H0L6IQi0yIL1NDWJPwY0CbjwP12990DZQ4NSQHOPGoWWBbZRPx7zTk35d/NkvUw4aN2H
 m4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=svW6pGDqyhvP8U/EVX0Wufr91GNeJl+RJSWfoa+Lk+4=;
 b=BgJm77fBBE4OmyNFgxAFyWETr4DhJ6fqfMb71+pnjYTNNFrXCelDBILra59/VpvwSX
 AluuPvVrhReJg5trGsHgdNWLbUa28FXEydBuqrbIiVw5M4jrfJU1GLwaJ1JAlSz24zRH
 M8C4gKpzse2DoB9tIxIj1Uxd7q+vhorYVxGjOHoupb3fSzYeZ7On8LSfu1J6rv+DAy6H
 YY7u5/oK3hTk4Ac+i9J282i4Yyt9O7EO7N329P3g/21xOD3s+cocPEHqz0Q0waYeFm2c
 6oIDR/bYtt1q1HAv4PqvaEAK3Xrf1cEexXDfe6+Y4KkdrvAzJiMOskSy3cTBhmZhQBgB
 D9JA==
X-Gm-Message-State: AOAM533z5zeDYV0gE4fIcmfk/Nzlg4v/cx72eyFJ4vm7YieaW7/Vgk4f
 e5oNDcALs/8gEb6v/UdLtpJTvdhFrRGXM745
X-Google-Smtp-Source: ABdhPJzgqC7z0xcJ9RsIEY+Ibp+7JOSNeAPLfF6E17v6NjqvzoeZab4npe/nu6HrM4yThJgAdbsZ2g==
X-Received: by 2002:a37:7806:: with SMTP id t6mr7368445qkc.360.1608336668916; 
 Fri, 18 Dec 2020 16:11:08 -0800 (PST)
Received: from [10.10.10.3] ([104.236.254.107])
 by smtp.gmail.com with ESMTPSA id b6sm6565700qkc.128.2020.12.18.16.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 16:11:08 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jacob Lambert <tharant@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
Date: Fri, 18 Dec 2020 18:11:07 -0600
Message-Id: <B7F0A3AC-5615-4517-BC74-6BDDDE574B12@gmail.com>
References: <CAHmME9pZq6pMV9W2EiYRP_mOLkQXVDpdB83kEFsiuhEH807bzA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <CAHmME9pZq6pMV9W2EiYRP_mOLkQXVDpdB83kEFsiuhEH807bzA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: iPhone Mail (18C66)
X-Mailman-Approved-At: Sat, 19 Dec 2020 01:18:24 +0100
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

Thanks for keeping us updated!  Knowing there=E2=80=99s a fix in the pipelin=
e is good enough for our needs as we have a workaround solution.  We appreci=
ate all your work, so thank you, and happy holidays!

--

-jacob

> On Dec 18, 2020, at 5:55 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> =EF=BB=BFHi again,
>=20
>> On Thu, Dec 17, 2020 at 10:53 PM Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>> However, they rejected the iOS update, due to the link in the version
>> info window to https://www.wireguard.com/donations/ that we've had on
>> there for two years. You can see their rejection here:
>> https://data.zx2c4.com/apple-asks-me-to-remove-donation-link-from-app.png=

>> https://data.zx2c4.com/the-screenshot-that-apple-provided.png
>>=20
>> Not wanting to hold up getting this fix deployed, I quickly removed
>> the link and resubmitted to the App Store:
>> https://git.zx2c4.com/wireguard-apple/commit/?id=3Da4fc0f64b8bca8afae5aba=
b37b81ba0b45836975
>>=20
>> So now the process of getting that fix deployed on iOS starts from the
>> beginning again. It could take another 24 hours. It could take a full
>> month. The process is opaque, and try as I may, I don't know what else
>> I can do to get the fix out faster.
>=20
> They rejected the submission with the donation link removed, citing
> the existence of the donation link in the old build and providing a
> screenshot of the old build, rather than the new build. I sent them a
> response pointing out that they reviewed the wrong build, looking at
> the old build rather than the new build, and I sent them a photo of
> the new build as installed from Test Fight. My experience with Apple
> here is that if you respond to their rejection with anything at all,
> you automatically get put in a bin of at least a week wait time. I
> hope that doesn't happen here. But, anyway, another day has gone by,
> and we're still waiting on Apple to ship the fix to you all.
>=20
> My response to them was:
>=20
>> Hi,
>>=20
>> Looking at that screenshot, I think you might have tested the old build. T=
he
>> one I submitted is build 21, which removes the donation link, rather than=

>> build 20. But in the screenshot you've attached, it shows "(20)" and it a=
lso
>> shows the donation link. So that leaves me pretty confused about what's
>> going on. The link is definitely gone in build 21, and I definitely
>> submitted build 21, and looking again at my build submission, it says bui=
ld
>> 21.
>>=20
>> Attached is a photo of build 21 running from Test Flight on my iPhone.
>> Notice how the build number says 21 and the donation link is gone.
>>=20
>> Could you take another look?
>>=20
>> Thanks,
>> Jason
>=20
> I hope this gets cleared up soon. Maybe I'll watch Terry Gilliam's
> Brazil on repeat while waiting.
>=20
> Jason

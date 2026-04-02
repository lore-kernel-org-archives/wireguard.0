Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7FAF34C62
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Apr 2026 15:16:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id feb7d01b;
	Mon, 13 Apr 2026 15:14:34 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b5e9d418
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Apr 2026 17:08:34 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d7f92bde91so683381a34.1
 for <wireguard@lists.zx2c4.com>; Thu, 02 Apr 2026 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775149713; x=1775754513; darn=lists.zx2c4.com;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anVZF/hO86rDuA0y2cSK6zli4sip6Rs95gAxI1zYy+s=;
 b=m1e3brG0IpNfkBX9Rpae41Tsv06QdWGopsf6ONhc8PEJvibxFcgkBc9A5YDRwaYvtM
 O3L/WQcTdlIlbwEw1kFBFgmoHVmxr+S5erAoeVrwaQe5LN8JmB8tiFSi1sOeBSa8DM0U
 dZt1kW8aCEssbSiHRMsKpNRk5nHke/wYtNkKFJTZTnaGlAOUQcwweAxMCl3Oea4AVLOr
 byXHIXdGaCYwm89NG75BB/xrqeofQ+FcFfmh/WdMci9gpN1mFQC76teSgFiLw42yExWV
 /g1ZQ5Y3lBJmsv15o2zxnP9KSM7uVi91Ew6JaKlKYfTrU6LI5yFMZ4JWawcGADDyHVtp
 mqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775149713; x=1775754513;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=anVZF/hO86rDuA0y2cSK6zli4sip6Rs95gAxI1zYy+s=;
 b=H30wQ63Q2QDJGKCfkIoXwlAle02/vxsAnR3Qz5xyBA7eOkMebJIYWjNIUsu6ck8jPg
 hjraW/KsaVUj/YD5L1rTRWFK2l+r2MeG+DZSMMDaPNPWQC33m8pPWDw/h3qzM8x9T7X5
 VRkSHKGxp5JrgSG7eKM0AHpSv4wEIc4ZSbKjp3pXHH3BzP34iP8938OC9qa+2KcXQxKs
 hQGcokuwQTaivs6HDF/P7J5LMm+4qGY6lfWpP+pcIEjaOkjgj9OR7mJgGzcEI6kvPpZo
 Wpukepu5dcYb7pQMl3RCEL40lsJrZZW/bo6ho3aVluQPZBf1AuYI6QQ6cWNyKxYNN8JK
 42pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKlzZAOkqyspmIJOXea96rF4V1CwiRwYfSjPJjOLnt0VFapKE582sYldzt/aotpzvTOuN2rWCIT9E=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwhVeA/r7NDgPodpdPMqoOXsCISEQE1VRZrIrXqInc4DvXbjy9t
 zRXlPbL0XzfZlAImWvm6mbOsF0sAtMUB3cpdCOz3WdHHnORSwAxZmJse
X-Gm-Gg: ATEYQzy7XPCoaHonH0MI3ma1mrYB6lzqMcr1n/8ynHqXeJ9M+FcGk+8ynNPO7tOiukL
 dJV1p6qWGKz1UwuZ1UxKOPububf+S4K4C3z6Jxvg7NOxliynsFXHKPwzSb35Txo4tCD/Frd2F0W
 pbuPNCLki0IomKJKkdo11ONnNgAYFsHnGeKGLX3XDOi273TQXG/diY5wf5E6CU0k9VPTcJ+tR3w
 Q0xDGaoo79ppnwQbphwwtljhxHcf5tb4euK+WzYo0wGoDQMHiXn/EwYVWz8brP0CXhddHvyOnsc
 0s3TnPYT4m3p1XtYp9d4i/QlhkO6lJ9Ov9LMc62zqcEwji/247skA2D1os5M196ZphsiX/CvUK2
 Svk1gexzql0MfBgKYGF3wS5m0rJXUD1qQhf+FpFM00WD/Tvs69gTLl/fL5nlf22O8G3Ss1fLTyj
 j41SnMFVbV1fAHnaf0CCYive6fxppvurO+G7BRK//NjP8/oFLB90c7Rgg=
X-Received: by 2002:a05:6830:621b:b0:7d1:9da9:c6c with SMTP id
 46e09a7af769-7dbb70d044fmr87778a34.17.1775149712878; 
 Thu, 02 Apr 2026 10:08:32 -0700 (PDT)
Received: from smtpclient.apple ([72.47.112.202])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7dbb40b1507sm427083a34.21.2026.04.02.10.08.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2026 10:08:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: Kernel ML-KEM implementation plans
From: Ryan Appel <ryan.appel.333@gmail.com>
In-Reply-To: <20260331011133.GB5190@sol>
Date: Thu, 2 Apr 2026 12:08:17 -0500
Cc: linux-crypto@vger.kernel.org, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8721F1CE-0E84-4A2B-816F-0A4485BA808E@gmail.com>
References: <20260331001358.GA5190@sol>
 <7507DE2E-1507-4D03-B6EF-9C139BBF34F8@gmail.com> <20260331011133.GB5190@sol>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Mailman-Approved-At: Mon, 13 Apr 2026 15:14:30 +0000
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

Another potential and likely use case is Wi-Fi.=20

WPA3 supports both SAE-PK (which currently uses ECDSA-P256 and will =
likely migrate to ML-DSA or other,
And WPA3 enterprise supports EAP, which uses the IKE Diffie-Hellman =
groups, which already have added support for (pending finalization) =
ML-KEM groups.

Of course the spec will have to be updated, but it=E2=80=99s highly =
likely that at least ML-KEM-512 will be supported.=20

The actual use of the algorithm is as simple as calling it instead of =
ECDH, but in theory, we typically care very much about the difference =
between key agreement and key exchange.=20

The major difference on a code front is that with ECDH, you input a =
public and private key, and get out a shared key.
But with ML-KEM, you input a public key, and get out a shared key, and a =
cipher text.
Or you input a private key and a cipher text and get out the same shared =
key.

(Encapsulation -> one input, two outputs)
(Decapsulation -> two inputs, one output)

I understand that there is a chicken and egg scenario where there=E2=80=99=
s need to wait for the need before developing, but something at least to =
consider for the roadmap.


> On Mar 30, 2026, at 8:11=E2=80=AFPM, Eric Biggers =
<ebiggers@kernel.org> wrote:
>=20
> On Mon, Mar 30, 2026 at 07:44:55PM -0500, Ryan Appel wrote:
>> WireGuard was my big implementation user.
>=20
> Any more details on this?  Googling for research papers shows that =
there
> have indeed been several proposals for quantum-resistant WireGuard.  =
But
> some use algorithms other than ML-KEM.  Others don't modify the kernel
> code but rather do the key establishment in userspace.  I haven't =
looked
> into the details, but it also sounds like it's not as simple as =
swapping
> out the algorithm, either.
>=20
> I think step 1 is work out some plan with the WireGuard folks.  Which
> may or may not turn out to involve in-kernel ML-KEM.
>=20
>> I also know that VMware uses the kernel crypto space for many of its
>> crypto operations.  I do not know when they will want ML-KEM and if
>> they will want it only within BoringCrypto or OpenSSL, but if there =
is
>> need for it in the market before it can be developed then that makes
>> sense.
>=20
> That code isn't upstream though, right?  So even if hypothetically =
they
> (will?) need ML-KEM in the kernel (for what?), that doesn't count for
> upstream purposes.
>=20
> - Eric


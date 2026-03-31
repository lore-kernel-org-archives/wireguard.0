Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BEF34C5E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Apr 2026 15:16:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 372703bb;
	Mon, 13 Apr 2026 15:14:32 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2735e3ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2026 00:45:09 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d9bba96f7dso2728518a34.1
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2026 17:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774917908; x=1775522708; darn=lists.zx2c4.com;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=mdV7saOUjIDAHAVu162wvni1KJ8JIN4P9J1aBuMdPl8=;
 b=pCQfOlXv6ZfDxX6rbQbCpgdvmFK1CvAGiGIQzQPElRuL0T/9nXxSRL8yg+Su+OP8Ah
 VWNInvB32fhAtYg80yUIToC0uMcm7M+S4egVVUcz1iPMTuOPC2xsR5en83kE0UYi1rUq
 S3AAj50NSbFs/K2KnmkrWc9CGVKog7cwy6WRx1qK/l5B3/S6E0+dl5SRCHjAv+Ev7lEs
 7fsZyv+vgE606PvXmVbg4McA0cbRAd/cq1BElQs0sDpLIy3FmSCtAnEpmjNoryAfeTgB
 aHsADc7Dl4LArYrwoJtkpxZd5VbDzCeLjGhGt7T4xDWK0SshMRtGpXar/KHwSUH35Uj6
 lLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774917908; x=1775522708;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mdV7saOUjIDAHAVu162wvni1KJ8JIN4P9J1aBuMdPl8=;
 b=PttYpBBrpB3IDOahTLLjhlkWuh94d8Q6qjejcq4Q7vX6hzLq7VCSqRt8mo2DUSIqe9
 6QcybOlmPfXjkfT43ngmpVgSEB7BXmEhXfC/8YGqrgUJiij1ZPsWujenOWaSj8BEIwBB
 rjUXegXfZfJtX3sJoQMjCtMmXYuPtu414tKYIDfFPXccU6FS2BWi7DaBotS0d6R+nZwv
 5Dc0CSzTC9I4ASKIOEq+dIViHvrxYTBVGlZYE7EIZBrQRv6gSLeu9ht6mueOEslEymmC
 T+99ds6dHf5tpRvKBICLjHyRnGXMKQccQTqtujhCOFMDDbvLbmfcSwhXLy11ErwESZa7
 +ZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCvEdGBgv1Z0T2hV0x16Q6SlilcZNAqkKluN0IgTtCgE0t4dGD54TVIvHDj1vCEuSJbXje+MAI8Vg=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyWnNvZh3W5iRQcLMbvWB9ehGvUDT8cDb2cvIRkWyJ7D8+Ab5Ar
 D8zycKv56UeQ4zuGpwGQzCEzipk12nqs1ZnUbfx8amQmQvl30dXXZhNh
X-Gm-Gg: ATEYQzxqmgrDQtTI6wh/IK9XaqPdfDeno7RAGHFEIhqPsKlRlCp/vfyatm/WwFP6KnS
 uJjIR/kdHLjGqRp/z41SPPOrHY2dsjLTD255JSSV1eDhhaszKVL5uzunv+5M7x5iZnTKK2J2TqR
 gKMIqC4KKiflDg0AqM9PzPViUUP841MUvSZTo/2YuGGefq4ezbDNrx3K5XlqkFeNQ2VqhpwzbWV
 FgGkmfB7MZCZ+bIhVfqYsSH1Akkl4ad4UgG0Yb61eSkf8MHPno8KsUkgukHXpbFXwVkFZStWONL
 WPxonXf6ciOPI4HF6bR2+WKwRFQI/6KmOk+YXl4VyKYCkltNsWUqaLTNQG1A1xu1atH/FikL0lx
 KIX8dXQQS4KmP4Xt5Yg3naZasn5MCH6hE0NVkwxCkMfhGL3FZimj/s7EHTPo63bH0VMLL26SE7r
 NEpuJIpzFzwKl8etk0se0d3jTuET2esKc1KRG5TaTUwqPATy62XA4i98fIfpvnoJ/jBkg4jXl/i
 Li81g==
X-Received: by 2002:a05:6820:20e:b0:67e:3e27:8575 with SMTP id
 006d021491bc7-67e3e278735mr887522eaf.50.1774917908015; 
 Mon, 30 Mar 2026 17:45:08 -0700 (PDT)
Received: from smtpclient.apple ([2600:381:6705:e5f:ad55:112f:ba58:2819])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-67e231ad680sm5683946eaf.10.2026.03.30.17.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 17:45:06 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ryan Appel <ryan.appel.333@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Kernel ML-KEM implementation plans
Date: Mon, 30 Mar 2026 19:44:55 -0500
Message-Id: <7507DE2E-1507-4D03-B6EF-9C139BBF34F8@gmail.com>
References: <20260331001358.GA5190@sol>
Cc: linux-crypto@vger.kernel.org, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <20260331001358.GA5190@sol>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: iPhone Mail (23D8133)
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

WireGuard was my big implementation user. I also know that VMware uses the k=
ernel crypto space for many of its crypto operations. I do not know when the=
y will want ML-KEM and if they will want it only within BoringCrypto or Open=
SSL, but if there is need for it in the market before it can be developed th=
en that makes sense.=20


Thank you,
    Ryan Appel

> On Mar 30, 2026, at 7:15=E2=80=AFPM, Eric Biggers <ebiggers@kernel.org> wr=
ote:
>=20
> =EF=BB=BFOn Mon, Mar 30, 2026 at 06:41:46PM -0500, Ryan Appel wrote:
>> Hello all,
>>=20
>> Looking through the mail archives I see no information on an
>> implementation of ML-KEM that has been planned, except for leancrypto
>> attempting to make a Key-Agreement Scheme a Key-Encapsulation
>> Mechanism.
>>=20
>> Is there a plan to implement a KEM interface at this point? Is this
>> something that needs support?  How could someone contribute to this?
>=20
> We don't add new algorithms preemptively, but rather only when an
> in-kernel user comes along.  Otherwise there's a risk that the code will
> never be used.
>=20
> Do you have a specific in-kernel user in mind?  I haven't actually heard
> anyone specifically say they need ML-KEM in the kernel yet.
>=20
> I guess the obvious use case would be WireGuard.  But that would require
> a new WireGuard protocol version that replaces X25519 with something
> like X25519MLKEM768.  It's going to be up to the WireGuard author
> (Jason) to decide whether that's in the roadmap for WireGuard.
>=20
> Also maybe Bluetooth, though it seems the spec for that is yet to be
> defined?
>=20
> Anyway, point is, before it makes sense to consider possible
> implementation strategies, there needs to be a plan to actually use it.
>=20
> - Eric

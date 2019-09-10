Return-Path: <SRS0=xahJ=XF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A4EC49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 09:36:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F6820872
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 09:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlt0G8dl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0F6820872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5306f40d;
	Tue, 10 Sep 2019 09:36:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09553dd7
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 09:36:22 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cfdf39a
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 09:36:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p2so15222490edx.11
 for <wireguard@lists.zx2c4.com>; Tue, 10 Sep 2019 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qnX3wc/VLBPHrpfw80KUe7RDrWotKN0evhgm90iWlhs=;
 b=qlt0G8dl6g3bwHK5OhvsJPJn5DXQy9EHkr1/bnOUNf1l13oNR4DbwzC3wz/Af2cOZg
 8RmkWspz88uRIZ5VaiOu7WiTl9SmqYpzZBKPb4Mers7ciTj4MOXUmQvXEPKv3TnNksC/
 kc0x/+mi9SPA+G1fixQoHkZr5HS41cZIQ9Z+xeYaJP4wcrNpEYGLqLW3CLSxlmwJNu4r
 9JFadbfy4tRaqiXxpwh5S3YnfUO30ladl7IL0J4BnxUtOhMlFTOQQtOrODKXaMww4IP1
 6i+Blv00zAp6RGKgEAYdjKHTGqO0JxeTnqxd18QFEfJCic8jSnMhWNI2WAdNLozLXGJU
 2HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qnX3wc/VLBPHrpfw80KUe7RDrWotKN0evhgm90iWlhs=;
 b=hPdASkTdRycT6qa51FFcv9pWyggDd5vtdu6YckIuCrVHl30f96MgmNLx0Ed12ny1XV
 uDqzxeyhfF2qGKg0M9rYtYsiegJiPM5EdFkygD2JI+cNYUu/EI24JDpyMiCbkbu9rSQU
 WnVyetr+My9SPx9j387cyJqFxVrYEyq45pV32wgq13UpCw4l6h7ilLqIh07Oif1qxuSB
 rrOnOy4tuA0rgbIyJwLwrn76GG8yU3a/3lnbQjSEq4lpqpHJmv66yCHZqtUi/RGLzd0f
 eXMjv/mAHUoP7UXv+xmThYdVfpRyfv2UoF5uUw7T1LL4uy63S+IfbWyeOlSewPdC1qXL
 pisQ==
X-Gm-Message-State: APjAAAVxe99eF13cpZywLirzjCan4sfGchqVNziHXk3V2AHdzl8AKXGl
 XNsSZW3SXcRwnClpsdK7eQxslf7xpHXfM5wWTqLYNHdn
X-Google-Smtp-Source: APXvYqwb7WCF/VyYEszS+GdhmyvyylWy68KGxDtl4PiIk7a3f/B250cr8nocW5CYZh34EmV8qdVsLOl4ZxlUgt0omq8=
X-Received: by 2002:a50:c052:: with SMTP id u18mr29272578edd.88.1568108180532; 
 Tue, 10 Sep 2019 02:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <CADdae-jaGWC=HxVpU7Gc6QD=mCgq6O2jTXdmzeKXyKvLq6QVmw@mail.gmail.com>
 <CAHmME9qbO37Cs9gMOLxaTqdu2KLTeOm6vtpvWKPe4tJZ6mFB+g@mail.gmail.com>
In-Reply-To: <CAHmME9qbO37Cs9gMOLxaTqdu2KLTeOm6vtpvWKPe4tJZ6mFB+g@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 10 Sep 2019 11:36:13 +0200
Message-ID: <CADdae-hWHX2xD4AZakB4Ytoz5Yj=yORoEE-Cs5o2seh=KhBnAQ@mail.gmail.com>
Subject: Re: Using openssl to generate private Key
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

VGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sCk5pY29sYXMKCkxlIGRpbS4gOCBzZXB0LiAyMDE5
IMOgIDIzOjI0LCBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4gYSDDqWNyaXQg
Ogo+Cj4gVGhpcyBzZWVtcyB0byB3b3JrLCBtYXliZToKPgo+IG9wZW5zc2wgZ2VucGtleSAtYWxn
b3JpdGhtIFgyNTUxOSAtb3V0Zm9ybSBkZXIgfCB0YWlsIC1jIDMyIHwgYmFzZTY0Cj4KPiBvcGVu
c3NsIGdlbnBrZXkgLWFsZ29yaXRobSBYMjU1MTkgLW91dGZvcm0gZGVyIHwgdGFpbCAtYyAzMiB8
IGJhc2U2NCB8IHdnIHB1YmtleQo+Cj4gSSBoYXZlbid0IHZlcmlmaWVkIHdoYXQncyBoYXBwZW5p
bmcgaW4gdGhlIGNvZGUgdGhvdWdoLCBzbyB1c2UgYXQgeW91cgo+IG93biByaXNrLiB3Zyg4KSBp
cyB0aGUgYmVzdCB3YXkgdG8gZ2VuZXJhdGUgd2lyZWd1YXJkIHByaXZhdGUga2V5cyBmb3IKPiB1
c2Ugd2l0aCB3aXJlZ3VhcmQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNv
bQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=

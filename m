Return-Path: <SRS0=v6vS=IS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D15C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Mar 2021 12:44:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4812F6196A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Mar 2021 12:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4812F6196A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48ea66f8;
	Sat, 20 Mar 2021 12:44:14 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4937e1a2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Mar 2021 05:39:23 +0000 (UTC)
Date: Sat, 20 Mar 2021 05:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1616218762;
 bh=e8VeMBFAdSHGCqF08xbBju7B31FseUBaRkR3DTq2Dlw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=O3CaDe7Q8VqjxUGwWjfTSQEElTHYzpG4JZJiqt2ZJOgKf/EQYt4pWKhH9p0Yv9pO9
 UpcgUDJQSgGwtGcMpJnJW8nkCA7WvUbN50NvLT0Rj41Bw/bo2QNXt2ThLLJFXpOxlC
 nvk/J/GtlsJIARW0iGpfZNIBxPUCSErIYL+MTyrI=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
Message-ID: <LPfKC3Tqkdr8gYTfUyIox24RcE7O3rmYx4FbE-Js2TAQDlLFY-nEaj2PBum1YoZjv6oHyhPGQRDVOL0wNE2wD7BildydzjZ2d0qNVA8WhAs=@protonmail.com>
In-Reply-To: <CAHmME9qvh8PBGX-0mrnHDhxMF_+Do0JzjUf0L+hJkeiNfViqCw@mail.gmail.com>
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
 <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
 <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
 <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
 <CAHmME9qvh8PBGX-0mrnHDhxMF_+Do0JzjUf0L+hJkeiNfViqCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 20 Mar 2021 12:44:12 +0000
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
Reply-To: Bradley Saulteaux <bradsoto@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thank you very much!

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, March 19, 2021 8:33 PM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:

> Hi Bradley,
>
> The hardware I ordered finally came and I was able to reproduce and
> then fix the bug, which was in the Go runtime.
>
> The bug report I filed is here: https://github.com/golang/go/issues/45138
>
> As of writing, the fix I've submitted is here:
> https://go-review.googlesource.com/c/go/+/303273/
> But that fix could wind up being wrong and replaced with something
> else. Either way, as soon as that or something else is merged, I'll
> cut a new release with the fix in it.
>
> Thanks again for the report.
>
> Regards,
> Jason



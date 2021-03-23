Return-Path: <SRS0=PPOQ=IV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6807DC433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 22:24:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DF6619C2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 22:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DF6619C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 376f24a6;
	Tue, 23 Mar 2021 22:21:59 +0000 (UTC)
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d91a50db
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 22:21:29 +0000 (UTC)
Date: Tue, 23 Mar 2021 22:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1616538088;
 bh=C1wXMcLwTZtUa1TEPDjavfaU89GyXw86rJ5mTN6MDLQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EvBd70llSZWWPSxz5Mf0Xyb/94vDJJ8ZBO6cVKjgER/NEDXumriVuJksjMXmfXhR+
 Q9e/8+4vc7WMeL39Hzn2HjyLo4xL33/wJ3HV8Y1b2dwNB2XG8x8cfXuA7CayCENq6h
 aJ4gzoC1viZKdN/hhAe4o6oMNF6OIzf2zq7pYHJg=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
Message-ID: <OY4nN3X4ls8lWZ5VdHVz17N_03f7DWBP9hYHDyljz-HA0jzv7XrdW0VS6pHcWPYxWJYc0f2_ii8XBXO8WLXzEBNBf2xF1DoXZxHcrfYhCBg=@protonmail.com>
In-Reply-To: <CAHmME9quO_Do25BaGOHX3Vdh3PPYRUeQR+U490HMYUpwemJKow@mail.gmail.com>
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
 <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
 <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
 <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
 <CAHmME9qvh8PBGX-0mrnHDhxMF_+Do0JzjUf0L+hJkeiNfViqCw@mail.gmail.com>
 <LPfKC3Tqkdr8gYTfUyIox24RcE7O3rmYx4FbE-Js2TAQDlLFY-nEaj2PBum1YoZjv6oHyhPGQRDVOL0wNE2wD7BildydzjZ2d0qNVA8WhAs=@protonmail.com>
 <CAHmME9quO_Do25BaGOHX3Vdh3PPYRUeQR+U490HMYUpwemJKow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 23 Mar 2021 22:21:58 +0000
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

Brilliant! It works better than ever. The world needs more people like you =
sir, you do fantastic work. Thank you so much.


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Monday, March 22, 2021 8:32 PM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:

> Hi again Bradley,
>
> https://github.com/golang/go/commit/78afca22c9485dbd44da3b909866bbb9c1eaf=
440
> was committed, and so WireGuard for Windows v0.3.9 was released. You
> said that you downgraded to some earlier arm32 version, so I imagine
> you've just been ignoring the update notification. Try updating now,
> and see if things go well.
>
> Jason



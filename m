Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF2FC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 19:13:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F4E23602
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 19:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F4E23602
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e95e819;
	Sat, 19 Dec 2020 19:04:38 +0000 (UTC)
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a77c50a7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 19:04:35 +0000 (UTC)
Date: Sat, 19 Dec 2020 19:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1608405201;
 bh=MrBHdhxvBpep/928Mfm2ndmu/eZ5RDhk8Rkys0phgVg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dNx2sXELfcWzlGlwYezL6TKRzKRYVKKgdoc9Y1j0J+QtPwIXU5OpJQ6UDqUv9EUTq
 GtA41TODWPGWuJkEBOT3XymT3HHHZS31jHWbrhoqObsHRSn/RAWHsxyPF15WX3ABUS
 XdXx9N95feJQOzQ6489yVCgzJcqdixYB4Lx0PUKA=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: Janne Johansson <icepic.dz@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: MacOS and wg 1.0.11 issues (for me)
Message-ID: <G83rQMHpzEl-u73o9kxWJVpyf44Mezj8tJOio-eQqxfXiB_c6Dwdj12WUSC9-nIi_OaKW3adm0qBl00jFbThacSjj8WtbIlJpQHBY-ZPMvQ=@protonmail.ch>
In-Reply-To: <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
References: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
 <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
 <ruafXiXluY0DZUNuLCh3Pzrxpk8CIkHqfrDjsnZ1IOfobylVKP0wc8w_lfT4JlpTbIC1nZ3mjeGb4t2fYfOBEqARrKvZ1_cHIlXBatZKZlU=@protonmail.ch>
 <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>




Sent with ProtonMail Secure Email.

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Saturday, 19 December 2020 11:48, Jason A. Donenfeld <Jason@zx2c4.com> w=
rote:

> On Sat, Dec 19, 2020 at 12:10 PM Laura Smith
> n5d9xq3ti233xiyif2vp@protonmail.ch wrote:
>
> > Jason,
> > Out of curiosity, is NetworkExtension not available if you push a test =
app via TestFlight ?
>
> There is no testflight on macos.
>
> I've now added Janne as a developer device on the WireGuard account by
> using the unique hardware ID of his laptop, so we're able to make a
> bit of progress that way, but Janne's availability for testing is a
> bit limited, so I'd still be happy to learn about other people who
> have the same problem and can help out. I still am unable to reproduce
> it myself.
>
> Jason


Fair enough.

If rumors are to be believed [1] TestFlight for macOS is on the horizon

Meanwhile the macOS method seems to be this one[2] (said for the benefit of=
 the list, I'm sure Jason knows this already !)

[1] https://appleinsider.com/articles/20/11/03/testflight-could-come-to-mac=
os-at-the-apple-silicon-event
[2] https://help.apple.com/xcode/mac/current/#/dev295cc0fae


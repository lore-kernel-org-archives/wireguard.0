Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13EFC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 11:10:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0F722D72
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 11:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0F722D72
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 443a8cc9;
	Sat, 19 Dec 2020 11:01:42 +0000 (UTC)
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch
 [185.70.40.137])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f99ce030
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 11:01:39 +0000 (UTC)
Date: Sat, 19 Dec 2020 11:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1608376223;
 bh=1vD+ccSivTPx5NzzPiY9pHfHQulIMkdLuZPouNaRfhc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=uOss9DnJLwQtQmBC2IP/A/DihNby65X4w/8doKDffGoqPfqjVlyqqBwiB3XTrGnrw
 TFUgCxBVAmiSO9crCBkSHex850/UzqzJyThA1Wjwsi0FDB+Pd30CpMuY4svUEFn4ad
 f+jE0zkBtXYHXiLd90PGyo355TtOvb/s5BhGDljk=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: Janne Johansson <icepic.dz@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: MacOS and wg 1.0.11 issues (for me)
Message-ID: <ruafXiXluY0DZUNuLCh3Pzrxpk8CIkHqfrDjsnZ1IOfobylVKP0wc8w_lfT4JlpTbIC1nZ3mjeGb4t2fYfOBEqARrKvZ1_cHIlXBatZKZlU=@protonmail.ch>
In-Reply-To: <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
References: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
 <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
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

Jason,

Out of curiosity, is NetworkExtension not available if you push a test app =
via TestFlight ?

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, 18 December 2020 16:19, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:

> Tentative patch is here:
> https://git.zx2c4.com/wireguard-go/commit/?id=3D54b5f7d7173d56508daa768e9=
6a9f7d85de951dc
>
> I'm unable to repro this problem on any of my systems, however, in
> order to test that patch. And Apple's signing restrictions make it
> impossible for me to send a test build to Janne, because
> NetworkExtension is mac-app-store-only. So if anyone else experiences
> what he's described AND has an apple developer account, please get in
> touch.



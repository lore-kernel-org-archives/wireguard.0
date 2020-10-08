Return-Path: <SRS0=xjNI=DP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B877C4363A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Oct 2020 14:05:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E30217BA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Oct 2020 14:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="eb3I3v4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E30217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca708247;
	Thu, 8 Oct 2020 13:32:22 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 904138c6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Oct 2020 13:32:19 +0000 (UTC)
Date: Thu, 08 Oct 2020 14:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1602165902;
 bh=K8d+hQqvFoJgdyEj7R+m9oRIG7+2SKVi/vFP7bKcOL0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=eb3I3v4/C/TipGJhVdpsc/0cs6qLy2B7Oa/lHMJ7qX3LMTJAz29H8RJWgjd83eAzy
 yqxBqETgUMdN/ApU8mGVpjqe7z88qOaSCmA7uyGMenZBCs5d4ViXfep0WTZ58ZwKgw
 ko6Y5w8aETEXmWWQBA5PsFrSL+wKJscmFuoLnG/A=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
Message-ID: <5DdCbxbxbLZBsJ4N5L4HkYoefn_KpBSk-UWlIM52Rd7uOlbYwKjkzudKbnInh2aSFOUG0xmFFhGvYLvzm_Xtmpfo22Vpmwr0buAnaMOHDBQ=@protonmail.ch>
In-Reply-To: <CAHmME9qZcWfVGaJ210e3XLW60NhZY403CEve7YK+E7nfcJEyXQ@mail.gmail.com>
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
 <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
 <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
 <CAHmME9qZcWfVGaJ210e3XLW60NhZY403CEve7YK+E7nfcJEyXQ@mail.gmail.com>
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


> You're free to do that, and I'd generally prefer that instead of
> having this mailing list turning into a place for you to vent your
> frustration. These bugs are non-trivial. If you want to put some
> development hours on it, we'd love to have your contributions.
> Otherwise you'll have to wait for one of us. That's just how it goes,
> and venting probably won't make it happen faster.


Jason,

Let me put it more simply.

I understand the whole development lifecycle thing, I really do.

My point is all that was needed was an ack.

I first posted about this issue to list on Sun Aug 23 20:34:17 CEST 2020.

After that post, the only thing I have seen is posts from other people sayi=
ng "yes, I've seen that too on my system".  That's great from my perspectiv=
e, in terms of showing I'm not the only one, but not so great in terms of f=
ix.

A one-line ack from you (or someone else) saying "yup, seen this, currently=
 busy on $android_or_whatever" would have been more than sufficient.

Instead, all I saw was radio silence which can be openly interpreted ....

Laura.

Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FABC31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 19:03:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0628720B1F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 19:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UcO5nZTh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0628720B1F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a73fd17f;
	Tue, 18 Jun 2019 19:03:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf59b2ba
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 19:03:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe4984be
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 19:03:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4a9e42f
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=mCyZdhjfTks5LqDLR+blh7t8L5o=; b=UcO5nZ
 ThaxMaAaMZi1G4rnQgZ8734hhpWkT/Iq1Ue7LDvGqQMcGmwq1gBHXe/KmgDqxePP
 x18zwK9k1yQueOpdl+Jj4C44g10mfWnUHrT1mO8mDGJe8B4MPbbNZkA2IkWlFExz
 zpXKz3LZkVSZWgbAfucJeaU9kfnqqE6p0qzKstucvcUtYjmGNNrkGI/o0cySahR/
 ywzmbhh8+1wwN120vl/ZFoJ4s0iilFMwpjG3NUO1lK7GnTvlmiDisXhZKSD/OteC
 vgkRi4p9rvJd+PSHgBj1XDlGAecZ9VgEzJtj5Pru/2e2y7oHOHjZd3EF/XmbyM8F
 ycNfY3YZOgLDgLng==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 35aaa1d6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 18:30:32 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 107so16551224otj.8
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2019 12:03:34 -0700 (PDT)
X-Gm-Message-State: APjAAAVA92HOZEazU4YnX8KectlItPOlQnzndS8qQ/IFp6J0+PsyCX1s
 PbpcPT1WPajSboKn1mXRo+STXKD8hEMAtCmKmg4=
X-Google-Smtp-Source: APXvYqxDGoHj9kG6LJRhxJ+QZrUGHEb13YtDMUj9x+lloWK1moAdDDrl3iOUFKEheMs/NZQ+rpx6aRd1kELwCVyb/9Y=
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr10232554otn.243.1560884613795; 
 Tue, 18 Jun 2019 12:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <CABwq4PiyPwjPL+RPVcWZYy66j4gaVRc3OHEA6Aqm_SbL=9VFAQ@mail.gmail.com>
 <CAHmME9rkgyG8kVsikznv_fvdXn5N-FZaQZ3hhthos4=dzSMqSA@mail.gmail.com>
In-Reply-To: <CAHmME9rkgyG8kVsikznv_fvdXn5N-FZaQZ3hhthos4=dzSMqSA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Jun 2019 21:03:22 +0200
X-Gmail-Original-Message-ID: <CAHmME9qEFp4kaRx03MrpMfAbC+7qzW8-kHruG-15_wbDe1u5XQ@mail.gmail.com>
Message-ID: <CAHmME9qEFp4kaRx03MrpMfAbC+7qzW8-kHruG-15_wbDe1u5XQ@mail.gmail.com>
Subject: Re: commit 99895f27f3d63d2e92a5c1c411205ae70f2a5ca breaks build on
 arm64
To: Andriy Perev Ortkin <irherder@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Let me know if the latest master branch works for you.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

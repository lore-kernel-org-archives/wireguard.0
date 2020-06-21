Return-Path: <SRS0=kilO=AD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D756C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:17:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22FF92068F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=frign.de header.i=@frign.de header.b="EL03oYdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22FF92068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frign.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc5170ca;
	Mon, 22 Jun 2020 07:58:29 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 55233381
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592777118;
 s=strato-dkim-0002; d=frign.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=09G5KXUqsmkhw2iP8cinQsdh0fw0xMc1MJiTnskkfpc=;
 b=EL03oYdR4bMQts3lhbnLJ+EU7WIyCjTkvnr8SNyaEJBfesk+B/2iN6w0eTc9tmXbEV
 YaHcQZi//ILSuHdiOGHpHm3dM+BfuV7q1pP5myxu0RLmQz8NjJBsJOYGjVFdjByCDp98
 2zKF3OSEJIZlsZ+y/dS9+CD/zzDwX7fsK+NvL4SS/sSp1mvKQrhE3xiL0/9hLs88FY2t
 9wi6G50F/5IKlV6UYG9AfK1eNpFAp26TYsHt9SF3RaURJKi/qcSFBOH5E1BcJCxmv5Yl
 8L6yiL4aoIhE5Om58bs5Y5NtY3NAtMyq9gUS1d52UEqbJZWyheAHEvdI6BxzCE36yXhG
 URmQ==
X-RZG-AUTH: ":KGkSVUa6cvg6QHOypuT/F+/ElAlFppyfIncvHffsptN49ixn09bzt6FCBhBjl7Pt"
X-RZG-CLASS-ID: mo00
Received: from localhost by smtp.strato.de (RZmta 46.10.4 AUTH)
 with ESMTPSA id d010d2w5LM5HQm9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2020 00:05:17 +0200 (CEST)
Date: Mon, 22 Jun 2020 00:05:16 +0200
From: Laslo Hunhold <dev@frign.de>
To: wireguard@lists.zx2c4.com
Subject: Re: [ANNOUNCE] WireGuard Merged Into OpenBSD
Message-ID: <20200622000516.61f0b74f@frign.de>
In-Reply-To: <CAHmME9pAwNty0q_+WD8RebgfdMdaFbh-OsKXaAb7wdhKBR+6Sg@mail.gmail.com>
References: <CAHmME9pAwNty0q_+WD8RebgfdMdaFbh-OsKXaAb7wdhKBR+6Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:58:24 +0200
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

On Sun, 21 Jun 2020 13:18:41 -0600
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

Dear Jason,

> I'm happy to announce that WireGuard has been merged into the OpenBSD
> kernel, with integration into userland as well.
> 
> https://marc.info/?l=openbsd-cvs&m=159274150512676&w=2
> 
> Matt Dunwoodie and I have been working on this for quite some time
> now, with at some point Matt even showing up at my door in Paris to
> push the effort further. This marks the culmination of quite a bit of
> effort, and certainly a multi-year project for Matt. I should also
> note that the upstreaming process to OpenBSD was extremely pleasant.
> We did three patch revisions, with useful feedback on each one and a
> very supportive community.
> 
> I imagine that this work will ship with OpenBSD 6.8.

very impressive work by Matt and you! I'm very glad to see this was
merged and can only imagine a bright future for WireGuard.

With best regards

Laslo Hunhold

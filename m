Return-Path: <SRS0=8OhL=F4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F076C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Dec 2020 23:19:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A0D225AA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Dec 2020 23:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A0D225AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e1e9cbd;
	Thu, 24 Dec 2020 23:09:39 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8611cd70
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Dec 2020 15:51:19 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id E36B622724
 for <wireguard@lists.zx2c4.com>; Thu, 24 Dec 2020 17:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1608825643; bh=EijtTkgGmAIzIf01s0fSaw+JNR4n/x7bcfqvg+/nNuk=;
 h=From:To:Subject:Date:From;
 b=oUJHKnIdK3cy17dTS8l0Eg+RWpj0iaXv8xEXT705ZqvIdh9Dz+w0w9ySdSzj9+3Vt
 dQuohi2FuONdqW32TfiUbtngxnjdsko2/4XzB6QNYggZG75yza6mUrALtmnDgecord
 v2TDv863icl0QEK7aPszaRYPlmercefcKrxavAjrejKszObey2Ghj1KyxTHCp6pdLF
 oalz8npt5G6UfkYPzeUrpD8V/9YIKUXIIrWWztexP4beoi8c5vsa3ntSxUgEw6QG6y
 9/awRWMyqFVlamui24e4mAzLWGOOS79DwqrgdN7HupH+CQMGAallHELX+Hz28s4lRg
 nDd233cJvw5Qw==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id 668371A6EA51; Thu, 24 Dec 2020 17:00:53 +0100 (CET)
User-agent: mu4e 1.4.13; emacs 27.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: How to verify a wireguard public key?
Date: Thu, 24 Dec 2020 17:00:53 +0100
Message-ID: <87k0t75h3e.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:09:37 +0100
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


Good morning,

I am currently extending uncloud [0] to support wireguard tunnels and
keys. At the moment it is not entirely clear how to verify that a
certain string is a valid wireguard key.

I first tried checking that it is valid base64, but not all base64
strings are valid wireguard keys.

Then I tried using `echo $key | wg pubkey && echo ok` - which seems to
check the key format, however the intended behaviour here is misused.

Does anyone have a pointer on how to reliably identify wireguard public
keys?

Is the wireguard key always 32 bytes when decoded from base64? Tests
with a number of public keys seems to indicate that.

Best regards,

Nico


[0] https://code.ungleich.ch/uncloud/uncloud

--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch

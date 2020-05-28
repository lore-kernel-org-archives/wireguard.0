Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2932C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:45:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92755208B3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=garrit.xyz header.i=@garrit.xyz header.b="DFygO6mO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92755208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garrit.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63a9c297;
	Wed, 17 Jun 2020 07:26:38 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0b9f407
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 May 2020 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590691516;
 s=strato-dkim-0002; d=garrit.xyz;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=tm3EzS+kRHwCzgWoP9/QbNGwq/Fvhm3ZX9CNciXymfA=;
 b=DFygO6mOxHfqVg+KiRNPQNmXwK3lNJKAynLQYzhRCZ/ANFzwJlpISGaoEhQeUVGxN2
 zHKAb0S0Cu6ab1EsrxiZwsyYLn71RNx9TBhBIDjrqa3wXHKo+ZjL1wOfihEij1RYGSig
 A5nFOW+x9GY6242v8zE8Pj/oeeclpB4eLqmzyZ8ZkKoZNX1HTYWuQ8XAtW2wAF/HfKLo
 0QoeKH9wx+VXTeICdAQVHgbj9k0suD3rXxVNbKLDrDcmvmkQdY7GrdYbFIooFDJoh/MC
 zUe/X+z5rYDlk+uScn41lfyV3g/u6wAqMayTKUyZBx+OlpUcVcw+Lzrkrdo7wqPG2k7G
 868g==
X-RZG-AUTH: ":L2MKYUGrb9+g6Yo/9DacaXP5UKUF1pzQZq8rlTFv9/FqKkfMj7DG0ltwUYiU2bdoyq/9lSg="
X-RZG-CLASS-ID: mo00
Received: from CKC-BS-N0240.fritz.box by smtp.strato.de (RZmta 46.9.0 AUTH)
 with ESMTPSA id k0b835w4SIjF4YF
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 28 May 2020 20:45:15 +0200 (CEST)
From: Garrit Franke <contact@garrit.xyz>
To: wireguard@lists.zx2c4.com
Cc: Garrit Franke <contact@garrit.xyz>
Subject: [PATCH] wg-quick: add restart command
Date: Thu, 28 May 2020 20:45:04 +0200
Message-Id: <20200528184510.51675-1-contact@garrit.xyz>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:34 +0200
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

This feature seems quite trivial, so I was wondering if there is any
reason not to have this command implemented.

I didn’t bother implementing it for android, since there is probably next to 
no chance of anyone using it on that platform.

I’d be happy to take your feedback!

Thanks,
Garrit Franke

Garrit Franke (6):
  wg-quick: linux: add restart command
  wg-quick: add restart man page
  wg-quick: freebsd: add restart command
  wg-quick: linux: add notice to restart command
  wg-quick: openbsd: add restart command
  wg-quick: darwin: add restart command

 src/man/wg-quick.8        |  8 +++++---
 src/wg-quick/darwin.bash  | 14 +++++++++++++-
 src/wg-quick/freebsd.bash | 12 +++++++++++-
 src/wg-quick/linux.bash   | 12 +++++++++++-
 src/wg-quick/openbsd.bash | 14 +++++++++++++-
 5 files changed, 53 insertions(+), 7 deletions(-)

-- 
2.24.3 (Apple Git-128)


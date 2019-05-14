Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA04FC04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 09:13:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6544520675
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 09:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="B0QUJ2FY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6544520675
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3536125d;
	Tue, 14 May 2019 09:13:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b829fa0
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 09:13:32 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa599118
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=G2p6lslin8o+O5Ivov/FsxAuTE0rfJHXJ22+6PEMnPQ=; b=B0QUJ2FYdDkHCLrpdS6nFopGBe
 eIbTSX+hDQlm5z03a9bvgUnz4oYtEyCRm8r39HAWkZl7y93z8WLL3trgICSRwbU31U2vdIHFEEUKG
 1nF2otRzy/1LaP5r3UjEB/MJjeXX7IRyULLWgvQSQJHL/kzrHwOpGX2vY1d1K4j2jjDk0nLzBnOZw
 Wl3cN/zo6L1yABRdQumTayMh5XZqg7z0KtWde0gWfJ+Cb2oTPZAMS5zCY87bQYnLTmlw02GKlwd0J
 dKhuMN9kG2EhKeZJubrjfH+HKx2HMfeEHfoNtE071IY1KE9gVPgYkfdZaFULQza7sNHJbUmtNKM/L
 DcrUM/IItlLcLpYmP5IxxLKw7C6vL+Gj7p3JoF07mfsrtd+JdeV2jmRGdFSixSbes2mFqAk+5grHY
 RBbpaL9lRfzWb2RiDqHgrvgSMBWKJ4zew2fF0l4+PJ4Kny+innYr+P7R8a3wn/RzB6D+p3kS08xXT
 Nm3bxzrssyuPAVUYOE3rbCwsxfWTOEr4fksCKASmGvFV6O+4UxJMEe7vneJrpDi1UfjwnV88Pxt+w
 ZQpXOuUROV6MILGCmM+1eyXMkDNT+PII57dIHHnqJzbGOHipzQ84jTn9PqWuY9oFhCCx4L0fQ5jZ2
 wp9OmQJkk8E0NiuonPnZ/HAA7/YOhscbHVkqqtaP8=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1hQTUz-0007mA-Q2
 with ESMTPSA (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 for wireguard@lists.zx2c4.com; Tue, 14 May 2019 11:13:27 +0200
Subject: Re: wg-quick: Add ORCHIDv2 address for in-band management
To: wireguard@lists.zx2c4.com
References: <58b72a97-4de6-0f2e-8323-6dcb86bc51e1@bartschnet.de>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <38d9e60e-baae-b06f-b4ec-d333eb3ff9d2@bartschnet.de>
Date: Tue, 14 May 2019 11:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <58b72a97-4de6-0f2e-8323-6dcb86bc51e1@bartschnet.de>
Content-Language: de-DE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Orchidv2 IETF RFC 7343: https://tools.ietf.org/pdf/rfc7343
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280B4C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:38:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A43D206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="owUGOMQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A43D206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9b00fb9;
	Thu, 26 Dec 2019 15:36:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d647077f
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Dec 2019 14:55:14 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22f4e554
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Dec 2019 14:55:14 +0000 (UTC)
Date: Tue, 24 Dec 2019 14:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1577199312;
 bh=cqgaj3WDSwKLXKd8rBrFMaFnqIJq3LUE1UgRnJG/Xx4=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=owUGOMQCtwpYBrf3Fqos8JNGIdvuPdUAlj+ynNoFqzPgwfWVIzcL3GluLezqgUuIw
 AGrBGxfbtAaJQ8hHLMCI0kJb5DS93YgV2boblDS2kkxebpd2YUIU64LpehcuvhjiPU
 SSj98iwlyxdB/cqFtTOdsI3e7FduJDEjETMiNcTs=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: xalloc <xalloc@protonmail.com>
Subject: Italian translation
Message-ID: <OybvEh1ML1xBQ2O-gTbMKaQ_yjh8A_1JKHi_zwLUfH8n8_YHJDWuMeTxejZ_ukwUJtgbWFyl4_duAFUnuD3zKEGpNldktBD8eNo_ZR5089E=@protonmail.com>
Feedback-ID: NC7N2So5GghaCKUfD9eFnVFM_Ey2tTYOI0-fQ_AStD0xsLzrEPN0pI-6ujh0EfScQTyQdQP5ByXZ5cdMl4tIUA==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Dec 2019 16:36:40 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: xalloc <xalloc@protonmail.com>
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

Hello, I translated the android app into italian. Can you include the file in attachment into /app/src/main/res/values-it/ please?

Thanks, best regards

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

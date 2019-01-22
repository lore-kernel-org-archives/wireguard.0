Return-Path: <SRS0=LuSS=P6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89EAC282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 14:21:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452EB20870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 14:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="F4lSDQF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 452EB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ebd06d3;
	Tue, 22 Jan 2019 14:16:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98390951
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 14:16:29 +0000 (UTC)
Received: from sonic314-13.consmr.mail.bf2.yahoo.com
 (sonic314-13.consmr.mail.bf2.yahoo.com [74.6.132.123])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e882c855
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1548166886; bh=/axUs1Ux7uuxlIDkKzIxtkb1cpWqvRasOUhKrynRjas=;
 h=In-Reply-To:References:From:Subject:To:Date:From:Subject;
 b=F4lSDQF0OhOs73Vhjo20ogybU37mlyjyIDgPUB26tgvKEwfmnXnAhKa4MtOIu73QwocDXclbgd0Zwe+5h+LnSM8oG32caT7Q2unYWF7og+xWp6Mk85cjdg/7jP0Mt7zH7ICBrTIe4tS11PyrceYYoE1NlHcnQsTP6Q0Gp4nqz306JcLdHyA2mVaQuPKWjjWbBQPnq1AucCF2nWuL8zocCgmWtAeVf1/YKYAb0yizzEFvbCgbwaaoFoErocvef6O+mteiSRYiG0UA0v7DPoNO1yV4WRrYqvbFFbvjYlmTY3qv4YQ+CuvJfUUJav4szEXcn6dpRUUFyVQLGrQiopRH3g==
X-YMail-OSG: xc5QKsAVM1nHXcuUsnK_gPEo8s4mK8bHCGSajuYJg9c5jz5jmt5ExIp.SBD5MUq
 XBf5CVKOI9y_bbu.bi_6Qo6viJBRTq4GqeB5M19C9OgOd0nwRdUz4H9WpgSZznQKXBCgzt22VJ9i
 9FlMS_AbPsaHtCtC7VOes_cByffKQBHrrGPxM_K5.q8U15Cy40OMat4UaTwP3XaGl9aLcqUqr3lW
 bnwzXMQd2XKdHFY3Ju6kq5Mayg1zKmpjn0P6j.cVDfel3ZbkmQqfNs7tu7K_pD96qFxv8QqCje5u
 xH2Wb85GNjE.KmdYWpUtYlobvtz9ujDba7sBgo.FxguASFXwCKNbWirdxsoF1Lehpy14eGFQJRSH
 Ur8ztzmUh0iz5qFfgJXCEyLpKg4z9ZM4TknMegZy56Dzb20J0qeiPCrL_QKm_mTyKoonL_wdosJz
 9Tqh1FWneHjEWhH.bzS0dfMDINl0adOHBQrCZ_SS6BGQE0_eTEyDME.Md65DZbeDw69WmXbIwoXr
 PwmNQNCIQTp8zf35QSVKf5s4.Apzoe5o5qzRq9oYiPWaRLWfUq_dh8qhhYRBt2Bd9Mr.MlsHS9gQ
 DHyDSotMXDUicqETSKEvwdVODfxYv.OGhpaBWuzFUuNt9jpuC5Ti4FG8uiTTYHW.0.fvUi9AOu0m
 YhI9w.ComsKZ.60MzBL7g6W0lxPKKMQxST4TlDYWOFnNCjnhxAq85M9d5rr35R84Og9NpbETbTBS
 sC3T9vMinb34ZyhtVmkYvR2iumL_2jrai3bVtlZxfAp2t7Wo6LkzN1GO9Stu_gQQmoqEKU71X79T
 dBu5ZLFbuWFJHkYXKDI8qO4k8sexatUFFuBkLbFTHr40vnyGdTZS1GHBBnwyF_TdmUMuJDEe8p3E
 1mfe_pmXmOEmr1N8ifj0iHab0jJMZse0MaflL.GJFVcaOCqauCeweE45jbImakF5coMSljuDl7dR
 JLrkX6nb7GpsnD3tnHAmJ1hBImJxQJIpDa1ciicmsHDmGlvsKOzwzp4HlvJgb8JhZfNMmzbnIFWk
 HYks3oWG6szt20zahBB.ESIZeLBwR
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 22 Jan 2019 14:21:26 +0000
Received: from pink.alxu.ca (EHLO localhost) ([198.98.62.56])
 by smtp430.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 c72d72cd84dd53ec8115a306ccf01f36 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 14:21:21 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190121233840.6401-1-alex_y_xu@yahoo.ca>
References: <20190121233840.6401-1-alex_y_xu@yahoo.ca>
From: Alex Xu <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH] %i is not a valid format specifier
To: wireguard@lists.zx2c4.com
Message-ID: <154816687981.625.806237344794238135@pink.alxu.ca>
User-Agent: alot/0.8
Date: Tue, 22 Jan 2019 14:21:19 +0000
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

for the record, missed this: "in Java"
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

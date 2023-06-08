Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E77C7EE29
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jun 2023 12:14:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 039e7931;
	Thu, 8 Jun 2023 12:11:37 +0000 (UTC)
Received: from sonic310-57.consmr.mail.ir2.yahoo.com
 (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56275f7b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Jun 2023 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1686226294; bh=md4uCmiSXHp1MLUWVvJYLAj26jY3kdSu/BPwo8XGBIQ=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=h67fLWXXG9SV9yicuFSFKpGP8++IHoEazF3OuBoLNJnuCv5f39qedxmj86JxqokLNv7zGvkPFCokhR3zkdhkN2sX7BKm5sKUVHkVC2CRwXtQVStHzJa5LlCr0eYgk/3lHzW/dNewM896AXWnh2AyIjopwZI2lT4oJbXqL/P3UPJ6qcmoc4UsdH/G/4RejyL54eJKtjFtg074a0yGuqd/kCiGBJXkmk63JESf/xHgCLx4X3hP5gL/sp2Q5oemyUDG7IZFlWGA18y+7FYiTbuTMvAIKFrWmO0CaGdrImJrtUOYdzxWZKFmKv8uU0JZcm8qJxPRLhOay2iiew5BaV+y+Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1686226294; bh=BWBwgOkRVXZEK3kRsbFTJ5tVlw6mrdDpltAmbb+rKfZ=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=d2rixFNaOBOQyn9HnxZuo3TW+LGrNvVJti3TvWmb/6LLgSpoTXhM5NPAQVrD36VhUSibkTKwiibbGhGq7ox9e/UakFsu6ag1x24qPRsAeJ7vtp8oRtUc2lpbrlX2k7bbn5pVp95lEdEFDZUv0u6mRVl7l2kiSK4JHscyNs3ZwWdX+pJ/e3s1kATrQYPjEsa1sBY77NK3RKj+BCSJbA1w0vQ5SVmPdXLLrn8ewFAYpXpRzHVT7YBT94uRgkEQAj6er7oCoUHQ6Jj/LyEyL8yBBy2y/aPVD/oSWBRCwPfYp/nfcm8YKAFeyfniApTE4ycDqcYBbdps9ZPplW2ztGvKMQ==
X-YMail-OSG: NOt0bdYVM1n8FaAFljnAeCfScQVQ3tfYNorvYcjydmNRYTQaKBY7.6HulGEDkSR
 8OoKIucQqJoQKW1KHXd4Ntrqv63gqROPt36_dl3IPXdRYiTwrVZKlQtZBUXGZjioecQyxzB0n3e9
 sZibM30sCcRE4AlAYYYFgFodKv6L71x0dbxGYjdYgwkb0OT5TCWRTpNg7wzpXkaRoDyqbZw9UD8t
 d6GLJ8.5_zFQXrOf0fZTYtyOvy18uhIoIaJqkXprNiWGvykWbVvs1Yhq1YuiQMEznC.TMheYUFDY
 HB_2cxT0zc.H_4otCs71Ue1AxEpPVaWA1GQT7a.5DFClm9P6pLy0waOxt17HcZCZS_iYoo9mON4J
 6imSOisNc97ep4I92nhXQnclxqrKjwXnFXEjhvu.0OqNzoFfMMnQV_jPXaTKueOrK3Zu2EmT4z5h
 uFeD5nWtumxQZ4uXMkpmX2wg2VYUD9BzurNgD3fE0idnI_t8d1vP2C9.YTPRFxyfzeD2b9o8HzxR
 2i8gpSemJaT7bVkst5fXrLXISZSlYxJhK4RCo2VU23MickjcMcYt_A6hY7LVy8uLiYknNG0khApK
 AwshY.H0h50CcTA2exHugDRR0koH2boJ3DKYxOMoFX4t9Xj.JXxNfGqCRTzrVQwzUY0n0qvGYblb
 4DvtbI.jNBfPi.acdn784LCU7o2SXYJL.t8w8ENjGGZgwpMiN8WFnMp0DOmZ7msk1JeEyzXww3Rz
 IqV2AjHceToAER6JjEeyoAzckorUf61fLEQQty7bP46iNkD6HCST0miRu4yQ81FdOe7K5KyrxWX4
 VE2uRGvTRjjkayWR.QXYM9Gh7OS.K39v36xhuqPMh8e3Nnf7DNlGvBO38uv3UqDDNEJqBGmisyE0
 DK.s6y47WE9nqfAyQJWRIdYiCyZzAPT1WXoBntlulpSCDN3OU9qk4dHQKneSixLgPFETfyDAJ00t
 vcX.AJ92ekzFEA_QmINIUvlPhPniOmZ9g3604CRDJxA4LjgZNVXCaAgK5.p6KKbUA_.LKqjEjP53
 qVyX5CHt.ZFLdmUgNMEJVgk75gH9bMVUINGg1U_08B0POLui426hSfEWrV0fbtGM1Jj3GpBIm49b
 3NL6wA39jWVD0Kt6Jr5v2Wi1k.a93xXXp.s6dn5pqWrR0tXC1WHCLcvsm3BY09Cmf_cKHZf.sWsf
 Me4nhzn.9QWzyhlG22kW4tNpweHrQcDx9ll9nOdbn2YP60Z5798.qpzKE8YhPxdaNWZZMFTPRVjw
 Ne875zl_hE4ozeQ8S9UqipEyHFqINiqzY8wHHMxdksCLAu6Pcoenn3LxWMCLHIfcjCV5KDwT95H6
 Xv_PyQloOIm73PtwG1yjKUZ9gWCBfk2LbmIO_lrsQCN6Jjff5iQyKP3S0QPDGKnWQ5wWEG7b8yLm
 LfL71D7.3VDwYU9EPJM4fXU2kF_rA51gQT1eyGESrsyAbPsqGJDzXldF7Tx3FVxlWJEXC8tzsOU_
 _ahtnBoeb8AViqpxHUFb1ruU7qa7fCuWoWM2qYQS0pqJRX.j8OPgoEqqWey6lAeoei4SZ3zBCfih
 .1c4PiVisqiTCH5CqF5VBHY8Gjvna4_OC.pWsjuSTj3FpiXb9VyVRJP2ybhRnkwg7cGf0M7m0z_2
 eg3g3tyW5mG.0eEHsTSSnchTZzckG5DE7fI7GZ7eW6Qf49o3LY5NXmS9Pxgp_deBmfKhZKqT_rJX
 crLVFxpRDy6ht0KEjHLlHwADM75TEbWYBsXFscK93ZBIuhqRXcB5upmftW.SWgIetlyIXlyprrpX
 rC3ADNLtQe28vtIN7gtw0O2ekBlYZnjU4CUF.v3QCBBfzMaPBhs9jw8OObSH7dNWGf6TTepg37HX
 GhEwTlI6UiUvfFD__RV7Yb5nXLPDf0Oo9td7yVKUcJlLkYLyF5GpGogQx.mfWCN4nEbQvtztAn.E
 aBO2b3UWELjiVd9BQZg_cdJiqq4nFPAcc5XdFAkXIBgfEUQ93hK33O95EdV5WxexZ1diJQlmWd8O
 CFmeiADOVMP63K4r3k0tLG6juBC00F0Kw26buuHEsxq2ebTmIG5wTFtxfH7l0QufYDsyGQt7xOeX
 bcC09foQ.CjzJ54oe6ERPcWaQPVtv911LrTuDao_LODe5h.GgxHHEj__rNUiKF79OqLZKub6bMHV
 tU1mPaSggAAaUL2IX24DIjQD3cjYTfZvIBYWgHwdn83yylmKODpon0sGuEatA5vWEZjECi40_uX9
 284buZav54Q0Ve_uwIQnHUKQETtwjLIqlk7M6wdX17UUJrlJ6ABYIY6gN93Cfoy8bXI9JrjRbCJz
 TAD6txkE-
X-Sonic-MF: <peljasz@yahoo.co.uk>
X-Sonic-ID: 17a7f52f-d7c3-4191-a6c7-608179a03d9b
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ir2.yahoo.com with HTTP; Thu, 8 Jun 2023 12:11:34 +0000
Received: by hermes--production-ir2-7867f454fc-8nkq6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 95baae32c6a207856f1328297d786e86; 
 Thu, 08 Jun 2023 12:11:32 +0000 (UTC)
Message-ID: <1f6ed0fe-3eea-38af-0610-b6f2b0f1cbb2@yahoo.co.uk>
Date: Thu, 8 Jun 2023 14:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: lejeczek <peljasz@yahoo.co.uk>
Subject: TEXT test - ignore
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <1f6ed0fe-3eea-38af-0610-b6f2b0f1cbb2.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.21516
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

ignore

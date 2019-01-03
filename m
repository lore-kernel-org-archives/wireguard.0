Return-Path: <SRS0=V5/A=PL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67EDC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jan 2019 16:17:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257E0208E3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jan 2019 16:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="LoqCySNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257E0208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3255dfef;
	Thu, 3 Jan 2019 16:15:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b5a8300
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 16:15:07 +0000 (UTC)
Received: from sonic306-47.consmr.mail.gq1.yahoo.com
 (sonic306-47.consmr.mail.gq1.yahoo.com [98.137.68.110])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4a34825
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1546532257; bh=FbGX7uW0FIIBEVCZaX+Q+L1iSYT3L8IuU/Ha03rNi30=;
 h=Date:From:To:Subject:References:From:Subject;
 b=LoqCySNaw6YJcNDOAMhZrQhbC39enTpbotqYNxP+ICByRG2nH50QAVqaDyGi5uQU1+T4nJw8zgtyzk+MMaFz18se8YnDJ9/CLEkvv9wPfKmOv2kaRlf5AkmAYibaasfU5IqcqUs9PUTSwrSu2unUiieCV7iwCDltc5nvfN7uq6LGl/m5GDZlMDarUDTelE0qjxZkMIi5WI0Yp740PAkbzOrzfqI4NTVlwQvrDB7MBUktDaQIE3c+3OiIlUv7pGAcfNBEnPePHxmY7hQDYBBRPHnlsWjGILcHYzibvtvEG5c1NSty92Y9Y8o8CgmoHyvFGmQVXbRLbzpXexfi/AnLVw==
X-YMail-OSG: 3uecURgVM1m0HueQotUuPPnW0uiW.t6xp.FJOXhg8Xpn7jdItixQjc3wJgOwft9
 m0p7QYeWB7WgSt0xcsMnzOGuHrQJMb3RulNFqmKksssVuqvfrKRqzS.0ja8X6D5eMQRmrR_6qvhG
 ebQ9D5bdIYgU51wxhI_WDfqPXjIqYhKq1Tgrv9e7yf15cCVE9VulQtDTC7mRryvost5qVllMxPPp
 lRtCsxELe69SjioBOPB4eWG.fUmWIvZXl4yyMfSWRzAU2e2uVa82smmEeJihMshOy7RlWNcdHMRT
 lDbiPT5KahHvIIkDdudlsjrnGgxDxHwHgydSsBqV1VhW.VQ_bWb4c5gFWw36InevFqB1INMmXlFD
 RMsmYm8glMPlrzxmxeTnWoy44fL1tju74MF5qA98k3MidYspZFUJEwz1UgHsWYfsD0FIOMJTv7xG
 kXKr.NbuNHTS4ewNM3RyOP2C.rUHae6A9R6lG3bDhmHw7Q6BYaFjymHcrYEN9ZFrj1gCRhbO4Vc1
 OKM0aQUmPUvqnNEUyuZlCrOEElo.bhVYZXHwCIm3LCCUw5rTomUOF2mcPGodUVqsmzvQWfU7_OVg
 VxIvXt3SabmDgE3OEhsMpJ1pBt5mPeowpIf4dR2tvigRKWq8xRMPaTC2pQ7MMW8limzSxRnphcXV
 5XygS3kjyUGU7D.MaKHOn3xpYtgXagRZzPigErlyl__nipW3PK5gykBi3e3a6CI_A5hNommpbeco
 MU0sZxkNy.b2OSpvvppittQmzZp6_fIlfZXp7iJ15Lh2L40Q_ZYmhP1xFcEZC9Hqe3q8XyT2TxPl
 vG0xZdEgLYysqjoJe_nK7lISUZApmNy3nINA.BLjjXci8kCBJH2MLj.j.Cg.KtNeqlGymnroYPlN
 M9WaGBGgIrgyrW4541WTcR6fM9uf05P1JiwVdCHihFMhEEPR.1ywtep9zTtKyhEuNrDwfrGdhWHO
 NAQ1wDhqA6fb6Brm5N_LmUkKgqiScUWSHLYJpBMJZv6RfcLscTK.PHEMH_KpHnpqp.R_XIdoxmFJ
 iXhZUMlCN.CW76oNOujRLGCrZEaiv_XmDf0xRiDPI39NbE3tC.7pJGXwK6XLl48sCgerXyrUQxVv
 tGBk9nCfTdHo_Hw9vSePNaIl.9iAX4wR8UN0H94s1A5ubgQHbKGlwNew45tiAnq53msLyxYV5oai
 SaxIXXP3dI28zvXNGU1h3u_0-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Thu, 3 Jan 2019 16:17:37 +0000
Date: Thu, 3 Jan 2019 16:15:32 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: wireguard@lists.zx2c4.com
Message-ID: <1545022781.13682832.1546532132906@mail.yahoo.com>
Subject: ExcludedApplication UI for Wireguard iOS
MIME-Version: 1.0
References: <1545022781.13682832.1546532132906.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.12857 YahooMailIosMobile Raven/44013 CFNetwork/976
 Darwin/18.2.0
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
Content-Type: multipart/mixed; boundary="===============0751016228303577221=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0751016228303577221==
Content-Type: multipart/alternative; 
	boundary="----=_Part_13682831_203693505.1546532132905"
Content-Length: 988

------=_Part_13682831_203693505.1546532132905
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jason,
I checked the iOS Todo list and noticed that there's no mention of an iOS excluded application list ala Android. Would you mind adding it to the list?

Thanks,Jose
------=_Part_13682831_203693505.1546532132905
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"><head><!--[if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><body>
Hi Jason,<div><br></div><div>I checked the iOS Todo list and noticed that there's no mention of an iOS excluded application list ala Android. Would you mind adding it to the list?<br><br>Thanks,<div>Jose</div></div>
</body></html>
------=_Part_13682831_203693505.1546532132905--

--===============0751016228303577221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0751016228303577221==--

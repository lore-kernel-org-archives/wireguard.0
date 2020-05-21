Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F51C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 14:23:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC592072C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 14:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Kj9/n72J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC592072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c8eb5c2;
	Thu, 21 May 2020 14:08:15 +0000 (UTC)
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57612245
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 14:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590070969; bh=7mvKCfujLHnsDi9W3ZzR4Ni338OeO6uyAysQcj+tF/s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=Kj9/n72JreeKSfV6QkFTFYVP1Rv/2QlSG+FLZUqET45wd/Itowz0mdpOsYbFao2VMs/Riy8dDfWI3TWMVXnR1o3ntm4sMQ4URpOinDNYJkUz+zQG6vC286NvJZqsyFs8gqJgJLchIZ30sLjD3KsQc/jjuqfReJY2oV0cCE1FC/9FeOa4w8F5yWTtmhf1oQc1bS2gDsgYLmfO1F4sBENv5X/EF2MXVY63kqEg1betV3rRPKROBDiOx42U5y1JexwfRwCVRz6a4IZ6Yp/HjAEsVX+In/MN5sJ5S2PW8/v0O0pNACSgEzrFC/6I3mwVUyC8fa4lDhVEbcbFatAGKGrlMQ==
X-YMail-OSG: yTeISt8VM1m6a8MVBKTQZU0EsnJlWhdI1jb5BcXyxdyFT90Q5__6er3vTyD22yA
 T7wYSqcrdXqfSCHnd8K44pLXKZHdNwE2RtELARjtWUh1BZnG0m6QTOkvsxUxDvszPUvcR_LsOaqJ
 uYyS3T9CWfDaXVBEw70hpTKnMV961Ft0kmFPkYwfaXl7gV4hOXJo_C416d9WWOhXfbL_dHLWahEx
 lU_ISIvnwBVjepbhdt8NriiPl_6bg0Kq15jOmuIJlIbsmiBvwTAecLX6LvgbVJbijXWWKkHgmGvk
 LJBge523cz7za4Qhx4IbisQiXowgVyseVSNVsGdyaFNaFwupulFZVXoWwUe6ATAMtfsYif3Pvfh4
 YI1VlGjn9vq9iDN2kBlfFNDBTmf7340M_a1bGanMOLcJhpMhnKmrFD5Sye1gM29hjYnRnHx5Jgbn
 cs7rsTVXV.rM6cQV_gsNZFSHj_..O4bjOj05WqSUDPX2EpGQBqlb4A_oq2AGkarMPPnBRcP.sYvk
 yfPJFvFkTrJbvKPugmGdCLSH.RaZIw0oTljJGcWMSNqzwJLSXjpZO8DZBHblsJ4rTh1mobYz5YIg
 jNfA17lH87cGWoJQ2HQsENybs2wKyw_D8NhSE8kLJV00zMb9kdtBkSlDY9b3SF8uyFcCXSQ._hnQ
 rwtlsLKWcVodiSSAPQyzZ7ixwCOGg1gBc2WtFnx8OOIPRzmFPsdkBLK3hzTcYUo0jt_qYbpx5ZHB
 OlfVFBlz7QjzT0uQ5DuPMo.fRmYQFfoY9_hFVhRjH8x6xP_N6mDDdKOG48_LcgQgHPBmcTjU0H26
 bqI55Zw1ZgCTn7dEk9miTxw9ILODcOEGwIrxDeOW5fjIdy4F_0_YnL2e37dr5y5OCt3X9cUwP.AC
 PoKbYg.261fGyqFxPZSO0fKuXI.Dt_K723YJmgJsYRGGZ4ckZz86ShN1xgAVZTQUZoYAXPi.3_ag
 qghdWdWRqV4Xeq7rnHOBlNVL1SMmAhR3jqf9eH8EyLxA57r7g4.Fbtr.fnOPEabwPfe4tGpSZTe0
 fuZiuRwkROn3c_40Ufbej5JUJMaqiJNV6U15mJk_.SBHE9PLcivoZ3rVgH2qjF_ZVgKEiNiDMPdR
 lDQlfc3s5g62gJnRwHg9pW5xG8zxX182pRl5D2fNdL5ObVpOpfeME7QyY7RgMnFloIVnePXPFwxu
 yPzrBDtjQrIib.Z3.DZxvXgbhKlivYoTalMq6n5lzsnFGb5LfFACGd0wUKf9z64FMimxOOD05eQd
 GnGip0KQ8XWpjyO2xFmcgaXlyBD8NTGauXCKR9Lo2nyYgZwlhqimHL3y98MaJq2fzd04WFhEuaSe
 ftiiaFguPz.5UWRUlnImeGbG_7Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Thu, 21 May 2020 14:22:49 +0000
Date: Thu, 21 May 2020 14:22:47 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>, 
 Mehdi Sadeghi <mx@43.yt>
Message-ID: <1797380096.2767339.1590070967097@mail.yahoo.com>
In-Reply-To: <220C4723-011D-4322-8213-820B36A15186@getmailspring.com>
References: <1693606427.2437935.1590008022682@mail.yahoo.com>
 <220C4723-011D-4322-8213-820B36A15186@getmailspring.com>
Subject: Re: Shouldn't devices tethered to a device using Wireguard share
 the same IP?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.15960 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/13.1 Safari/605.1.15
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

Thank you so much Harsh. What's the best way to make my kernel available to you? Even if you could allow me to push to the repo I wouldn't know where to save it.

Thank you for this and your work on the apps.





Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25445C46CD3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:25:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a51d1221;
	Wed, 20 Dec 2023 04:58:59 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ce4d9d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Aug 2023 12:41:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DAFC25C00B9
 for <wireguard@lists.zx2c4.com>; Thu, 24 Aug 2023 08:41:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 24 Aug 2023 08:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furrypaws.ca; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1692880885; x=1692967285; bh=oK
 gfhls3vd+1X5g0XaYblB+eT3EMAFN/i1lUhd7RPSE=; b=Xra4o9F15nFO89C41U
 9XOBAJHAux8+44Bh0srBSwdTDGQMhKHWsQl6V0SnR3SYAUgPAa/+ylSs08V9grST
 UaRd+DarRfvXYAtu3Zq8NF08wFi2m6Yrd8Jwi6yTguXy2vhCJrxIfIZQx8JS4wUw
 EiWtpPPt/eBidK3H5jqyBc0llqiV+fTxTWsroiCPNLo0YmD1hhJOC5W9IwSZyeiv
 2XJMIgXbx6gIdC9yo4PDBbLqixZHX33lPteXmtuxtUUDfT4vkt1BYn4mSaq2gbTO
 u04GQHYvaDHTd4maCu0cbWf2LLAZQyZ3Q1qu9Wtmy/9os494uChXut+lLidxX202
 BB0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1692880885; x=1692967285; bh=oKgfhls3vd+1X
 5g0XaYblB+eT3EMAFN/i1lUhd7RPSE=; b=ghAcM4f4z4mIc4GQOuDlgLbnMGATk
 ORLdJdm4yQjASWnwGIdpC0Sl1GhPw3+NrhCClG4ggyR3XDDEX/GNd0dwA082W/Er
 Bf1v3F7gY8/Vr/ISxv6YvdTk2t4Pw14BKgxQNHSi8VQWiRMtTzv3KBUgkg5rZwEu
 aU3pr1iAFyWOkS5+XL3P9PTi9tZ3KZ8EMJsZrlFAwvcjNaa0LpQ26fVJkvAGSNr0
 uCfbeU2ZEQ5ae7rbG0p+Ua6XdpZGRousDqvcYHfbgA2JB7QhLkBXGRTjz84AurQC
 vUocFKUBeqXrQ5llZNaC5PmvA7spTb0WHvIkAxBK8OgnQZqtdYvde2wIQ==
X-ME-Sender: <xms:9U_nZMd0aryKi-XNRUgJgoUMT_5JOHHwdRWu62V2AjJX8pIhHQMppg>
 <xme:9U_nZOOeqF_1akmq-ZlQ5ji-bTsMX24ZBlALIdtyKPgyDKczf_AtqKxVQq3cx9DFe
 ROeDRRPA5G5m41WCQ>
X-ME-Received: <xmr:9U_nZNjwL4SpgdyuKWWMUQtSlBimrYOfxIZ6lxEqErGpZ1bL2tw260bphdRGv9oGULTaItAgv22yqns3omIgq3x66RsWlBcRSrLkPpU0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddviedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffokfggtgfgsehtqhhmtd
 ertddtnecuhfhrohhmpeetnhgurhgvficuuegvrhhrhicuoegrnhgurhgvfiesfhhurhhr
 hihprgifshdrtggrqeenucggtffrrghtthgvrhhnpeetheejfedvtedtleehvefhudehfe
 eihffgtdeuhfevgefhuedvieefueehueeikeenucffohhmrghinhepohhpnhhsvghnshgv
 rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsehfuhhrrhihphgrfihsrdgtrg
X-ME-Proxy: <xmx:9U_nZB8Iz_br9QlgmncOzYeaGHS6LBVh5u8PFWnVV-uwwxF2vAdawQ>
 <xmx:9U_nZIsTSrKybPddAPEiZ4PqWRfOR1EmiEFr_2EVK76qB6yh1d7_kQ>
 <xmx:9U_nZIHQI4Z7tBKIsFj-A_8IA5yBUWqUgkYT6_Z_zZYn2IIlHCoUPg>
 <xmx:9U_nZEJla7CDfPvOcqbG8NESRew2ks0VG0_ENVkD3jEMIdCoDuVf8A>
Feedback-ID: i7da94273:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <wireguard@lists.zx2c4.com>; Thu, 24 Aug 2023 08:41:24 -0400 (EDT)
From: Andrew Berry <andrew@furrypaws.ca>
To: wireguard@lists.zx2c4.com
Subject: Bug connecting in iOS / macOS client when using the WG UI to connect
Date: Thu, 24 Aug 2023 08:41:24 -0400
X-Mailer: MailMate (1.14r5937)
Message-ID: <2E8408F8-888B-4A21-B035-C0A2257E2491@furrypaws.ca>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Are there any known issues using the toggle in the Wireguard app to conne=
ct, versus the toggle in the Settings app?

I've been having trouble connecting to an OPNSesnse-hosted Wireguard VPN.=
 Symptoms are:

  - No handshakes
  - No data going across the tunnel
  - Except sometimes, there are handshakes, but there is a huge amount of=
 data shown in the counters way beyond what is possible, and no actual tr=
affic works

If I reconnect enough times, eventually it works fine.

I posted about this on the OPNSense forums, and another user mentioned se=
eing this and that starting the VPN via Settings always worked. The same =
workaround seems to fix it for me too:

https://forum.opnsense.org/index.php?topic=3D35555

While at first I thought this was an issue with the FreeBSD port of Wireg=
uard, now I wonder if this is just an Apple client issue or an issue betw=
een the Apple client and the FreeBSD port.

Has anyone else seen the same behaviour? Any suggestions on ways to get u=
seful information for debugging?

Thanks,
--Andrew

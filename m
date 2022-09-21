Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A86C6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:35:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d9416fcb;
	Wed, 28 Sep 2022 10:21:06 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cba35446
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 04:10:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1D2763200981
 for <wireguard@lists.zx2c4.com>; Wed, 21 Sep 2022 00:10:19 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Wed, 21 Sep 2022 00:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elitemail.org;
 h=cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1663733418; x=1663819818; bh=qJLkB3DWIt0kQu7WRDce9ADk4lMM6A0GHTF
 9J0gDk0w=; b=iblFftJK6003U3FV+UPXZ70EiCE+IJG7D1rMMGXP+Tthy7Sy5zN
 ovfgqDhVDMNb/JUWc67m7KukrlvFXgOCDSD+u5wDObHTO0jpUB1y1sLn9cscXKfs
 gsF4UkvZmiFhWh1BKZXLKJAfadEMQd4cGhrBfFRpkA01Dz7L5BF4IYc5SNcQHSF7
 Hn2nI++IFWNq90Jox/2HfHU/Om4Z3gB4/ZUV/J8tmIGp3MStbhCY6AXWhkPxBH6g
 0oouOm0uwxlirZ2GxmRUkgTcdStO/YgVvhVDkPF8w+jhPq/jcaOltBmQB1HrSaEO
 19enQ24EYPdBOAHv9VSt4CCbuhB3cfQtvhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663733418; x=
 1663819818; bh=qJLkB3DWIt0kQu7WRDce9ADk4lMM6A0GHTF9J0gDk0w=; b=Y
 vdbp3Lc+bABvlqyjIqXJwjN/v4bAOT/H0GoMcNcYg8+vs9jmsSe2mwj0lD1clRcE
 N2/Um6bScpw88a3P4dhz9Hnkxv4Q7kOec7QI2h3eNvlhOlp7jPoCWU71qqQ9+S9u
 HB+JH1qgbjlWfQzOfvfElIUSYYabGKNBr2qNwi2Q8M8kGjNdilMh4tDcp2SXQ2yH
 VipM6XnxAemyp5rtShVFmLOVtDen403jBkeH3Nf50DGq1vVUja64bU6uGTaObM6n
 om+MAYon5vod9bLsHlNKgDQbunFQXgcmCiLDzUIwoFynjFabBrxHoIEXjI6LAmEu
 8ZfRIrWl4of+GTPRrrN9Q==
X-ME-Sender: <xms:qY4qYxqI8vC6JtPbXWKN7jZ4gKOvyoKC1po4Q9le7VDr-M12NcZhnA>
 <xme:qY4qYzprecnBUaxNfWif1Uza5IeNB_ftL1KPKtYzoK0o3CqCEnJgPxP9sG3mdtoMc
 77dr74Wz4OV4aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpeifihhrvghguhgrrhgusegsuhhllhgvthhinhdrvghlihhtvghm
 rghilhdrohhrghenucggtffrrghtthgvrhhnpedujeeuhedtheffgedvueeivddvjefgvd
 dtudegfeffveegkeeugeevffelleevfeenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpeifihhrvghguhgrrhgusegsuhhllhgvthhinhdrvghlih
 htvghmrghilhdrohhrgh
X-ME-Proxy: <xmx:qo4qY-Mb4fvYiIR7R0h48tPlZngkO6TbSClBddDat4kS1EA4tAJF6A>
 <xmx:qo4qY849DlLJQllEC2srjzB00m8Tm0JqqvVZHxHA7AXwQXT1WhMLoA>
 <xmx:qo4qYw4pw5VhmfYGeja7Mg99S4mKKRyosdid8qdzCPrWLJvrIMFUIw>
 <xmx:qo4qYyEc3g9tFELeZfrXqIogZr9XJvKQa4vI0MsuVPJhKOrmt37lnA>
Feedback-ID: i0301461f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DE1272D40071; Wed, 21 Sep 2022 00:10:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
Date: Wed, 21 Sep 2022 04:09:56 +0000
From: wireguard@bulletin.elitemail.org
To: wireguard@lists.zx2c4.com
Subject: APK outside of Play Store?
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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

For users who prefer to avoid Play Store as a delivery channel, is there an official pre-built APK available? Such users are typically steered towards APKPure/APKMirror/F-Droid with questionabl authenticity and (in the case of F-Droid) the prospect of old build dependencies built on an EOL OS (Strech). Aurora is an option, though a dev provided build (with accompanying checksum/signing cert fingerprint) would be preferable. 

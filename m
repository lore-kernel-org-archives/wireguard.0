Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AB8C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:35:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4f3a9813;
	Wed, 28 Sep 2022 10:21:05 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5575b1e2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2022 02:19:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 06A5A32009B9
 for <wireguard@lists.zx2c4.com>; Tue, 20 Sep 2022 22:18:58 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 20 Sep 2022 22:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elitemail.org;
 h=cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1663726738; x=1663813138; bh=h3i+YfBDa9n0k5kyZqoVi2Y7ryQixStJDga
 BbxKZZ2k=; b=TpPORzYgnoIMEvBQWX7B6fXXUHqaKodO0yYxuNUst7SfWh+Qo6F
 xv3ZwYaibK4pS9F+1+4M2zNcsnAJ9HnijQ6wakGO+wRhGpb1evUyItdHOXb7xl2A
 GgwqkbuQIAL3t1mQvb15tOVcFawY0G+DuS1lRSYoMHKRhlBIgMy2TzkwetwbKl/w
 XViLpr4ujldqqTF6WGRSrU4vz8284psJwxhqRW0jeKWSucVuSAv2iJSW8O7YW5Wz
 /wBbEYnLiiMmtOwFwep+XctaUKo2F4b5HO+NB0QLPVZ2O4EiqUC6aFqbC8NmVrFC
 WgW6lTvxvqkSfksKUG3artG4QVOh1Fo9T5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663726738; x=
 1663813138; bh=h3i+YfBDa9n0k5kyZqoVi2Y7ryQixStJDgaBbxKZZ2k=; b=K
 JI42F6btNNhWuKHqk2gkLPhQ9orL3zErVLsj2Otn8a+8fXyJWYMm/CqDu5wd27ED
 AG1BuXHPk7EsDnZ0nUkfal20ykIFdjy9TPd5Y0VdFG3Wi9c3P+6t+hmouXorv1wP
 psvDNEdBHQEO1nzdmn7earOOdCenZMh+hh9ToZzTbB7TrKY8naL6rUlg3ot/XTuj
 tJWcn48Hmm79KSDYhbuNk1XWBufwJ521O5u15PDlswSX5te3gqg680QScgddbwVS
 vtnG2j3XzJ9bMriXtlWhqc2xXXoYc9tgK1IrG5ChzaeZGqTIKQ6XAHN5jAGqF1GT
 hbAGf7b2G4xkIxK/5xoLA==
X-ME-Sender: <xms:knQqY_t222e5m4qohtAsP0XQ9uYOUZJJ024ppz4AF_bZPyonKArWhg>
 <xme:knQqYwdHsQZVy2aBUkwWR9iBNRf1UaKS3j4VQr5s6tBJzptYzrluYAT2AvXshyOZ_
 cSrcV2ru0_VwaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpeifihhrvghguhgrrhgusegsuhhllhgvthhinhdrvghlihhtvghm
 rghilhdrohhrghenucggtffrrghtthgvrhhnpeeiheetgeeggfdtleffhefgtdeiveevud
 eiveffudefgfegtdeijeegkeelteetudenucffohhmrghinheprghnughrohhiugdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeifih
 hrvghguhgrrhgusegsuhhllhgvthhinhdrvghlihhtvghmrghilhdrohhrgh
X-ME-Proxy: <xmx:knQqYyzgH6MnAbUXBSSMY_tYl2WkZviPWUhTKxcJoVUDNtbYcwXYyQ>
 <xmx:knQqY-NmbS1I9SGSS_YZW8TTv1wxnYHPmAj2YERiRyiX5yYQuYGCLw>
 <xmx:knQqY_-EjJH-E0uCFnW830vyUGPyhTN2UwKhwa70C846BxoswneQgQ>
 <xmx:knQqYyKmx1UOgQY8wWAl6e_QylamS0gOC7iT2VtHPb6SGbJaBVryIA>
Feedback-ID: i0301461f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 462302D40071; Tue, 20 Sep 2022 22:18:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <848c8979-89e7-46af-a7b2-42aec914bccf@www.fastmail.com>
Date: Wed, 21 Sep 2022 02:18:38 +0000
From: wireguard@bulletin.elitemail.org
To: wireguard@lists.zx2c4.com
Subject: Android: Support for Material You Themed Icon?
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

This would be useful for my partial color blindness (and others who are similarly color vision deficient) as it would  provide a base to improve the contrast of the icon against a light/dark theme background (a monochromatic icon layer and a touch of XML): 

https://developer.android.com/develop/ui/views/launch/icon_design_adaptive


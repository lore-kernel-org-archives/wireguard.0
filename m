Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576D8C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Oct 2022 03:08:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 88cc7e84;
	Sun, 2 Oct 2022 03:04:20 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 438150ef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2022 03:04:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E33835C00D8
 for <wireguard@lists.zx2c4.com>; Sat,  1 Oct 2022 23:04:16 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Sat, 01 Oct 2022 23:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elitemail.org;
 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664679856; x=1664766256; bh=K4Q0jRSDVE
 pOLuy9BZgP3t8k0EH7MPlLebIzmK65Y68=; b=CFUX/EzHw5rGj8520L6w/E+Z4H
 ycdGb8a1FQumJl+QrFRzk2KAOOMVJWcxYn1QnHI2TrcSS/3Q967EWmUJDt6w6yIR
 aF0DCKgcICcpyuZV9a/4uWjmNVPAyPXUsoavKk5f4XZf8c8MD5/zU8bjlyHcN2nw
 CUtUmcUx8kfMjuBtvcrdpf0cfHqRGkipDw43QiGfFsBtVwSBV1VMVK/sDyTLVbYl
 CKL8FRUK+8FfSj3WepFSS9DaHVREQJ0qnEqGDyXgrUhX+UBGrTfO7mRYU9Gh74S5
 NiKUMmC7zPaJ1ojwDOHP3won3TVjwrRxzIdbVd+M2G6+FHyOMsM+4nvEuThA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664679856; x=1664766256; bh=K4Q0jRSDVEpOLuy9BZgP3t8k0EH7
 MPlLebIzmK65Y68=; b=ACbmUR4B9m5G/xxOEzkxPD4W9aq08m2z2jEPW97eAr+u
 6vNtnjpdCzzOp3KuUNmxffZrTfIlK5JObPF4PHD3eIzTkn+mHiQ+7Z58HuYi1gn3
 g2GZTC/SnRMt+/6Sj+uGgMsn5pBBSDxMu0IZyo6ezfBwbe6TSqYOxdsenxE3QhRW
 HMhm7UtyRRXFTVowKa2ZEbeMlC8NkEePmlpJPtj+92KpGAn5kAJUaAAQL3wlcR5o
 gq+BlCJ3etb+2rwJu5VjuAlA0fzKkqAuyNCchhSnjXZQbfUvyxV1bs5Ga9PsvRqO
 1PtjRW3xwHTE8sWpf58/BjRd67vJfT3ToAedI5sVLw==
X-ME-Sender: <xms:sP84Y35Cd6UC1KCjH-ITJeXdkvUYdr-6G4UlGgs-HixLCKKa3HsdlQ>
 <xme:sP84Y86fonFbXFTVbOPUtvCw-F06E765I_F8UqZ75UcAewHkjvaPwnZuHvUaQ_EU2
 SN1lENxlxGIYEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpeifihhrvghguhgrrhgusegsuhhllhgvthhinhdrvghlihht
 vghmrghilhdrohhrghenucggtffrrghtthgvrhhnpefgvdegtdfgiedvieffleegiefghf
 eiieevgeehveefffdvgfffgeejtedthfefhfenucffohhmrghinhepfihirhgvghhurghr
 ugdrtghomhdpfhdqughrohhiugdrohhrghdpfihirhgvghhurghrugdrrghnughrohhiug
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeifihhr
 vghguhgrrhgusegsuhhllhgvthhinhdrvghlihhtvghmrghilhdrohhrgh
X-ME-Proxy: <xmx:sP84Y-d2GWuBqYL_H3DgKlgc7ohfwAMCuzR6wYOgv8XzcKLhbbsntg>
 <xmx:sP84Y4KWgq5_b9SD5H1rZ29rqwKyxha922xXDAd6eQbYKAbkoWcbFw>
 <xmx:sP84Y7Kl7ljM_sTQa6nKVlJNgcNA9ogMR4yBLgFCMZa5RnqLsStMQA>
 <xmx:sP84YwU_MtH3GXIwPJSY1MJLuaIArNOIbC9nnR57kaA-bosY0j9XFg>
Feedback-ID: i0301461f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4EB952D40071; Sat,  1 Oct 2022 23:04:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <17e101ab-1434-43cb-af2c-437623bfecbf@app.fastmail.com>
In-Reply-To: <286505c7-67b8-29dd-3cff-570851c3169c@tempforever.com>
References: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
 <286505c7-67b8-29dd-3cff-570851c3169c@tempforever.com>
Date: Sun, 02 Oct 2022 03:03:51 +0000
From: wireguard@bulletin.elitemail.org
To: wireguard@lists.zx2c4.com
Subject: Re: APK outside of Play Store?
Content-Type: text/plain
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

F-Droid builds on EOL Debian Stretch using an outdated toolchain and dependencies is not the way. An official build on a supported non-EOL OS signed by first-party development is. 

On Wed, Sep 28, 2022, at 4:34 PM, tempforever wrote:
> wireguard@bulletin.elitemail.org wrote:
>> For users who prefer to avoid Play Store as a delivery channel, is there an official pre-built APK available? Such users are typically steered towards APKPure/APKMirror/F-Droid with questionabl authenticity and (in the case of F-Droid) the prospect of old build dependencies built on an EOL OS (Strech). Aurora is an option, though a dev provided build (with accompanying checksum/signing cert fingerprint) would be preferable. 
>>
> It's on the wireguard installation/download page
> https://www.wireguard.com/install/#android-play-store-f-droid
>
> The f-droid link is https://f-droid.org/en/packages/com.wireguard.android/

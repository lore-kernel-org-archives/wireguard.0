Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4EAC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 18:21:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 093fe5ce;
	Wed, 28 Sep 2022 18:17:45 +0000 (UTC)
Received: from tempforever.com (tempforever.com [185.144.158.117])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id dd563818
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 16:34:50 +0000 (UTC)
Received: from [192.168.2.10] (unknown [192.168.2.10])
 by tempforever.com (Postfix) with ESMTPSA id 9DB796004D
 for <wireguard@lists.zx2c4.com>; Wed, 28 Sep 2022 12:34:49 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tempforever.com;
 s=domkey; t=1664382889;
 bh=FjTtkWObsxq0V2tQnOUcr34Oxfw9tijfvUR687GuxTw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=A07F10ZKVdRccfUlr+XNNL9NSI88dnSeEX2SyU8QgiCMXtBM0I9tk1SnW2FK/WN6e
 STH3spnrSbSMc4IXvDcqZ+FbIBpLI4Eipcck6UPMrrtmbjgq6Ylsk/lKH4KjYgRipq
 CfWH1rf5kthCEYYMc/82juwT6W/3Gg7QeHtDPrAw=
Subject: Re: APK outside of Play Store?
To: wireguard@lists.zx2c4.com
References: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
From: tempforever <dev1@tempforever.com>
Message-ID: <286505c7-67b8-29dd-3cff-570851c3169c@tempforever.com>
Date: Wed, 28 Sep 2022 12:34:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 SeaMonkey/2.53.11.1
MIME-Version: 1.0
In-Reply-To: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 28 Sep 2022 18:17:44 +0000
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

wireguard@bulletin.elitemail.org wrote:
> For users who prefer to avoid Play Store as a delivery channel, is there an official pre-built APK available? Such users are typically steered towards APKPure/APKMirror/F-Droid with questionabl authenticity and (in the case of F-Droid) the prospect of old build dependencies built on an EOL OS (Strech). Aurora is an option, though a dev provided build (with accompanying checksum/signing cert fingerprint) would be preferable. 
>
It's on the wireguard installation/download page
https://www.wireguard.com/install/#android-play-store-f-droid

The f-droid link is https://f-droid.org/en/packages/com.wireguard.android/


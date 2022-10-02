Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91EEC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Oct 2022 08:59:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e1cbc4f7;
	Sun, 2 Oct 2022 08:57:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7d21ef50
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2022 08:57:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E024260E03;
 Sun,  2 Oct 2022 08:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FA4C433D6;
 Sun,  2 Oct 2022 08:57:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Qf/Vs05O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664701022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5x+rMV2S4tdhKYpl1a4VC/MS3ijEuE4P7AJgED9jAQY=;
 b=Qf/Vs05O4QqL3V19EPvw8bbzoqAITndw3XljxXfuFapxhD9/qND1+u6YLvXjl8szUwCDeI
 0oP88q7AVNCKCrTFIzHBkVsDUD52cJw4Ym3eDUEPrj+jmr8YVxSLIPZrPcqmB+NgJTCVix
 noGIFtnoYp3YHhfKp28fVtUKIYKJCNc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 13f8bc1d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 2 Oct 2022 08:57:01 +0000 (UTC)
Date: Sun, 2 Oct 2022 10:56:59 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@bulletin.elitemail.org
Cc: wireguard@lists.zx2c4.com
Subject: Re: APK outside of Play Store?
Message-ID: <YzlSW9qQ+c/0tB5A@zx2c4.com>
References: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
 <286505c7-67b8-29dd-3cff-570851c3169c@tempforever.com>
 <17e101ab-1434-43cb-af2c-437623bfecbf@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17e101ab-1434-43cb-af2c-437623bfecbf@app.fastmail.com>
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

On Sun, Oct 02, 2022 at 03:03:51AM +0000, wireguard@bulletin.elitemail.org wrote:
> F-Droid builds on EOL Debian Stretch using an outdated toolchain and
> dependencies is not the way. An official build on a supported non-EOL
> OS signed by first-party development is. 

Is there actually something inferior about the apks it generates? Yes,
we all know fdroid's infra is crumbly. But is there something wrong with
its output files? Can you point to something technically substantive
there? If you can identify a real technical problem, maybe there's
something I can do about that, by working with the fdroid developers, or
otherwise find some way. In the past, they've been able to bump NDK/SDK
revisions and whatnot without too much hassle. And these days, all is
usually fine so long as we stick with the non-beta releases (that is,
the open source releases) of AGP. But maybe now you've identified a new
problem? On the other hand, if you cannot identity a real technical
problem, I'm not sure I have much to comment on.

Jason

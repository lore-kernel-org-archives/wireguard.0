Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3F6C77B7D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 May 2023 23:47:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb06c2a1;
	Mon, 15 May 2023 23:44:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e8ce2715
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 May 2023 23:44:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D50AD60DEA;
 Mon, 15 May 2023 23:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8630C433D2;
 Mon, 15 May 2023 23:44:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iuy1dXbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684194241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uk/wSML+S10Rcg8qOCgnLqI4J3WH+nY8P7JuiAYsJgg=;
 b=iuy1dXbzwLSTCARwRESTdroBtWgS/BkfKlWmfygCA2nBN6Voe/MCIRsB5ztT9cXWgGPbYr
 hgu2qC1weudRDlDmIQ08JjVIyDaV7W7cUOGhP1pwgx629lQbSePjMpiEUdDC+s8OqlXgTw
 JE0XrMLbPV4eeuT3kybr3fml9gIpGMo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4573a674
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 15 May 2023 23:43:59 +0000 (UTC)
Date: Tue, 16 May 2023 01:43:58 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@bulletin.elitemail.org
Cc: wireguard@lists.zx2c4.com
Subject: Re: APK outside of Play Store?
Message-ID: <ZGLDvq41wMnHaoQK@zx2c4.com>
References: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <517b5e80-d3ac-4829-9096-1415ecad5aa4@www.fastmail.com>
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

On Wed, Sep 21, 2022 at 04:09:56AM +0000, wireguard@bulletin.elitemail.org wrote:
> For users who prefer to avoid Play Store as a delivery channel, is
> there an official pre-built APK available? Such users are typically
> steered towards APKPure/APKMirror/F-Droid with questionabl
> authenticity and (in the case of F-Droid) the prospect of old build
> dependencies built on an EOL OS (Strech). Aurora is an option, though
> a dev provided build (with accompanying checksum/signing cert
> fingerprint) would be preferable. 

Done: https://lists.zx2c4.com/pipermail/wireguard/2023-May/008057.html

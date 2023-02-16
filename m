Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A42C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Feb 2023 15:39:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d655ecfa;
	Thu, 16 Feb 2023 15:39:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d73a8046
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2023 15:39:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D39E3614E2;
 Thu, 16 Feb 2023 15:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99177C433EF;
 Thu, 16 Feb 2023 15:39:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LxyCaTFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1676561979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CVSBQr9y+4axrXxhcbbr4/cPgSLwcPx7E51y/mrxzws=;
 b=LxyCaTFPGmRn6fF1J8pprSeqi/Ab8zo6l3v4nS6/NddBc9kf3mgTLd/DWMNSjs+PesNc1R
 nyIgzaljPBaLqtUScMiGEfP9OdWxfCa9ymvcuwBVWVk0BGZKN3OBuLTGyshc4+0fO6wBOM
 pyCpzGeu3chHCNIvUboyWMxs4pEbYyE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45caa685
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 16 Feb 2023 15:39:39 +0000 (UTC)
Date: Thu, 16 Feb 2023 16:39:35 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: z <dzm@unexpl0.red>
Cc: wireguard@lists.zx2c4.com, mathias@hall-andersen.dk
Subject: Re: Noise Protocol Question
Message-ID: <Y+5ONw070fwcUIec@zx2c4.com>
References: <0685312b-2d0f-495b-b321-80d46326b764@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0685312b-2d0f-495b-b321-80d46326b764@app.fastmail.com>
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

On Sat, Feb 11, 2023 at 03:39:12PM +0000, z wrote:
> TL;DR  Why is wireguard go not calling isZero() on the output of the ECDH key agreement every time?

Good question. AFAICT, this was something I had noticed back when this
code was in development, but then zero checking only got added to the
initiation side, not the response side, in 8c34c4c ("First set of code
review patches"). I don't know whether this was a mistake or if there
was a rationale at the time.

Fortunately, there aren't really any real consequences. But I did fix it
up, so thanks very much for reporting this:
https://git.zx2c4.com/wireguard-go/commit/?id=c7b76d3d9ecdc2ffde80decadda88c0c7cdfeedf

Jason

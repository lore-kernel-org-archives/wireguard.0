Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90CC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 11:41:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e687a856;
	Thu, 30 Jun 2022 11:41:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 905b744b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 11:41:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 126E16155C;
 Thu, 30 Jun 2022 11:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16873C341CB;
 Thu, 30 Jun 2022 11:41:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jMG4CUIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656589305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yaLrfHVQUpQlZppwmP9NiykxLYHraj6TlVMhtCrdoek=;
 b=jMG4CUIigNmVg7pVAlqap95sCj2ObwfEHyuCmFlPAAWPvMXFs0og9x+dDGSF/vTG+U9oK5
 PWoci+AlZb5snoTUT2oACdWOJzzyOeCWcRiBcXY2kHf9hILWvwwNbkvTrm6TGkuufC8W4o
 bfte9/sfBh7RivF9aIQ+fGaT9ceoThE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7cd2cc0a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 30 Jun 2022 11:41:45 +0000 (UTC)
Date: Thu, 30 Jun 2022 13:41:43 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: tlhackque <tlhackque@yahoo.com>
Cc: WireGuard Mailing list <wireguard@lists.zx2c4.com>
Subject: Re: CONFIG_ANDROID
Message-ID: <Yr2L9759Ek63KV1F@zx2c4.com>
References: <23929467-11c2-cdf2-3841-2a837ba58b51.ref@yahoo.com>
 <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com>
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

On Thu, Jun 30, 2022 at 06:47:38AM -0400, tlhackque wrote:
> FWIW: Having watched the discussion about CONFIG_ANDROID, it occurs to 
> me that there's an alternative for WireGuard that sidesteps the issue.
> 
>  From the last patcheset, it seems that the only use in WireGuard is to 
> avoid clearing keys on every wake-up.

No, it clears keys before sleeping.

> 
> So: Why not timestamp key-clear events, and establish a minimum interval?

Because we don't know when we're going to wake up again, and the
objective is to maintain forward secrecy.

Jason

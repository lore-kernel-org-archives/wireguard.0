Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68407F433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Apr 2026 03:27:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id da96733b;
	Thu, 16 Apr 2026 03:27:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2434bccc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Apr 2026 03:27:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59F3060120;
 Thu, 16 Apr 2026 03:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9248BC19424;
 Thu, 16 Apr 2026 03:27:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="f0N/wyLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1776310041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfHDjrCG/LP8Bq6IyH21MnRjlL9jnauO9jXaWv8A868=;
 b=f0N/wyLSMsf+87P+MhPoHQk1c9SG1X75RV6i0JlhZ81nphPrAvxIa0HHWA22MXppqdMMDH
 vbEH3721hdGoTAb/5Hm8myS6Pn+8Nhn9kOXfxXZtVghF7lTq/i5FKOKsrAFdbnWLXxPEDG
 XTfSiO8UvDK8j9XsLMpd+zxGFhsV/kQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 91df2eb0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 16 Apr 2026 03:27:19 +0000 (UTC)
Date: Thu, 16 Apr 2026 05:27:17 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: =?utf-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard Windows 0.6.1 - Timeline of issues (tunnels lost &
 import still broken)
Message-ID: <aeBXFfT-hIHw_8Ec@zx2c4.com>
References: <CABJHARCjTJ+T43++SkTam0RiHKvgxGqQJfAeGOOcF65SWCH5yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJHARCjTJ+T43++SkTam0RiHKvgxGqQJfAeGOOcF65SWCH5yA@mail.gmail.com>
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

On Thu, Apr 16, 2026 at 09:37:39AM +0900, 오한웅 wrote:
> Hello,
> 
> I would like to report a clear timeline of issues observed with
> WireGuard for Windows (version 0.6.1).
> 
> April 14:
> - After updating, all existing tunnels disappeared
> - Importing new tunnels failed
>   - ZIP files were not visible
>   - "*.*" filter did not help
>   - Drag and drop did not work
> 
> April 16:
> - Existing tunnels no longer disappear after update (possibly improved)
> - However, importing new tunnels is still not working
>   - ZIP files are still not visible in the import dialog
>   - "*.*" filter does not work
>   - Drag and drop still fails
> 
> At this point:
> - It is unclear whether the tunnel disappearance issue is fully fixed or not
> - The import issue remains critical and consistently reproducible
> 
> Impact:
> - Users cannot add new tunnels after installation or update
> - This is affecting a production VPN service with multiple users
> 
> Please confirm:
> - Whether there was a recent change in the update package
> - Whether the import issue is a known bug
> - When a fix can be expected
> 
> Thank you.

I need information - build of windows, architecture, other software
installed, and so forth.

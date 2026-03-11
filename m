Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A748F103E2EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Mar 2026 23:04:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ab60d7e6;
	Wed, 11 Mar 2026 23:03:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 157842b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Mar 2026 23:02:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9931560137;
 Wed, 11 Mar 2026 23:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7E8C4CEF7;
 Wed, 11 Mar 2026 23:02:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="j0nuOHwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1773270174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiY5KDNvnWfx9XWdYS3zxMraFINB/RAoBpCgRdditRs=;
 b=j0nuOHwpgwpT/5eiA2N8L0FqEH4u8bSHIxOm/SwzTMqT46SyDXqFh6IH4faybEPH0d8ogM
 B0pc0978/LDE8TbWY1ojgaEHcCoz98F4la6eIf/9jqgKRUiMyrjcAPLQqY2yLeWSEpxY/y
 ZF3f5rZdkjsD1BoB6QXSp6BApkbezqI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8f30663
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 11 Mar 2026 23:02:54 +0000 (UTC)
Date: Thu, 12 Mar 2026 00:02:52 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH wireguard-tools v3 0/3] ipc: linux: kernel-side netdevice
 filtering
Message-ID: <abH0nBlQmggFAFt7@zx2c4.com>
References: <20260130191058.5123-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130191058.5123-1-ast@fiberby.net>
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

On Fri, Jan 30, 2026 at 07:10:52PM +0000, Asbjørn Sloth Tønnesen wrote:
> Move device filtering to the kernel, thereby reducing netlink traffic.
> 
> The first patch request kernel-side filtering.
> 
> The second patch requests that the kernel doesn't include statistics
> in netdevice dumps.
> 
> The third patch removes the old filtering code, as an
> additional step, which breaks on earlier than Linux v4.6.
> 
> I assume that a dependency on Linux v4.6+ is acceptable for wg-tools
> now, as wireguard-linux-compat haven't been updated for 3 years.

Interesting series. If I'm going to apply this, I'm going to apply it,
and so the ifdefs you've added won't matter much; this will still break
wireguard-linux-compat. But maybe it's time to do so. So if you're up
for sending a v4, just do it like there's no yesterday.

Also, does this filtering need to also be added to the embeddable c
library contrib code?

Thanks for this patch. I'll start thinking seriously about
wireguard-linux-compat sunsetting.

Jason

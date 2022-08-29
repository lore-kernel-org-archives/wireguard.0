Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBD3ECAAD2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Aug 2022 16:25:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0e93aaf9;
	Mon, 29 Aug 2022 16:16:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0160277d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2022 16:16:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C9F661202;
 Mon, 29 Aug 2022 16:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507F5C433C1;
 Mon, 29 Aug 2022 16:16:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CMkK2XIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1661789796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZaM9oArygvBg45JM/Xp/ZSxKy0nQRSklYk7fAARhtw=;
 b=CMkK2XIlx6y7sMQmHg8qa9CCa5PvA/ANS0NEnlyqw775d9qIVjN8tFbA2ZaV2iYklKeBsd
 5zFgUSn0oYzUy22INwE2N82vltgnqAeojdDeTdj1e5YRjR1osIYLZ4jqJfyGIzPx1p0mAQ
 vcWzo9LVdvlBY0ZV06BTDsNOxrrC+Dg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dbc60098
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 29 Aug 2022 16:16:36 +0000 (UTC)
Date: Mon, 29 Aug 2022 12:16:35 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Pro <michael.adm@gmail.com>
Cc: wireguard@lists.zx2c4.com, kevans@freebsd.org
Subject: Re: FreeBSD current socket-src changed. Wireguard not compiling.
Message-ID: <YwzmY6Q/lJIDZyfz@zx2c4.com>
References: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
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

On Tue, Aug 23, 2022 at 12:26:21PM +0300, Michael Pro wrote:
> Tonight after updating kernel freebsd current I got coredump with
> wireguard enabled kernel module.
> 
> As is
> https://reviews.freebsd.org/D36232
>  D36232 protosw: refactor protosw and domain static declaration and
> load (freebsd.org)
> in wireguard-freebsd/src/support.h
> ...
> error = (*so->so_proto->pr_usrreqs->pru_sockaddr)(so, nam);
> ...
> replace to
> ...
> error = solisten_proto_check(so);
> ...
> Recompile - no more core dumps. All works now, perhaps...
> 
> Is this the right way to fix the problem? Is this enough or should we
> wait for a full-scale refactoring of the code?
> 
> Thanks in advance for your reply.

Thanks. Is there a __FreeBSD_version__ change that corresponds?

Jason

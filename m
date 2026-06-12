Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF85CD98CF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Jun 2026 17:04:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c552bb37;
	Fri, 12 Jun 2026 17:04:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6d6a8b8b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jun 2026 17:04:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A9B05601E1;
 Fri, 12 Jun 2026 17:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F15B1F000E9;
 Fri, 12 Jun 2026 17:04:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=VNID4pV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1781283890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H/xTHWGyytj0Wxk8h7O66xTkTiDPvX943AH0jZq6AfQ=;
 b=VNID4pV4x1Hj0CDhn2IUn2atbl5IHTISL88phB6kF0uAktdFyOClfnrvEhEKazofHyXLB7
 9oIQz5LUIXvhWBm9ePAEC8LF51vVsS5wt2xoCjqMUZLmZwlCwzraEFmQQo0LxeC6G45NT1
 S1xIFedc48uxG7Dy7aZWulDpl4TSj5Q=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 480ffa8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 12 Jun 2026 17:04:50 +0000 (UTC)
Date: Fri, 12 Jun 2026 19:04:47 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Robert Frohl <rfrohl@suse.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Revert "dns-hatchet: apply resolv.conf's selinux context
 to new resolv.conf"
Message-ID: <aiw8L3XwjibHS2_-@zx2c4.com>
References: <20260608133610.108416-1-rfrohl@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608133610.108416-1-rfrohl@suse.com>
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

On Mon, Jun 08, 2026 at 03:36:10PM +0200, Robert Frohl wrote:
> This reverts commit 2ce4680bd34f371aacd3c09673c3c907274321cd.
> 
> selinux does not allow every domain to set file contexts and will raise
> relabelto/relabelfrom AVCs and block these changes if a domain tries to update
> the selinux context.
> 
> It is better to ignore selinux and leave the proper labeling to the
> selinux policy, which can add proper file transitions for the right
> context.

Does any existent selinux policy have anything to handle this? Or is this
purely speculative/future-facing?

Also, wondering if any distros are still shipping the hatchet.

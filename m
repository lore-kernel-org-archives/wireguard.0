Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824EAC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddda972c;
	Tue, 20 May 2025 19:34:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3e1ca685
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Dec 2024 20:35:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA2125C5A14;
 Tue,  3 Dec 2024 20:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCDDC4CECF;
 Tue,  3 Dec 2024 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733258110;
 bh=5xpp5ZE5z0bk8ryEGi+u3xIb0pxyaQCKLxC8nFsMpJc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=erfYuqSyhTZ5FD3nR/dn2mCcwJ6LVEpxrsV66CQy6pOV1HJpo97b6WBvqt0ZTDIlc
 ZsqX3aX/QeYQPPVX9zNae3lrdvot3gpx+uYc5znMgipUv9eKHQEjh+nCI+criBEtP8
 BdVqIf6pERiIQtBNwtSaBSONs0cjYpNs0edtepNV8JJ2ARe/3Bs114s+PGkZHtq9ME
 sdhBjCCSVn7XXo9nneqPIfjuQGdUXP1NXj1G6IeSBnBNb3N0sj8Rzr8aj+xKboOPHk
 eZU7dZQ+GcQBPYp8JQgYWjBIaGRKiZq6kqQjST5ZGUct0eTFnNxsF482U5ZGLmPEc2
 oh5gBe8UuHUzg==
Message-ID: <d686df42-3f31-4aaa-a9b3-f3fb85c7bf6a@kernel.org>
Date: Tue, 3 Dec 2024 13:35:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: wireguard: Allow binding to specific ifindex
To: greearb@candelatech.com, netdev@vger.kernel.org
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com
References: <20241203193939.1953303-1-greearb@candelatech.com>
Content-Language: en-US
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20241203193939.1953303-1-greearb@candelatech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/3/24 12:39 PM, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Which allows us to bind to VRF.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
> 
> v2:  Fix bad use of comma, semicolon now used instead.
> 
>  drivers/net/wireguard/device.h  |  1 +
>  drivers/net/wireguard/netlink.c | 12 +++++++++++-
>  drivers/net/wireguard/socket.c  |  8 +++++++-
>  include/uapi/linux/wireguard.h  |  3 +++
>  4 files changed, 22 insertions(+), 2 deletions(-)
> 

LGTM

Reviewed-by: David Ahern <dsahern@kernel.org>

be good to throw a test case under selftests

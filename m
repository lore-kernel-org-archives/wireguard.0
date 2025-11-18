Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02506CEDDB5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 15:26:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e2e1ea8;
	Tue, 18 Nov 2025 15:21:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 10b69816
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 15:21:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AF884351A;
 Tue, 18 Nov 2025 15:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6A3C116B1;
 Tue, 18 Nov 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="F0W3gtgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763479260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHsEEDamXTBjz7jsIIRcmnVyYCJKWmTea4vcDHn5vjg=;
 b=F0W3gtgk4ZMlnIpAOfJH68yLnOXi0WTTfKf/1oH0vCf50ebKE0cYxUwOjva03oEp2O8m+E
 P3EpspXuFBOS2Kp8O08KkYxetF7HBOmHrqGBl1wnPtmpkYimck88VwNtjlsVJPy5Zm7VKO
 q5uvLoxY2ZM02Xl8S4r5c7Iv4GTnH4o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54ba1b2d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 18 Nov 2025 15:21:00 +0000 (UTC)
Date: Tue, 18 Nov 2025 16:20:58 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: Re: [PATCH net-next v3 08/11] tools: ynl: add sample for wireguard
Message-ID: <aRyO2mvToYf4yuwY@zx2c4.com>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-9-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183223.89913-9-ast@fiberby.net>
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

On Wed, Nov 05, 2025 at 06:32:17PM +0000, Asbjørn Sloth Tønnesen wrote:
> +CFLAGS_wireguard:=$(call get_hdr_inc,_LINUX_WIREGUARD_H,wireguard.h) \
> +	-D _WG_UAPI_WIREGUARD_H # alternate pre-YNL guard

I don't totally grok what's going on here. As I understand it, this
makefile creates `wireguard-user.h` in the generated/ include path,
which has all the various netlink wrapper declarations. And then this
also references, somehow, include/uapi/linux/wireguard.h, for the constants.
For some reason, you're then defining _WG_UAPI_WIREGUARD_H here, so that
wireguard.h from /usr/include doesn't clash. But also, why would it?
Isn't this just a matter of placing $(src)/include/uapi earlier in the
include file path?

Jason

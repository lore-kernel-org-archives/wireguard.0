Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712BDD4920F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:35:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a833d3ad;
	Mon, 18 Nov 2024 12:35:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d417e3e2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2024 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711388716; x=1742924716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pDZKQc6ecvkphwAYRU2Enq0nSASTo3gjVQAEK+jg+qA=;
 b=XBy797o3VuJrcD15mUiobWTsgsIKj85/Sx/iw4qOYydEWH0QCEHGdL/7
 Vb2fjIe/pgiuHvEwmuUILCYQmEQyvTt2HD21aVDPJGKr+vbtbjVc3cqBj
 FkqzWmAu0YHzlscm40ArFs1nNxpOy/BhNQCHIm8WKPepLl+FjSIyvzJUx
 DCnmdv79mn8Bj2mDNMlyKEpDNujC7HbVcxjAw4Aq5CtAzn3oaDYGhHJ21
 LGtM59D4sN/LAJgUygbw3GfLLAjC3xZNDKuw9zH3b7selUhiX93tcXQOW
 /7sOorPfnY7cfPjceOFIzFy90XAsichUlFEvi21+S4BNLodiZqGPR8xoJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6590090"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6590090"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="914850267"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="914850267"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:45:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rooNd-0000000G4LT-195N; Mon, 25 Mar 2024 19:45:05 +0200
Date: Mon, 25 Mar 2024 19:45:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, dw@davidwei.uk, jiri@resnulli.us,
 Sven Eckelmann <sven@narfation.org>, Jason@zx2c4.com,
 mareklindner@neomailbox.ch, sw@simonwunderlich.de, a@unstable.cc,
 pshelar@ovn.org, wireguard@lists.zx2c4.com, dev@openvswitch.org
Subject: Re: [PATCH net-next v2 3/3] genetlink: remove linux/genetlink.h
Message-ID: <ZgG4IebcrI1RCKAe@smile.fi.intel.com>
References: <20240325173716.2390605-1-kuba@kernel.org>
 <20240325173716.2390605-4-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325173716.2390605-4-kuba@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

On Mon, Mar 25, 2024 at 10:37:16AM -0700, Jakub Kicinski wrote:
> genetlink.h is a shell of what used to be a combined uAPI
> and kernel header over a decade ago. It has fewer than
> 10 lines of code. Merge it into net/genetlink.h.
> In some ways it'd be better to keep the combined header
> under linux/ but it would make looking through git history
> harder.

Some last moment minor comments (no need to send a new version, JFYI,
maybe you tide this up when applying).

...

> +/* Non-parallel generic netlink requests are serialized by a global lock.  */

While at it, maybe drop extra space? (I noticed it was originally like this.

...

> +#define MODULE_ALIAS_GENL_FAMILY(family) \
> + MODULE_ALIAS_NET_PF_PROTO_NAME(PF_NETLINK, NETLINK_GENERIC, "-family-" family)

I would still make this TAB indented.

-- 
With Best Regards,
Andy Shevchenko



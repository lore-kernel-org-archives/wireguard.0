Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9536CD4920F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:35:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee65de74;
	Mon, 18 Nov 2024 12:35:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f2c51d9c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Mar 2024 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710151266; x=1741687266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zKjzyi61+cKiGXB1eb9jj5q7YL5px2kJANb0CTHwR6M=;
 b=KHADaCtUu8jHwNPf7KzCweWaErYae/LpsXZh33C2XD/ZHHSzKv5F1Kf9
 vdEZiakIoeTzYC6GFdabdHGcWeISSqhqT1mKa5tkV0nFDb1StjSxFSUbl
 EPTden01KTWSlMOMvZ5Lo1N8QW6zRzLsl1GYJcryCMenx29Mh9A3VR8Vc
 0nlqxi48hd2HCMy4xrW3ENRD8KOqmV6AiU1s3kUsj5wTZo5f0/SvvWQzx
 WmymkhzUfEcFq1YrEZhwNkb2GPhsxuxh0pEvW6HgawTsN/YgtypBe1jnc
 8HH/jeqY1JIJ51io4t/R7AQV4723KveRANDyHAJTC9wRbA/wPgswB7k0/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4941273"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4941273"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 03:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="914354455"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="914354455"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 03:01:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rjcSn-0000000BaPF-0v4c; Mon, 11 Mar 2024 12:00:57 +0200
Date: Mon, 11 Mar 2024 12:00:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, jiri@resnulli.us, Jason@zx2c4.com,
 mareklindner@neomailbox.ch, sw@simonwunderlich.de, a@unstable.cc,
 sven@narfation.org, pshelar@ovn.org, wireguard@lists.zx2c4.com,
 dev@openvswitch.org
Subject: Re: [PATCH net-next 3/3] genetlink: remove linux/genetlink.h
Message-ID: <Ze7WWLK-xcFHsJyo@smile.fi.intel.com>
References: <20240309183458.3014713-1-kuba@kernel.org>
 <20240309183458.3014713-4-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240309183458.3014713-4-kuba@kernel.org>
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

On Sat, Mar 09, 2024 at 10:34:58AM -0800, Jakub Kicinski wrote:
> genetlink.h is a shell of what used to be a combined uAPI
> and kernel header over a decade ago. It has fewer than
> 10 lines of code. Merge it into net/genetlink.h.
> In some ways it'd be better to keep the combined header
> under linux/ but it would make looking through git history
> harder.

...

> +/* All generic netlink requests are serialized by a global lock.  */
> +extern void genl_lock(void);
> +extern void genl_unlock(void);

Do you need to inherit unneeded 'extern' here?

...

> +#define MODULE_ALIAS_GENL_FAMILY(family) \
> + MODULE_ALIAS_NET_PF_PROTO_NAME(PF_NETLINK, NETLINK_GENERIC, "-family-" family)

This is using the macro defined in net.h which seems not being included.

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDEDC04A94
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Aug 2023 21:48:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fbb6319;
	Tue, 15 Aug 2023 21:47:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 098ddbc8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Aug 2023 21:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692136043; x=1723672043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xz8NL6STmp0W6EsxVXVBPrOYiDE42Au7K2UZXa36gJQ=;
 b=G3e0dpZX8LGbQgx4YpLQIUu99ctupLzUNhV6IExYSWe2OQ8zE/iNSOWF
 lZUDk+5pJMjHSAXCn+M6i87/W+SXVgfoAx908bvuw3x47lXTB7H3utGo5
 zJ5eeSAT3O4rsH3kAUSx9XSQJUhrMxIXCB6CDLlzQ2kSiXQzBTnWbKjPr
 2dk89NUUFPjYWb9/DQIxoVdWdJ2EltiGV1umSAK7ixwx1M4MMCnE6rF1Z
 JQWkoDO8g+pgZL9tS/cqyuYwDX6coOZNF4WiD/V0lCPXzL25LlN4MkzMC
 bAPJky1Qp9FMPvUN2+K7AwAmQpSjWNSf99ymHzYOohABXJG8bjhTXuTl0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403363689"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="403363689"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 14:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768967416"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="768967416"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 14:47:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qW1se-0001Fs-2P;
 Tue, 15 Aug 2023 21:47:13 +0000
Date: Wed, 16 Aug 2023 05:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, jiri@resnulli.us,
 johannes@sipsolutions.net, Jakub Kicinski <kuba@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jiri Pirko <jiri@nvidia.com>, Jason@zx2c4.com, alex.aring@gmail.com,
 stefan@datenfreihafen.org, krzysztof.kozlowski@linaro.org,
 jmaloy@redhat.com, ying.xue@windriver.com, floridsleeves@gmail.com,
 leon@kernel.org, jacob.e.keller@intel.com,
 wireguard@lists.zx2c4.com, linux-wpan@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net
Subject: Re: [PATCH net-next v3 05/10] genetlink: use attrs from struct
 genl_info
Message-ID: <202308160545.9cpmjvz9-lkp@intel.com>
References: <20230814214723.2924989-6-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814214723.2924989-6-kuba@kernel.org>
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

Hi Jakub,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/genetlink-push-conditional-locking-into-dumpit-done/20230815-055212
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230814214723.2924989-6-kuba%40kernel.org
patch subject: [PATCH net-next v3 05/10] genetlink: use attrs from struct genl_info
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230816/202308160545.9cpmjvz9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160545.9cpmjvz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160545.9cpmjvz9-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/devlink/netlink.c: In function 'devlink_nl_dumpit':
>> net/devlink/netlink.c:232:37: error: 'const struct genl_dumpit_info' has no member named 'attrs'
     232 |         struct nlattr **attrs = info->attrs;
         |                                     ^~
--
   net/devlink/health.c: In function 'devlink_nl_health_reporter_get_dump_one':
>> net/devlink/health.c:396:37: error: 'const struct genl_dumpit_info' has no member named 'attrs'
     396 |         struct nlattr **attrs = info->attrs;
         |                                     ^~


vim +232 net/devlink/netlink.c

07f3af66089e20 Jakub Kicinski 2023-01-04  227  
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  228  int devlink_nl_dumpit(struct sk_buff *msg, struct netlink_callback *cb,
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  229  		      devlink_nl_dump_one_func_t *dump_one)
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  230  {
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  231  	const struct genl_dumpit_info *info = genl_dumpit_info(cb);
4a1b5aa8b5c743 Jiri Pirko     2023-08-11 @232  	struct nlattr **attrs = info->attrs;
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  233  	int flags = NLM_F_MULTI;
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  234  
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  235  	if (attrs &&
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  236  	    (attrs[DEVLINK_ATTR_BUS_NAME] || attrs[DEVLINK_ATTR_DEV_NAME]))
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  237  		return devlink_nl_inst_single_dumpit(msg, cb, flags, dump_one,
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  238  						     attrs);
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  239  	else
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  240  		return devlink_nl_inst_iter_dumpit(msg, cb, flags, dump_one);
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  241  }
4a1b5aa8b5c743 Jiri Pirko     2023-08-11  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

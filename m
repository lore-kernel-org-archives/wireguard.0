Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7ACE64018
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Nov 2024 21:45:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a20a669;
	Thu, 21 Nov 2024 21:45:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2986988c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Nov 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732225503; x=1763761503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NIUcN6+T+wki60rCRnwepyQ8KRF0PBbMkb47VLXLqKM=;
 b=ammfg0ynJgRWRWQk47QUPfT6ChebBozDFsVhcLCrrrEgJdFn7JTKL8r3
 oRU3QxzIYeR0OMJ5lUXD5ohYpUB+eBGbHNx5hlrdki0gOIv6peoKVOPGu
 7mbFfVkFb1VignFjLdUZxuUpb3z5bpTJDsyE4YMk+6JkcZZkJsupaTJuD
 GhvrN945ZruWyhUzHRYQIMVgBaLArxNdNvAQ84NZyts/gXuObUHTNYVRx
 McK9ALPXJJRGGUWLiUGlGsdBMwDcccQtj12HM8Vybm0BGM0pkwp92OEdD
 MeSLBuT49OIpI0W/yg4ZSlFf2erOtbEb2bYdj0UTYLl/2B7ya6uS4j9M+ g==;
X-CSE-ConnectionGUID: UT5pzXvUQR6NN3lPMkjGUw==
X-CSE-MsgGUID: IMk2o2q8SlCcFBO96tkH9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32514208"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32514208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 13:45:01 -0800
X-CSE-ConnectionGUID: xdpPO1RmQrC72kpFCsgzmg==
X-CSE-MsgGUID: zhZedUIBSeupQFYJAgkZ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90753178"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2024 13:44:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tEEyr-0003O1-1A;
 Thu, 21 Nov 2024 21:44:53 +0000
Date: Fri, 22 Nov 2024 05:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xiao Liang <shaw.leon@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Jakub Kicinski <kuba@kernel.org>, Donald Hunter <donald.hunter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/5] rtnetlink: Decouple net namespaces in
 rtnl_newlink_create()
Message-ID: <202411220516.rokej98E-lkp@intel.com>
References: <20241118143244.1773-4-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118143244.1773-4-shaw.leon@gmail.com>
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

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Liang/net-ip_tunnel-Build-flow-in-underlay-net-namespace/20241121-112705
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241118143244.1773-4-shaw.leon%40gmail.com
patch subject: [PATCH net-next v4 3/5] rtnetlink: Decouple net namespaces in rtnl_newlink_create()
config: arc-randconfig-002-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220516.rokej98E-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220516.rokej98E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220516.rokej98E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/batman-adv/soft-interface.c:1075: warning: Function parameter or struct member 'params' not described in 'batadv_softif_newlink'
>> net/batman-adv/soft-interface.c:1075: warning: Excess function parameter 'nets' description in 'batadv_softif_newlink'
>> net/batman-adv/soft-interface.c:1075: warning: Excess function parameter 'dev' description in 'batadv_softif_newlink'
>> net/batman-adv/soft-interface.c:1075: warning: Excess function parameter 'tb' description in 'batadv_softif_newlink'
>> net/batman-adv/soft-interface.c:1075: warning: Excess function parameter 'data' description in 'batadv_softif_newlink'
>> net/batman-adv/soft-interface.c:1075: warning: Excess function parameter 'extack' description in 'batadv_softif_newlink'


vim +1075 net/batman-adv/soft-interface.c

128254ceea6ffe Sven Eckelmann 2020-10-11  1063  
128254ceea6ffe Sven Eckelmann 2020-10-11  1064  /**
128254ceea6ffe Sven Eckelmann 2020-10-11  1065   * batadv_softif_newlink() - pre-initialize and register new batadv link
c19808cb1d05d1 Xiao Liang     2024-11-18  1066   * @nets: the applicable net namespaces
128254ceea6ffe Sven Eckelmann 2020-10-11  1067   * @dev: network device to register
128254ceea6ffe Sven Eckelmann 2020-10-11  1068   * @tb: IFLA_INFO_DATA netlink attributes
128254ceea6ffe Sven Eckelmann 2020-10-11  1069   * @data: enum batadv_ifla_attrs attributes
128254ceea6ffe Sven Eckelmann 2020-10-11  1070   * @extack: extended ACK report struct
128254ceea6ffe Sven Eckelmann 2020-10-11  1071   *
128254ceea6ffe Sven Eckelmann 2020-10-11  1072   * Return: 0 if successful or error otherwise.
128254ceea6ffe Sven Eckelmann 2020-10-11  1073   */
c19808cb1d05d1 Xiao Liang     2024-11-18  1074  static int batadv_softif_newlink(struct rtnl_newlink_params *params)
128254ceea6ffe Sven Eckelmann 2020-10-11 @1075  {
c19808cb1d05d1 Xiao Liang     2024-11-18  1076  	struct net_device *dev = params->dev;
c19808cb1d05d1 Xiao Liang     2024-11-18  1077  	struct nlattr **data = params->data;
a5ad457eea41ef Sven Eckelmann 2020-10-11  1078  	struct batadv_priv *bat_priv = netdev_priv(dev);
a5ad457eea41ef Sven Eckelmann 2020-10-11  1079  	const char *algo_name;
a5ad457eea41ef Sven Eckelmann 2020-10-11  1080  	int err;
a5ad457eea41ef Sven Eckelmann 2020-10-11  1081  
a5ad457eea41ef Sven Eckelmann 2020-10-11  1082  	if (data && data[IFLA_BATADV_ALGO_NAME]) {
a5ad457eea41ef Sven Eckelmann 2020-10-11  1083  		algo_name = nla_data(data[IFLA_BATADV_ALGO_NAME]);
a5ad457eea41ef Sven Eckelmann 2020-10-11  1084  		err = batadv_algo_select(bat_priv, algo_name);
a5ad457eea41ef Sven Eckelmann 2020-10-11  1085  		if (err)
a5ad457eea41ef Sven Eckelmann 2020-10-11  1086  			return -EINVAL;
a5ad457eea41ef Sven Eckelmann 2020-10-11  1087  	}
a5ad457eea41ef Sven Eckelmann 2020-10-11  1088  
128254ceea6ffe Sven Eckelmann 2020-10-11  1089  	return register_netdevice(dev);
128254ceea6ffe Sven Eckelmann 2020-10-11  1090  }
128254ceea6ffe Sven Eckelmann 2020-10-11  1091  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

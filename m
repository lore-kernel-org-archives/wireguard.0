Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A854D10F3A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 01:36:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dc8f615;
	Mon, 18 Nov 2024 01:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a6d2ca7
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2024 05:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725167617; x=1756703617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Svloc/17cgB1tI/t29aHIxSnubb5d8x1d/mrQM1NWe4=;
 b=AehSVcVa/e1rhh9AdXUDEKGu4CKDcSt9lBN7r9liJQofCwE303QPudae
 JZmBNGflHNes+Hw09v4rWoXnTP8yp+x11TYjmChnVbcOID0k/zg/iHqba
 p+PsgPhWKegO9tH+oKKOh+FBLTn1fR4IHTCyP+DSI4IPCQUhX8u2qYFwu
 uqVcPV8L0Yrq6oAbnPCqNNiISTxF+VHhHThKtHsiTtvQWxa4Gtxqqezmw
 PpH+oVtRkaUKuwx184PP6qeux3W/jSScTrFVeOEsPvhJbjzlpUFesWZuU
 he6H8FwkRnuymqnPpPlwe1fcVXSNsJ9r75g7jeJoc0Kq/5X5m2su3Kzhu w==;
X-CSE-ConnectionGUID: JrPlrFxxQa6j9EjliEMD6A==
X-CSE-MsgGUID: AggaUgCiSDS7SDHUWfXGyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="26675922"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; d="scan'208";a="26675922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 22:13:34 -0700
X-CSE-ConnectionGUID: G/ipLG5SQTeRjFVDYsOX9Q==
X-CSE-MsgGUID: /dyauXO0S4qv+Q4gn0j1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; d="scan'208";a="95080879"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2024 22:13:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1skcu1-0003QY-1Y;
 Sun, 01 Sep 2024 05:13:29 +0000
Date: Sun, 1 Sep 2024 13:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Rife <jrife@google.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 wireguard@lists.zx2c4.com
Cc: oe-kbuild-all@lists.linux.dev, Jordan Rife <jrife@google.com>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <202409011256.CWrnquxQ-lkp@intel.com>
References: <20240830194103.2186774-1-jrife@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830194103.2186774-1-jrife@google.com>
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

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Rife/wireguard-allowedips-Add-WGALLOWEDIP_F_REMOVE_ME-flag/20240831-034712
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240830194103.2186774-1-jrife%40google.com
patch subject: [PATCH net-next] wireguard: allowedips: Add WGALLOWEDIP_F_REMOVE_ME flag
config: i386-randconfig-062-20240901 (https://download.01.org/0day-ci/archive/20240901/202409011256.CWrnquxQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011256.CWrnquxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011256.CWrnquxQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireguard/allowedips.c:257:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct list_head *entry @@     got struct list_head [noderef] __rcu * @@
   drivers/net/wireguard/allowedips.c:257:24: sparse:     expected struct list_head *entry
   drivers/net/wireguard/allowedips.c:257:24: sparse:     got struct list_head [noderef] __rcu *
>> drivers/net/wireguard/allowedips.c:258:9: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:269:24: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/net/wireguard/allowedips.c:270:26: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/net/wireguard/allowedips.c:276:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   drivers/net/wireguard/allowedips.c:276:19: sparse:     expected struct callback_head *head
   drivers/net/wireguard/allowedips.c:276:19: sparse:     got struct callback_head [noderef] __rcu *
   drivers/net/wireguard/allowedips.c:294:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/net/wireguard/allowedips.c:294:18: sparse:    struct wg_peer *
   drivers/net/wireguard/allowedips.c:294:18: sparse:    struct wg_peer [noderef] __rcu *
>> drivers/net/wireguard/allowedips.c:384:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node [noderef] __rcu *node @@     got struct allowedips_node *[assigned] node @@
>> drivers/net/wireguard/allowedips.c:258:9: sparse: sparse: dereference of noderef expression
>> drivers/net/wireguard/allowedips.c:258:9: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:259:22: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:259:38: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:261:17: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:264:44: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:265:50: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:268:25: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:269:24: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:269:24: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:270:26: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:270:26: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:271:26: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:274:25: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:274:25: sparse: sparse: dereference of noderef expression
   drivers/net/wireguard/allowedips.c:274:25: sparse: sparse: dereference of noderef expression

vim +257 drivers/net/wireguard/allowedips.c

   251	
   252	static void _remove(struct allowedips_node __rcu *node, struct mutex *lock)
   253	{
   254		struct allowedips_node *child, **parent_bit, *parent;
   255		bool free_parent;
   256	
 > 257		list_del_init(&node->peer_list);
 > 258		RCU_INIT_POINTER(node->peer, NULL);
   259		if (node->bit[0] && node->bit[1])
   260			return;
   261		child = rcu_dereference_protected(node->bit[!rcu_access_pointer(node->bit[0])],
   262						  lockdep_is_held(lock));
   263		if (child)
   264			child->parent_bit_packed = node->parent_bit_packed;
   265		parent_bit = (struct allowedips_node **)(node->parent_bit_packed & ~3UL);
   266		*parent_bit = child;
   267		parent = (void *)parent_bit -
   268				offsetof(struct allowedips_node, bit[node->parent_bit_packed & 1]);
   269		free_parent = !rcu_access_pointer(node->bit[0]) &&
   270				!rcu_access_pointer(node->bit[1]) &&
   271				(node->parent_bit_packed & 3) <= 1 &&
   272				!rcu_access_pointer(parent->peer);
   273		if (free_parent)
   274			child = rcu_dereference_protected(parent->bit[!(node->parent_bit_packed & 1)],
   275							  lockdep_is_held(lock));
 > 276		call_rcu(&node->rcu, node_free_rcu);
   277		if (!free_parent)
   278			return;
   279		if (child)
   280			child->parent_bit_packed = parent->parent_bit_packed;
   281		*(struct allowedips_node **)(parent->parent_bit_packed & ~3UL) = child;
   282		call_rcu(&parent->rcu, node_free_rcu);
   283	}
   284	
   285	static int remove(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
   286			  u8 cidr, struct wg_peer *peer, struct mutex *lock)
   287	{
   288		struct allowedips_node *node;
   289	
   290		if (unlikely(cidr > bits || !peer))
   291			return -EINVAL;
   292		if (!rcu_access_pointer(*trie) ||
   293		    !node_placement(*trie, key, cidr, bits, &node, lock) ||
   294		    peer != node->peer)
   295			return 0;
   296	
   297		_remove(node, lock);
   298	
   299		return 0;
   300	}
   301	
   302	void wg_allowedips_init(struct allowedips *table)
   303	{
   304		table->root4 = table->root6 = NULL;
   305		table->seq = 1;
   306	}
   307	
   308	void wg_allowedips_free(struct allowedips *table, struct mutex *lock)
   309	{
   310		struct allowedips_node __rcu *old4 = table->root4, *old6 = table->root6;
   311	
   312		++table->seq;
   313		RCU_INIT_POINTER(table->root4, NULL);
   314		RCU_INIT_POINTER(table->root6, NULL);
   315		if (rcu_access_pointer(old4)) {
   316			struct allowedips_node *node = rcu_dereference_protected(old4,
   317								lockdep_is_held(lock));
   318	
   319			root_remove_peer_lists(node);
   320			call_rcu(&node->rcu, root_free_rcu);
   321		}
   322		if (rcu_access_pointer(old6)) {
   323			struct allowedips_node *node = rcu_dereference_protected(old6,
   324								lockdep_is_held(lock));
   325	
   326			root_remove_peer_lists(node);
   327			call_rcu(&node->rcu, root_free_rcu);
   328		}
   329	}
   330	
   331	int wg_allowedips_insert_v4(struct allowedips *table, const struct in_addr *ip,
   332				    u8 cidr, struct wg_peer *peer, struct mutex *lock)
   333	{
   334		/* Aligned so it can be passed to fls */
   335		u8 key[4] __aligned(__alignof(u32));
   336	
   337		++table->seq;
   338		swap_endian(key, (const u8 *)ip, 32);
   339		return add(&table->root4, 32, key, cidr, peer, lock);
   340	}
   341	
   342	int wg_allowedips_insert_v6(struct allowedips *table, const struct in6_addr *ip,
   343				    u8 cidr, struct wg_peer *peer, struct mutex *lock)
   344	{
   345		/* Aligned so it can be passed to fls64 */
   346		u8 key[16] __aligned(__alignof(u64));
   347	
   348		++table->seq;
   349		swap_endian(key, (const u8 *)ip, 128);
   350		return add(&table->root6, 128, key, cidr, peer, lock);
   351	}
   352	
   353	int wg_allowedips_remove_v4(struct allowedips *table, const struct in_addr *ip,
   354				    u8 cidr, struct wg_peer *peer, struct mutex *lock)
   355	{
   356		/* Aligned so it can be passed to fls */
   357		u8 key[4] __aligned(__alignof(u32));
   358	
   359		++table->seq;
   360		swap_endian(key, (const u8 *)ip, 32);
   361		return remove(&table->root4, 32, key, cidr, peer, lock);
   362	}
   363	
   364	int wg_allowedips_remove_v6(struct allowedips *table, const struct in6_addr *ip,
   365				    u8 cidr, struct wg_peer *peer, struct mutex *lock)
   366	{
   367		/* Aligned so it can be passed to fls64 */
   368		u8 key[16] __aligned(__alignof(u64));
   369	
   370		++table->seq;
   371		swap_endian(key, (const u8 *)ip, 128);
   372		return remove(&table->root6, 128, key, cidr, peer, lock);
   373	}
   374	
   375	void wg_allowedips_remove_by_peer(struct allowedips *table,
   376					  struct wg_peer *peer, struct mutex *lock)
   377	{
   378		struct allowedips_node *node, *tmp;
   379	
   380		if (list_empty(&peer->allowedips_list))
   381			return;
   382		++table->seq;
   383		list_for_each_entry_safe(node, tmp, &peer->allowedips_list, peer_list) {
 > 384			_remove(node, lock);
   385		}
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

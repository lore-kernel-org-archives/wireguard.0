Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA06DCCD183
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Oct 2025 16:49:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4b00837;
	Thu, 9 Oct 2025 16:49:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 025e1a5a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Oct 2025 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760028545; x=1791564545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1TzUcnwgjEN0gNNPpUHv1Ovokylsh6Xk6QfDEhG7vv0=;
 b=I7eS65k4e7Sv8Ql1y5e0At6eSG+aJXDVoxyD45jdDSPxW2mS04ll7zeF
 D96/SAPECp4+42y758JHezr7w39RaP1lN+W7MVo+81upL1nm0qxqZ0Zyp
 1rMlLfxkDjivCvjRc1eVtsA9TA8P1f+2sT6qH4fGoTZkRUad5WSuBaN6P
 3tAtKsu0EMX1ZAgss58tRMq+ZmMGgFHMuRDwoMDpFFOpbzkvx0+57DtDV
 Fkrbgwhr6z0SYSyrYwAqbwKjiJL0jlw9/U+Si/+GBZLKXSJgCC23rlTBm
 q+UnFZarX5jP0MyeeS8l6u+H/DhBlTUbKbTcwdft5BDSQTB91jXov7ykW A==;
X-CSE-ConnectionGUID: BiNez8zrTVOc+FMYjNpppQ==
X-CSE-MsgGUID: HHvhGHX5RmiiDrvx4/2b0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62147485"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62147485"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:49:03 -0700
X-CSE-ConnectionGUID: 4RHkDBvhRt+FjlkfWXLCkQ==
X-CSE-MsgGUID: EFu18xe0RzypojlyTbvvyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185145921"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 09:49:00 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v6tp4-00012B-08;
 Thu, 09 Oct 2025 16:48:58 +0000
Date: Fri, 10 Oct 2025 00:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Fushuai Wang <wangfushuai@baidu.com>, Jason@zx2c4.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fushuai Wang <wangfushuai@baidu.com>
Subject: Re: [PATCH] wireguard: allowedips: Use kfree_rcu() instead of
 call_rcu()
Message-ID: <202510100057.ZUiqBtur-lkp@intel.com>
References: <20251005122626.26988-1-wangfushuai@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005122626.26988-1-wangfushuai@baidu.com>
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

Hi Fushuai,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on crng-random/master v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fushuai-Wang/wireguard-allowedips-Use-kfree_rcu-instead-of-call_rcu/20251009-142048
base:   linus/master
patch link:    https://lore.kernel.org/r/20251005122626.26988-1-wangfushuai%40baidu.com
patch subject: [PATCH] wireguard: allowedips: Use kfree_rcu() instead of call_rcu()
config: m68k-hp300_defconfig (https://download.01.org/0day-ci/archive/20251010/202510100057.ZUiqBtur-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100057.ZUiqBtur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100057.ZUiqBtur-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/net/wireguard/allowedips.c: In function 'remove_node':
>> include/linux/stddef.h:16:33: error: '*0' is a pointer; did you mean to use '->'?
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:575:23: note: in definition of macro '__compiletime_assert'
     575 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:595:9: note: in expansion of macro '_compiletime_assert'
     595 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1124:17: note: in expansion of macro 'BUILD_BUG_ON'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1124:30: note: in expansion of macro 'offsetof'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                              ^~~~~~~~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/allowedips.c:269:9: note: in expansion of macro 'kfree_rcu'
     269 |         kfree_rcu(&node, rcu);
         |         ^~~~~~~~~
   In file included from include/linux/rculist.h:11,
                    from include/linux/dcache.h:8,
                    from include/linux/fs.h:9,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/ip.h:16,
                    from drivers/net/wireguard/allowedips.h:10,
                    from drivers/net/wireguard/allowedips.c:6:
>> include/linux/rcupdate.h:1125:41: error: '___p' is a pointer to pointer; did you mean to dereference it before applying '->' to it?
    1125 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));       \
         |                                         ^~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/allowedips.c:269:9: note: in expansion of macro 'kfree_rcu'
     269 |         kfree_rcu(&node, rcu);
         |         ^~~~~~~~~
>> include/linux/stddef.h:16:33: error: '*0' is a pointer; did you mean to use '->'?
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:575:23: note: in definition of macro '__compiletime_assert'
     575 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:595:9: note: in expansion of macro '_compiletime_assert'
     595 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1124:17: note: in expansion of macro 'BUILD_BUG_ON'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1124:30: note: in expansion of macro 'offsetof'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                              ^~~~~~~~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/allowedips.c:275:9: note: in expansion of macro 'kfree_rcu'
     275 |         kfree_rcu(&parent, rcu);
         |         ^~~~~~~~~
>> include/linux/rcupdate.h:1125:41: error: '___p' is a pointer to pointer; did you mean to dereference it before applying '->' to it?
    1125 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));       \
         |                                         ^~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/allowedips.c:275:9: note: in expansion of macro 'kfree_rcu'
     275 |         kfree_rcu(&parent, rcu);
         |         ^~~~~~~~~
--
   In file included from <command-line>:
   allowedips.c: In function 'remove_node':
>> include/linux/stddef.h:16:33: error: '*0' is a pointer; did you mean to use '->'?
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:575:23: note: in definition of macro '__compiletime_assert'
     575 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:595:9: note: in expansion of macro '_compiletime_assert'
     595 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1124:17: note: in expansion of macro 'BUILD_BUG_ON'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1124:30: note: in expansion of macro 'offsetof'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                              ^~~~~~~~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   allowedips.c:269:9: note: in expansion of macro 'kfree_rcu'
     269 |         kfree_rcu(&node, rcu);
         |         ^~~~~~~~~
   In file included from include/linux/rculist.h:11,
                    from include/linux/dcache.h:8,
                    from include/linux/fs.h:9,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/ip.h:16,
                    from allowedips.h:10,
                    from allowedips.c:6:
>> include/linux/rcupdate.h:1125:41: error: '___p' is a pointer to pointer; did you mean to dereference it before applying '->' to it?
    1125 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));       \
         |                                         ^~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   allowedips.c:269:9: note: in expansion of macro 'kfree_rcu'
     269 |         kfree_rcu(&node, rcu);
         |         ^~~~~~~~~
>> include/linux/stddef.h:16:33: error: '*0' is a pointer; did you mean to use '->'?
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:575:23: note: in definition of macro '__compiletime_assert'
     575 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:595:9: note: in expansion of macro '_compiletime_assert'
     595 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1124:17: note: in expansion of macro 'BUILD_BUG_ON'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1124:30: note: in expansion of macro 'offsetof'
    1124 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), rhf) >= 4096);    \
         |                              ^~~~~~~~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   allowedips.c:275:9: note: in expansion of macro 'kfree_rcu'
     275 |         kfree_rcu(&parent, rcu);
         |         ^~~~~~~~~
>> include/linux/rcupdate.h:1125:41: error: '___p' is a pointer to pointer; did you mean to dereference it before applying '->' to it?
    1125 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));       \
         |                                         ^~
   include/linux/rcupdate.h:1087:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1087 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   allowedips.c:275:9: note: in expansion of macro 'kfree_rcu'
     275 |         kfree_rcu(&parent, rcu);
         |         ^~~~~~~~~


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

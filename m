Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40669CCD199
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Oct 2025 12:50:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6e92cf4;
	Thu, 16 Oct 2025 12:50:44 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 955ad86b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Oct 2025 12:50:42 +0000 (UTC)
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id CC355601B357B;
 Thu, 16 Oct 2025 14:47:52 +0200 (CEST)
Message-ID: <906dd11d-26db-4570-840a-e4797748c05c@molgen.mpg.de>
Date: Thu, 16 Oct 2025 14:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][v4] hung_task: Panic when there are more than N hung
 tasks at the same time
To: Li RongQing <lirongqing@baidu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>, Florian Wesphal <fw@strlen.de>,
 Jakub Kacinski <kuba@kernel.org>, "Jason A . Donenfeld" <jason@zx2c4.com>,
 Joel Granados <joel.granados@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Phil Auld <pauld@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>
References: <20251015063615.2632-1-lirongqing@baidu.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251015063615.2632-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Dear RongQing,


Thank you for the patch. One minor comment regarding the Kconfig 
description.

Am 15.10.25 um 08:36 schrieb lirongqing:
> From: Li RongQing <lirongqing@baidu.com>
> 
> Currently, when 'hung_task_panic' is enabled, the kernel panics
> immediately upon detecting the first hung task. However, some hung
> tasks are transient and allow system recovery, while persistent hangs
> should trigger a panic when accumulating beyond a threshold.
> 
> Extend the 'hung_task_panic' sysctl to accept a threshold value
> specifying the number of hung tasks that must be detected before
> triggering a kernel panic. This provides finer control for environments
> where transient hangs may occur but persistent hangs should be fatal.
> 
> The sysctl now accepts:
> - 0: don't panic (maintains original behavior)
> - 1: panic on first hung task (maintains original behavior)
> - N > 1: panic after N hung tasks are detected in a single scan
> 
> This maintains backward compatibility while providing flexibility for
> different hang scenarios.
> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Florian Wesphal <fw@strlen.de>
> Cc: Jakub Kacinski <kuba@kernel.org>
> Cc: Jason A. Donenfeld <jason@zx2c4.com>
> Cc: Joel Granados <joel.granados@kernel.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Liam Howlett <liam.howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
> Cc: "Paul E . McKenney" <paulmck@kernel.org>
> Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> ---
> diff with v3: comments modification, suggested by Lance, Masami, Randy and Petr
> diff with v2: do not add a new sysctl, extend hung_task_panic, suggested by Kees Cook
> 
>   Documentation/admin-guide/kernel-parameters.txt      | 20 +++++++++++++-------
>   Documentation/admin-guide/sysctl/kernel.rst          |  9 +++++----
>   arch/arm/configs/aspeed_g5_defconfig                 |  2 +-
>   kernel/configs/debug.config                          |  2 +-
>   kernel/hung_task.c                                   | 15 ++++++++++-----
>   lib/Kconfig.debug                                    |  9 +++++----
>   tools/testing/selftests/wireguard/qemu/kernel.config |  2 +-
>   7 files changed, 36 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a51ab46..492f0bc 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1992,14 +1992,20 @@
>   			the added memory block itself do not be affected.
>   
>   	hung_task_panic=
> -			[KNL] Should the hung task detector generate panics.
> -			Format: 0 | 1
> +			[KNL] Number of hung tasks to trigger kernel panic.
> +			Format: <int>
> +
> +			When set to a non-zero value, a kernel panic will be triggered if
> +			the number of detected hung tasks reaches this value.
> +
> +			0: don't panic
> +			1: panic immediately on first hung task
> +			N: panic after N hung tasks are detected in a single scan
>   
> -			A value of 1 instructs the kernel to panic when a
> -			hung task is detected. The default value is controlled
> -			by the CONFIG_BOOTPARAM_HUNG_TASK_PANIC build-time
> -			option. The value selected by this boot parameter can
> -			be changed later by the kernel.hung_task_panic sysctl.
> +			The default value is controlled by the
> +			CONFIG_BOOTPARAM_HUNG_TASK_PANIC build-time option. The value
> +			selected by this boot parameter can be changed later by the
> +			kernel.hung_task_panic sysctl.
>   
>   	hvc_iucv=	[S390]	Number of z/VM IUCV hypervisor console (HVC)
>   				terminal devices. Valid values: 0..8
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index f3ee807..0065a55 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -397,13 +397,14 @@ a hung task is detected.
>   hung_task_panic
>   ===============
>   
> -Controls the kernel's behavior when a hung task is detected.
> +When set to a non-zero value, a kernel panic will be triggered if the
> +number of hung tasks found during a single scan reaches this value.
>   This file shows up if ``CONFIG_DETECT_HUNG_TASK`` is enabled.
>   
> -= =================================================
> += =======================================================
>   0 Continue operation. This is the default behavior.
> -1 Panic immediately.
> -= =================================================
> +N Panic when N hung tasks are found during a single scan.
> += =======================================================
>   
>   
>   hung_task_check_count

[…]

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294..3976c90 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1258,12 +1258,13 @@ config DEFAULT_HUNG_TASK_TIMEOUT
>   	  Keeping the default should be fine in most cases.
>   
>   config BOOTPARAM_HUNG_TASK_PANIC
> -	bool "Panic (Reboot) On Hung Tasks"
> +	int "Number of hung tasks to trigger kernel panic"
>   	depends on DETECT_HUNG_TASK
> +	default 0
>   	help
> -	  Say Y here to enable the kernel to panic on "hung tasks",
> -	  which are bugs that cause the kernel to leave a task stuck
> -	  in uninterruptible "D" state.
> +	  When set to a non-zero value, a kernel panic will be triggered
> +	  if the number of hung tasks found during a single scan reaches
> +	  this value.
>   
>   	  The panic can be used in combination with panic_timeout,
>   	  to cause the system to reboot automatically after a
Why not leave the sentence about the uninterruptible "D" state in there?

Also, it sounds like, some are actually using this in production. Maybe 
it should be moved out of `Kconfig.debug` too?


Kind regards,

Paul

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D85CCD185
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Oct 2025 01:38:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a932f9b;
	Tue, 14 Oct 2025 01:38:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f8b2de53
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Oct 2025 01:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=SCW41sazUXG5KcMtr/XAw0GQBM/OgQxXYdOpaMbHEK8=; b=Vunw790xEYTNY49uEhIAewJymb
 X5GikfhFUMnMl1ReMC5pYd1Xn1RLzH93C4HAYlVR/5MEu6Rri2ErZ9/du8zhiCFmDbbPVkXSb6kBQ
 0AA3G9tsERMPDzo9RApk/350l6/1GQjLh8ExHR0hoN/son9IFKunn3cpwV5b3sbNfLBlzkjAEWnnl
 fRkGvuoT+TmAXOZ4AIqtD5lW46KClOooxYpNXv8ljjl19q7MmHh2tZICmayRdETwSetCKmp2vFm/8
 mPjAXxPvMTzmupw/prDDCTKAbl5DsN3yZc/0EapJIkVXicoPgsxMPGd16wHyOMFdv/ImqxcZlXB1v
 +fqikLhw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v8Tyl-0000000EuFp-3tOW; Tue, 14 Oct 2025 01:37:31 +0000
Message-ID: <b16d76de-688a-4697-bcfe-06f2785a1d3c@infradead.org>
Date: Mon, 13 Oct 2025 18:37:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][v3] hung_task: Panic after fixed number of hung tasks
To: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Andrew Morton <akpm@linux-foundation.org>, Lance Yang
 <lance.yang@linux.dev>, Masami Hiramatsu <mhiramat@kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Feng Tang
 <feng.tang@linux.alibaba.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Phil Auld <pauld@redhat.com>, Joel Granados <joel.granados@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Florian Westphal <fw@strlen.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251012115035.2169-1-lirongqing@baidu.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251012115035.2169-1-lirongqing@baidu.com>
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

Hi--

On 10/12/25 4:50 AM, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 

> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a51ab46..7d9a8ee 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1992,14 +1992,20 @@
>  			the added memory block itself do not be affected.
>  
>  	hung_task_panic=
> -			[KNL] Should the hung task detector generate panics.
> -			Format: 0 | 1
> +			[KNL] Number of hung tasks to trigger kernel panic.
> +			Format: <int>
> +
> +			Set this to the number of hung tasks that must be
> +			detected before triggering a kernel panic.
> +
> +			0: don't panic
> +			1: panic immediately on first hung task
> +			N: panic after N hung tasks are detect

			                            are detected

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
>  	hvc_iucv=	[S390]	Number of z/VM IUCV hypervisor console (HVC)
>  				terminal devices. Valid values: 0..8


-- 
~Randy


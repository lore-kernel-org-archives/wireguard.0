Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF87CF397B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 17:17:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6a68e5d;
	Tue, 18 Nov 2025 17:32:41 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ace7a637
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Oct 2025 05:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1760678273;
 bh=JPM4mlpiishQWeQFEupQtI0yWXJaRSHmeNe+WZxInAk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=jPvbvixbXMKZqhbOdvGCGRfbQ6xz4XZW5OoEp834zvcbcUzeT0DEZQShCifFLvXH/
 7VNXYSdU2G7KBQWNNJLvpdVm+M3neujB8Z53erIEdu1UJ2Ur/ZNsImsaJHlj4fM+hg
 pXJ6iktIeSvvkWXkQePecL2LJGSXwTBivc0u1kUyxGFPoHq8uPoFGCjZLd1T70h288
 XUtXbfrycVVCuJeeKaPuRXQTaJ2o8tU0V5LH3J2I97AhMweppeCmPHR8J6FZsKDRD8
 AXTsyoypYXqYM3OOtceSmolxJvsYijbhLEvWUBCtsx2wbK42Z7FgkrL++vG1zbFzKz
 wxyyk4y8wDU0A==
Received: from [192.168.68.113] (unknown [180.150.112.213])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 882AA766F5;
 Fri, 17 Oct 2025 13:17:46 +0800 (AWST)
Message-ID: <57dffe112a461a218c7dab6bfc3b02967440cc77.camel@codeconstruct.com.au>
Subject: Re: [PATCH][v4] hung_task: Panic when there are more than N hung
 tasks at the same time
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: lirongqing <lirongqing@baidu.com>, Andrew Morton
 <akpm@linux-foundation.org>,  Lance Yang <lance.yang@linux.dev>, Masami
 Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, 	linux-kselftest@vger.kernel.org, Anshuman Khandual
 <anshuman.khandual@arm.com>,  Arnd Bergmann	 <arnd@arndb.de>, David
 Hildenbrand <david@redhat.com>, Florian Wesphal	 <fw@strlen.de>, Jakub
 Kacinski <kuba@kernel.org>, "Jason A . Donenfeld"	 <jason@zx2c4.com>, Joel
 Granados <joel.granados@kernel.org>, Joel Stanley	 <joel@jms.id.au>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,  Liam
 Howlett <liam.howlett@oracle.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Paul E . McKenney"	 <paulmck@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Petr Mladek
 <pmladek@suse.com>, Phil Auld <pauld@redhat.com>, Randy Dunlap
 <rdunlap@infradead.org>,  Russell King <linux@armlinux.org.uk>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,  Stanislav Fomichev	
 <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 17 Oct 2025 15:47:45 +1030
In-Reply-To: <20251015063615.2632-1-lirongqing@baidu.com>
References: <20251015063615.2632-1-lirongqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

On Wed, 2025-10-15 at 14:36 +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>=20
> Currently, when 'hung_task_panic' is enabled, the kernel panics
> immediately upon detecting the first hung task. However, some hung
> tasks are transient and allow system recovery, while persistent hangs
> should trigger a panic when accumulating beyond a threshold.
>=20
> Extend the 'hung_task_panic' sysctl to accept a threshold value
> specifying the number of hung tasks that must be detected before
> triggering a kernel panic. This provides finer control for environments
> where transient hangs may occur but persistent hangs should be fatal.
>=20
> The sysctl now accepts:
> - 0: don't panic (maintains original behavior)
> - 1: panic on first hung task (maintains original behavior)
> - N > 1: panic after N hung tasks are detected in a single scan
>=20
> This maintains backward compatibility while providing flexibility for
> different hang scenarios.
>=20
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
> diff with v3: comments modification, suggested by Lance, Masami, Randy an=
d Petr
> diff with v2: do not add a new sysctl, extend hung_task_panic, suggested =
by Kees Cook
>=20
> =C2=A0Documentation/admin-guide/kernel-parameters.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 20 +++++++++++++-------
> =C2=A0Documentation/admin-guide/sysctl/kernel.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++----
> =C2=A0arch/arm/configs/aspeed_g5_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-

For the aspeed_g5_defconfig change:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

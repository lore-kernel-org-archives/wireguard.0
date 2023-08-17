Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C60EE49AD
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 20:28:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64adc2eb;
	Sat, 19 Aug 2023 20:14:19 +0000 (UTC)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6aa2f39c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 04:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1692247099;
 bh=TTioG2ECpny8c1gUsV9lSzzBSbOyxoHgJmKmcWGJJb4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XBb7K0DGSY/aWma20FuWJJsaYj/I7WnxTgc1QHrKacwxzHabn8IDVtxnh+u1kir6R
 0/dCSv6v4j6K+H0n0qfcFvbzDwuMx48my6HmK54JUowGxZTDeBv/LzC/fGdkjM0jbL
 uhrythOSDp6fSsw5OTIIfIEFFsUSHSrvxpvNZyVXzcV91YnrQwqGxwE4iXdMVpv7PD
 KJDmjPNi29obujTq193LiorByY4yu6Webks9bDdTMqdbgikcZ6YUA9A+9yqAiDvppy
 K31/Jqh8vTUknZvmhTxSZipw5CVFpctxK0wQ1Ogxo+krqzabVOtQDHKwv50O+7cmGR
 NxwruEUcx/hdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRC1B2MJWz4wZn;
 Thu, 17 Aug 2023 14:38:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Arnd
 Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 wireguard@lists.zx2c4.com, linux-arch@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org, Greg
 Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen
 <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
References: <20230816055010.31534-1-rdunlap@infradead.org>
Date: Thu, 17 Aug 2023 14:38:05 +1000
Message-ID: <875y5e707m.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 19 Aug 2023 20:14:11 +0000
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

Randy Dunlap <rdunlap@infradead.org> writes:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
...
>  arch/powerpc/configs/40x/klondike_defconfig          |    2 +-
>  arch/powerpc/configs/44x/fsp2_defconfig              |    2 +-
>  arch/powerpc/configs/52xx/tqm5200_defconfig          |    2 +-
>  arch/powerpc/configs/mgcoge_defconfig                |    2 +-
>  arch/powerpc/configs/microwatt_defconfig             |    2 +-
>  arch/powerpc/configs/ps3_defconfig                   |    2 +-
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

...

> diff -- a/init/Kconfig b/init/Kconfig
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
>  
>  	  If unsure, say N.
>  
> -config EMBEDDED
> -	bool "Embedded system"
> -	select EXPERT

This is a crucial detail that could be mentioned in the change log. ie.
that all defconfigs that currently have EMBEDDED=y are currently
selecting EXPERT already.

cheers

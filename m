Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91CEC2FC04
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Aug 2023 03:17:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0043249;
	Thu, 17 Aug 2023 03:15:38 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81e1d76d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Aug 2023 03:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=P/kFyzCr/eSDaJkbY0OlCILEe1j9xWTLXn/yJLAYIu4=; b=A9+ZOyBLxgvkefgcCG3G+GbFOc
 t3Q4LPTtkkpyh0LBpbAFdc+3lhG3pcvB3Tuy2cTe9/M//iW+Sx1QS7+tpwHS9HCucIDpD/RDGCGIr
 FphyIapebkE7eEjeEnFtOi+9dwumQAvsQRYGjE0GEiZ5WBo53AxtXkFjlluHJQQSFYe1ZQ0mwCfpK
 6X/okD9sKE4Z8iWegd56l1SCJXl6wUSJ5Uk04klLzVcTy3SNTh8mgr2aL00kPfkoj1Td2N2/Azxck
 21ORjXTS2+GmCUfbeyQtLCC4mizooGziW6L1eBdD4Ta+hfKURTJGkPtTMCT5Ht16ny8Gi1C8JbRXm
 mdreectQ==;
Received: from [2601:1c2:980:9ec0::1a0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qWTTi-000tOI-Mm; Thu, 17 Aug 2023 03:15:18 +0000
Message-ID: <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
Date: Wed, 16 Aug 2023 20:15:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: 20230816055010.31534-1-rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@quicinc.com>,
 linux-hexagon@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Jesse,

On 8/16/23 15:45, Jesse Taube wrote:
> Hi, Randy
> 
>> diff -- a/init/Kconfig b/init/Kconfig
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
>>
>>        If unsure, say N.
>>
>> -config EMBEDDED
>> -    bool "Embedded system"
>> -    select EXPERT
>> -    help
>> -      This option should be enabled if compiling the kernel for
>> -      an embedded system so certain expert options are available
>> -      for configuration.
> 
> Wouldn't removing this break many out of tree configs?

I'm not familiar with out-of-tree configs.
Do you have some examples of some that use CONFIG_EMBEDDED?
(not distros)

> Should there be a warning here to update change it instead of removal?

kconfig doesn't have a warning mechanism AFAIK.
Do you have an idea of how this would work?

We could make a smaller change to init/Kconfig, like so:

 config EMBEDDED
-	bool "Embedded system"
+	bool "Embedded system (DEPRECATED)"
 	select EXPERT
 	help
-	  This option should be enabled if compiling the kernel for
-	  an embedded system so certain expert options are available
-	  for configuration.
+	  This option is being removed after Linux 6.6.
+	  Use EXPERT instead of EMBEDDED.

but there is no way to produce a warning message. I.e., even with this
change, the message will probably be overlooked.

---
~Randy


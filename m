Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9A0C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 14:21:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47560207D3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 14:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47560207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e660ff4;
	Tue, 10 Nov 2020 14:17:16 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bf757651
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 14:17:14 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 23E3F7D9
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 14:20:55 +0000 (UTC)
Date: Tue, 10 Nov 2020 19:20:55 +0500
From: Roman Mamedov <rm@romanrm.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: No longer compiles on 5.4.76
Message-ID: <20201110192055.1ab28462@natsu>
In-Reply-To: <20201110185656.541102fe@natsu>
References: <20201110185656.541102fe@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 10 Nov 2020 18:56:56 +0500
Roman Mamedov <rm@romanrm.net> wrote:

> Hello,
> 
> Building kernel 5.4.76 with WireGuard v1.0.20200908 fails for me now with:
> 
>   AS [M]  net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o
> In file included from <command-line>:
> ././net/wireguard/compat/compat-asm.h:44: warning: "SYM_FUNC_START" redefined
>  #define SYM_FUNC_START ENTRY
>  
> In file included from ././net/wireguard/compat/compat-asm.h:9,
>                  from <command-line>:
> ./include/linux/linkage.h:218: note: this is the location of the previous definition
>  #define SYM_FUNC_START(name)    \
>  
> In file included from <command-line>:
> ././net/wireguard/compat/compat-asm.h:45: warning: "SYM_FUNC_END" redefined
>  #define SYM_FUNC_END ENDPROC
>  
> In file included from ././net/wireguard/compat/compat-asm.h:9,
>                  from <command-line>:
> ./include/linux/linkage.h:265: note: this is the location of the previous definition
>  #define SYM_FUNC_END(name)    \
>  
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S: Assembler messages:
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:123: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:185: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:187: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:319: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1016: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1616: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1620: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1810: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1812: Error: invalid character '(' in mnemonic
> net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1959: Error: invalid character '(' in mnemonic
>   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
> scripts/Makefile.build:348: recipe for target 'net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o' failed
> make[3]: *** [net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o] Error 1
> scripts/Makefile.build:500: recipe for target 'net/wireguard' failed
> make[2]: *** [net/wireguard] Error 2

Seems related to:

commit 840d8c9b3e5f51d1005256e6c63eab4f81cbebfb
Author: Jiri Slaby <jirislaby@kernel.org>
Date:   Fri Oct 11 13:50:41 2019 +0200

    linkage: Introduce new macros for assembler symbols
    
    commit ffedeeb780dc554eff3d3b16e6a462a26a41d7ec upstream.
    
    Introduce new C macros for annotations of functions and data in
    assembly. There is a long-standing mess in macros like ENTRY, END,
    ENDPROC and similar. They are used in different manners and sometimes
    incorrectly.
    
    So introduce macros with clear use to annotate assembly as follows:
    
    a) Support macros for the ones below
       SYM_T_FUNC -- type used by assembler to mark functions
       SYM_T_OBJECT -- type used by assembler to mark data
       SYM_T_NONE -- type used by assembler to mark entries of unknown type
    
       They are defined as STT_FUNC, STT_OBJECT, and STT_NOTYPE
       respectively. According to the gas manual, this is the most portable
       way. I am not sure about other assemblers, so this can be switched
       back to %function and %object if this turns into a problem.
       Architectures can also override them by something like ", @function"
       if they need.
    
       SYM_A_ALIGN, SYM_A_NONE -- align the symbol?
       SYM_L_GLOBAL, SYM_L_WEAK, SYM_L_LOCAL -- linkage of symbols
    
    b) Mostly internal annotations, used by the ones below
       SYM_ENTRY -- use only if you have to (for non-paired symbols)
       SYM_START -- use only if you have to (for paired symbols)
       SYM_END -- use only if you have to (for paired symbols)
    
    c) Annotations for code
       SYM_INNER_LABEL_ALIGN -- only for labels in the middle of code
       SYM_INNER_LABEL -- only for labels in the middle of code
    
       SYM_FUNC_START_LOCAL_ALIAS -- use where there are two local names for
            one function
       SYM_FUNC_START_ALIAS -- use where there are two global names for one
            function
       SYM_FUNC_END_ALIAS -- the end of LOCAL_ALIASed or ALIASed function
    
       SYM_FUNC_START -- use for global functions
       SYM_FUNC_START_NOALIGN -- use for global functions, w/o alignment
       SYM_FUNC_START_LOCAL -- use for local functions
       SYM_FUNC_START_LOCAL_NOALIGN -- use for local functions, w/o
            alignment
       SYM_FUNC_START_WEAK -- use for weak functions
       SYM_FUNC_START_WEAK_NOALIGN -- use for weak functions, w/o alignment
       SYM_FUNC_END -- the end of SYM_FUNC_START_LOCAL, SYM_FUNC_START,
            SYM_FUNC_START_WEAK, ...
    
       For functions with special (non-C) calling conventions:
       SYM_CODE_START -- use for non-C (special) functions
       SYM_CODE_START_NOALIGN -- use for non-C (special) functions, w/o
            alignment
       SYM_CODE_START_LOCAL -- use for local non-C (special) functions
       SYM_CODE_START_LOCAL_NOALIGN -- use for local non-C (special)
            functions, w/o alignment
       SYM_CODE_END -- the end of SYM_CODE_START_LOCAL or SYM_CODE_START
    
    d) For data
       SYM_DATA_START -- global data symbol
       SYM_DATA_START_LOCAL -- local data symbol
       SYM_DATA_END -- the end of the SYM_DATA_START symbol
       SYM_DATA_END_LABEL -- the labeled end of SYM_DATA_START symbol
       SYM_DATA -- start+end wrapper around simple global data
       SYM_DATA_LOCAL -- start+end wrapper around simple local data
    
    ==========
    
    The macros allow to pair starts and ends of functions and mark functions
    correctly in the output ELF objects.
    
    All users of the old macros in x86 are converted to use these in further
    patches.
    
    Signed-off-by: Jiri Slaby <jslaby@suse.cz>
    Signed-off-by: Borislav Petkov <bp@suse.de>
    Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
    Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    Cc: "H. Peter Anvin" <hpa@zytor.com>
    Cc: Ingo Molnar <mingo@kernel.org>
    Cc: Jonathan Corbet <corbet@lwn.net>
    Cc: Josh Poimboeuf <jpoimboe@redhat.com>
    Cc: Juergen Gross <jgross@suse.com>
    Cc: Len Brown <len.brown@intel.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: linux-arch@vger.kernel.org
    Cc: linux-doc@vger.kernel.org
    Cc: linux-kernel@vger.kernel.org
    Cc: linux-pm@vger.kernel.org
    Cc: Mark Rutland <mark.rutland@arm.com>
    Cc: Pavel Machek <pavel@ucw.cz>
    Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Will Deacon <will@kernel.org>
    Cc: x86-ml <x86@kernel.org>
    Cc: xen-devel@lists.xenproject.org
    Link: https://lkml.kernel.org/r/20191011115108.12392-2-jslaby@suse.cz
    Cc: Jian Cai <jiancai@google.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


---------------
It appears the following will fix it, applied and restarted my build now.

--- a/src/compat/compat-asm.h	2020-11-10 19:11:15.526802518 +0500
+++ b/src/compat/compat-asm.h	2020-11-10 19:11:21.678802669 +0500
@@ -40,7 +40,7 @@
 #undef pull
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76)
 #define SYM_FUNC_START ENTRY
 #define SYM_FUNC_END ENDPROC
 #endif


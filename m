Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54136C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:18:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0B920989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0B920989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a40a17fc;
	Thu, 6 Dec 2018 23:06:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01404b5d
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Nov 2018 09:18:14 +0000 (UTC)
Received: from mail.hundeboll.net (2a01:4f8:d16:3392::2
 [IPv6:2a01:4f8:d16:3392::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7860b675
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Nov 2018 09:18:14 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
 by mail.hundeboll.net (Postfix) with ESMTPSA id A4AA91C1B4E
 for <wireguard@lists.zx2c4.com>; Wed, 28 Nov 2018 10:25:19 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Subject: Compilation fails with linux-headers-4.20
Message-ID: <1aec0b5a-a911-13b1-0d06-65baa356f1a0@geanix.com>
Date: Wed, 28 Nov 2018 10:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5C99980E03FDD058AC31951A"
Content-Language: en-US-large
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:06:41 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
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

This is a multi-part message in MIME format.
--------------5C99980E03FDD058AC31951A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I am experiencing the following error (verbose log attached) when 
building the wireguard module on my Arch Linux running 4.20-rc4:

% make -C /usr/lib/modules/4.20.0-rc4-1-git/build/ M=$(pwd) modules 
 
 

make: Entering directory '/usr/lib/modules/4.20.0-rc4-1-git/build' 
 
 

   CC [M]  /home/martin/projects/wireguard/git/src/main.o 
 
 

   CC [M]  /home/martin/projects/wireguard/git/src/noise.o 
 
 

./arch/x86/include/asm/refcount.h: Assembler messages: 
 
 

./arch/x86/include/asm/refcount.h:90: Error: no such instruction: 
`lock_prefix decl 680(%rbx)' 
 

./arch/x86/include/asm/refcount.h:91: Error: no such instruction: 
`refcount_check_lt_zero counter="680(%rbx)"' 
 

./arch/x86/include/asm/refcount.h:90: Error: no such instruction: 
`lock_prefix decl 680(%rbx)' 
 

./arch/x86/include/asm/refcount.h:91: Error: no such instruction: 
`refcount_check_lt_zero counter="680(%rbx)"' 
 

./arch/x86/include/asm/atomic.h:200: Error: no such instruction: 
`lock_prefix cmpxchgl %ecx,(%rdx)' 
 

./arch/x86/include/asm/refcount.h:109: Error: no such instruction: 
`refcount_error counter="(%rdx)"' 
 

./arch/x86/include/asm/refcount.h:90: Error: no such instruction: 
`lock_prefix decl 680(%rbx)' 
 

./arch/x86/include/asm/refcount.h:91: Error: no such instruction: 
`refcount_check_lt_zero counter="680(%rbx)"' 
 

./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction: 
`lock_prefix xaddq %rax,keypair_counter(%rip)' 
 

make[1]: *** [scripts/Makefile.build:294: 
/home/martin/projects/wireguard/git/src/noise.o] Error 1 
 
 

make: *** [Makefile:1565: 
_module_/home/martin/projects/wireguard/git/src] Error 2 
 
 

make: Leaving directory '/usr/lib/modules/4.20.0-rc4-1-git/build'

The issue seems to be caused by this series:
https://lkml.org/lkml/2018/10/4/25

The compilation succeeds when building against a full checkout of the 
kernel, so I suspect that something is missing in the linux-headers 
package on my distro.

Can you point me any direction to make this work? Let me know if any 
testing/logging is needed.

Thanks.

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

--------------5C99980E03FDD058AC31951A
Content-Type: text/x-log;
 name="compile.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="compile.log"

% make -C /usr/lib/modules/4.20.0-rc4-1-git/build/ M=3D$(pwd) V=3D1 modul=
es
make: Entering directory '/usr/lib/modules/4.20.0-rc4-1-git/build'
test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( =
               \
echo >&2;                                                       \
echo >&2 "  ERROR: Kernel configuration is invalid.";           \
echo >&2 "         include/generated/autoconf.h or include/config/auto.co=
nf are missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to =
fix it.";      \
echo >&2 ;                                                      \
/bin/false)
mkdir -p /home/martin/projects/wireguard/git/src/.tmp_versions ; rm -f /h=
ome/martin/projects/wireguard/git/src/.tmp_versions/*
make -f ./scripts/Makefile.build obj=3D/home/martin/projects/wireguard/gi=
t/src
(cat /dev/null;   echo kernel//home/martin/projects/wireguard/git/src/wir=
eguard.ko;) > /home/martin/projects/wireguard/git/src/modules.order
  gcc -Wp,-MD,/home/martin/projects/wireguard/git/src/.main.o.d  -nostdin=
c -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/include -I./arch/x86/in=
clude -I./arch/x86/include/generated  -I./include -I./arch/x86/include/ua=
pi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/gener=
ated/uapi -include ./include/linux/kconfig.h -include ./include/linux/com=
piler_types.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-functi=
on-declaration -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_G=
OTO -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=3D=
1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bound=
ary=3D3 -mskip-rax-setup -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel=
 -funit-at-a-time -DCONFIG_AS_CFI=3D1 -DCONFIG_AS_CFI_SIGNAL_FRAME=3D1 -D=
CONFIG_AS_CFI_SECTIONS=3D1 -DCONFIG_AS_FXSAVEQ=3D1 -DCONFIG_AS_SSSE3=3D1 =
-DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=3D1 -DCONFIG_AS_AVX512=3D1 -DCONFIG_=
AS_SHA1_NI=3D1 -DCONFIG_AS_SHA256_NI=3D1 -Wno-sign-compare -fno-asynchron=
ous-unwind-tables -mindirect-branch=3Dthunk-extern -mindirect-branch-regi=
ster -DRETPOLINE -Wa,arch/x86/kernel/macros.s -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-=
int-in-bool-context -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D2048 -fstack-protector-strong -Wno-unused-but-set-variable -Wno=
-unused-const-variable -fno-var-tracking-assignments -pg -mrecord-mcount =
-mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement -Wvla -Wno-point=
er-sign -Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-cons=
tants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=3Dimpli=
cit-int -Werror=3Dstrict-prototypes -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D./=3D =
-Wno-packed-not-aligned -O3 -fvisibility=3Dhidden -D'pr_fmt(fmt)=3DKBUILD=
_MODNAME ": " fmt' -I/home/martin/projects/wireguard/git/src/crypto/inclu=
de -DCONFIG_ZINC_ARCH_X86_64 -include /home/martin/projects/wireguard/git=
/src/compat/compat.h -I/home/martin/projects/wireguard/git/src/compat/sim=
d/include -DCONFIG_AS_SSSE3=3D1 -DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=3D1 =
-DCONFIG_AS_AVX512=3D1  -DMODULE  -DKBUILD_BASENAME=3D'"main"' -DKBUILD_M=
ODNAME=3D'"wireguard"' -c -o /home/martin/projects/wireguard/git/src/.tmp=
_main.o /home/martin/projects/wireguard/git/src/main.c
   ./tools/objtool/objtool orc generate  --module --no-fp --retpoline "/h=
ome/martin/projects/wireguard/git/src/.tmp_main.o";
  gcc -Wp,-MD,/home/martin/projects/wireguard/git/src/.noise.o.d  -nostdi=
nc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/include -I./arch/x86/i=
nclude -I./arch/x86/include/generated  -I./include -I./arch/x86/include/u=
api -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/gene=
rated/uapi -include ./include/linux/kconfig.h -include ./include/linux/co=
mpiler_types.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-funct=
ion-declaration -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_=
GOTO -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=3D=
1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bound=
ary=3D3 -mskip-rax-setup -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel=
 -funit-at-a-time -DCONFIG_AS_CFI=3D1 -DCONFIG_AS_CFI_SIGNAL_FRAME=3D1 -D=
CONFIG_AS_CFI_SECTIONS=3D1 -DCONFIG_AS_FXSAVEQ=3D1 -DCONFIG_AS_SSSE3=3D1 =
-DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=3D1 -DCONFIG_AS_AVX512=3D1 -DCONFIG_=
AS_SHA1_NI=3D1 -DCONFIG_AS_SHA256_NI=3D1 -Wno-sign-compare -fno-asynchron=
ous-unwind-tables -mindirect-branch=3Dthunk-extern -mindirect-branch-regi=
ster -DRETPOLINE -Wa,arch/x86/kernel/macros.s -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-=
int-in-bool-context -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D2048 -fstack-protector-strong -Wno-unused-but-set-variable -Wno=
-unused-const-variable -fno-var-tracking-assignments -pg -mrecord-mcount =
-mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement -Wvla -Wno-point=
er-sign -Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-cons=
tants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=3Dimpli=
cit-int -Werror=3Dstrict-prototypes -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D./=3D =
-Wno-packed-not-aligned -O3 -fvisibility=3Dhidden -D'pr_fmt(fmt)=3DKBUILD=
_MODNAME ": " fmt' -I/home/martin/projects/wireguard/git/src/crypto/inclu=
de -DCONFIG_ZINC_ARCH_X86_64 -include /home/martin/projects/wireguard/git=
/src/compat/compat.h -I/home/martin/projects/wireguard/git/src/compat/sim=
d/include -DCONFIG_AS_SSSE3=3D1 -DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=3D1 =
-DCONFIG_AS_AVX512=3D1  -DMODULE  -DKBUILD_BASENAME=3D'"noise"' -DKBUILD_=
MODNAME=3D'"wireguard"' -c -o /home/martin/projects/wireguard/git/src/.tm=
p_noise.o /home/martin/projects/wireguard/git/src/noise.c
=2E/arch/x86/include/asm/refcount.h: Assembler messages:
=2E/arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock=
_prefix decl 680(%rbx)'
=2E/arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refc=
ount_check_lt_zero counter=3D"680(%rbx)"'
=2E/arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock=
_prefix decl 680(%rbx)'
=2E/arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refc=
ount_check_lt_zero counter=3D"680(%rbx)"'
=2E/arch/x86/include/asm/atomic.h:200: Error: no such instruction: `lock_=
prefix cmpxchgl %ecx,(%rdx)'
=2E/arch/x86/include/asm/refcount.h:109: Error: no such instruction: `ref=
count_error counter=3D"(%rdx)"'
=2E/arch/x86/include/asm/refcount.h:90: Error: no such instruction: `lock=
_prefix decl 680(%rbx)'
=2E/arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refc=
ount_check_lt_zero counter=3D"680(%rbx)"'
=2E/arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction: `=
lock_prefix xaddq %rax,keypair_counter(%rip)'
make[1]: *** [scripts/Makefile.build:294: /home/martin/projects/wireguard=
/git/src/noise.o] Error 1
make: *** [Makefile:1565: _module_/home/martin/projects/wireguard/git/src=
] Error 2
make: Leaving directory '/usr/lib/modules/4.20.0-rc4-1-git/build'

--------------5C99980E03FDD058AC31951A
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------5C99980E03FDD058AC31951A--

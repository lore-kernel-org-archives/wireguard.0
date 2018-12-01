Return-Path: <SRS0=I+33=OK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F4BC04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 20:57:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615712146D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 20:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy/dDfLD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615712146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 079b4800;
	Sat, 1 Dec 2018 20:49:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c7c3377
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 20:49:35 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 734d9cae
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 20:49:35 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id d19so5253237qkg.5
 for <wireguard@lists.zx2c4.com>; Sat, 01 Dec 2018 12:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4aV/4xV/ig2NoVGwRbz52hVy5ipHB7VjPt5+Dk4L1M4=;
 b=iy/dDfLDcse9o319iM553279rjb+Z1w76tL8UOPuMH6SpEr5LUPUUtcGPZuuWgJnpv
 IqAGWRs8XeJq931kJsfT6hjMcNViCPWMD8ZW9yKHqeaHgOmBYzbN8G2bEZIv/Epqkm4E
 PTwc+EJzS2CEumgkzEvxRy2Vsda9G6Yho0Hp5bOStkmd37En3JjGrONa18KDeq+/Tel3
 HM8BhbT4JXCf7+fhiSyiB6PhD9MZU1H1brZ+oxumNcCNxBuN8BVVuph6U6HV4APyCJxh
 2wRx+ZDncvcnTbisviQEpUEvyqfxE4DLYlD+It17cC3sJvAq/S0Gv1S1WEFTu/+UGfCo
 2P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4aV/4xV/ig2NoVGwRbz52hVy5ipHB7VjPt5+Dk4L1M4=;
 b=Rd1p90NSKivnxtjIg1P5fwINDZ9VGfPXnFAjS6f7RKzyX8fbTs0rTbLtpmscb41x99
 +mIbV+JuseNgOyb1LAadm6d8C++prCluWKgnP9IieutOJ0oa/YCPJ91OB8q/XZ39NGHF
 c0gbviwspM0gA2V8XxncktXjJo0SUAXZcMZS158ZXrd3Rle6DZ7MvKRTl7vwO4T/xXav
 G4Wr7QjgYi9QH2Qw8OIoLXJ+RfdQK2USNN+TG13z6JwIjVhC4v24vDsu9Vmf4n4A45cz
 +H0Uj5XfirQ/DxaZTBcCbJ5bIzAmpdjwi1bBmUoMXj2s90frL+3WjtmQaKPmgGf9irsI
 KhdA==
X-Gm-Message-State: AA+aEWYnOIQ2qlzKQa9/m1dNs5it2ddCfVYyA3OaNQVuncFvLgVXMUPQ
 +LJJA7KFTA9xaezq5ISlsPXPMU4m9KnlfoFDLXc9ygGO
X-Google-Smtp-Source: AFSGD/X3jf8D7zho+kUjhlOkoguMJhpElzPTLIdb1Xw65zqEim9ve3DdEJ7Mzl6uqUfTsUGrAJQGpoLdleIA3OR1LAI=
X-Received: by 2002:a37:50c4:: with SMTP id e187mr9814161qkb.276.1543697827553; 
 Sat, 01 Dec 2018 12:57:07 -0800 (PST)
MIME-Version: 1.0
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Sat, 1 Dec 2018 22:56:55 +0200
Message-ID: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
Subject: Build fails on Debian, kernel 4.20.0-rc4
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5165460003358005558=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5165460003358005558==
Content-Type: multipart/alternative; boundary="000000000000a6e4eb057bfc28de"

--000000000000a6e4eb057bfc28de
Content-Type: text/plain; charset="UTF-8"

Hi,
The wireguard module (0.0.20181119 from Debian Unstable) fails to build on
my machine using kernel 4.20 rc4.

I get the following errors:

# cat /var/lib/dkms/wireguard/0.0.20181119/build/make.log
> DKMS make.log for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)
> Sat Dec  1 22:51:18 EET 2018
> make: Entering directory '/usr/src/linux-headers-4.20.0-rc4'
>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/main.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/noise.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/device.o
>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/peer.o
> Assembler messages:
> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
> directory
> make[1]: *** [scripts/Makefile.build:293:
> /var/lib/dkms/wireguard/0.0.20181119/build/main.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Assembler messages:
> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
> directory
> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
> `lock_prefix xaddq %rax,peer_counter(%rip)'
> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
> `lock_prefix orb $32,1592(%rbx)'
> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
> `lock_prefix andb $-2,1592(%rbx)'
> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
> `lock_prefix andb $-9,1592(%rbx)'
> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
> `static_branch_nop l_yes=".L15"key="descriptor.66338+40"branch="0"'
> ./include/linux/netdevice.h:515: Error: no such instruction: `asm_bug
> ins=".byte 0x0f, 0x0b"file=.LC0 line=515 flags=0 size=12'
> ./include/linux/netdevice.h:515: Error: no such instruction:
> `annotate_unreachable counter=80'
> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
> `lock_prefix cmpxchgl %ecx,(%rdx)'
> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
> `refcount_error counter="(%rdx)"'
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 1528(%rbx)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="1528(%rbx)"'
> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
> `static_branch_nop l_yes=".L61"key="descriptor.66372+40"branch="0"'
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 1528(%rdi)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="1528(%rdi)"'
> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
> `static_branch_nop l_yes=".L80"key="descriptor.66372+40"branch="0"'
> Assembler messages:
> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
> directory
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 4(%rdi)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="4(%rdi)"'
> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
> `static_branch_nop l_yes=".L6"key="descriptor.67356+40"branch="0"'
> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
> `static_branch_nop l_yes=".L32"key="descriptor.67420+40"branch="0"'
> ./arch/x86/include/asm/refcount.h:65: Error: no such instruction:
> `lock_prefix incl 4(%rdi)'
> ./arch/x86/include/asm/refcount.h:66: Error: no such instruction:
> `refcount_check_lt_zero counter="4(%rdi)"'
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 4(%rdi)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="4(%rdi)"'
> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
> instruction: `asm_bug ins=".byte 0x0f, 0x0b"file=.LC7 line=404 flags=2305
> size=12'
> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
> instruction: `annotate_reachable counter=163'
> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
> `lock_prefix orb $32,328(%rax)'
> make[1]: *** [scripts/Makefile.build:293:
> /var/lib/dkms/wireguard/0.0.20181119/build/peer.o] Error 1
> make[1]: *** [scripts/Makefile.build:293:
> /var/lib/dkms/wireguard/0.0.20181119/build/device.o] Error 1
> Assembler messages:
> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
> directory
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 680(%rbx)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="680(%rbx)"'
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 680(%rbx)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="680(%rbx)"'
> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
> `lock_prefix cmpxchgl %ecx,(%rdx)'
> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
> `refcount_error counter="(%rdx)"'
> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
> `lock_prefix decl 680(%rbx)'
> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
> `refcount_check_lt_zero counter="680(%rbx)"'
> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
> `lock_prefix xaddq %rax,keypair_counter(%rip)'
> make[1]: *** [scripts/Makefile.build:293:
> /var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1
> make: *** [Makefile:1565:
> _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2
> make: Leaving directory '/usr/src/linux-headers-4.20.0-rc4'
>
>

--000000000000a6e4eb057bfc28de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div>The w=
ireguard module (0.0.20181119 from Debian Unstable) fails to build on my ma=
chine using kernel 4.20 rc4. <br></div><div><br></div><div>I get the follow=
ing errors:</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div># cat /var/lib/dkms/wireguard/0.0.20181119/build/make.log<br>DK=
MS make.log for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)<br>Sa=
t Dec=C2=A0 1 22:51:18 EET 2018<br>make: Entering directory &#39;/usr/src/l=
inux-headers-4.20.0-rc4&#39;<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard=
/0.0.20181119/build/main.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0=
.0.20181119/build/noise.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.=
0.20181119/build/device.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.=
0.20181119/build/peer.o<br>Assembler messages:<br>Error: can&#39;t open arc=
h/x86/kernel/macros.s for reading: No such file or directory<br>make[1]: **=
* [scripts/Makefile.build:293: /var/lib/dkms/wireguard/0.0.20181119/build/m=
ain.o] Error 1<br>make[1]: *** Waiting for unfinished jobs....<br>Assembler=
 messages:<br>Error: can&#39;t open arch/x86/kernel/macros.s for reading: N=
o such file or directory<br>./arch/x86/include/asm/atomic64_64.h:160: Error=
: no such instruction: `lock_prefix xaddq %rax,peer_counter(%rip)&#39;<br>.=
/arch/x86/include/asm/bitops.h:76: Error: no such instruction: `lock_prefix=
 orb $32,1592(%rbx)&#39;<br>./arch/x86/include/asm/bitops.h:114: Error: no =
such instruction: `lock_prefix andb $-2,1592(%rbx)&#39;<br>./arch/x86/inclu=
de/asm/bitops.h:114: Error: no such instruction: `lock_prefix andb $-9,1592=
(%rbx)&#39;<br>./arch/x86/include/asm/jump_label.h:23: Error: no such instr=
uction: `static_branch_nop l_yes=3D&quot;.L15&quot;key=3D&quot;descriptor.6=
6338+40&quot;branch=3D&quot;0&quot;&#39;<br>./include/linux/netdevice.h:515=
: Error: no such instruction: `asm_bug ins=3D&quot;.byte 0x0f, 0x0b&quot;fi=
le=3D.LC0 line=3D515 flags=3D0 size=3D12&#39;<br>./include/linux/netdevice.=
h:515: Error: no such instruction: `annotate_unreachable counter=3D80&#39;<=
br>./arch/x86/include/asm/atomic.h:200: Error: no such instruction: `lock_p=
refix cmpxchgl %ecx,(%rdx)&#39;<br>./arch/x86/include/asm/refcount.h:109: E=
rror: no such instruction: `refcount_error counter=3D&quot;(%rdx)&quot;&#39=
;<br>./arch/x86/include/asm/refcount.h:90: Error: no such instruction: `loc=
k_prefix decl 1528(%rbx)&#39;<br>./arch/x86/include/asm/refcount.h:91: Erro=
r: no such instruction: `refcount_check_lt_zero counter=3D&quot;1528(%rbx)&=
quot;&#39;<br>./arch/x86/include/asm/jump_label.h:23: Error: no such instru=
ction: `static_branch_nop l_yes=3D&quot;.L61&quot;key=3D&quot;descriptor.66=
372+40&quot;branch=3D&quot;0&quot;&#39;<br>./arch/x86/include/asm/refcount.=
h:90: Error: no such instruction: `lock_prefix decl 1528(%rdi)&#39;<br>./ar=
ch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_che=
ck_lt_zero counter=3D&quot;1528(%rdi)&quot;&#39;<br>./arch/x86/include/asm/=
jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=3D&qu=
ot;.L80&quot;key=3D&quot;descriptor.66372+40&quot;branch=3D&quot;0&quot;&#3=
9;<br>Assembler messages:<br>Error: can&#39;t open arch/x86/kernel/macros.s=
 for reading: No such file or directory<br>./arch/x86/include/asm/refcount.=
h:90: Error: no such instruction: `lock_prefix decl 4(%rdi)&#39;<br>./arch/=
x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_=
lt_zero counter=3D&quot;4(%rdi)&quot;&#39;<br>./arch/x86/include/asm/jump_l=
abel.h:23: Error: no such instruction: `static_branch_nop l_yes=3D&quot;.L6=
&quot;key=3D&quot;descriptor.67356+40&quot;branch=3D&quot;0&quot;&#39;<br>.=
/arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_=
branch_nop l_yes=3D&quot;.L32&quot;key=3D&quot;descriptor.67420+40&quot;bra=
nch=3D&quot;0&quot;&#39;<br>./arch/x86/include/asm/refcount.h:65: Error: no=
 such instruction: `lock_prefix incl 4(%rdi)&#39;<br>./arch/x86/include/asm=
/refcount.h:66: Error: no such instruction: `refcount_check_lt_zero counter=
=3D&quot;4(%rdi)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: Error:=
 no such instruction: `lock_prefix decl 4(%rdi)&#39;<br>./arch/x86/include/=
asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero coun=
ter=3D&quot;4(%rdi)&quot;&#39;<br>/var/lib/dkms/wireguard/0.0.20181119/buil=
d/device.c:404: Error: no such instruction: `asm_bug ins=3D&quot;.byte 0x0f=
, 0x0b&quot;file=3D.LC7 line=3D404 flags=3D2305 size=3D12&#39;<br>/var/lib/=
dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such instruction:=
 `annotate_reachable counter=3D163&#39;<br>./arch/x86/include/asm/bitops.h:=
76: Error: no such instruction: `lock_prefix orb $32,328(%rax)&#39;<br>make=
[1]: *** [scripts/Makefile.build:293: /var/lib/dkms/wireguard/0.0.20181119/=
build/peer.o] Error 1<br>make[1]: *** [scripts/Makefile.build:293: /var/lib=
/dkms/wireguard/0.0.20181119/build/device.o] Error 1<br>Assembler messages:=
<br>Error: can&#39;t open arch/x86/kernel/macros.s for reading: No such fil=
e or directory<br>./arch/x86/include/asm/refcount.h:90: Error: no such inst=
ruction: `lock_prefix decl 680(%rbx)&#39;<br>./arch/x86/include/asm/refcoun=
t.h:91: Error: no such instruction: `refcount_check_lt_zero counter=3D&quot=
;680(%rbx)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: Error: no su=
ch instruction: `lock_prefix decl 680(%rbx)&#39;<br>./arch/x86/include/asm/=
refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter=
=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/asm/atomic.h:200: Error=
: no such instruction: `lock_prefix cmpxchgl %ecx,(%rdx)&#39;<br>./arch/x86=
/include/asm/refcount.h:109: Error: no such instruction: `refcount_error co=
unter=3D&quot;(%rdx)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: Er=
ror: no such instruction: `lock_prefix decl 680(%rbx)&#39;<br>./arch/x86/in=
clude/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zer=
o counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/asm/atomic64_6=
4.h:160: Error: no such instruction: `lock_prefix xaddq %rax,keypair_counte=
r(%rip)&#39;<br>make[1]: *** [scripts/Makefile.build:293: /var/lib/dkms/wir=
eguard/0.0.20181119/build/noise.o] Error 1<br>make: *** [Makefile:1565: _mo=
dule_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2<br>make: Leaving d=
irectory &#39;/usr/src/linux-headers-4.20.0-rc4&#39;<br><br></div></blockqu=
ote><div><br></div><div><br></div></div></div></div>

--000000000000a6e4eb057bfc28de--

--===============5165460003358005558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5165460003358005558==--

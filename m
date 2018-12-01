Return-Path: <SRS0=I+33=OK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B22C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 23:26:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FDC2081D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 23:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKR/aJb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9FDC2081D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7585768b;
	Sat, 1 Dec 2018 23:19:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba3f68c9
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 23:19:09 +0000 (UTC)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be24df02
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 23:19:09 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id x1so5475795vsc.10
 for <wireguard@lists.zx2c4.com>; Sat, 01 Dec 2018 15:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmx6hRwxnSrNYrMcJUzy5+/8XaXhzOPibS2kXqa9Ig4=;
 b=WKR/aJb9pzg3PejNpWAKgsa+JFdiOERLlspBqJi1TxL5FjNs9UxtEvZM9xlRQaQQJ0
 5VUfOb/O18mA5fJN8ltOK4QU6u7PDcbN7z1EQgh4z+pkBt4zDh/qDw+ii6pXudjJrqOk
 2BpkaieO5zAWHsBMBHsZ9CFIw1vswAETh/LzjLY1m4EI4un7ArfKKZqEReVEzslER7zv
 hiaUh0ByASr1PNKe5duLk5v8eITFhP4oW1TvHiwTXpkGEJauzrZUl4h4+tBKnZUiEXD5
 3Y+QkNZD9pcWyA0SVxahyxS13RL6qDfJIvzU+CLW3n/UpSgHdYqbEv0G9efBVgGagMxQ
 BrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmx6hRwxnSrNYrMcJUzy5+/8XaXhzOPibS2kXqa9Ig4=;
 b=kW4515W0ljkuG/P97VsKoZXOz0+i1PFRq9Gzx/kIsOIDHSGKts+0ZUTNC5lEMZYaI3
 tEWQvaf0wMojOwMA7SwTqWFlEhxJUgdw5zxZsWCZqbgA0DZmgZNdGK8NFG2Zdk22umJI
 3o6gCYL/n5bCeiTaKJc6HjyN2X3ucT5XPQ/Vh4+1sN+Q8r75Qhr6074qnH1gTZ1+gA+y
 oa3UupT/vfXVg/5G5xmAs8cH5HGcxZNhxMMDZvWY2P5F4JBweTBVWpRblCN9E2/HoTIZ
 zzjShTpg8OYkU0PSOSppZvXt0dBXzINbeh4hmEIJi5f6Dz+mA7NFnsvwdbxWRbT+Off8
 lYBg==
X-Gm-Message-State: AA+aEWZiDC3SWw2wQQEL5AazpiWBKFLiQnWVZqTzlKOO6UZBYXuJW+XK
 lqejQYP2QL3yhelUP8PP7IhrOVTmUJH51AQ4VTk=
X-Google-Smtp-Source: AFSGD/UHO+JI2sr7s0KKQr/8YX0bv0PvpLvvfE8tFuyg4t+seEgVClXKnn0Gfq0psJu2X3SwvWx8POMAVUYXm2XZ0JM=
X-Received: by 2002:a67:3c5c:: with SMTP id j89mr4728203vsa.117.1543706802735; 
 Sat, 01 Dec 2018 15:26:42 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
 <dsoqviekeu6evb7laiisjpi0.1543698163154@gmail.com>
 <CANcuY=pCONP7Xy8hXmJfczeszwnLOmmbWagOOE19iYpEinXV2g@mail.gmail.com>
In-Reply-To: <CANcuY=pCONP7Xy8hXmJfczeszwnLOmmbWagOOE19iYpEinXV2g@mail.gmail.com>
From: Tushar Pankaj <tushar.s.pankaj@gmail.com>
Date: Sat, 1 Dec 2018 17:26:31 -0600
Message-ID: <CANO=1y+bnK7Hr_rDJOovxsq38ZVYNO67gvCGVu3E3pTrwBzC3g@mail.gmail.com>
Subject: Re: Build fails on Debian, kernel 4.20.0-rc4
To: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============0821856801919123320=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0821856801919123320==
Content-Type: multipart/alternative; boundary="0000000000009d4dcb057bfe3f3c"

--0000000000009d4dcb057bfe3f3c
Content-Type: text/plain; charset="UTF-8"

Does it have to do with macros.S having a capital S extension?

Thanks,
Tushar Pankaj

On Sat, Dec 1, 2018, 17:24 Laszlo KERTESZ <laszlo.kertesz@gmail.com wrote:

> Hi,
> It builds with 4.19.x. What happened to 4.20?
> On the Fedore bug tracker there is something related:
>
>
> https://src.fedoraproject.org/cgit/rpms/kernel.git/commit/?id=6904e708917a12819d1fe0d329f605030d6e4b0d
>
> On Sat, Dec 1, 2018 at 11:03 PM QINGWEI ZHANG <qzhang.canada@gmail.com>
> wrote:
>
>> This kernel is the latest one, could you try with 4.19?
>>
>> Sent via the BlackBerry Hub for Android
>> <http://play.google.com/store/apps/details?id=com.blackberry.hub>
>> *From:* laszlo.kertesz@gmail.com
>> *Sent:* December 1, 2018 15:58
>> *To:* wireguard@lists.zx2c4.com
>> *Subject:* Build fails on Debian, kernel 4.20.0-rc4
>>
>> Hi,
>> The wireguard module (0.0.20181119 from Debian Unstable) fails to build
>> on my machine using kernel 4.20 rc4.
>>
>> I get the following errors:
>>
>> # cat /var/lib/dkms/wireguard/0.0.20181119/build/make.log
>>> DKMS make.log for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)
>>> Sat Dec  1 22:51:18 EET 2018
>>> make: Entering directory '/usr/src/linux-headers-4.20.0-rc4'
>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/main.o
>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/noise.o
>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/device.o
>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/peer.o
>>> Assembler messages:
>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>> directory
>>> make[1]: *** [scripts/Makefile.build:293:
>>> /var/lib/dkms/wireguard/0.0.20181119/build/main.o] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> Assembler messages:
>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>> directory
>>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
>>> `lock_prefix xaddq %rax,peer_counter(%rip)'
>>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
>>> `lock_prefix orb $32,1592(%rbx)'
>>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
>>> `lock_prefix andb $-2,1592(%rbx)'
>>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
>>> `lock_prefix andb $-9,1592(%rbx)'
>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>> `static_branch_nop l_yes=".L15"key="descriptor.66338+40"branch="0"'
>>> ./include/linux/netdevice.h:515: Error: no such instruction: `asm_bug
>>> ins=".byte 0x0f, 0x0b"file=.LC0 line=515 flags=0 size=12'
>>> ./include/linux/netdevice.h:515: Error: no such instruction:
>>> `annotate_unreachable counter=80'
>>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
>>> `lock_prefix cmpxchgl %ecx,(%rdx)'
>>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
>>> `refcount_error counter="(%rdx)"'
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 1528(%rbx)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="1528(%rbx)"'
>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>> `static_branch_nop l_yes=".L61"key="descriptor.66372+40"branch="0"'
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 1528(%rdi)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="1528(%rdi)"'
>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>> `static_branch_nop l_yes=".L80"key="descriptor.66372+40"branch="0"'
>>> Assembler messages:
>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>> directory
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 4(%rdi)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="4(%rdi)"'
>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>> `static_branch_nop l_yes=".L6"key="descriptor.67356+40"branch="0"'
>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>> `static_branch_nop l_yes=".L32"key="descriptor.67420+40"branch="0"'
>>> ./arch/x86/include/asm/refcount.h:65: Error: no such instruction:
>>> `lock_prefix incl 4(%rdi)'
>>> ./arch/x86/include/asm/refcount.h:66: Error: no such instruction:
>>> `refcount_check_lt_zero counter="4(%rdi)"'
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 4(%rdi)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="4(%rdi)"'
>>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
>>> instruction: `asm_bug ins=".byte 0x0f, 0x0b"file=.LC7 line=404 flags=2305
>>> size=12'
>>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
>>> instruction: `annotate_reachable counter=163'
>>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
>>> `lock_prefix orb $32,328(%rax)'
>>> make[1]: *** [scripts/Makefile.build:293:
>>> /var/lib/dkms/wireguard/0.0.20181119/build/peer.o] Error 1
>>> make[1]: *** [scripts/Makefile.build:293:
>>> /var/lib/dkms/wireguard/0.0.20181119/build/device.o] Error 1
>>> Assembler messages:
>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>> directory
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 680(%rbx)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="680(%rbx)"'
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 680(%rbx)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="680(%rbx)"'
>>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
>>> `lock_prefix cmpxchgl %ecx,(%rdx)'
>>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
>>> `refcount_error counter="(%rdx)"'
>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>> `lock_prefix decl 680(%rbx)'
>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>> `refcount_check_lt_zero counter="680(%rbx)"'
>>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
>>> `lock_prefix xaddq %rax,keypair_counter(%rip)'
>>> make[1]: *** [scripts/Makefile.build:293:
>>> /var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1
>>> make: *** [Makefile:1565:
>>> _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2
>>> make: Leaving directory '/usr/src/linux-headers-4.20.0-rc4'
>>>
>>>
>>
>> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000009d4dcb057bfe3f3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Does it have to do with macros.S having a capital S exten=
sion?<br><br><div data-smartmail=3D"gmail_signature">Thanks,<br>Tushar Pank=
aj</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Dec 1=
, 2018, 17:24 Laszlo KERTESZ &lt;<a href=3D"mailto:laszlo.kertesz@gmail.com=
">laszlo.kertesz@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,<br></div><div>It builds with =
4.19.x. What happened to 4.20? <br></div><div>On the Fedore bug tracker the=
re is something related:</div><div><br></div><div><a href=3D"https://src.fe=
doraproject.org/cgit/rpms/kernel.git/commit/?id=3D6904e708917a12819d1fe0d32=
9f605030d6e4b0d" target=3D"_blank" rel=3D"noreferrer">https://src.fedorapro=
ject.org/cgit/rpms/kernel.git/commit/?id=3D6904e708917a12819d1fe0d329f60503=
0d6e4b0d</a><br></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Sat, Dec 1, 2018 at 11:03 PM QINGWEI ZHANG &lt;<a href=3D"mailt=
o:qzhang.canada@gmail.com" target=3D"_blank" rel=3D"noreferrer">qzhang.cana=
da@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div st=
yle=3D"background-color:rgb(255,255,255);background-image:initial;line-heig=
ht:initial"><div id=3D"m_-1194933585637765609m_5093046255808516082response_=
container_BBPPID" style=3D"outline:none" dir=3D"auto"> <div name=3D"BB10" i=
d=3D"m_-1194933585637765609m_5093046255808516082BB10_response_div_BBPPID" d=
ir=3D"auto" style=3D"width:100%"> This kernel is the latest one, could you =
try with 4.19?</div>                                                       =
                                                                           =
    <div name=3D"BB10" id=3D"m_-1194933585637765609m_5093046255808516082res=
ponse_div_spacer_BBPPID" dir=3D"auto" style=3D"width:100%"> <br style=3D"di=
splay:initial"></div>                            <div id=3D"m_-119493358563=
7765609m_5093046255808516082blackberry_signature_BBPPID" name=3D"BB10" dir=
=3D"auto">     <div id=3D"m_-1194933585637765609m_5093046255808516082_signa=
turePlaceholder_BBPPID" name=3D"BB10" dir=3D"auto">Sent via the <a href=3D"=
http://play.google.com/store/apps/details?id=3Dcom.blackberry.hub" target=
=3D"_blank" rel=3D"noreferrer">BlackBerry Hub for Android</a></div> </div><=
/div><div id=3D"m_-1194933585637765609m_5093046255808516082_original_msg_he=
ader_BBPPID" dir=3D"auto">                                                 =
                                                                           =
                 <table width=3D"100%" style=3D"background-color:white;bord=
er-spacing:0px;display:table;outline:none"><tbody><tr><td colspan=3D"2" sty=
le=3D"padding:initial;font-size:initial;text-align:initial;background-color=
:rgb(255,255,255)">                           <div style=3D"border-right:no=
ne;border-bottom:none;border-left:none;border-top:1pt solid rgb(181,196,223=
);padding:3pt 0in 0in;font-family:Tahoma,&quot;BB Alpha Sans&quot;,&quot;Sl=
ate Pro&quot;;font-size:10pt">  <div id=3D"m_-1194933585637765609m_50930462=
55808516082from"><b>From:</b> <a href=3D"mailto:laszlo.kertesz@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">laszlo.kertesz@gmail.com</a></div><div =
id=3D"m_-1194933585637765609m_5093046255808516082sent"><b>Sent:</b> Decembe=
r 1, 2018 15:58</div><div id=3D"m_-1194933585637765609m_5093046255808516082=
to"><b>To:</b> <a href=3D"mailto:wireguard@lists.zx2c4.com" target=3D"_blan=
k" rel=3D"noreferrer">wireguard@lists.zx2c4.com</a></div><div id=3D"m_-1194=
933585637765609m_5093046255808516082subject"><b>Subject:</b> Build fails on=
 Debian, kernel 4.20.0-rc4</div></div></td></tr></tbody></table> <br> </div=
><div name=3D"BB10" dir=3D"auto" style=3D"background-image:initial;line-hei=
ght:initial;outline:none"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Hi,</div><div>The wireguard module (0.0.20181119 from Debian Unstabl=
e) fails to build on my machine using kernel 4.20 rc4. <br></div><div><br><=
/div><div>I get the following errors:</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div># cat /var/lib/dkms/wireguard/0.0.201=
81119/build/<a href=3D"http://make.log" target=3D"_blank" rel=3D"noreferrer=
">make.log</a><br>DKMS <a href=3D"http://make.log" target=3D"_blank" rel=3D=
"noreferrer">make.log</a> for wireguard-0.0.20181119 for kernel 4.20.0-rc4 =
(x86_64)<br>Sat Dec=C2=A0 1 22:51:18 EET 2018<br>make: Entering directory &=
#39;/usr/src/linux-headers-4.20.0-rc4&#39;<br>=C2=A0 CC [M]=C2=A0 /var/lib/=
dkms/wireguard/0.0.20181119/build/main.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dk=
ms/wireguard/0.0.20181119/build/noise.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkm=
s/wireguard/0.0.20181119/build/device.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkm=
s/wireguard/0.0.20181119/build/peer.o<br>Assembler messages:<br>Error: can&=
#39;t open arch/x86/kernel/macros.s for reading: No such file or directory<=
br>make[1]: *** [scripts/<a href=3D"http://Makefile.build:293" target=3D"_b=
lank" rel=3D"noreferrer">Makefile.build:293</a>: /var/lib/dkms/wireguard/0.=
0.20181119/build/main.o] Error 1<br>make[1]: *** Waiting for unfinished job=
s....<br>Assembler messages:<br>Error: can&#39;t open arch/x86/kernel/macro=
s.s for reading: No such file or directory<br>./arch/x86/include/asm/atomic=
64_64.h:160: Error: no such instruction: `lock_prefix xaddq %rax,peer_count=
er(%rip)&#39;<br>./arch/x86/include/asm/bitops.h:76: Error: no such instruc=
tion: `lock_prefix orb $32,1592(%rbx)&#39;<br>./arch/x86/include/asm/bitops=
.h:114: Error: no such instruction: `lock_prefix andb $-2,1592(%rbx)&#39;<b=
r>./arch/x86/include/asm/bitops.h:114: Error: no such instruction: `lock_pr=
efix andb $-9,1592(%rbx)&#39;<br>./arch/x86/include/asm/jump_label.h:23: Er=
ror: no such instruction: `static_branch_nop l_yes=3D&quot;.L15&quot;key=3D=
&quot;descriptor.66338+40&quot;branch=3D&quot;0&quot;&#39;<br>./include/lin=
ux/netdevice.h:515: Error: no such instruction: `asm_bug ins=3D&quot;.byte =
0x0f, 0x0b&quot;file=3D.LC0 line=3D515 flags=3D0 size=3D12&#39;<br>./includ=
e/linux/netdevice.h:515: Error: no such instruction: `annotate_unreachable =
counter=3D80&#39;<br>./arch/x86/include/asm/atomic.h:200: Error: no such in=
struction: `lock_prefix cmpxchgl %ecx,(%rdx)&#39;<br>./arch/x86/include/asm=
/refcount.h:109: Error: no such instruction: `refcount_error counter=3D&quo=
t;(%rdx)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: Error: no such=
 instruction: `lock_prefix decl 1528(%rbx)&#39;<br>./arch/x86/include/asm/r=
efcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter=
=3D&quot;1528(%rbx)&quot;&#39;<br>./arch/x86/include/asm/jump_label.h:23: E=
rror: no such instruction: `static_branch_nop l_yes=3D&quot;.L61&quot;key=
=3D&quot;descriptor.66372+40&quot;branch=3D&quot;0&quot;&#39;<br>./arch/x86=
/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 1=
528(%rdi)&#39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such inst=
ruction: `refcount_check_lt_zero counter=3D&quot;1528(%rdi)&quot;&#39;<br>.=
/arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_=
branch_nop l_yes=3D&quot;.L80&quot;key=3D&quot;descriptor.66372+40&quot;bra=
nch=3D&quot;0&quot;&#39;<br>Assembler messages:<br>Error: can&#39;t open ar=
ch/x86/kernel/macros.s for reading: No such file or directory<br>./arch/x86=
/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 4=
(%rdi)&#39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such instruc=
tion: `refcount_check_lt_zero counter=3D&quot;4(%rdi)&quot;&#39;<br>./arch/=
x86/include/asm/jump_label.h:23: Error: no such instruction: `static_branch=
_nop l_yes=3D&quot;.L6&quot;key=3D&quot;descriptor.67356+40&quot;branch=3D&=
quot;0&quot;&#39;<br>./arch/x86/include/asm/jump_label.h:23: Error: no such=
 instruction: `static_branch_nop l_yes=3D&quot;.L32&quot;key=3D&quot;descri=
ptor.67420+40&quot;branch=3D&quot;0&quot;&#39;<br>./arch/x86/include/asm/re=
fcount.h:65: Error: no such instruction: `lock_prefix incl 4(%rdi)&#39;<br>=
./arch/x86/include/asm/refcount.h:66: Error: no such instruction: `refcount=
_check_lt_zero counter=3D&quot;4(%rdi)&quot;&#39;<br>./arch/x86/include/asm=
/refcount.h:90: Error: no such instruction: `lock_prefix decl 4(%rdi)&#39;<=
br>./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refco=
unt_check_lt_zero counter=3D&quot;4(%rdi)&quot;&#39;<br>/var/lib/dkms/wireg=
uard/0.0.20181119/build/device.c:404: Error: no such instruction: `asm_bug =
ins=3D&quot;.byte 0x0f, 0x0b&quot;file=3D.LC7 line=3D404 flags=3D2305 size=
=3D12&#39;<br>/var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Erro=
r: no such instruction: `annotate_reachable counter=3D163&#39;<br>./arch/x8=
6/include/asm/bitops.h:76: Error: no such instruction: `lock_prefix orb $32=
,328(%rax)&#39;<br>make[1]: *** [scripts/<a href=3D"http://Makefile.build:2=
93" target=3D"_blank" rel=3D"noreferrer">Makefile.build:293</a>: /var/lib/d=
kms/wireguard/0.0.20181119/build/peer.o] Error 1<br>make[1]: *** [scripts/<=
a href=3D"http://Makefile.build:293" target=3D"_blank" rel=3D"noreferrer">M=
akefile.build:293</a>: /var/lib/dkms/wireguard/0.0.20181119/build/device.o]=
 Error 1<br>Assembler messages:<br>Error: can&#39;t open arch/x86/kernel/ma=
cros.s for reading: No such file or directory<br>./arch/x86/include/asm/ref=
count.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)&#39;<br=
>./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcoun=
t_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/=
asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)&=
#39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `=
refcount_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/i=
nclude/asm/atomic.h:200: Error: no such instruction: `lock_prefix cmpxchgl =
%ecx,(%rdx)&#39;<br>./arch/x86/include/asm/refcount.h:109: Error: no such i=
nstruction: `refcount_error counter=3D&quot;(%rdx)&quot;&#39;<br>./arch/x86=
/include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 6=
80(%rbx)&#39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such instr=
uction: `refcount_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./a=
rch/x86/include/asm/atomic64_64.h:160: Error: no such instruction: `lock_pr=
efix xaddq %rax,keypair_counter(%rip)&#39;<br>make[1]: *** [scripts/<a href=
=3D"http://Makefile.build:293" target=3D"_blank" rel=3D"noreferrer">Makefil=
e.build:293</a>: /var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error =
1<br>make: *** [Makefile:1565: _module_/var/lib/dkms/wireguard/0.0.20181119=
/build] Error 2<br>make: Leaving directory &#39;/usr/src/linux-headers-4.20=
.0-rc4&#39;<br><br></div></blockquote><div><br></div><div><br></div></div><=
/div></div>
</div></div></blockquote></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000009d4dcb057bfe3f3c--

--===============0821856801919123320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0821856801919123320==--

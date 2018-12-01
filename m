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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B68C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 23:38:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD492082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 23:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIZbRVN0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD492082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06752ba5;
	Sat, 1 Dec 2018 23:31:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 044d6a01
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 23:31:10 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29b5eb31
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 23:31:10 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id a132so5373060qkg.1
 for <wireguard@lists.zx2c4.com>; Sat, 01 Dec 2018 15:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O04vFq2sDTumsUF8YWz5gwtIeVOsoqOrcHpoIkUdlCI=;
 b=bIZbRVN07iFHAIu6J8k6xn8m+hfIm/2cp5n1Hhhcdrjy8/egmUzCWK2pPAOBU8ZiZK
 JhPf3oKnYWC7b6VOP8KEnYgCYxlQY2kRYNsodqmWMkpJ4bEWgnDQu6V7TwM9NTe+U/Vf
 j3jvJlC45GoAmuqXk0CtgMVl8cUkFy87DYTTwqJR++JlPCf+sU2EAKKsNSMj/lKuaVN5
 WtE+EpeR+8nVuV27cxFqAKN6CH6I6K3DcAZtoBtxJGB+ST3KaT7zTKiuFIg7z8EzJ8hY
 x2qGoZBd1OC4WeCwOjKq/VuI+v0g7ZGLiN4VUruxRw1rQVlYYWqAlhbWhZdH90f8ajDt
 AjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O04vFq2sDTumsUF8YWz5gwtIeVOsoqOrcHpoIkUdlCI=;
 b=YvhsvJo2n9kTPVmINtLwBR9L7wbndRXKNnan5ighdF9/4dF0mZ8Cxgu16VBFIP4GD2
 Lr/SFryxw58rZWdPAu9+s4Ur2ya+3QfWP4iqZdcRajNpMnnR5+LaQtxyPJRLB6Wtdt5X
 s3pqhJqrgzGcLgpz8fAfH0hZ4C6YEiP9UQuOkxC/+o/b8ppR8Xe3npUBnzapmzK+OLcF
 50lFOYsrA1yaC9Jn/FzB0JURJ4eiLOZ00tV9LMxYsG65Yj1oav42U/WQBikajRefRcxf
 9H+UD3KsrLuqvrVHi3Ep5KAmIO6Xrs/bsk7fvhI80TVoRvjXUY90Z/CfXX9JNX27ykmA
 1Rzw==
X-Gm-Message-State: AA+aEWbZaLb7tHi9yrn5EJtvu/EYfKUx9i1zMPpdCX3G/gi9ZenWwZN2
 7EY+v/pDSWciU+CubQINo8yg9PBhO1svfNfyBhQg8nvB
X-Google-Smtp-Source: AFSGD/URqcbYhqw/yh89o4i3JrkNztcJ1V2PuJCYLADSLUDFY2VzOSkPqVTRTg0EvUZ5huR0TRy3+Kk9JpOCYrLakFE=
X-Received: by 2002:a37:9cd4:: with SMTP id
 f203mr10344092qke.155.1543707524271; 
 Sat, 01 Dec 2018 15:38:44 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
 <dsoqviekeu6evb7laiisjpi0.1543698163154@gmail.com>
 <CANcuY=pCONP7Xy8hXmJfczeszwnLOmmbWagOOE19iYpEinXV2g@mail.gmail.com>
 <CANO=1y+bnK7Hr_rDJOovxsq38ZVYNO67gvCGVu3E3pTrwBzC3g@mail.gmail.com>
In-Reply-To: <CANO=1y+bnK7Hr_rDJOovxsq38ZVYNO67gvCGVu3E3pTrwBzC3g@mail.gmail.com>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Sun, 2 Dec 2018 01:38:32 +0200
Message-ID: <CANcuY=r=6fd+1+4arDi+95+BnWAiQupkT1Zct=Osktf9J4AUcA@mail.gmail.com>
Subject: Re: Build fails on Debian, kernel 4.20.0-rc4
To: tushar.s.pankaj@gmail.com
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
Content-Type: multipart/mixed; boundary="===============4861024272184823447=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4861024272184823447==
Content-Type: multipart/alternative; boundary="0000000000009f1264057bfe6af5"

--0000000000009f1264057bfe6af5
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 2, 2018 at 1:26 AM Tushar Pankaj <tushar.s.pankaj@gmail.com>
wrote:

> Does it have to do with macros.S having a capital S extension?
>
> Thanks,
> Tushar Pankaj
>
>
Probably not. I don't have any "arch/x86/kernel/macros.s" file (actually
"/usr/src/linux-headers-4.20.0-rc4/arch/x86/kernel/macros.s") at all. In
fact neither do i have macros.s or macros.S in previous kernels directories.


> On Sat, Dec 1, 2018, 17:24 Laszlo KERTESZ <laszlo.kertesz@gmail.com wrote:
>
>> Hi,
>> It builds with 4.19.x. What happened to 4.20?
>> On the Fedore bug tracker there is something related:
>>
>>
>> https://src.fedoraproject.org/cgit/rpms/kernel.git/commit/?id=6904e708917a12819d1fe0d329f605030d6e4b0d
>>
>> On Sat, Dec 1, 2018 at 11:03 PM QINGWEI ZHANG <qzhang.canada@gmail.com>
>> wrote:
>>
>>> This kernel is the latest one, could you try with 4.19?
>>>
>>> Sent via the BlackBerry Hub for Android
>>> <http://play.google.com/store/apps/details?id=com.blackberry.hub>
>>> *From:* laszlo.kertesz@gmail.com
>>> *Sent:* December 1, 2018 15:58
>>> *To:* wireguard@lists.zx2c4.com
>>> *Subject:* Build fails on Debian, kernel 4.20.0-rc4
>>>
>>> Hi,
>>> The wireguard module (0.0.20181119 from Debian Unstable) fails to build
>>> on my machine using kernel 4.20 rc4.
>>>
>>> I get the following errors:
>>>
>>> # cat /var/lib/dkms/wireguard/0.0.20181119/build/make.log
>>>> DKMS make.log for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)
>>>> Sat Dec  1 22:51:18 EET 2018
>>>> make: Entering directory '/usr/src/linux-headers-4.20.0-rc4'
>>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/main.o
>>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/noise.o
>>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/device.o
>>>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/peer.o
>>>> Assembler messages:
>>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>>> directory
>>>> make[1]: *** [scripts/Makefile.build:293:
>>>> /var/lib/dkms/wireguard/0.0.20181119/build/main.o] Error 1
>>>> make[1]: *** Waiting for unfinished jobs....
>>>> Assembler messages:
>>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>>> directory
>>>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
>>>> `lock_prefix xaddq %rax,peer_counter(%rip)'
>>>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
>>>> `lock_prefix orb $32,1592(%rbx)'
>>>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
>>>> `lock_prefix andb $-2,1592(%rbx)'
>>>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
>>>> `lock_prefix andb $-9,1592(%rbx)'
>>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>>> `static_branch_nop l_yes=".L15"key="descriptor.66338+40"branch="0"'
>>>> ./include/linux/netdevice.h:515: Error: no such instruction: `asm_bug
>>>> ins=".byte 0x0f, 0x0b"file=.LC0 line=515 flags=0 size=12'
>>>> ./include/linux/netdevice.h:515: Error: no such instruction:
>>>> `annotate_unreachable counter=80'
>>>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
>>>> `lock_prefix cmpxchgl %ecx,(%rdx)'
>>>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
>>>> `refcount_error counter="(%rdx)"'
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 1528(%rbx)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="1528(%rbx)"'
>>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>>> `static_branch_nop l_yes=".L61"key="descriptor.66372+40"branch="0"'
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 1528(%rdi)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="1528(%rdi)"'
>>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>>> `static_branch_nop l_yes=".L80"key="descriptor.66372+40"branch="0"'
>>>> Assembler messages:
>>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>>> directory
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 4(%rdi)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="4(%rdi)"'
>>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>>> `static_branch_nop l_yes=".L6"key="descriptor.67356+40"branch="0"'
>>>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>>>> `static_branch_nop l_yes=".L32"key="descriptor.67420+40"branch="0"'
>>>> ./arch/x86/include/asm/refcount.h:65: Error: no such instruction:
>>>> `lock_prefix incl 4(%rdi)'
>>>> ./arch/x86/include/asm/refcount.h:66: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="4(%rdi)"'
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 4(%rdi)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="4(%rdi)"'
>>>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
>>>> instruction: `asm_bug ins=".byte 0x0f, 0x0b"file=.LC7 line=404 flags=2305
>>>> size=12'
>>>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
>>>> instruction: `annotate_reachable counter=163'
>>>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
>>>> `lock_prefix orb $32,328(%rax)'
>>>> make[1]: *** [scripts/Makefile.build:293:
>>>> /var/lib/dkms/wireguard/0.0.20181119/build/peer.o] Error 1
>>>> make[1]: *** [scripts/Makefile.build:293:
>>>> /var/lib/dkms/wireguard/0.0.20181119/build/device.o] Error 1
>>>> Assembler messages:
>>>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>>>> directory
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 680(%rbx)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="680(%rbx)"'
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 680(%rbx)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="680(%rbx)"'
>>>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
>>>> `lock_prefix cmpxchgl %ecx,(%rdx)'
>>>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
>>>> `refcount_error counter="(%rdx)"'
>>>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>>>> `lock_prefix decl 680(%rbx)'
>>>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>>>> `refcount_check_lt_zero counter="680(%rbx)"'
>>>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
>>>> `lock_prefix xaddq %rax,keypair_counter(%rip)'
>>>> make[1]: *** [scripts/Makefile.build:293:
>>>> /var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1
>>>> make: *** [Makefile:1565:
>>>> _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2
>>>> make: Leaving directory '/usr/src/linux-headers-4.20.0-rc4'
>>>>
>>>>
>>>
>>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--0000000000009f1264057bfe6af5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Sun, Dec 2, 2018 at 1:26 AM Tushar Pankaj &l=
t;<a href=3D"mailto:tushar.s.pankaj@gmail.com">tushar.s.pankaj@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"auto">Does it have to do with macros.S having a capital S extensio=
n?<br><br><div>Thanks,<br>Tushar Pankaj</div></div><br></blockquote><div><b=
r></div><div>Probably not. I don&#39;t have any &quot;arch/x86/kernel/macro=
s.s&quot; file (actually &quot;/usr/src/linux-headers-4.20.0-rc4/arch/x86/k=
ernel/macros.s&quot;) at all. In fact neither do i have macros.s or macros.=
S in previous kernels directories.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Sat, Dec 1, 2018, 17:24 Laszlo KERTESZ &lt;<a href=3D"mailto:laszlo=
.kertesz@gmail.com" target=3D"_blank">laszlo.kertesz@gmail.com</a> wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><div>Hi,<br></div><div>It builds with 4.19.x. What happene=
d to 4.20? <br></div><div>On the Fedore bug tracker there is something rela=
ted:</div><div><br></div><div><a href=3D"https://src.fedoraproject.org/cgit=
/rpms/kernel.git/commit/?id=3D6904e708917a12819d1fe0d329f605030d6e4b0d" rel=
=3D"noreferrer" target=3D"_blank">https://src.fedoraproject.org/cgit/rpms/k=
ernel.git/commit/?id=3D6904e708917a12819d1fe0d329f605030d6e4b0d</a><br></di=
v></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Dec 1=
, 2018 at 11:03 PM QINGWEI ZHANG &lt;<a href=3D"mailto:qzhang.canada@gmail.=
com" rel=3D"noreferrer" target=3D"_blank">qzhang.canada@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=
=3D"background-color:rgb(255,255,255);background-image:initial;line-height:=
initial"><div id=3D"gmail-m_-1362399965051979972m_-1194933585637765609m_509=
3046255808516082response_container_BBPPID" style=3D"outline:currentcolor no=
ne medium" dir=3D"auto"> <div name=3D"BB10" id=3D"gmail-m_-1362399965051979=
972m_-1194933585637765609m_5093046255808516082BB10_response_div_BBPPID" dir=
=3D"auto" style=3D"width:100%"> This kernel is the latest one, could you tr=
y with 4.19?</div>                                                         =
                                                                           =
  <div name=3D"BB10" id=3D"gmail-m_-1362399965051979972m_-11949335856377656=
09m_5093046255808516082response_div_spacer_BBPPID" dir=3D"auto" style=3D"wi=
dth:100%"> <br style=3D"display:initial"></div>                            =
<div id=3D"gmail-m_-1362399965051979972m_-1194933585637765609m_509304625580=
8516082blackberry_signature_BBPPID" name=3D"BB10" dir=3D"auto">     <div id=
=3D"gmail-m_-1362399965051979972m_-1194933585637765609m_5093046255808516082=
_signaturePlaceholder_BBPPID" name=3D"BB10" dir=3D"auto">Sent via the <a hr=
ef=3D"http://play.google.com/store/apps/details?id=3Dcom.blackberry.hub" re=
l=3D"noreferrer" target=3D"_blank">BlackBerry Hub for Android</a></div> </d=
iv></div><div id=3D"gmail-m_-1362399965051979972m_-1194933585637765609m_509=
3046255808516082_original_msg_header_BBPPID" dir=3D"auto">                 =
                                                                           =
                                                 <table style=3D"background=
-color:white;border-spacing:0px;display:table;outline:currentcolor none med=
ium" width=3D"100%"><tbody><tr><td colspan=3D"2" style=3D"padding:initial;f=
ont-size:initial;text-align:initial;background-color:rgb(255,255,255)">    =
                       <div style=3D"border-color:rgb(181,196,223) currentc=
olor currentcolor;border-style:solid none none;border-width:1pt medium medi=
um;padding:3pt 0in 0in;font-family:Tahoma,&quot;BB Alpha Sans&quot;,&quot;S=
late Pro&quot;;font-size:10pt">  <div id=3D"gmail-m_-1362399965051979972m_-=
1194933585637765609m_5093046255808516082from"><b>From:</b> <a href=3D"mailt=
o:laszlo.kertesz@gmail.com" rel=3D"noreferrer" target=3D"_blank">laszlo.ker=
tesz@gmail.com</a></div><div id=3D"gmail-m_-1362399965051979972m_-119493358=
5637765609m_5093046255808516082sent"><b>Sent:</b> December 1, 2018 15:58</d=
iv><div id=3D"gmail-m_-1362399965051979972m_-1194933585637765609m_509304625=
5808516082to"><b>To:</b> <a href=3D"mailto:wireguard@lists.zx2c4.com" rel=
=3D"noreferrer" target=3D"_blank">wireguard@lists.zx2c4.com</a></div><div i=
d=3D"gmail-m_-1362399965051979972m_-1194933585637765609m_509304625580851608=
2subject"><b>Subject:</b> Build fails on Debian, kernel 4.20.0-rc4</div></d=
iv></td></tr></tbody></table> <br> </div><div name=3D"BB10" dir=3D"auto" st=
yle=3D"background-image:initial;line-height:initial;outline:currentcolor no=
ne medium"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div=
><div>The wireguard module (0.0.20181119 from Debian Unstable) fails to bui=
ld on my machine using kernel 4.20 rc4. <br></div><div><br></div><div>I get=
 the following errors:</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div># cat /var/lib/dkms/wireguard/0.0.20181119/build/<a =
href=3D"http://make.log" rel=3D"noreferrer" target=3D"_blank">make.log</a><=
br>DKMS <a href=3D"http://make.log" rel=3D"noreferrer" target=3D"_blank">ma=
ke.log</a> for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)<br>Sat=
 Dec=C2=A0 1 22:51:18 EET 2018<br>make: Entering directory &#39;/usr/src/li=
nux-headers-4.20.0-rc4&#39;<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/=
0.0.20181119/build/main.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.=
0.20181119/build/noise.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0=
.20181119/build/device.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0=
.20181119/build/peer.o<br>Assembler messages:<br>Error: can&#39;t open arch=
/x86/kernel/macros.s for reading: No such file or directory<br>make[1]: ***=
 [scripts/<a href=3D"http://Makefile.build:293" rel=3D"noreferrer" target=
=3D"_blank">Makefile.build:293</a>: /var/lib/dkms/wireguard/0.0.20181119/bu=
ild/main.o] Error 1<br>make[1]: *** Waiting for unfinished jobs....<br>Asse=
mbler messages:<br>Error: can&#39;t open arch/x86/kernel/macros.s for readi=
ng: No such file or directory<br>./arch/x86/include/asm/atomic64_64.h:160: =
Error: no such instruction: `lock_prefix xaddq %rax,peer_counter(%rip)&#39;=
<br>./arch/x86/include/asm/bitops.h:76: Error: no such instruction: `lock_p=
refix orb $32,1592(%rbx)&#39;<br>./arch/x86/include/asm/bitops.h:114: Error=
: no such instruction: `lock_prefix andb $-2,1592(%rbx)&#39;<br>./arch/x86/=
include/asm/bitops.h:114: Error: no such instruction: `lock_prefix andb $-9=
,1592(%rbx)&#39;<br>./arch/x86/include/asm/jump_label.h:23: Error: no such =
instruction: `static_branch_nop l_yes=3D&quot;.L15&quot;key=3D&quot;descrip=
tor.66338+40&quot;branch=3D&quot;0&quot;&#39;<br>./include/linux/netdevice.=
h:515: Error: no such instruction: `asm_bug ins=3D&quot;.byte 0x0f, 0x0b&qu=
ot;file=3D.LC0 line=3D515 flags=3D0 size=3D12&#39;<br>./include/linux/netde=
vice.h:515: Error: no such instruction: `annotate_unreachable counter=3D80&=
#39;<br>./arch/x86/include/asm/atomic.h:200: Error: no such instruction: `l=
ock_prefix cmpxchgl %ecx,(%rdx)&#39;<br>./arch/x86/include/asm/refcount.h:1=
09: Error: no such instruction: `refcount_error counter=3D&quot;(%rdx)&quot=
;&#39;<br>./arch/x86/include/asm/refcount.h:90: Error: no such instruction:=
 `lock_prefix decl 1528(%rbx)&#39;<br>./arch/x86/include/asm/refcount.h:91:=
 Error: no such instruction: `refcount_check_lt_zero counter=3D&quot;1528(%=
rbx)&quot;&#39;<br>./arch/x86/include/asm/jump_label.h:23: Error: no such i=
nstruction: `static_branch_nop l_yes=3D&quot;.L61&quot;key=3D&quot;descript=
or.66372+40&quot;branch=3D&quot;0&quot;&#39;<br>./arch/x86/include/asm/refc=
ount.h:90: Error: no such instruction: `lock_prefix decl 1528(%rdi)&#39;<br=
>./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcoun=
t_check_lt_zero counter=3D&quot;1528(%rdi)&quot;&#39;<br>./arch/x86/include=
/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=
=3D&quot;.L80&quot;key=3D&quot;descriptor.66372+40&quot;branch=3D&quot;0&qu=
ot;&#39;<br>Assembler messages:<br>Error: can&#39;t open arch/x86/kernel/ma=
cros.s for reading: No such file or directory<br>./arch/x86/include/asm/ref=
count.h:90: Error: no such instruction: `lock_prefix decl 4(%rdi)&#39;<br>.=
/arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount_=
check_lt_zero counter=3D&quot;4(%rdi)&quot;&#39;<br>./arch/x86/include/asm/=
jump_label.h:23: Error: no such instruction: `static_branch_nop l_yes=3D&qu=
ot;.L6&quot;key=3D&quot;descriptor.67356+40&quot;branch=3D&quot;0&quot;&#39=
;<br>./arch/x86/include/asm/jump_label.h:23: Error: no such instruction: `s=
tatic_branch_nop l_yes=3D&quot;.L32&quot;key=3D&quot;descriptor.67420+40&qu=
ot;branch=3D&quot;0&quot;&#39;<br>./arch/x86/include/asm/refcount.h:65: Err=
or: no such instruction: `lock_prefix incl 4(%rdi)&#39;<br>./arch/x86/inclu=
de/asm/refcount.h:66: Error: no such instruction: `refcount_check_lt_zero c=
ounter=3D&quot;4(%rdi)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: =
Error: no such instruction: `lock_prefix decl 4(%rdi)&#39;<br>./arch/x86/in=
clude/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zer=
o counter=3D&quot;4(%rdi)&quot;&#39;<br>/var/lib/dkms/wireguard/0.0.2018111=
9/build/device.c:404: Error: no such instruction: `asm_bug ins=3D&quot;.byt=
e 0x0f, 0x0b&quot;file=3D.LC7 line=3D404 flags=3D2305 size=3D12&#39;<br>/va=
r/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such instru=
ction: `annotate_reachable counter=3D163&#39;<br>./arch/x86/include/asm/bit=
ops.h:76: Error: no such instruction: `lock_prefix orb $32,328(%rax)&#39;<b=
r>make[1]: *** [scripts/<a href=3D"http://Makefile.build:293" rel=3D"norefe=
rrer" target=3D"_blank">Makefile.build:293</a>: /var/lib/dkms/wireguard/0.0=
.20181119/build/peer.o] Error 1<br>make[1]: *** [scripts/<a href=3D"http://=
Makefile.build:293" rel=3D"noreferrer" target=3D"_blank">Makefile.build:293=
</a>: /var/lib/dkms/wireguard/0.0.20181119/build/device.o] Error 1<br>Assem=
bler messages:<br>Error: can&#39;t open arch/x86/kernel/macros.s for readin=
g: No such file or directory<br>./arch/x86/include/asm/refcount.h:90: Error=
: no such instruction: `lock_prefix decl 680(%rbx)&#39;<br>./arch/x86/inclu=
de/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero c=
ounter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90=
: Error: no such instruction: `lock_prefix decl 680(%rbx)&#39;<br>./arch/x8=
6/include/asm/refcount.h:91: Error: no such instruction: `refcount_check_lt=
_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/asm/atomic=
.h:200: Error: no such instruction: `lock_prefix cmpxchgl %ecx,(%rdx)&#39;<=
br>./arch/x86/include/asm/refcount.h:109: Error: no such instruction: `refc=
ount_error counter=3D&quot;(%rdx)&quot;&#39;<br>./arch/x86/include/asm/refc=
ount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)&#39;<br>=
./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount=
_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/a=
sm/atomic64_64.h:160: Error: no such instruction: `lock_prefix xaddq %rax,k=
eypair_counter(%rip)&#39;<br>make[1]: *** [scripts/<a href=3D"http://Makefi=
le.build:293" rel=3D"noreferrer" target=3D"_blank">Makefile.build:293</a>: =
/var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1<br>make: *** [M=
akefile:1565: _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2<b=
r>make: Leaving directory &#39;/usr/src/linux-headers-4.20.0-rc4&#39;<br><b=
r></div></blockquote><div><br></div><div><br></div></div></div></div>
</div></div></blockquote></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer" target=3D"_=
blank">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>
</blockquote></div></div></div></div>

--0000000000009f1264057bfe6af5--

--===============4861024272184823447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4861024272184823447==--

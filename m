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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB0AC04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 23:23:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9351220673
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Dec 2018 23:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGlrW/ea"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9351220673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f6d0eef;
	Sat, 1 Dec 2018 23:15:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bb1cb45
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 23:15:41 +0000 (UTC)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e717b15
 for <wireguard@lists.zx2c4.com>; Sat, 1 Dec 2018 23:15:41 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id i7so9976167qtj.10
 for <wireguard@lists.zx2c4.com>; Sat, 01 Dec 2018 15:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRtZh5qKi+cwmAPbdunG/WOhhgG6FRrEQQ05Y5f+P/Q=;
 b=cGlrW/eaO8qJXxgGQJjB+VLZcHVJJNTj6ZoxVJaPtrlnI1Ed3fksGSa1eMa5RS6IcQ
 iGFB17jQNakSRWfxGsTmLxMOxc5AynHUJwsl4VzKUcmB7g4yDhIxUVbtncPHON5qf0Sl
 Wvd8TUnif3Y5wsn5WJeTMAfSXbMBR/YEYJvOp+GnFRpcP4z5ucWoktjdjeCWebgnhrU9
 6ZphIgk8ZkFwut7QW22Kgb9qAXT2dEQtjkug3MwL34O0RgnvxgCOn6ENUZqyGoFhnrXs
 LH8Mne0HmzcnJGh/PIqJVOaiDvqrhnWibTzrf20PBMDMTYWMfeGQKfCalOKAT7PyWF0X
 E+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRtZh5qKi+cwmAPbdunG/WOhhgG6FRrEQQ05Y5f+P/Q=;
 b=r6KlkYXxjwiGffG9qNEYnOjYJ8Iub+rsn4s87Tbv/sXIuBOlXcKjQg4vjOZcXowAyK
 LgQondC5tYwJu3TOetZzptgLyVkAR1UrjuyScANRejg44IBDXCAnao6ZSSHMXAoOV4Kf
 uyGvzy2rEaQTnNvdvaRxmwYSsGAn4rIWWW5tPaUs/7JqV52RcrD2WoFgC6CAZ2m0nAdd
 iJvohWt2zlh+EcW4VR+uU/CFr7dtUGA4kvqSUSo3kBbv91rJqDfAjWJ5HRUYLCfvX3yV
 ajjTXVuiFm481VQII5UJ20LfN38ldxTfcGxvWalyGd6O9V3NolwGhfSRafiwPtbY6HTr
 z/1w==
X-Gm-Message-State: AA+aEWZ3WG/fchWQEScHkgWiEw3r3acG5HIlwXzXYOG7TMn1DuGvhpLe
 Y5wnno+rE9Rs+kVsKv/Ae9gfuau3/L9tSfsL04U=
X-Google-Smtp-Source: AFSGD/WX9FWb0/mUNXlYz3dTBMtQq/JCDZbNYMEW5QfnpZtnp1Eujjp6706lw1gnNjARU9fq7cEIJYHyfHQcGvHFiUg=
X-Received: by 2002:a0c:ba24:: with SMTP id w36mr10589977qvf.60.1543706595379; 
 Sat, 01 Dec 2018 15:23:15 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
 <dsoqviekeu6evb7laiisjpi0.1543698163154@gmail.com>
In-Reply-To: <dsoqviekeu6evb7laiisjpi0.1543698163154@gmail.com>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Sun, 2 Dec 2018 01:22:53 +0200
Message-ID: <CANcuY=pCONP7Xy8hXmJfczeszwnLOmmbWagOOE19iYpEinXV2g@mail.gmail.com>
Subject: Re: Build fails on Debian, kernel 4.20.0-rc4
To: qzhang.canada@gmail.com
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
Content-Type: multipart/mixed; boundary="===============1725212006553918755=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1725212006553918755==
Content-Type: multipart/alternative; boundary="0000000000004150ed057bfe334a"

--0000000000004150ed057bfe334a
Content-Type: text/plain; charset="UTF-8"

Hi,
It builds with 4.19.x. What happened to 4.20?
On the Fedore bug tracker there is something related:

https://src.fedoraproject.org/cgit/rpms/kernel.git/commit/?id=6904e708917a12819d1fe0d329f605030d6e4b0d

On Sat, Dec 1, 2018 at 11:03 PM QINGWEI ZHANG <qzhang.canada@gmail.com>
wrote:

> This kernel is the latest one, could you try with 4.19?
>
> Sent via the BlackBerry Hub for Android
> <http://play.google.com/store/apps/details?id=com.blackberry.hub>
> *From:* laszlo.kertesz@gmail.com
> *Sent:* December 1, 2018 15:58
> *To:* wireguard@lists.zx2c4.com
> *Subject:* Build fails on Debian, kernel 4.20.0-rc4
>
> Hi,
> The wireguard module (0.0.20181119 from Debian Unstable) fails to build on
> my machine using kernel 4.20 rc4.
>
> I get the following errors:
>
> # cat /var/lib/dkms/wireguard/0.0.20181119/build/make.log
>> DKMS make.log for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)
>> Sat Dec  1 22:51:18 EET 2018
>> make: Entering directory '/usr/src/linux-headers-4.20.0-rc4'
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/main.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/noise.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/device.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20181119/build/peer.o
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>> directory
>> make[1]: *** [scripts/Makefile.build:293:
>> /var/lib/dkms/wireguard/0.0.20181119/build/main.o] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>> directory
>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
>> `lock_prefix xaddq %rax,peer_counter(%rip)'
>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
>> `lock_prefix orb $32,1592(%rbx)'
>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
>> `lock_prefix andb $-2,1592(%rbx)'
>> ./arch/x86/include/asm/bitops.h:114: Error: no such instruction:
>> `lock_prefix andb $-9,1592(%rbx)'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>> `static_branch_nop l_yes=".L15"key="descriptor.66338+40"branch="0"'
>> ./include/linux/netdevice.h:515: Error: no such instruction: `asm_bug
>> ins=".byte 0x0f, 0x0b"file=.LC0 line=515 flags=0 size=12'
>> ./include/linux/netdevice.h:515: Error: no such instruction:
>> `annotate_unreachable counter=80'
>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
>> `lock_prefix cmpxchgl %ecx,(%rdx)'
>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
>> `refcount_error counter="(%rdx)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 1528(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="1528(%rbx)"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>> `static_branch_nop l_yes=".L61"key="descriptor.66372+40"branch="0"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 1528(%rdi)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="1528(%rdi)"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>> `static_branch_nop l_yes=".L80"key="descriptor.66372+40"branch="0"'
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>> directory
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 4(%rdi)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="4(%rdi)"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>> `static_branch_nop l_yes=".L6"key="descriptor.67356+40"branch="0"'
>> ./arch/x86/include/asm/jump_label.h:23: Error: no such instruction:
>> `static_branch_nop l_yes=".L32"key="descriptor.67420+40"branch="0"'
>> ./arch/x86/include/asm/refcount.h:65: Error: no such instruction:
>> `lock_prefix incl 4(%rdi)'
>> ./arch/x86/include/asm/refcount.h:66: Error: no such instruction:
>> `refcount_check_lt_zero counter="4(%rdi)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 4(%rdi)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="4(%rdi)"'
>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
>> instruction: `asm_bug ins=".byte 0x0f, 0x0b"file=.LC7 line=404 flags=2305
>> size=12'
>> /var/lib/dkms/wireguard/0.0.20181119/build/device.c:404: Error: no such
>> instruction: `annotate_reachable counter=163'
>> ./arch/x86/include/asm/bitops.h:76: Error: no such instruction:
>> `lock_prefix orb $32,328(%rax)'
>> make[1]: *** [scripts/Makefile.build:293:
>> /var/lib/dkms/wireguard/0.0.20181119/build/peer.o] Error 1
>> make[1]: *** [scripts/Makefile.build:293:
>> /var/lib/dkms/wireguard/0.0.20181119/build/device.o] Error 1
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file or
>> directory
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 680(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="680(%rbx)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 680(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="680(%rbx)"'
>> ./arch/x86/include/asm/atomic.h:200: Error: no such instruction:
>> `lock_prefix cmpxchgl %ecx,(%rdx)'
>> ./arch/x86/include/asm/refcount.h:109: Error: no such instruction:
>> `refcount_error counter="(%rdx)"'
>> ./arch/x86/include/asm/refcount.h:90: Error: no such instruction:
>> `lock_prefix decl 680(%rbx)'
>> ./arch/x86/include/asm/refcount.h:91: Error: no such instruction:
>> `refcount_check_lt_zero counter="680(%rbx)"'
>> ./arch/x86/include/asm/atomic64_64.h:160: Error: no such instruction:
>> `lock_prefix xaddq %rax,keypair_counter(%rip)'
>> make[1]: *** [scripts/Makefile.build:293:
>> /var/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1
>> make: *** [Makefile:1565:
>> _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2
>> make: Leaving directory '/usr/src/linux-headers-4.20.0-rc4'
>>
>>
>
>

--0000000000004150ed057bfe334a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,<br></div><div>It builds with 4.1=
9.x. What happened to 4.20? <br></div><div>On the Fedore bug tracker there =
is something related:</div><div><br></div><div><a href=3D"https://src.fedor=
aproject.org/cgit/rpms/kernel.git/commit/?id=3D6904e708917a12819d1fe0d329f6=
05030d6e4b0d">https://src.fedoraproject.org/cgit/rpms/kernel.git/commit/?id=
=3D6904e708917a12819d1fe0d329f605030d6e4b0d</a><br></div></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Dec 1, 2018 at 11:03 PM Q=
INGWEI ZHANG &lt;<a href=3D"mailto:qzhang.canada@gmail.com">qzhang.canada@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=
=3D"background-color:rgb(255,255,255);background-image:initial;line-height:=
initial"><div id=3D"m_5093046255808516082response_container_BBPPID" style=
=3D"outline:none" dir=3D"auto"> <div name=3D"BB10" id=3D"m_5093046255808516=
082BB10_response_div_BBPPID" dir=3D"auto" style=3D"width:100%"> This kernel=
 is the latest one, could you try with 4.19?</div>                         =
                                                                           =
                                  <div name=3D"BB10" id=3D"m_50930462558085=
16082response_div_spacer_BBPPID" dir=3D"auto" style=3D"width:100%"> <br sty=
le=3D"display:initial"></div>                            <div id=3D"m_50930=
46255808516082blackberry_signature_BBPPID" name=3D"BB10" dir=3D"auto">     =
<div id=3D"m_5093046255808516082_signaturePlaceholder_BBPPID" name=3D"BB10"=
 dir=3D"auto">Sent via the <a href=3D"http://play.google.com/store/apps/det=
ails?id=3Dcom.blackberry.hub" target=3D"_blank">BlackBerry Hub for Android<=
/a></div> </div></div><div id=3D"m_5093046255808516082_original_msg_header_=
BBPPID" dir=3D"auto">                                                      =
                                                                           =
            <table width=3D"100%" style=3D"background-color:white;border-sp=
acing:0px;display:table;outline:none"><tbody><tr><td colspan=3D"2" style=3D=
"padding:initial;font-size:initial;text-align:initial;background-color:rgb(=
255,255,255)">                           <div style=3D"border-right:none;bo=
rder-bottom:none;border-left:none;border-top:1pt solid rgb(181,196,223);pad=
ding:3pt 0in 0in;font-family:Tahoma,&quot;BB Alpha Sans&quot;,&quot;Slate P=
ro&quot;;font-size:10pt">  <div id=3D"m_5093046255808516082from"><b>From:</=
b> <a href=3D"mailto:laszlo.kertesz@gmail.com" target=3D"_blank">laszlo.ker=
tesz@gmail.com</a></div><div id=3D"m_5093046255808516082sent"><b>Sent:</b> =
December 1, 2018 15:58</div><div id=3D"m_5093046255808516082to"><b>To:</b> =
<a href=3D"mailto:wireguard@lists.zx2c4.com" target=3D"_blank">wireguard@li=
sts.zx2c4.com</a></div><div id=3D"m_5093046255808516082subject"><b>Subject:=
</b> Build fails on Debian, kernel 4.20.0-rc4</div></div></td></tr></tbody>=
</table> <br> </div><div name=3D"BB10" dir=3D"auto" style=3D"background-ima=
ge:initial;line-height:initial;outline:none"><div dir=3D"ltr"><div dir=3D"l=
tr"><div dir=3D"ltr"><div>Hi,</div><div>The wireguard module (0.0.20181119 =
from Debian Unstable) fails to build on my machine using kernel 4.20 rc4. <=
br></div><div><br></div><div>I get the following errors:</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div># cat /var/lib/dkm=
s/wireguard/0.0.20181119/build/<a href=3D"http://make.log" target=3D"_blank=
">make.log</a><br>DKMS <a href=3D"http://make.log" target=3D"_blank">make.l=
og</a> for wireguard-0.0.20181119 for kernel 4.20.0-rc4 (x86_64)<br>Sat Dec=
=C2=A0 1 22:51:18 EET 2018<br>make: Entering directory &#39;/usr/src/linux-=
headers-4.20.0-rc4&#39;<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.=
20181119/build/main.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20=
181119/build/noise.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.201=
81119/build/device.o<br>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.201=
81119/build/peer.o<br>Assembler messages:<br>Error: can&#39;t open arch/x86=
/kernel/macros.s for reading: No such file or directory<br>make[1]: *** [sc=
ripts/<a href=3D"http://Makefile.build:293" target=3D"_blank">Makefile.buil=
d:293</a>: /var/lib/dkms/wireguard/0.0.20181119/build/main.o] Error 1<br>ma=
ke[1]: *** Waiting for unfinished jobs....<br>Assembler messages:<br>Error:=
 can&#39;t open arch/x86/kernel/macros.s for reading: No such file or direc=
tory<br>./arch/x86/include/asm/atomic64_64.h:160: Error: no such instructio=
n: `lock_prefix xaddq %rax,peer_counter(%rip)&#39;<br>./arch/x86/include/as=
m/bitops.h:76: Error: no such instruction: `lock_prefix orb $32,1592(%rbx)&=
#39;<br>./arch/x86/include/asm/bitops.h:114: Error: no such instruction: `l=
ock_prefix andb $-2,1592(%rbx)&#39;<br>./arch/x86/include/asm/bitops.h:114:=
 Error: no such instruction: `lock_prefix andb $-9,1592(%rbx)&#39;<br>./arc=
h/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_bran=
ch_nop l_yes=3D&quot;.L15&quot;key=3D&quot;descriptor.66338+40&quot;branch=
=3D&quot;0&quot;&#39;<br>./include/linux/netdevice.h:515: Error: no such in=
struction: `asm_bug ins=3D&quot;.byte 0x0f, 0x0b&quot;file=3D.LC0 line=3D51=
5 flags=3D0 size=3D12&#39;<br>./include/linux/netdevice.h:515: Error: no su=
ch instruction: `annotate_unreachable counter=3D80&#39;<br>./arch/x86/inclu=
de/asm/atomic.h:200: Error: no such instruction: `lock_prefix cmpxchgl %ecx=
,(%rdx)&#39;<br>./arch/x86/include/asm/refcount.h:109: Error: no such instr=
uction: `refcount_error counter=3D&quot;(%rdx)&quot;&#39;<br>./arch/x86/inc=
lude/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 1528(=
%rbx)&#39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such instruct=
ion: `refcount_check_lt_zero counter=3D&quot;1528(%rbx)&quot;&#39;<br>./arc=
h/x86/include/asm/jump_label.h:23: Error: no such instruction: `static_bran=
ch_nop l_yes=3D&quot;.L61&quot;key=3D&quot;descriptor.66372+40&quot;branch=
=3D&quot;0&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: Error: no su=
ch instruction: `lock_prefix decl 1528(%rdi)&#39;<br>./arch/x86/include/asm=
/refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter=
=3D&quot;1528(%rdi)&quot;&#39;<br>./arch/x86/include/asm/jump_label.h:23: E=
rror: no such instruction: `static_branch_nop l_yes=3D&quot;.L80&quot;key=
=3D&quot;descriptor.66372+40&quot;branch=3D&quot;0&quot;&#39;<br>Assembler =
messages:<br>Error: can&#39;t open arch/x86/kernel/macros.s for reading: No=
 such file or directory<br>./arch/x86/include/asm/refcount.h:90: Error: no =
such instruction: `lock_prefix decl 4(%rdi)&#39;<br>./arch/x86/include/asm/=
refcount.h:91: Error: no such instruction: `refcount_check_lt_zero counter=
=3D&quot;4(%rdi)&quot;&#39;<br>./arch/x86/include/asm/jump_label.h:23: Erro=
r: no such instruction: `static_branch_nop l_yes=3D&quot;.L6&quot;key=3D&qu=
ot;descriptor.67356+40&quot;branch=3D&quot;0&quot;&#39;<br>./arch/x86/inclu=
de/asm/jump_label.h:23: Error: no such instruction: `static_branch_nop l_ye=
s=3D&quot;.L32&quot;key=3D&quot;descriptor.67420+40&quot;branch=3D&quot;0&q=
uot;&#39;<br>./arch/x86/include/asm/refcount.h:65: Error: no such instructi=
on: `lock_prefix incl 4(%rdi)&#39;<br>./arch/x86/include/asm/refcount.h:66:=
 Error: no such instruction: `refcount_check_lt_zero counter=3D&quot;4(%rdi=
)&quot;&#39;<br>./arch/x86/include/asm/refcount.h:90: Error: no such instru=
ction: `lock_prefix decl 4(%rdi)&#39;<br>./arch/x86/include/asm/refcount.h:=
91: Error: no such instruction: `refcount_check_lt_zero counter=3D&quot;4(%=
rdi)&quot;&#39;<br>/var/lib/dkms/wireguard/0.0.20181119/build/device.c:404:=
 Error: no such instruction: `asm_bug ins=3D&quot;.byte 0x0f, 0x0b&quot;fil=
e=3D.LC7 line=3D404 flags=3D2305 size=3D12&#39;<br>/var/lib/dkms/wireguard/=
0.0.20181119/build/device.c:404: Error: no such instruction: `annotate_reac=
hable counter=3D163&#39;<br>./arch/x86/include/asm/bitops.h:76: Error: no s=
uch instruction: `lock_prefix orb $32,328(%rax)&#39;<br>make[1]: *** [scrip=
ts/<a href=3D"http://Makefile.build:293" target=3D"_blank">Makefile.build:2=
93</a>: /var/lib/dkms/wireguard/0.0.20181119/build/peer.o] Error 1<br>make[=
1]: *** [scripts/<a href=3D"http://Makefile.build:293" target=3D"_blank">Ma=
kefile.build:293</a>: /var/lib/dkms/wireguard/0.0.20181119/build/device.o] =
Error 1<br>Assembler messages:<br>Error: can&#39;t open arch/x86/kernel/mac=
ros.s for reading: No such file or directory<br>./arch/x86/include/asm/refc=
ount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)&#39;<br>=
./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `refcount=
_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/include/a=
sm/refcount.h:90: Error: no such instruction: `lock_prefix decl 680(%rbx)&#=
39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such instruction: `r=
efcount_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./arch/x86/in=
clude/asm/atomic.h:200: Error: no such instruction: `lock_prefix cmpxchgl %=
ecx,(%rdx)&#39;<br>./arch/x86/include/asm/refcount.h:109: Error: no such in=
struction: `refcount_error counter=3D&quot;(%rdx)&quot;&#39;<br>./arch/x86/=
include/asm/refcount.h:90: Error: no such instruction: `lock_prefix decl 68=
0(%rbx)&#39;<br>./arch/x86/include/asm/refcount.h:91: Error: no such instru=
ction: `refcount_check_lt_zero counter=3D&quot;680(%rbx)&quot;&#39;<br>./ar=
ch/x86/include/asm/atomic64_64.h:160: Error: no such instruction: `lock_pre=
fix xaddq %rax,keypair_counter(%rip)&#39;<br>make[1]: *** [scripts/<a href=
=3D"http://Makefile.build:293" target=3D"_blank">Makefile.build:293</a>: /v=
ar/lib/dkms/wireguard/0.0.20181119/build/noise.o] Error 1<br>make: *** [Mak=
efile:1565: _module_/var/lib/dkms/wireguard/0.0.20181119/build] Error 2<br>=
make: Leaving directory &#39;/usr/src/linux-headers-4.20.0-rc4&#39;<br><br>=
</div></blockquote><div><br></div><div><br></div></div></div></div>
</div></div></blockquote></div>

--0000000000004150ed057bfe334a--

--===============1725212006553918755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1725212006553918755==--

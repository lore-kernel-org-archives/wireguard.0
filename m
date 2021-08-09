Return-Path: <SRS0=nfW+=NA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5170AC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 10:14:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6159561076
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 10:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6159561076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grsecurity.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 644080be;
	Mon, 9 Aug 2021 10:14:00 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 389fecf2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Aug 2021 10:13:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m12so20645958wru.12
 for <wireguard@lists.zx2c4.com>; Mon, 09 Aug 2021 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oq0yCUi2o1WHgTyGXZdb/Pw2KyHcVW+WoBaZIs/YeOI=;
 b=wD9ios8bYezI16nkOBTGezmtPeILUn2RqjRHsQCtwx/IXS064dlD0I79mm81t6S9oK
 FEgsz/D01pLha19zyfgpqHyuysLCC+9VasWKPLKUkh+uonTCaks5iKStsYI9yDhE079R
 kIq/L4SGnB1bceX0GcvKiPh4ALWnza2LBOFWaLh9/1Neh1pfZclHx6OgSaylpd+FUvPd
 jjrpXVPIYsIzUwBKTf/pzchv+ov6AvtEWDttV6z2X9w7WGaDjgd2V2eHzcWHgriRk+8g
 x53eMjeMFGJPKrYVlPb7Ht3o/V2onjoaUfkK/ZVH5Y5pQr9dZnKv6sum25vu2gqcV0rY
 goBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oq0yCUi2o1WHgTyGXZdb/Pw2KyHcVW+WoBaZIs/YeOI=;
 b=Oop/eMdL/qFZAyCPieJ/svLWJEcv6vplQN/SyIioU2UrNMAfhwerfoTUU4nd5iOvWA
 qV/X080mqfMe3+yMJmU7r2yYQ9i1bL/lxqLxn5LQ2KelSjLJHxaDQRIjRdrMFP1e606H
 LjIokJvi85PhDsRyeGZX81HxWunw6/6T3x9Rc63MXBohkU3xxgQcE2L2SvX0PfBZp1/R
 sEsgWvIXW5Pz8YiAEt+n9i12bDmD61sVmOwZfwXvmz96w6asCzxXg8rXf8pF5oODzUzL
 PRkoAYaii3K5EqGMXSf7GaldhujP/nVGT2ca1dLKZfHjgIF1Zn0J6RJn0fJrGTtzwq4e
 JgbQ==
X-Gm-Message-State: AOAM530tVG2QRbsmeUYqeDjfX7+B2kHIgvwUi8C7J9abhP50s2FVlhrG
 cvQPu/Husfw83inlDGz2RgtyuHGK7YVrSg==
X-Google-Smtp-Source: ABdhPJzZJWsffBYNa7gLuKOZTav4F8Rb0BikdLz0oIMBFhNRjxd3h4je/OBlSNc8mymsg9XzhbsF7Q==
X-Received: by 2002:a5d:58da:: with SMTP id o26mr5220725wrf.140.1628504036041; 
 Mon, 09 Aug 2021 03:13:56 -0700 (PDT)
Received: from ?IPv6:2003:f6:af02:f900:8ee2:5b41:1fb5:80c7?
 (p200300f6af02f9008ee25b411fb580c7.dip0.t-ipconnect.de.
 [2003:f6:af02:f900:8ee2:5b41:1fb5:80c7])
 by smtp.gmail.com with ESMTPSA id s84sm4004771wme.12.2021.08.09.03.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:13:55 -0700 (PDT)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
From: Mathias Krause <minipli@grsecurity.net>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Message-ID: <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
Date: Mon, 9 Aug 2021 12:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi Jason,

Am 08.08.21 um 22:53 schrieb Jason A. Donenfeld:
> Hi Mathias,
> 
> Sorry for the delay in reviewing these. Thanks for that. I've merged
> them with a trivial change.

thanks!

>                             The constraint one is interesting; it
> looks like with your change and those extra constraints it winds up
> spilling rdi to the stack?

Indeed, looking, for example, at fsquare_times() (!RAP, FRAMEPOINTER=y),
it looks like gcc prefers to choose the constraint with a memory output
argument even if it could fulfill the register allocation request, i.e.
it could allocate (all remaining) 3 registers instead of only 2 but
chooses to do the latter nonetheless. However, for me it's %rsi that's
put on the stack. Also it's not spilled, but used as a variable -- the
stack frame increases by 8 bytes and the stack slot where %rsi is
written to is used as-is for operations in the end. But, again, this
differs from the original code that used to allocate three registers for
the inline assembly. The old code has two memory loads at the end and
one compare while the new one has only one -- directly encode into the
compare instruction. So, memory-wise, a net win?

Below is the diff of the disassembly of fsquare_times(), spare of
addresses to reduce clutter with comments below each hunk:

--- old.dis	2021-08-09 11:46:53.050680456 +0200
+++ new.dis	2021-08-09 11:48:18.816851059 +0200
@@ -6,10 +6,10 @@
 	push   %r13
 	push   %r12
 	push   %rbx
-	sub    $0x18,%rsp
-	mov    %rdi,-0x38(%rbp)
-	mov    %rdx,-0x40(%rbp)
-	mov    %ecx,-0x2c(%rbp)
+	sub    $0x20,%rsp
+	mov    %rdi,-0x40(%rbp)
+	mov    %rdx,-0x48(%rbp)
+	mov    %ecx,-0x30(%rbp)
 	mov    %rdx,%r12
 	mov    (%rsi),%rdx
 	mulx   0x8(%rsi),%r8,%r14

This first hunk is really only the increased stack frame and resulting
offset changes.

@@ -92,15 +92,14 @@
 	cmovb  %rdx,%rax
 	add    %rax,%r8
 	mov    %r8,(%r12)
-	mov    -0x2c(%rbp),%eax
+	mov    -0x30(%rbp),%eax
 	sub    $0x1,%eax
-	mov    %eax,-0x30(%rbp)
-	je     1f42 <fsquare_times+0x3a2>
+	mov    %eax,-0x34(%rbp)
+	je     1f3c <fsquare_times+0x39c>
 	xor    %r12d,%r12d
-	mov    %r12d,-0x2c(%rbp)     <-- no longer needed in new code
-	mov    -0x38(%rbp),%rsi
-	mov    -0x40(%rbp),%rdi
-	mov    %rsi,%r12             <-- see below
+	mov    -0x40(%rbp),%rsi
+	mov    -0x48(%rbp),%rdi
+	mov    %rsi,-0x30(%rbp)      <-- reg -> mem operand constraint
 	mov    (%rsi),%rdx
 	mulx   0x8(%rsi),%r8,%r14
 	xor    %r15,%r15

Offset changes again. Beside the one dropped instruction there's only
one real change ("mov %rsi,%r12" -> "mov %rsi,-0x30(%rbp)"), induced by
the memory constraint of the inline assembly, switching a register
operand to a memory location.

@@ -154,7 +153,7 @@
 	adcx   %rcx,%r14
 	mov    %r14,0x38(%rdi)
 	mov    %rdi,%rsi
-	mov    %r12,%rdi
+	mov    -0x30(%rbp),%rdi
 	mov    $0x26,%rdx
 	mulx   0x20(%rsi),%r8,%r13
 	xor    %rcx,%rcx

Load of the stack slot which used to be a register operation before.

@@ -182,12 +181,10 @@
 	cmovb  %rdx,%rax
 	add    %rax,%r8
 	mov    %r8,(%rdi)
-	addl   $0x1,-0x2c(%rbp)            <-- mem operation
-	mov    -0x30(%rbp),%ebx            <-- mem load
-	mov    -0x2c(%rbp),%eax            <-- mem load
-	cmp    %ebx,%eax                   <-- reg compare
-	jne    1d83 <fsquare_times+0x1e3>
-	add    $0x18,%rsp
+	add    $0x1,%r12d                  <-- reg operation
+	cmp    -0x34(%rbp),%r12d           <-- mem compare
+	jne    1d7f <fsquare_times+0x1df>
+	add    $0x20,%rsp
 	pop    %rbx
 	pop    %r12
 	pop    %r13

We switch one memory operation (addl) to a register one and spare the
memory loads for the compare by directly encoding one of the memory
operands into the compare instruction. IMHO a net win, as gcc now can
use a register for the loop condition variable, making the conditional
jump depend only on one memory operand, not two. But only a benchmark
can tell if it's really faster or even slower.


Thanks,
Mathias

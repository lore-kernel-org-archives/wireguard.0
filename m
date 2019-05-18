Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10801C04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:31:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20C32087B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ietaJiHj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20C32087B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dcfff87;
	Sat, 18 May 2019 16:30:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ab897f6
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 May 2019 16:27:47 +0000 (UTC)
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b258992
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 May 2019 16:27:47 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id s30so3880032uas.8
 for <wireguard@lists.zx2c4.com>; Sat, 18 May 2019 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6XA1DC3gHnj+izQfKSX0Mwr78JnzIMK0cjbsYwQbEo4=;
 b=ietaJiHj18mI/l13gnEjz0rfg0jI1Hpk8IQ7djbauFztIYWrVqLVu96Xndit8luNFa
 BOS7ObuCUUMceGRgKPRPKDvKNUggRgtBDelfVaSef1yei0s/Fpd/cIGvD7OrsGBMefI2
 17qOV+SnOqqpOScQD8wYr5h6/DuQb0zG/dDPQi3yAcM8FFjiJh/B8kFCctG0NcoywjL3
 Wjba7JD421TkAzFbzEzOGaQs8vUDl78+2oYRrFPpwq76MZhPyvximD2pYmOneRi2CQf1
 cygGksy5IW/FymF3mLX38bo2n5wKjxA14NPfCCPxdwZAPJaOLjguCX3gxs+TvIP1Wz0A
 LqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6XA1DC3gHnj+izQfKSX0Mwr78JnzIMK0cjbsYwQbEo4=;
 b=Vzklic5tqkzjaqu+AJI2klDqoLRbEKj0weMZNKGBQOWxm77du9bHLS0LCa0+RDKy9d
 xH4vB9ShFOa/5NoL8Id8hfSBDC6kywoHdEI4Ejn7mRv9Fequ6Kfkt7/G0h6I9QUNCsyL
 odHbyx1AnVVwBSjKhqU3z/rSim4EfBs82fzc3H7dDkCvIZot/XHixZmWcCfw3Olh66cB
 lZcgU4P3gKTXFsZWrdFG268/YO/Ii2Wyu3nvfQPJUqdqytGFxVkkrSg48Q1my2Jxwm5e
 uWj0+G97sB2JDk37zsEQKNuDpriCQmcsluO1e471Xs1P0r0Aswj3uR9f1gcKIPQ/6WsT
 rEGQ==
X-Gm-Message-State: APjAAAU41uhBBSSDiSY9DsEROGRz2+/L4q61JsWGCPdIYMf/5Tv/sN5c
 OjS8RdSVPFkjhc0tStcQn3/MihdUgRtfmqacFgg=
X-Google-Smtp-Source: APXvYqw4K71BlKOEs2FgReLHTumd+RfU8lvMkrTpZGzW7Es0Stms2/Ct2zx2/d28YGMfT5LAa5bmPY7TfGQZOHD1a7M=
X-Received: by 2002:a9f:3381:: with SMTP id p1mr3954926uab.40.1558196866049;
 Sat, 18 May 2019 09:27:46 -0700 (PDT)
MIME-Version: 1.0
From: Shawn Landden <slandden@gmail.com>
Date: Sat, 18 May 2019 11:27:34 -0500
Message-ID: <CA+49okpOX5-N33BLPEEeBTW4Wcn7sBWog7cBNT=ENLvOZ_MKVQ@mail.gmail.com>
Subject: Allowing SIMD in kernel mode without disabling preemption
To: linux-rt-users@vger.kernel.org, peterz@infradead.org, 
 wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 18 May 2019 18:30:46 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I ported the x86 approach to allowing SIMD in kernel mode, even in an
interrupt, to powerpc[1], but I couldn't help wonder if it would be
possible without disabling preemption.

The scheduler just has to check the per-cpu in_kernel_fpu, and if it
is set, save the fpu state of the kernel thread, similar to what is
done for user-space threads with use_mode().

This way WireGuard would be fast even on preempt-rt kernels (it
currently turns off SIMD on them). Other crypto in the kernel is
woorse, and just unconditionally turns off preempt for each block of
data (look at arch/x86/crypto/chacha_glue.c ). Note that
kernel_fpu_begin() disables preemption, but I don't believe it has to.

Is there any complications with this approach that I am missing?

-Shawn Landden

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-May/190704.html
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

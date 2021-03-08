Return-Path: <SRS0=uBg8=IG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26017C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Mar 2021 15:01:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0016521B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Mar 2021 15:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E0016521B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c1f9a40;
	Mon, 8 Mar 2021 15:01:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f38a7b9e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Mar 2021 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615215669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7n2kGYRAeSz3XSk2cT3ov2xNl5NMWCfsYm2TtyHmM6I=;
 b=VbbOVMJcjVR9salJgBYB9vDhybAHCtUMViBDirVjKnRCn0st9k5xUseSIpAi44E0/HqV9D
 M9WZ2XEiyrDGOiP2j/Ixna3CSsKOmKHLdJTuQkH/vRgwnSxHVmfrN+CZv4o6Q352ITXHBJ
 eK9lOGNxhu67KpHM+vxA+vaxzwn2nh0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 02ba6163
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Mar 2021 15:01:09 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id c131so10415861ybf.7
 for <wireguard@lists.zx2c4.com>; Mon, 08 Mar 2021 07:01:09 -0800 (PST)
X-Gm-Message-State: AOAM530OciL4gSb+ppovhvyOE/ILrZib5MBquKiIVFR6lpn23U6lAPXh
 yUdkaeENiBQkTccPRRRFhYCZdpQInZKbXA+CrJM=
X-Google-Smtp-Source: ABdhPJzCr9sZ3fVhghCk16jLrywTA3r7Brkddr8xBxlVC6A7caEWNaq0YjgSb+LZ7418/Pd26b5bSSVYDgZ0hTCJ+2E=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr35198930ybt.239.1615215669382; 
 Mon, 08 Mar 2021 07:01:09 -0800 (PST)
MIME-Version: 1.0
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
 <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
 <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
In-Reply-To: <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Mar 2021 08:00:58 -0700
X-Gmail-Original-Message-ID: <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
Message-ID: <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
To: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Mar 8, 2021 at 2:25 AM Bradley Saulteaux
<bradsoto@protonmail.com> wrote:
>
> Hello Jason,
>
> Yes prior to build 21327 the latest version worked.

Hmm. Anything in the logs from the flawed 0.3.8 launches that might
indicate something?

If you're up for debugging this in real time with me, perhaps we can
jump onto IRC and I can send a few tweaked builds? I'm zx2c4 on
freenode.

Jason

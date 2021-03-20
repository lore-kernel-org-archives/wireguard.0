Return-Path: <SRS0=v6vS=IS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8464C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Mar 2021 02:34:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D204561968
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Mar 2021 02:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D204561968
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 791d0c7e;
	Sat, 20 Mar 2021 02:34:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 69177cf5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Mar 2021 02:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616207647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNAaN1C8XC4AzCAWY3sZLPtogmogF+VfBMYlnBiBjFY=;
 b=Vgy2psCqPzbcUQakCZlRRC/GzDHcYFa9yUlVciy8dRgy6w6eBgLPCwMUexQukrD8+yZhTt
 2pYk3j0gIk4jGFSuQwP4Ehcn8icL+QhJuadQ4T/q1fpf2Gh8QhunTPHn7pWnNKdh8x1dLM
 rcVk+VezEvT3ZXLmt064VLeRomG5mlg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67ce53d0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Mar 2021 02:34:07 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i9so215479ybp.4
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 19:34:07 -0700 (PDT)
X-Gm-Message-State: AOAM533E7H9jcEV9o9rGDeNYvEEvW5U2JwZVLuwDTz4myffZtfTKlDAt
 +IkDG5SoMVLT/BEnRbedpbrNf8IK/8ULnkS7Jf8=
X-Google-Smtp-Source: ABdhPJwiMF4v6zXo6X6JyAG6ozBLiWhvmI9L8bzhovU2f3sUetmpGjpHsAwjHkVBrJnxQKiWPexXG6LRYT0WYBootk4=
X-Received: by 2002:a25:38c5:: with SMTP id
 f188mr10481445yba.178.1616207646703; 
 Fri, 19 Mar 2021 19:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
 <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
 <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
 <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
In-Reply-To: <CAHmME9qvexiP9ZFLMJfFEQEnaYHFZkPWmBUBwzdTs7Zov1poCA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 20:33:55 -0600
X-Gmail-Original-Message-ID: <CAHmME9qvh8PBGX-0mrnHDhxMF_+Do0JzjUf0L+hJkeiNfViqCw@mail.gmail.com>
Message-ID: <CAHmME9qvh8PBGX-0mrnHDhxMF_+Do0JzjUf0L+hJkeiNfViqCw@mail.gmail.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
To: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 20 Mar 2021 02:34:19 +0000
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

Hi Bradley,

The hardware I ordered finally came and I was able to reproduce and
then fix the bug, which was in the Go runtime.

The bug report I filed is here: https://github.com/golang/go/issues/45138

As of writing, the fix I've submitted is here:
https://go-review.googlesource.com/c/go/+/303273/
But that fix could wind up being wrong and replaced with something
else. Either way, as soon as that or something else is merged, I'll
cut a new release with the fix in it.

Thanks again for the report.

Regards,
Jason

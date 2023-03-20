Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E327C6FD1F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Mar 2023 01:59:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f948053;
	Mon, 20 Mar 2023 01:59:47 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e772690a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2023 01:59:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h25so1404761lfv.6
 for <wireguard@lists.zx2c4.com>; Sun, 19 Mar 2023 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1679277585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veHR4OeBVdmMM7ZoMMD2LEaF+ZQb01kUcsthEQZ+G8o=;
 b=SNcJ+0V8W1TJ4MntzJ+tWV7MHo4J3GQzdu8n70Frwh9hfIq8QJeAepOPu8iQN8X+PI
 718jEIJg59mxJDYCZRplEWtR5a0GmEVRh4EPAtJkC6Hq5jJlDEALE1binS+iGalKfCmv
 EGPciyy8uyBqEs3OImQsnGjVKl5PsCY2jrNl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679277585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veHR4OeBVdmMM7ZoMMD2LEaF+ZQb01kUcsthEQZ+G8o=;
 b=LWQTwvQROf8yyWkwPCeqpY95LT5m5SsENyXVCdw9JIWAvkB+6loTh4K8tieW31+2NV
 30urO2BXVek6gVJNkcRuplEf0V8cdgDo1WdxoMX0jyBbm6sxzi2h+JLxfTBRsxr57fEJ
 G5fMn4fWExVW7wpH+6BNkKLoVjkY1FlJ8dpaSYXcKbbZ2/s2E2/0OhG63cOcdunZeAiD
 RmjN7GNz/HW6OS0GHxx0z9zCz8kU8eClViXyyiRShHlqg9uwsTOgKzTT7DC3Q2McWl36
 aRe6jJmacOmexLEU9r2Y7PjBzvR5icFpnnwetbN00AZSywn8tHxVJMBDJaIn4MtaWvJP
 2tOA==
X-Gm-Message-State: AO0yUKXF+v4ku0TEWyt8fYlXweklR5Hc7wZL1Icv7Y0qa1iuQjzv/317
 U9eVDPwLJ/hCqNhlrc9P1R6+MgZqmLB369MO/CfjwQ==
X-Google-Smtp-Source: AK7set+trbbuZZQu5CCCQoIWN2hoVouYwfgAUMQVnkQ7MHXjeuz4NOVn1/iPaUrJ9WBDE0eOrX5Gvw==
X-Received: by 2002:a05:6512:4dc:b0:4dd:a4e1:4869 with SMTP id
 w28-20020a05651204dc00b004dda4e14869mr6431108lfq.43.1679277585088; 
 Sun, 19 Mar 2023 18:59:45 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 t8-20020a19ad08000000b004a9b9ccfbe6sm1495546lfc.51.2023.03.19.18.59.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 18:59:44 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id b10so11891285lfb.9
 for <wireguard@lists.zx2c4.com>; Sun, 19 Mar 2023 18:59:44 -0700 (PDT)
X-Received: by 2002:a17:906:2294:b0:927:912:6baf with SMTP id
 p20-20020a170906229400b0092709126bafmr2817236eja.15.1679277564111; Sun, 19
 Mar 2023 18:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230320005258.1428043-1-sashal@kernel.org>
 <20230320005258.1428043-9-sashal@kernel.org>
In-Reply-To: <20230320005258.1428043-9-sashal@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Mar 2023 18:59:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpK-Gm-nOybRKs1LTD5yb7rPHQ4+=PCDvq61mUpBskYw@mail.gmail.com>
Message-ID: <CAHk-=wgpK-Gm-nOybRKs1LTD5yb7rPHQ4+=PCDvq61mUpBskYw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.2 09/30] cpumask: fix incorrect cpumask scanning
 result checks
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Vernon Yang <vernon2gm@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>, mpe@ellerman.id.au, tytso@mit.edu,
 davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com, 
 martin.petersen@oracle.com, christophe.leroy@csgroup.eu, npiggin@gmail.com, 
 dmitry.osipenko@collabora.com, joel@jms.id.au, nathanl@linux.ibm.com, 
 gustavoars@kernel.org, naveen.n.rao@linux.vnet.ibm.com, 
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Mar 19, 2023 at 5:53=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> [ Upstream commit 8ca09d5fa3549d142c2080a72a4c70ce389163cd ]

These are technically real fixes, but they are really just "documented
behavior" fixes, and don't actually matter unless you also have
596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
optimizations"), which doesn't look like stable material.

And if somebody *does* decide to backport commit 596ff4a09b89, you
should then backport all of

  6015b1aca1a2 sched_getaffinity: don't assume 'cpumask_size()' is
fully initialized
  e7304080e0e5 cpumask: relax sanity checking constraints
  63355b9884b3 cpumask: be more careful with 'cpumask_setall()'
  8ca09d5fa354 cpumask: fix incorrect cpumask scanning result checks

but again, none of these matter as long as the constant-sized cpumask
optimized case doesn't exist.

(Technically, FORCE_NR_CPUS also does the constant-size optimizations
even before, but that will complain loudly if that constant size then
doesn't match nr_cpu_ids, so ..).

                   Linus

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F52CC64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 17:32:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7decef4;
	Mon, 6 Mar 2023 17:29:33 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73b5bfee
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 17:29:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id j11so22337340edq.4
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1678123770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyTtB/4llIx7xJW4yBF6B/aJvNGYAxGhl43lVEfQF64=;
 b=EifQQ+weQ4IsQawW78VYTLw0g+AyIdH6YFF1/AsK3QC7lF2UsWQ10yHbii0PWaGd+8
 wiR3rddKNt23NDeAOIr8b0ktihYLY7o2/+BUqstbp+GwjW0A36mBQCH3ZzAJeyxwwVTc
 XMlKlXM60vkKaJwQ8vo6+pirMSfkVEAdxOfpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hyTtB/4llIx7xJW4yBF6B/aJvNGYAxGhl43lVEfQF64=;
 b=A4LZKgKF87yXxDdiKfLYVLiHgKZHxUuZfVaajrEXCZkHviEDUvtK7StalqdsiEGj71
 yV2uHDS3f9k0M/9Y0hJ5c9nW83MkRt23y0rnuNbGSSx/16yYYGWRaoYxOPWDUrK11TtQ
 BHvZkeH1pWFm/2AfrifYtNGcn7/cZmlMci0us4tJr51dW03wzK2S6S+FtC6LkHHPFunt
 sQkoEzEIBul1BX9jlgW8pI5LB6OoVip5D0vN8eDndSDgXOdcdEBjd7NDcATLC2rOnEY5
 yAckzuDzM8iP0v0+WWalwo6VIotZSSamZJQJMRvNDS8FUUdfBNMxvxTTTygLPxshInIl
 8EEg==
X-Gm-Message-State: AO0yUKWn1HQhXIt8q1KZSzlmP1+uH/16vfturA4pW4I5LnHW1sWTJAWe
 PfRYYxi1RocugdVytFmu96x/0d3e8HEQiNau9UOJSA==
X-Google-Smtp-Source: AK7set+6utstDMkq15y8dpiZ45uUvsd+ou6hOcYgGXSBiBZ9qmnWPxeZDew6QzHwqGVcrgkNEStw9A==
X-Received: by 2002:a17:906:66cd:b0:878:605b:ffef with SMTP id
 k13-20020a17090666cd00b00878605bffefmr12609986ejp.55.1678123770252; 
 Mon, 06 Mar 2023 09:29:30 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 fy5-20020a170906b7c500b008b17662e1f7sm4858328ejb.53.2023.03.06.09.29.28
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:29:29 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id k10so17958723edk.13
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 09:29:28 -0800 (PST)
X-Received: by 2002:a17:906:4997:b0:877:7480:c75d with SMTP id
 p23-20020a170906499700b008777480c75dmr5644673eju.0.1678123768103; Mon, 06 Mar
 2023 09:29:28 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
In-Reply-To: <20230306160651.2016767-6-vernon2gm@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Mar 2023 09:29:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
Message-ID: <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
To: Vernon Yang <vernon2gm@gmail.com>
Cc: tytso@mit.edu, Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com, 
 martin.petersen@oracle.com, yury.norov@gmail.com, 
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
 james.smart@broadcom.com, dick.kennedy@broadcom.com, 
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com, 
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

On Mon, Mar 6, 2023 at 8:07=E2=80=AFAM Vernon Yang <vernon2gm@gmail.com> wr=
ote:
>
> After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> optimizations"), the cpumask size is divided into three different case,
> so fix comment of cpumask_xxx correctly.

No no.

Those three cases are meant to be entirely internal optimizations.
They are literally just "preferred sizes".

The correct thing to do is always that

   * Returns >=3D nr_cpu_ids if no cpus set.

because nr_cpu_ids is always the *smallest* of the access sizes.

That's exactly why it's a ">=3D". The CPU mask stuff has always
historically potentially used a different size than the actual
nr_cpu_ids, in that it could do word-sized scans even when the machine
might only have a smaller set of CPUs.

So the whole "small" vs "large" should be seen entirely internal to
cpumask.h. We should not expose it outside (sadly, that already
happened with "nr_cpumask_size", which also was that kind of thing.

So no, this patch is wrong. If anything, the comments should be strengthene=
d.

Of course, right now Guenter seems to be reporting a problem with that
optimization, so unless I figure out what is going on I'll just need
to revert it anyway.

                Linus

                Linus

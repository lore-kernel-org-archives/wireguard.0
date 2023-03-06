Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E52C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 18:50:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3d563ad;
	Mon, 6 Mar 2023 18:48:24 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7066313e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 18:48:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id o12so42704654edb.9
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1678128502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+AuRXdo16JeR9PnbP32vE+RmxUJH9KHyOeCFYJO9N8=;
 b=cfLBMhsxEmyjxzpNdu5x3WI0oXcOEnEr8VoAG5m38Cw4/kQTo9PWxpACKwcyjytSKD
 ydU9ygHtlfqv6Q6/ugWeApD883giDkCXBpD8NOvECUqwxj4akokkyUxVfHre/EMVa2oa
 4SHO37wicSka3vGgpwhCmiBzDQRvxlNbPRHeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678128502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+AuRXdo16JeR9PnbP32vE+RmxUJH9KHyOeCFYJO9N8=;
 b=8RsIrTgJ/LH41s2LW/ryXAMZvJ3wQRlKlW10yWeJ+u8cntxD3zWSmwnfY2qEEpoMp7
 4lDIlkz+jE2OnlqHppNaQ3B55TqNmv3SuG1a9HG45u/jmF75wFuQxXpc2YUFtqc86ikX
 mV5f7ZOKTHQwURV64kW3BrSaUEhn+MwENkqiUvw29C8jjJn2P4iaRBabTsU8slK+HTvk
 r1QBchqWRBHdf/yo4EwlwA1QaE3skdY+/jlWtQEdTd10q7lrkYNgwDnxb9MkJdQk/2t8
 Ah4l5MvtnzF9K+E2/nhliWT/T4mtN+oOPtsgkxpmXxhdIq5eVR4Jb8fnVjJu2EuHp5Rt
 NRkQ==
X-Gm-Message-State: AO0yUKUcUVugc99rtn6xIk6qwXQ1dnJrmjXPhVvUqmsks0u3Gka6UOiU
 QfXUoKrQ05sJHw2V92YyLC8tlTidN4gAZvWipaOrTw==
X-Google-Smtp-Source: AK7set96VI4HRMTevKY5MS/wjEAwprb7RdDZMn0YCn5LeFsW9nYx+XjgVPgPeary3Dqdw+Sw5znhcQ==
X-Received: by 2002:a50:ee8c:0:b0:4bb:83eb:1b46 with SMTP id
 f12-20020a50ee8c000000b004bb83eb1b46mr9042937edr.23.1678128501913; 
 Mon, 06 Mar 2023 10:48:21 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 v15-20020a50954f000000b004c09527d62dsm5551019eda.30.2023.03.06.10.48.21
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:48:21 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id cw28so42799431edb.5
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:48:21 -0800 (PST)
X-Received: by 2002:a50:cd15:0:b0:4c1:1555:152f with SMTP id
 z21-20020a50cd15000000b004c11555152fmr6419391edi.5.1678128500729; Mon, 06 Mar
 2023 10:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-4-vernon2gm@gmail.com>
In-Reply-To: <20230306160651.2016767-4-vernon2gm@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Mar 2023 10:48:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj73=Os1p=W7D2va=Rd81ZKvjb35yWgXQNgn1hXNRpAbw@mail.gmail.com>
Message-ID: <CAHk-=wj73=Os1p=W7D2va=Rd81ZKvjb35yWgXQNgn1hXNRpAbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] scsi: lpfc: fix lpfc_cpu_affinity_check() if no
 further cpus set
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
> -                               if (new_cpu =3D=3D nr_cpumask_bits)
> +                               if (new_cpu >=3D nr_cpumask_bits)

This all should use "nr_cpu_ids", not "nr_cpumask_bits".

But I really suspect that it should all be rewritten to not do that
thing over and over, but just use a helper function for it.

  int lpfc_next_present_cpu(int n, int alternate)
  {
        n =3D cpumask_next(n, cpu_present_mask);
        if (n >=3D nr_cpu_ids)
                n =3D alternate;
        return n;
  }

and then you could just use

        start_cpu =3D lpfc_next_present_cpu(new_cpu, first_cpu);

or similar.

              Linus

PS. We "kind of" already have a helper function for this:
cpumask_next_wrap(). But it's really meant for a different pattern
entirely, so let's not confuse things.

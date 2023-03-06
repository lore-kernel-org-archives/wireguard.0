Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0423C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 18:36:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af00fc34;
	Mon, 6 Mar 2023 18:34:24 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c90f583d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 18:34:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s11so42592764edy.8
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1678127661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUkuyszYTAoQtNUlKsSSIkY0E3vOhynrc0QM2L0Yxu4=;
 b=ApSrgLIXz4JjA09pC4lJ23b/ViBE9xa/BHSWJAYZZt9VJxMEzUQO12mOvi/25MWpyr
 v/oArdsyZA1V7cJArI270gsaf3V1GgsFiM0ij+oMDX7nfvEIOrZeVjdE/R+9p9P7Exwa
 gl3Vd+wv89xHSW03UrJuYFJ3rJBzUkE9sx9q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUkuyszYTAoQtNUlKsSSIkY0E3vOhynrc0QM2L0Yxu4=;
 b=Qsn5poipDQ1MS2rEfs/9z8I9CRPvpM/DEOuyP8i924E8Xf3mETcIgLG+RLVUh3Opxx
 ETfgTLErwcHmaQQvRYyfJofdvCezAROJ4jDRDIHnZMUsJBUAWBAP3nlTdI7Vm0OJDt8h
 YGbkCVB83c0yD2Wk8vtGFf+t9aCXXk2pDDIky6pivPDuOPZid1ABFSMyDb5NR4YkGHXe
 sawbkvZxOUmC2Vx/ZBVNcEUK0C7FdWpcFObACN+I4h2IxI/kjgBFVg1lh+S1wWXo55Ld
 Me7bZOEZlN/6WfwBf95CEHbF7xFRqRTC3TFH+nPViyrNhdCp+4BLDFD6Oi0vz1FPYLf2
 anQg==
X-Gm-Message-State: AO0yUKW266yd/ojLUyJzoggJftpN4wIb5UNle0sOEPpgJLPpwQ8VWD+o
 CcE2gO9K0wc08I7i3+rQFQ/DtNiPUa75tjO+SZBgeA==
X-Google-Smtp-Source: AK7set+70sS+q7i/ya896NDuoVUiCgNjZdkKBuPV//hAs6ctsjlpRDiTES6/tTrfW9bmmzDQqiwA8w==
X-Received: by 2002:a17:906:304a:b0:8b1:4051:6d2c with SMTP id
 d10-20020a170906304a00b008b140516d2cmr11825601ejd.19.1678127661351; 
 Mon, 06 Mar 2023 10:34:21 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 ga1-20020a170906b84100b008b17879ec95sm4878078ejb.22.2023.03.06.10.34.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:34:20 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id da10so42702337edb.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:34:19 -0800 (PST)
X-Received: by 2002:a50:8711:0:b0:4bb:d098:2138 with SMTP id
 i17-20020a508711000000b004bbd0982138mr6329093edb.5.1678127659323; Mon, 06 Mar
 2023 10:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
 <ZAYtRcbMeRUQFUw/@vernon-pc>
In-Reply-To: <ZAYtRcbMeRUQFUw/@vernon-pc>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Mar 2023 10:34:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=whA2kEBk3ibg3mrxpuXOAJKdM_MC4MQ8gLmxerZ5URfvg@mail.gmail.com>
Message-ID: <CAHk-=whA2kEBk3ibg3mrxpuXOAJKdM_MC4MQ8gLmxerZ5URfvg@mail.gmail.com>
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

On Mon, Mar 6, 2023 at 10:13=E2=80=AFAM Vernon Yang <vernon2gm@gmail.com> w=
rote:
>
> I also just see nr_cpumask_size exposed to outside, so...

Yeah, it's not great.

nr_cpumask_bits came out of the exact same "this is an internal value
that we use for optimized cpumask accesses", and existed exactly
because it *might* be the same as 'nr_cpu_ids', but it might also be a
simpler "small constant that is big enough" case.

It just depended on the exact kernel config which one was used.

But clearly that internal value then spread outside, and that then
caused problems when the internal implementation changed.

            Linus

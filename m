Return-Path: <SRS0=/LYe=7G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE61C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 00:30:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19F720787
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 00:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuLInsI4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19F720787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29d5fd1d;
	Sun, 24 May 2020 00:15:18 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [2607:f8b0:4864:20::d2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a87e843
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 11:35:40 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id j8so14270147iog.13
 for <wireguard@lists.zx2c4.com>; Sat, 23 May 2020 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f6m/dBgU4ZZWXr/JnXmK9qGV1Yv41yQxuPP9BaXSG1w=;
 b=XuLInsI4nPm2Bt8vqCBp+Kz5cYzQL4Xb5Wi43lC9H8MammUyeooU9AnTfZVJvGGVR7
 q9+j5tjC8VTlFdwvrdtt2Lx4vbEoTkIS6LdBAd6LBWo3kd2JwdFXx5wFrESCjqEHf9VE
 e5ynJPgaUZEnYqL2bU+YWiW1tDmxW9iZs2Zy22Shb6Codang9T6zLrlAxIbQxSqzFZ3T
 /JUBs+xi2c0UzEdIQrbSp3SOxle9CIx69xJ3Sj6Nd38u1ds6jq9f/IzVngpdAUyl5tLV
 hgrJPnEmG6pZV77S+y7cYf4yXZZyj11Rvp/OhcA560zsD1B9xngyHTPIxtWwQnjAnZVY
 40rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f6m/dBgU4ZZWXr/JnXmK9qGV1Yv41yQxuPP9BaXSG1w=;
 b=GSBbTcSTYV6inBRbhexJ4I1wGVEsUsjSawJUIqsZBN8GACK1SB/R/AtZskQjomOsF8
 87oehY0bk6y+0VqAL/Ix9prI1ZjNRusCP897OCgzlg7RxQInbeAGyeuUF3K9SHBpL2xl
 EJ/d9/cwu0WNN1cFW5oLO7Vkrfj1/ATYOTUVJdOmvNLsKc/fgIwg4OI6zYDgQLSbTxFD
 DkD17afl5kQvXO/4+AokWHj5H+IGjcGRm3OKl2QC2P9pGLxV0yySXruFpN/riMHHtgPq
 nnKTgUEQk71LuEUSJ4diw+Z6R56Zp1A0ykDDX6pNxgS9BnCIxTUuxpUFDWiIx5dxNIIi
 82ZA==
X-Gm-Message-State: AOAM5301d9RNjKO3K4GVILFhCZrjMdTovOzRjdYfiYJVRV+TcvVO/XH9
 7yzXysZ4XffjkVA1S2uIeI1KmDV0yjcWfHp8G0w=
X-Google-Smtp-Source: ABdhPJwmwKYzA/U/ZscpsU820HzUZdVAwcvWnipSJGUEpLXrlCttYz9bBzSCgDn7Sd+dTJjMrvrgwxHOk45NQVkhX1Y=
X-Received: by 2002:a02:c615:: with SMTP id i21mr11999519jan.30.1590234630886; 
 Sat, 23 May 2020 04:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
 <CAEg-Je8HRbwymZqxZJ8ZyGPk3yAG_R9bg7doeO4SdJ_h6Ni-9g@mail.gmail.com>
 <CAHmME9oTr0NF7UUgsxcmqj_R8bQ1HyYH0tpQdtyq84zPou338Q@mail.gmail.com>
In-Reply-To: <CAHmME9oTr0NF7UUgsxcmqj_R8bQ1HyYH0tpQdtyq84zPou338Q@mail.gmail.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Sat, 23 May 2020 07:49:55 -0400
Message-ID: <CAEg-Je8=PEek1d9ZvK9Fqnbm4TOzZU4hKvFL0zVd6k2w0ionvQ@mail.gmail.com>
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>, 
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>, 
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Carl George <carl@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 24 May 2020 02:14:59 +0200
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

On Sat, May 23, 2020 at 3:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Neal,
>
> Thanks for these very helpful instructions. In trying to implement
> this, one snag I encountered was that the .src.rpm file has inside of
> it the linux-{version}.tar.xz file that I actually want. Is there
> anywhere on the internet that hosts these .tar.xz files directly?
>

There *is*, but that starts getting into using the CentOS Git system
more directly. Per your original email, you weren't interested in that
path, so I didn't go there.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

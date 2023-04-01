Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A7CC76196
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  1 Apr 2023 11:38:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56387dc0;
	Sat, 1 Apr 2023 11:38:16 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [2607:f8b0:4864:20::d2f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec48635a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 1 Apr 2023 11:38:15 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id q6so10856841iot.2
 for <wireguard@lists.zx2c4.com>; Sat, 01 Apr 2023 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680349093;
 h=content-transfer-encoding:cc:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLLto5zJaUrFCbdPw2vFaOFuVaH2N0k7YtIcg0mvxis=;
 b=Muk2YZ/HO5TsXJOZxHMr2sDF2g7iJRJ/dUsgZvJKf/mC7zLBB891WvW8f6zkOOZmMN
 UOgnic+P3khqmquSZt2Xkly2vavx4Mob9m+1C+k/FL6JE6YLR6avwry/GZEkUZkdYgZ0
 j8pJpD1CIjnKmEx6kIsuLxEhbBqouV/72uzGlLSVsyGbK3f4nOW6Rwq6lruKrjqfFhft
 y4YMNNMuEdSDWDLgjXOic7EDI1z/79/esZFrUumwrzopBOV2QZ7i2VPF+P4wiQdqaz2L
 ZMOW/DmANUYZOJxvWM+iGh7gtkk3jMbUHvd5LQBza4A2WJjt2vdXkvbvlI3qKwCjQa1Y
 Ox8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680349093;
 h=content-transfer-encoding:cc:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLLto5zJaUrFCbdPw2vFaOFuVaH2N0k7YtIcg0mvxis=;
 b=GHBLlQciNrM48cUHDLkdVsbVs9MOKHPpcZjjDpMqoMhyEwYVnpyVqJwAGzQAASoq8I
 HAiKVQdKAKaU8mTrVzLhm3OZFl/R+HWjZ7QeO2/iXKx7o22LueSgf9BtQo8GdYr4oWlU
 jFp8wFJxGo2UI+wubLAUYwFkj5MlyERQPGTT9SCgfTOPhoONpoEg+AmzIvqSpFAF75Qd
 aJ14D8/xbTd+PdSBzxG1G0ZnSBwW8YHyAXiE++w3Q8Zt5oSCvIHK4Ha4DLadKc5e2eyi
 27mcB0vvG3EegcUgXaNA57DGCtFfnpe9hDeTpbIxFWCWtW2rzc7TFy8hgLCsjyYkeKvS
 R5VA==
X-Gm-Message-State: AO0yUKV9NJ8NPysTw9w6ibarHTCkJhJnI64NBu3IO/x2A0ZRC1SR44DS
 SfAW/d4oD3RtRzKSPWebkkzURS9GHyqh9UewtrgMF16sIM42GA==
X-Google-Smtp-Source: AK7set+VJoiF+asoo+TolvJFKTIePnax8bwDegi3PveagPFoNObylR739/g5kSGbcqa0s8MIisxYAVzrPtX3dOGQAqk=
X-Received: by 2002:a05:6638:1114:b0:3fc:e1f5:961a with SMTP id
 n20-20020a056638111400b003fce1f5961amr11609327jal.2.1680349093111; Sat, 01
 Apr 2023 04:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+CGqoKvx-Yeh6zP1_9goVFaPMKaVPQUij2UrO9B9Ea8cRd7iQ@mail.gmail.com>
 <CAHmME9pXvghVW7RUD3gMRR4R9bAfS9YZ7kbt+27m2tnbGtjXFQ@mail.gmail.com>
 <CAHmME9rTgQKn54SDO+JDNYVYiSFuaV+wjN2yNNNOSw43P6KiKQ@mail.gmail.com>
 <CAHmME9ryKHp-YsWHF=v=CieavufWAQKuNNxgGmiP=Kiz2uTWXQ@mail.gmail.com>
In-Reply-To: <CAHmME9ryKHp-YsWHF=v=CieavufWAQKuNNxgGmiP=Kiz2uTWXQ@mail.gmail.com>
From: Kai Haberzettl <khaberz@gmail.com>
Date: Sat, 1 Apr 2023 13:38:02 +0200
Message-ID: <CA+CGqoL=z45P34bAwjVWU=_6PYRso08539cFUccdAfh=m8xH7Q@mail.gmail.com>
Subject: Re: Nw Android version crashes on Android TV / Google TV
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Can confirm. Thanks!

On Fri, Mar 31, 2023 at 6:06=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> The fix has now been released by Google, so just update and the crash
> will go away.

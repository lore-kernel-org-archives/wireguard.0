Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C66C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 20:54:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EE223A79
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EE223A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 613d4688;
	Fri, 8 Jan 2021 20:54:34 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [2607:f8b0:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 12c7e7db
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 20:54:32 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x15so11639317ilq.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jan 2021 12:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7sDo7Ig6dt2HxHSXD1nx4pPbJPS7gh4sWOn7HUm8xWI=;
 b=mPDKeANGgH15/xo29DTlSZ1g1TfSRRAiA1k0ZeNe3QrC75e3zQdbqycUodA1PiYhVc
 hJTv5Ib1bfUQuQC3rbX6dK/SAHGS8alAZz8shYFjF7SlqzKkBEXz0yWrWgqKQ8iIUG7F
 Ffs8RQGEmU0olqPzxQ74zg+gjIV8XA1hrzmjh2gVgn1hH+dME738NYL3a7j67Iyykvzi
 qhnUJwwTtxV5LHWFlGLQ9GJ3GkqOdWX2Xxv4krOwVy9CGZOivWAWbhdFCDZFHoANz7/O
 1W9bkpR6IXX8Y0VKIEvG3bLb+D+DVwTJnXVdgQAlm/hrWylyTkjIxyhnR9qet3vB3782
 EyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7sDo7Ig6dt2HxHSXD1nx4pPbJPS7gh4sWOn7HUm8xWI=;
 b=EySaYwPnXWNzNvcaucYNFy5wi2L8lVYRx1GRO2VKxo6Eg/GVagYNJZHzTxgqMhunYV
 mY9/t8RRJgJAtEt2Oze4qxLKQO1EFVMjhGJDf70RNzHktnLAI++Fjps8krKZu1Y16Ry+
 0jfCLTqD0FCa+hW2JkZXHG4UaN4zsbhPzy1OBWNKiLVEEOYVVuNqZvWmVXlNcAyeMvRF
 UXs7Z8ZuQET6TI6+Jl4rcJCNoBcMHWyUKIEZsKbLsr8LmPed/7TCaw7WsRdaIuPUKwlo
 WTX6tWvZaKuVYVNtzh9VR6rGklsUhlm1v4SFpCvNs1j9xNJjYLWHm8xmb8m7EeBJDTQb
 hSbg==
X-Gm-Message-State: AOAM531NU7koudKZrTXqlLKSs4ssFCyvg+yhlsf6q7N9TwfWr3LIDYo8
 6UrOMLPdih9xOq3gs2g0J7E=
X-Google-Smtp-Source: ABdhPJylezPuqPddhKq1qSotHzhfsK4Y+VoLRyotouG7ekXbb0IBcIiKbO68ddOAgVdVm9pJwnatdg==
X-Received: by 2002:a92:77c9:: with SMTP id s192mr5382314ilc.75.1610139270928; 
 Fri, 08 Jan 2021 12:54:30 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id z18sm7639133ilb.26.2021.01.08.12.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:54:30 -0800 (PST)
Date: Fri, 8 Jan 2021 13:54:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: noloader@gmail.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
Message-ID: <20210108205428.GA2547211@ubuntu-m3-large-x86>
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
 <CACT4Y+ZRfQkPYoO+cgygsTLFLSbnyPRqHw3mVdVDg6zVAs4s2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZRfQkPYoO+cgygsTLFLSbnyPRqHw3mVdVDg6zVAs4s2A@mail.gmail.com>
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

On Fri, Jan 08, 2021 at 10:33:19AM +0100, Dmitry Vyukov wrote:
> On Thu, Jan 7, 2021 at 8:06 PM Jeffrey Walton <noloader@gmail.com> wrote:
> >
> > On Thu, Jan 7, 2021 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > >
> > > > On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > > >
> > > > > ...
> > > >
> > > > These UBSAN checks were just enabled recently.
> > > > It's indeed super easy to trigger: 133083 VMs were crashed on this already:
> > > > https://syzkaller.appspot.com/bug?extid=8f90d005ab2d22342b6d
> > > > So it's one of the top crashers by now.
> > >
> > > Ahh, makes sense. So it is easily reproducible after all.
> > >
> > > You're still of the opinion that it's a false positive, right? I
> > > shouldn't spend more cycles on this?
> >
> > You might consider making a test build with -fno-lto in case LTO is
> > mucking things up.
> >
> > Google Posts Patches So The Linux Kernel Can Be LTO-Optimized By
> > Clang, https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Clang-LTO-Patches
> 
> Hi Jeff,
> 
> Are these patches upstream now?
> syzbot doesn't enable LTO intentionally, nor I see CONFIG_LTO in the
> provided config.

Those patches are not upstream yet and LTO will have to be explicitly
enabled via config.

Cheers,
Nathan

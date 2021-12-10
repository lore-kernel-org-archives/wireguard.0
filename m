Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7092C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Dec 2021 23:30:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0bbfaac2;
	Fri, 10 Dec 2021 23:30:38 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 766ccf71
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Dec 2021 23:30:37 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id j2so24709738ybg.9
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 15:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PtNVC0qNUsnpWyOD6nLmxcmoHXvttC4gSujzgBms6k=;
 b=XLzn7xVB8PMmInGbIZ666sLrvINYuZIdA0YWVVMps9KD2m9kwJsF+vTJDeGcRAGLKg
 bfp/rmV1ZlRkglidU6fTQGXhizTqtFUctM3oFsS+IhVsiA3kt7uFyiMTKtu1kCOhIeii
 S0tGnn5/p1wvWPLgg0rXwN2NOXfgwXVzVA/Wph3jk1916U9S/URPkssCq31LhqVqG1DR
 5VhgzVKOU2LFjIUo1WZ8ajqwrG/Lp5GmGHkgSIrphqMyQGs0/TBjn0XYWM6AX9puZXEz
 pdaiQVLnmfIHjDNlx3/OpP49jbj8Nw5ffLYTuQy/sjea1xWX4FtnmMb8u1FtVE26bFzA
 ebcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PtNVC0qNUsnpWyOD6nLmxcmoHXvttC4gSujzgBms6k=;
 b=LUopn1Moo763wr7tl1ypAZXUpzvSv26+r6QPhE8vArse2GAfEOv+W0Gy1r0GPApkBq
 xvsa7cLfv6U/+muAYmk3sEmyEojVefbkyPm19dVWlI2N0dLd3/ok2EL8DBel9xtD2XWI
 /bzXATRFIhVE0l1/2RhGGkjFI1AZEt3n0rP5IxEi92XV4Eob3rdLHuZ2qPtrR/1iz3nT
 nunuWFJQnaYQGcM5FDzzDvRnqZdPMAfSXtSYr+t6iW0w7ayoWj6jnX1D1kSW1du1M/gd
 49XJYPK2sIUgJSSADwiWhsHMGGB+orbNtHrwYbNeb4gRaG7g+TswE6V7Wxnp5UYyL/fX
 zrQA==
X-Gm-Message-State: AOAM5336IRbQSESVP4JVnTkREDBGIAG1Zn6y0EK7bMXsvegD45OIyWuP
 51oShwq1TNkDoJ8BCHGZ3uWWEufr93GUURZIldpbSlQSDnruqg==
X-Google-Smtp-Source: ABdhPJyHig6nc3Qe5js/x2/pa8m4Or6lbQpqjMR+UYkwEPkuasmDNF1o/OzZaXwIsWKewuDVxvovt1n7hS7xmkFvJJA=
X-Received: by 2002:a25:f621:: with SMTP id t33mr18482801ybd.576.1639179036011; 
 Fri, 10 Dec 2021 15:30:36 -0800 (PST)
MIME-Version: 1.0
References: <CACD9L=CAinAO0CHRR25-sEoxCqNp_8BCqU9kJLK-Wzt++oy4bg@mail.gmail.com>
In-Reply-To: <CACD9L=CAinAO0CHRR25-sEoxCqNp_8BCqU9kJLK-Wzt++oy4bg@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Fri, 10 Dec 2021 18:29:59 -0500
Message-ID: <CAMaqUZ1yWooNbHdDhTAzrUeHtQCFn7QunSWdAdhdG+Ru6=K9Mg@mail.gmail.com>
Subject: Re: separate allowedips from routing for multipath
To: Arvid Picciani <aep@exys.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

WireGuard doesn't care what address V has, because peers are defined
by their public key. If V switches from A1 to A2, upon receiving a
handshake packet from V's key from the address A2, B will start
sending packets for V out to A2. Incoming packets can arrive from any
IP; if they're from a connection with V, V's AllowedIP rules will be
applied.

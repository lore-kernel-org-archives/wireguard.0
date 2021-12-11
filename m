Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E452BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 Dec 2021 07:28:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2e50459f;
	Sat, 11 Dec 2021 07:28:49 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 505679d7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Dec 2021 07:28:48 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id q14so10516822qtx.10
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 23:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exys-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JU2iwLSETbPfFpxjhxh7yX0xWJY+FcXHnJpnqPDxoAY=;
 b=REX3L84yyCCpLUExdVPk5EwKVuycju/dCXohwetd248BHcGnD9FlXr2R0O9Wab4mTe
 Hw/ikjKk7iI6exMoFHIwhx7rKicFtHmFocU6xiZHZcbba20iEit4nuGrKUmrd75MOVET
 gIqeSpu01PQN/wXJY28Ll8gVXhVfod1nSt37aHJP+QvZqireGhTaZJlbn/KCz9b6pl/e
 DvuF5HEORp7tKIV9oKXaWltK/Gj5Qowc8DAs8emB8ONDHFPZIl5QjR1XNXK8/OldA9pX
 t3c1nZ+LGxPxHNUSlC6HtpmlnKj1jQTZamaecMPaP5tz7se3GwLx5ese+Vv871uRuGpi
 yslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JU2iwLSETbPfFpxjhxh7yX0xWJY+FcXHnJpnqPDxoAY=;
 b=GBbiH8AWIhL4IOeHRG7MHPN3BfeKr0ch2veBVTRiVg3RoWAvdny8zZ3hNHsrxmXb8a
 zH6eJVpnj+Tqg7SL7BKU5ORpf7pOeuBJEx3uKdmdJuKsS+qwlHZlPX4mR4kF0Jw+z7es
 cs27jefgEbgPZ8FuGIyzZYe8Tm0O5Sc/1D6two/mNjIOXq80J/vwSbnu3OvFq/lkKIMj
 7qwYwAwq3uZmxzWhLFOm6axdLVKn+onRoRbQL4DN6foRmFlAQn5oR7jmduKmRW/QoFFU
 g9APpVPm5d5QE3BE9biPR/knjtO+/yZyqEhtr0SVaZ77FU17anZNSFfub3IkM6LE4w/b
 YRdw==
X-Gm-Message-State: AOAM531Pf4cbWEOzUD9f3hcfwUAs1P4CCHTZUskrjUgT3B9OzVWGFyCU
 4vjmruD13VkMl/EhBWfsJUy3BrG0CKDay0qYTquEkw==
X-Google-Smtp-Source: ABdhPJwvifnM5nlJ8zsgbpU+rXZb11anKrmrgMyfO2cBQDlDvGLOZLnusOqlUV/MGES7VF21ThxH5CBtTeZA57jSkUk=
X-Received: by 2002:a05:622a:508:: with SMTP id
 l8mr31815963qtx.650.1639207727602; 
 Fri, 10 Dec 2021 23:28:47 -0800 (PST)
MIME-Version: 1.0
References: <CACD9L=CAinAO0CHRR25-sEoxCqNp_8BCqU9kJLK-Wzt++oy4bg@mail.gmail.com>
 <CAMaqUZ1yWooNbHdDhTAzrUeHtQCFn7QunSWdAdhdG+Ru6=K9Mg@mail.gmail.com>
In-Reply-To: <CAMaqUZ1yWooNbHdDhTAzrUeHtQCFn7QunSWdAdhdG+Ru6=K9Mg@mail.gmail.com>
From: Arvid Picciani <aep@exys.org>
Date: Sat, 11 Dec 2021 08:28:37 +0100
Message-ID: <CACD9L=BWM_OPmBjTh7JUsBkL3A6V_hiyHDos=1MrEkJ5P3QhWg@mail.gmail.com>
Subject: Re: separate allowedips from routing for multipath
To: Reid Rankin <reidrankin@gmail.com>
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

Thanks Reid,

i'm aware of how that works, but that's not the question.
V is an IP routed on A1 or A2, not a "road warrior" case.

I can look into if port reuse is possible if a patchset doing that
would be acceptable.

On Sat, Dec 11, 2021 at 12:30 AM Reid Rankin <reidrankin@gmail.com> wrote:
>
> WireGuard doesn't care what address V has, because peers are defined
> by their public key. If V switches from A1 to A2, upon receiving a
> handshake packet from V's key from the address A2, B will start
> sending packets for V out to A2. Incoming packets can arrive from any
> IP; if they're from a connection with V, V's AllowedIP rules will be
> applied.



-- 
+4916093821054

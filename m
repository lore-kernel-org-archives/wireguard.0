Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0DDC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 22:42:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4268321871
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 22:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="VUNng6Vi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4268321871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f8a8268;
	Tue, 18 Dec 2018 22:42:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3ef817a
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 22:42:03 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d747ca52
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 22:42:03 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u18so50694oie.10
 for <wireguard@lists.zx2c4.com>; Tue, 18 Dec 2018 14:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kNP5GcZlcTOOn/dbg4TdUHx/+mVb+vs/t4msVDxXE6E=;
 b=VUNng6ViJwsNUsxBuRdRC56as1RIzp/9D9ATwAwtqc93ooKVBu88gcQEq4GQPvoqdr
 PXsM+H2+9wttfvDmOSUDNiR8FBswQx3rHYNFwbMH/qsVYqttPXBSyCo4UgA8KU2TCJG0
 WXI7vkPgt1jYHbZefOBqCqg8zZNIU4ur4mQUXlw/BejFFayncsd8sV7UCsCV5WytB4gp
 Y23QpoKL+7PzBcHtLddEbGYh/p53Z+lm0bDhlOzWC1uq8c8fDyhD1vdOaO0os4Lttrh3
 8QAzGoptnPkySh19YWvqHH14EDXBJQc01+p5Cnh2PE7Tl9OnJbbSUv2Dlrjuvxmn0fyu
 Eqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kNP5GcZlcTOOn/dbg4TdUHx/+mVb+vs/t4msVDxXE6E=;
 b=HVi8pM/x+fqZLHkY5VYHKr1N8Xz+vMfsAlTyZxYfI6d5WAXRouVW9nQmmi3BVeI+NV
 fE2aiYz7Tyshb76dpKcb0qLddJZuAYYPPbhCVdvK+IuUfH1YXb/yNurSNaGSqJaRURFi
 83J63cqlUJIFVHIZbqfOD5ZPPrOHFuVwnFXgOAWhFdviAv5AVTNGpbKMR9imMNAfLwOg
 0EwXiskzN4FNAFosZwF7pLL8przgjMGqu4H5HfYwAkcE7b3Hp4UUa4PhcoFWZLhL5Kps
 +B7ydXggN+BinRu3/5rWvH2Pwieut48iDecnwMGIVgWBI0LigvzeFFnPyguyVsykDST4
 Lc4Q==
X-Gm-Message-State: AA+aEWZDQijkezzXighicBDDS+I6Mz0qYVide+N4U+WilYgAd6FvPkzP
 5SO1BhfNQoDaKbmUZMf6v7Wl8EWhAnwC5QMHxiQ6cA==
X-Google-Smtp-Source: AFSGD/VsVbA7x10zQ2IY8KD2/pkJUcVcDvcNxE3E3D/leNiHLUviTZfzQD2L75/gIPNjzIGAWS/jV1Z7ZPRkKkvTFRg=
X-Received: by 2002:aca:c413:: with SMTP id u19mr8449834oif.209.1545172953037; 
 Tue, 18 Dec 2018 14:42:33 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZG+GtovJG0tCusWD3VrMdV=ZMJ1=OXTTO4DQsChtriVg@mail.gmail.com>
 <CAKXLc7ewkUKnVLugQAzqWbRxb8w1NaDBV4_DtAJeBSVyggveOA@mail.gmail.com>
In-Reply-To: <CAKXLc7ewkUKnVLugQAzqWbRxb8w1NaDBV4_DtAJeBSVyggveOA@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Tue, 18 Dec 2018 17:42:22 -0500
Message-ID: <CAO_nJAazsyAPj7Q+7fqSDe58+V7kH+WUP9je7=H=QLawSevj6A@mail.gmail.com>
Subject: Re: Syntax for iperf3 to use over pair wireguard interfaces on a LAN?
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Dec 18, 2018 at 4:49 PM Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
> On Tue, 18 Dec 2018, 20:50 John <graysky@archlinux.us wrote:
>>
>> On bar:
>> % iperf3 -c 10.0.9.15 -B 10.0.9.16
>> iperf3: error - unable to connect to server: Connection timed outa
>
> iperf -c 10.0.9.15
>
> Also for the server, omit ipaddr, it listens to all interfaces by default.
>

I tried that but nothing:
On foo:
% iperf3 -s
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------

On bar:
% iperf3 -c 10.0.9.15
iperf3: error - unable to connect to server: Connection timed out
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

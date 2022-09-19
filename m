Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB145C6FA86
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Sep 2022 17:47:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 29c58bb9;
	Mon, 19 Sep 2022 17:47:44 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 17343932
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Sep 2022 17:47:42 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lc7so568761ejb.0
 for <wireguard@lists.zx2c4.com>; Mon, 19 Sep 2022 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=8/inuDH7Ak0ETiZesvADkfUSZ1DNZeCIDX8OjBVTh94=;
 b=k3X3hdHh/jgXRMcvkYdXGH7eaTghfjVLgHOb6jl1Tf0rXnaffn1ZIB3jh+oQIr6jLt
 Hv4Jq9cEx1efr7HHSJ1Nf4oQMPJ8RZg/LyPwsH2KvOgfosnRbO3hTuR79l+WOiex9jke
 lcMUkvu5eWg9CtxYB9Ld5Up36FDDq5/5ODbpuS7c9gWa8LZEGTRlMlCIZFEH60AULaKE
 Yq6z+ChsUTud5qr4agcioR9Ib2cfkk7Q0xtD4uF4Qs0mqVhrx4ho9PB7qAKt/gWvB30v
 M6nP4rsZPbrOc0RwbsntUAyzF8kJ5P+OgvkJb2xLQgkKvdJZs9qDeEtfHCpouiDOODx2
 Wl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=8/inuDH7Ak0ETiZesvADkfUSZ1DNZeCIDX8OjBVTh94=;
 b=M81cuoZKcF0JUuCPOYSt3Kv6FGlXCd3/nxf9gPD/ABY7VmTUGAhavhgF8CZl+ArJIQ
 pDVk3x8w9KDnN3fAap7N8GGJTRJJ4sizbvdeOwm5QiXweHt8cNr1T2lB0xxPbuvYYKUe
 IROLgfgbGu7SIj1orVFzoMbvBQED1Kh7cAMl5pYK83nIuGeblMUS33bH8nei5cDUPFJb
 ZQ/hx8TTnNcg0EiQGmA7zNe3ydokdAzAqqQelgJT/tAc6k9wF8aJgqumM0tMf+FQgbW1
 YTP9FvPzy/49o8QP9ciJ9FaCmzt+0Q+wAVJAIUfnaHQb8QlGp7BsBznrP4GxMvdlmVfT
 n/5g==
X-Gm-Message-State: ACrzQf0PXtcAJUFOuPU3pEzD/BSpd0Y8VGTKqqmn0tnHfgTWwXbdxHVg
 XUy8Ns/rQOkKdBdXRehTyvb1711rwv5JoaYhBN2wVfID
X-Google-Smtp-Source: AMsMyM7soeDTE8vHo1I8o0UA/pHcJ06uThzSmmkM0Ck/PZ9c2fMfVDK6v8rnZ/4el5/22XCBKlFY2E//14nVF7CgyD0=
X-Received: by 2002:a17:907:d29:b0:77c:be93:d3a9 with SMTP id
 gn41-20020a1709070d2900b0077cbe93d3a9mr13991347ejc.654.1663609661392; Mon, 19
 Sep 2022 10:47:41 -0700 (PDT)
MIME-Version: 1.0
From: Devanath S <s.devanath@gmail.com>
Date: Mon, 19 Sep 2022 10:47:29 -0700
Message-ID: <CADjMg7XtPWoozpBikNGP=EDCYvH=dr3Uo60emPXGvUv0MbJvVQ@mail.gmail.com>
Subject: wireguard-go on MACos
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi All,

We are using wireguard-go on MACOS/LINUX and a dns-proxy is listening
on wireguard device. dns-proxy is receiving dns requests from the
desktop (destined to wireguarddeviceip:53) on linuxos. But the same
does not work on MACos.

I have tried to create tun/ap using go-library (water) and was able to
receive the requests, but the same fails when using a wireguard device
created using wireguard-go. Also ping to wireguard device ip from the
desktop fails miserably.

I am kind of blocked, Appreciate any help regarding this.

Regards,
Dev

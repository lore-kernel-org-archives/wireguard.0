Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7437C47257
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 16:58:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B62E206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 16:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw1AIVzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B62E206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0aaeb288;
	Wed, 6 May 2020 16:45:29 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a387acf5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 16:45:26 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f6so1237678pgm.1
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=B0zgFTi0deSViAZY9DPE6KxdnqflOoQvr3pncBfT1Uw=;
 b=Cw1AIVzJRXK4AVnnxVw4Kuu7nIvejYaYXYnxakrrWAc89OSiCkgIFfjODKPkxm+yJQ
 5HP40HW9GJyc9PJNytNcg0meZo8DdE5PRvikT1gyUOt9s8/rFZmc5JW/uq4J8kLtTCxD
 tNNlGloDr7vw6zfgCb8UE6/s0oJEZ6EITFl1KbN/2NSAues5oE1kFq+7cBuUGtlsaL99
 UBpC28nn0+X4+3EfWW0+rjNigSbNOBAf0oEFf0KC040lytm401YrMXgXIaMCjlgbyfZ9
 bQmv+a/JPRhea5gGuTPNmEQ4Rm+mybvzLOW30kDOWuxVJgeIrTdOBbIQPReltxySntYN
 2h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=B0zgFTi0deSViAZY9DPE6KxdnqflOoQvr3pncBfT1Uw=;
 b=Ugj6uTHKds0FwcvoZHy55gNi4Lmmx7pW66dN8fom9n2lz+cO9borcs67H6hj5yi7Oj
 RI9Eo2z7Q8pb2GHJPduI8em9PAdpTWawbo8xNZslApSLWq7vm9cEAELqbcTPvybUv6z8
 Qfe180cn/ogC8EkBS7h/jN51U1GbHBv3b0JR3B+deyiZpEPsaT6TuCuSzfBzTd8M7TR4
 vj055EVpAQ49F1B3/8o8OEhNtZSPf6FRRCg8cDkzQOQLJr4L5UGtkslxWW8JqVgkK4uu
 1MMZTjGYGYqFlnVYPOVaSgCQpPPvDwemQbHEZwAPAMC5eQS21Tj2j85qPiTBNXFHPvv3
 oZUw==
X-Gm-Message-State: AGi0PuZ1/CF3kNd+fcRfGSZvwbrIG5e/msM3mCl2quX9lcGeXGl/4Hy6
 IJ50XZn4vQWoPLHv3Kav/ZRbAHZG8AAjaTRUQhAIbpYJ
X-Google-Smtp-Source: APiQypJK3nC82dVhgjhJgZ2+dzdGjFy6uVvjN61Q/+thz32qzaoFVbQNcZXcy2NFOlA28FaYpLeeTAIHPeOx5h1nQ/U=
X-Received: by 2002:a62:764b:: with SMTP id r72mr9174238pfc.207.1588784286365; 
 Wed, 06 May 2020 09:58:06 -0700 (PDT)
MIME-Version: 1.0
From: Mo Balaa <buddybalaa@gmail.com>
Date: Wed, 6 May 2020 11:57:55 -0500
Message-ID: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
Subject: WireGuard over WireGuard
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

We are running WireGuard over WireGuard. It appears to work well;
however I am noticing some applications struggle to work reliably.
Lots of failed page loadss / timeouts. Any pointers on how I could go
about debugging these issues?

Any general pointers on running WireGuard over WireGuard? One note
about my deployment is that it uses socat to transparently proxy the
inner tunnel between devices.

The setup looks something like this:
tunnel 1 (iOS) -> socat -> tunnel 0 -> Linux (tunnel 0) -> (tunnel 1)

Thanks for the feedback.

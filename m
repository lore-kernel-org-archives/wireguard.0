Return-Path: <SRS0=eD45=PN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F8EC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE00E60720
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE00E60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8da3443b;
	Mon, 25 Oct 2021 15:52:15 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [2607:f8b0:4864:20::d2d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b98156a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Oct 2021 16:47:40 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id q6so8361987iod.7
 for <wireguard@lists.zx2c4.com>; Sun, 24 Oct 2021 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=jE0NEo6ZND/nx1GpJly0tfNYEhzDtDVW1rq2PbNQBqI=;
 b=WyOBUq5MSe2ubbcs8swHlUIw+wlc6I6b1EKsaS34E4LQN4+d688gMRnkCuMc557Hpk
 9+2JL06vbPNP7QDsFjn/IFNVnU1+HW6OXOkiKFhSoELHzfNznDrUOr2Ap84fPvUfVvC7
 cgaopLYzqBcKobZur/MWTbC9LTWpXYMJtLBDVqAhMy2NtGfSkuwfEt2wwm/PY1Xq+Rd7
 wGAeavMuaZuTcp3WZXIeISPVW2SO3w+M21W+1ZHUShFglSgDUflf0NUfZ/NtTbpkaOnM
 /IaXikXa31KjErVDW8TrhY/aZIwb7X7DuLrdhKEHY3hPHg4/c8Zr4WSDrhj/DooEvEay
 67rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jE0NEo6ZND/nx1GpJly0tfNYEhzDtDVW1rq2PbNQBqI=;
 b=upVSNQifs6VUDo46tMnt8fPjpvbg8QmKvxYKCgPSeBWM4sDY4HQ24YD7gpmBaEKy9Z
 JjZCrVyfl3piNTX5ClAedp5cQWlmrZbiZu9oMqzmI94MEuqYoMvp/5AFuGYQXnUp4U2P
 Rb+AmsoHWOH2nWCvWdQvyEF38xxEXGlwgB+6kOk1kfRQriBzqIiot2L1UTBB/MeSiVB2
 CXX8drxkCcHYT9PtIOJXWTrtVdaiihOVBaWvEL5lttnFDSWFQiYaQlj4+iqE78d+TWJP
 qjBlc92jsNi5i7uzq0NRsw+QH+sJF4KylJFy0jXf20d9XJNZ+n3b6DeXU6tZnCl4fWoA
 6NTA==
X-Gm-Message-State: AOAM530wqX5ibyCokSrqYVkvlJnn0MoOfkTqJQfbM0tovRl0HIrmlwPy
 85v3GaJNNvJY1mknB9yf9ERb0JOB9BZ64eRFX/UyhRqL40k=
X-Google-Smtp-Source: ABdhPJznGcZAW2v5EpJKDvvFZFV1oG/t/J7xoa41TIY37n4cp49N1lDTbZYpUU3yPi3oS8MFujeU2OPITJ60520d3lc=
X-Received: by 2002:a02:c8d9:: with SMTP id q25mr7412344jao.85.1635094058625; 
 Sun, 24 Oct 2021 09:47:38 -0700 (PDT)
MIME-Version: 1.0
From: Adam Bliss <abliss@gmail.com>
Date: Sun, 24 Oct 2021 12:47:23 -0400
Message-ID: <CAEAeJWyPEhWgPQXEbJ=26G2FvK0xzyvmQ4reakdFpCt8wgpGPg@mail.gmail.com>
Subject: wireguard-go no longer builds with go1.16 ?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 25 Oct 2021 15:52:11 +0000
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

The README says 1.16, but it seems like go1.17 may now be required due
to dependencies? This is what I get with go1.16 on ubuntu focal:

$ make
go build -v -o "wireguard-go"
go: downloading golang.org/x/sys v0.0.0-20211020174200-9d6173849985
go: downloading golang.org/x/net v0.0.0-20211020060615-d418f374d309
go: downloading golang.org/x/crypto v0.0.0-20210921155107-089bfa567519
//go:build comment without // +build comment
make[1]: *** [Makefile:20: wireguard-go] Error 1
make: *** [Makefile:12: generate-version-and-build] Error 2


Thanks,
--Adam

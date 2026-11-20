Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5282606A68B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2026 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wades-im.20260707.gappssmtp.com header.i=@wades-im.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RPHwtpY3
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4422ef1c;
	Fri, 20 Nov 2026 21:13:10 +0000 (UTC)
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com
 [2607:f8b0:4864:20::b131])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 81232bcc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2026 21:13:08 +0000 (UTC)
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-67db763cec7so1603320d50.1
 for <wireguard@lists.zx2c4.com>; Fri, 20 Nov 2026 13:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209186; cv=none;
 d=google.com; s=arc-20260327;
 b=HgVC7TfFjAEulS2LG0zlfj4iCvi2Nt4YVC6+GrEfmLZHCMBx7JcWmSIazVZdT9x6YR
 6h9WLlQNKDCgbKYFtIA6xAagsYPgqiWrHdrlwNPvtPgV/FQXUQtu3pkTFYXkwOVlLZ1V
 hvZhfVAraNRFbh6yM/beuupCcoEk1lh8MsdY9yNYXZyIWpR8YBrWWfgbX06fEE2d1f+c
 vilL+Wy1ELhJJjCafKPWBu2FAxW6ZWTGWwQLPEw1g6K+2s+Pmy+beESqB7u6Wp28JpIw
 lmuwqgx/7goJcKe69KSDIFrImfo6CwO+bkvCX0O7avuF9CQMRMN8Zl1RvAhYTMqOk2RI
 p6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=02KiKNZpF9Ct8tCZ/vhnx85VM+9ZtYctQDaudIWc7RE=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=aNBD8Qv7pmUBjYlQfnuDPWmkxOUxrMUSZJCrlZpah2KE8A5EbqvsqsWRFM1ugiYrJ/
 iXEyxvGskvSl/pw1aij2M82b+ejdHPnOc0obRSAicFIJ/fcjLwdUnXaa2dmmuiOTpxIz
 1u+k1h5IUz5n2YgZhjs+IRofr1vsCbJ2i7kBVuHiL+bZm6zhzOprlttkLA3P5C+PkHtu
 hRPmuRhb0MoEvT9fu9Iulo5qgtjy0Ob9Gn4O8hIDR1A1iP/ygwTiGEi4IcJapNXLjQTY
 tWAVyXloWVcG5T98wmmXGwGgYiRRQXoJ7t4fjdQZ70Vlf7VV8iT7kIo2jtpcKkrBm9Ic
 1KNg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wades-im.20260707.gappssmtp.com; s=20260707; t=1795209186; x=1795813986;
 darn=lists.zx2c4.com; 
 h=content-type:to:subject:message-id:date:from:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=02KiKNZpF9Ct8tCZ/vhnx85VM+9ZtYctQDaudIWc7RE=;
 b=RPHwtpY3MpNGzyGeHLiuyca8huz6VIlguKiqF0MxZJXRj20IbInc1Uqsr5dxk9192s
 Nus4qan+vAQmE1SnC4I3jlVLVmvUqipiCgi6YtUxASL7XOKhyAIyv1P9OL5BCk1uYrU1
 6QTnac/l1HvNQyTCh67xzDzE9bR2/TTT4BGnng8BqOk/VweftBWaS4J7QTTzS3GUCcRW
 D/owD2nb1S5rRCBlNlTZCge6Mi3h0I3ytuZRZcuG1iID7f7Jcgh8pJ7B1b1frPS65j/t
 G8tx8DTsWpVnlkDqul59gMk3rEjPim0G9tsf5VdydFJp9EfIr4G3S0UwkUufqVbWS8ik
 RyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795209186; x=1795813986;
 h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=02KiKNZpF9Ct8tCZ/vhnx85VM+9ZtYctQDaudIWc7RE=;
 b=0EQxFJv7v7333lu8pKkXLNkCaNWivCVQpSlwj3OBD0eGzan+4dTQqLfLP/ChmY2rbP
 IKu/kYMg6sNhDe6T0curHfAbvk0P8o0SA1iqskISg9qBWPLz7FbffoHoPnyi4URX/U0T
 TAtTt0x/4CRCLKQTYFn+mu4Zdbt+7JNA/lIhEjSS69vsoZLW7X4Nuo1MGoZGOy2iEMmi
 kqJkhItn/2axcaingBF7/L16mpIcRNZOF5vpuh66ZYrwgAH+MC9jkRiQaAMBFZf2UmX0
 8vo6j3Ujet4iCmSDvCL3B20NPmjLFEMQDpGDFtSdgfgkYQc1wXG0Zx70Ezbboa3/OalD
 NshA==
X-Gm-Message-State: APuU4Z85A85pdgib2Ad9B1YMOP5quZCoNhT9nstLDfQVzT5zMHc6kyNB
 t1hGG9X4Gtjp0Hlu3Zhy6qpwa5ZdN5noQ0cg+D+7g1LyqjF7G3mWC2+dos/ggV2+c6I/n423UiN
 GcnoEzhsBiJEknOqLD5DKBXkoB+HphXKNywr1Ip8=
X-Gm-Gg: AZFdTZdqXI1E8O6vMtYNwLvt4H1FJ3UoF9HBKNsKUIk99BqFEXpXIv2VaL8mAZC4jtE
 yP2lwmkt4+VYWaG0ivGWL2vX9KaiNlWdkWfb3/GRQS6ok4saZuCu6eji1oil5a9UCuLEE+f1gzs
 hx0xoxMK1iUuxl9AU3wQQAvz5Rl4osPEV61Sb1Y1HWheNFK7XwhGQrjmY18pxfMzM8TEaqoFEAv
 DtLWddLerecJ3yeWx/Cm6vqujEhs99QjU22sJypGqkJYgZEM4Azl7LdFrwwgxpB74GBE/Vu5oBQ
 0wMX9oDcsJfWAscFVDdct7KcoeAdLRwmmAsOul6D5K/Vjz4axgaYPpbJDP0DLgV6xj/Oo9pFn+A
 PoDdu7UQtMIXUeDxZ8IwWleABGBTHRaeXTbd4Xh98MpnCPnvE+SBqG6/08E+3yjB+NrPZAWrXqV
 /hSSM3B1ytfuilLdQu5vP82s1hDuc=
X-Received: by 2002:a05:690e:1698:b0:67d:ab75:a917 with SMTP id
 956f58d0204a3-67df445360bmr1513751d50.60.1795209186507; Fri, 20 Nov 2026
 13:13:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Wade Simmons <wade@wades.im>
Date: Fri, 20 Nov 2026 16:12:55 -0500
X-Gm-Features: Aa3M54r_x6lgOC_SdMQxkK4wICzNJ8OmD5B7M3-mPjbkUYJe5nPZOoplcGYZGL4
Message-ID: <CAF63tRqE-udLP+xH8hYJTtArUZM6wvZk2mTpY7X2xLLDeffuWg@mail.gmail.com>
Subject: wireguard-windows: v1.1.1 Go checksum mismatch
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It appears that tag v1.1.1 was modified after proxy.golang.org cached
it, causing Go checksum issues for anyone trying to reverify it from
source:

- https://proxy.golang.org/golang.zx2c4.com/wireguard/windows/@v/v1.1.1.info

This shows Hash "82d7a9cb9cdd34be5ba8c9a6d92a2fa0d2cd5846" which does
not match the v1.1.1 tag in the repo, which now has hash
"f0605c3e3dcc5ff801e19158fd6255378b99e17c".

- https://git.zx2c4.com/wireguard-windows/tag/?h=v1.1.1

Proof of issue:

    $ GOPRIVATE=* go get golang.zx2c4.com/wireguard/windows@v1.1.1
    $ rm go.sum
    $ go get golang.zx2c4.com/wireguard/windows@v1.1.1
    golang.zx2c4.com/wireguard/windows@v1.1.1: verifying module:
checksum mismatch
        downloaded: h1:nZZFWe0wrs77JWTXTL32wrmQQ28nQ6rOyB5aEKQvwjw=
        sum.golang.org: h1:8/H97U1v1PNDNcBsMZgU3KFuND9MQdTsU2NOwmCXArE=

    SECURITY ERROR
    This download does NOT match the one reported by the checksum server.
    The bits may have been replaced on the origin server, or an attacker may
    have intercepted the download attempt.

I think the only way to resolve this is to push a new tag, such as
v1.1.2 and ensure the tag doesn't get recreated later.

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9EDC636CD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:35:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2502c550;
	Tue, 7 Feb 2023 04:29:51 +0000 (UTC)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 83233b8f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Jan 2023 18:20:40 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id j7so16973667vsl.11
 for <wireguard@lists.zx2c4.com>; Tue, 31 Jan 2023 10:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t00AMxA1YEQ1+EyJvUWc8f/qjPS1NxycftZqnyHpQ4Q=;
 b=ft6xwKKW0AlJTO5Me88j8YC1ST/AiAjVZnhPXkG/xyqNFCkZHHZv6aek+pMcfYsa64
 A3AFt6Soa9m8PxtbH86zjBlnjtBsFUmDm3FLMpz2sN6CkJkHIKGS9/92C5oIaQtDnLLG
 pwzgTa2x48IXfrq0fvAZFQbEIFIe9U6bptgVNeNuD/M6lBySzJUimPbPlrySsPKWmzvH
 Q8vjG9HgSdu6xqw9looEmXKZsby89xzqvDsjO7vRBUg+IK0BEGaMgLbw/saS4A7Ri/4d
 RSSnyTxYnxPPniz/hsIBI5acW+vvE4LIvIsMXVTVF5MuUD4/G//CNZ8RzY0dUTuh8cxf
 Cy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t00AMxA1YEQ1+EyJvUWc8f/qjPS1NxycftZqnyHpQ4Q=;
 b=7NvabyLXLkXDeW/eyb7BvMsM8F4GJ/8rvuHbPN1FUBlddagGfk8RmY7mcAiv9Wc6yU
 3TavvnuEki+LCqkTmS7ouLhdf/ETILulGobi6C0DO2wGw1gyPcZWGlkf7Ddl3xvTBLAB
 Br9DiRmb3NZgFKjuU6/TWI0Lb0k2Hlz64pqfwDFKW13bcj+oaN/r5HjyGi+MU8hDYdeC
 0zXI7e2w2/YeFJ/XDfHJ0/WCmv96DkV1eCcyCIIB2BEClYHx47NJkz37NDDCm+weT7k4
 cMuu6FBsxNMhcHnj9e7uxZwW2mhe0GE6ANX92TsItt41o+K1trDLjPHk/gt1Fnrlqwnt
 U+eg==
X-Gm-Message-State: AFqh2krz6DEsuLzA6Xo2y9eI49k1uXtZP/FjijtgzyarksIdvtta2Eb5
 mzkXzdc/a44OWrXP5v/DgnKVLrQz0griKiPA11DWYWrnkEJn8w==
X-Google-Smtp-Source: AMrXdXuP2omXatlQNZKRaYLfS8XihAOftbPmienVLy05xu9JAp2wkELu8/xsVoqNnORKtGeP+cDt7GxX3OWJVW7KEyA=
X-Received: by 2002:a67:fb42:0:b0:3d0:d3fe:3d48 with SMTP id
 e2-20020a67fb42000000b003d0d3fe3d48mr6714892vsr.32.1675189239487; Tue, 31 Jan
 2023 10:20:39 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Berkant_=C4=B0pek?= <berkant.ipek@gmail.com>
Date: Tue, 31 Jan 2023 21:20:28 +0300
Message-ID: <CANAp0rHRK_p+VEJ=6wEUu63XbwS2n_9zLBeOgcWOEONVB__Xog@mail.gmail.com>
Subject: Encapsulation support in wireguard-go
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

Hi,

Does wireguard-go provide any facility in order to encapsulate and
decapsulate WireGuard packets as they leave for and arrive from the
remote peer? Or, am I just better off to use kernel implementation
with a TUN device to handle en- and decapsulation and relaying?

Cheers.

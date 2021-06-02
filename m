Return-Path: <SRS0=nrw4=K4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50FFC47083
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jun 2021 06:36:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8B96128A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jun 2021 06:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC8B96128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95611f11;
	Wed, 2 Jun 2021 06:36:18 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 016002f8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jun 2021 06:36:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k7so2127311ejv.12
 for <wireguard@lists.zx2c4.com>; Tue, 01 Jun 2021 23:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=banHVpXFVndhVbaD17wCvCqfKzy0oRntlOCG2RxdZzI=;
 b=RaegX6ugVzUvhYcEvG9UNUTF7iJidvrgXsKADuB4gUsLlNwJC4j7ADW1tseEb/PVyd
 OpgX2HagKgV++vRfs5UCXKJ2ue+d9rdjD/P1ArYv9f23Cnr8uELrE9htahbxKN54kgfo
 DI9LZYDPI6SfMME55u5dvMGmGmekyl5e0wGQkQttqExWJRGZRH5NHPPHWjmaQhHe3tR0
 OCq54DWzCQRDnSQzlqTuY5YRyJfMt8JH6DzYGvdW9rVywKI2L8Qjw6svcIMmuckPyBBw
 LJjLhwiIsgYEyP0Ew79nOUVv8BYS4QYXo+U8uSpWMqCvTuYcz9x+HfUfLFoRZKIrnllH
 kBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=banHVpXFVndhVbaD17wCvCqfKzy0oRntlOCG2RxdZzI=;
 b=IYn8oCKHX3sd+sNVMm1aebdp5kDM/HhW5qbSjo3nECo9lHerbtq3UJzD07VH18UYI8
 oyYQqbvqSe/cGFsw2yuUCTvSc17JSska87WH7vpsyrHlaXfiljtUz+BbKqebFP2hV4vC
 B8CCW4XGMcIMvPqmIgrtubzuxjY65OP0oS2YRPGsapZI0OqDD4EBId8TjZcCgNNJGtB8
 BWGa7heRaHLZNwLe94pxJFVyBVD7h0z1zQyC1ljXR0YQT/B0e61Q5r0oNwl+3n+nuE5G
 0IsfHppcIdm9ahDNC3zrJdJRXNkhLdo0XlTRynIlchnL4EJA8H9EyshKZK+fxDG7Y38c
 U11w==
X-Gm-Message-State: AOAM531wMItI5DvWj9gN0BYPgkxo3vClyFxLXcSr3lwDN3YR32w6rOH+
 C0wC0Op85ufgLS+vLGeKOGuKq3TB2QMTLA==
X-Google-Smtp-Source: ABdhPJwus7GrM4+I/B3UUNN5Ea4jLYOv1QGmho3o1S0NYq1t6vcTzEP6l0Dj97NhW9OC0wurLZnFIw==
X-Received: by 2002:a17:906:d1d1:: with SMTP id
 bs17mr33081431ejb.492.1622615776054; 
 Tue, 01 Jun 2021 23:36:16 -0700 (PDT)
Received: from hal.home ([86.126.22.60])
 by smtp.gmail.com with ESMTPSA id d15sm676676edu.86.2021.06.01.23.36.15
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 23:36:15 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: tunnel no longer established :: how to debug?
Message-ID: <ef038c91-f2bd-9e05-f49a-c1700a0f25af@gmail.com>
Date: Wed, 2 Jun 2021 09:36:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi! After a change of connection point (the same ISP but different location, but with the same wireless, and end-points)
the tunnel no longer is established. Nothing in the wg configuration is changed ...
from the "client" machine to the "server" end-point i can do:
root@hal: ~ # nc -u -vz sev.HHHHHH 43333
Ncat: Version 7.80 ( https://nmap.org/ncat )
Ncat: Connected to HHH.HHH.HHH.HHH:43333.
Ncat: UDP packet sent successfully
Ncat: 1 bytes sent, 0 bytes received in 2.01 seconds.

How can i debug further to see why the connection is not established?
Thanks a lot!
Adrian

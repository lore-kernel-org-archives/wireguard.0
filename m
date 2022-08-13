Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3619C32772
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 13:38:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e37c6859;
	Tue, 23 Aug 2022 13:35:59 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6359b8db
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Aug 2022 13:25:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id uj29so6302561ejc.0
 for <wireguard@lists.zx2c4.com>; Sat, 13 Aug 2022 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:message-id:to:from
 :date:from:to:cc;
 bh=Ti7I67dFIL/oYNvyyW/a9VmKJrxzdCQvTOsrdYP2Vg0=;
 b=Fn+zJyLJMoIhkbqz3oEcXJOZuxvMFG3WXFZoMufJ+J2pibYG8kdyb+vKQRinF7b8lq
 qnfKs8Fi2Ezia1hDHYteLnucl5XA4kkmGnJCGU8qdBsp2SVXevTGYRrOHJPxdCteRjDH
 9Wmn5XwUy/fhhgQgRpxapAHBKjidCjQLlVK9iQD+AnevKZeo8nJkGPkqtJJoAvZYoDXA
 zc42Be6ehf0wYpNPOxDkpPmTpGS6bxd6500SK+9ROxZijwuExZj4n9aJH0yJao7H53mK
 8vHCnyF+On9ONIBPR2XJqJmVtZZcQ+QZj8k13Ix7SucW5EujTxHkF1XeD7yppJyMD6Hc
 IXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:message-id:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=Ti7I67dFIL/oYNvyyW/a9VmKJrxzdCQvTOsrdYP2Vg0=;
 b=daELE4gbYTiRboUsMLqd3dMWYtBWE2heUPpZpC3xC3Hoiw4uMsPkzMNDKOp3U1Z1qp
 HQujX+LXu3PzcEZR8ra7UgkR9mqQVlj2iMlIMk/DQwwQs6TRRbjqSaqwe+VSocqpMzYt
 JdymGS8CQReNqcvfpSic8wYhAjwUGGOZV7eY/oNEwQ8xmxH7L9nyroV+vu9b5H7SgKzC
 QjC1mIQX2Sc4lxDt/DDA39A1igGflWOYrcD3ogrB9mfVhUNIGI0EqTZrxyqMB0HCwsqL
 KTY90MNtGYcSLKH+Uil6h3NV3fZlCw3auGfglR7akUmwa4103ZDYVPNGh6NHQMMe3Grr
 J8Tg==
X-Gm-Message-State: ACgBeo05BmmGYQsNB56x2tcdtzaTsaGEu/XxX75kk1XujTPLtpaQo8GH
 n+b6K294+cfjyTTQF7crK35gZHooBas=
X-Google-Smtp-Source: AA6agR5cbgmM3ZdEqvzRU93tReZOXcgsEMGgbHWGP9Waa/q0FW6VMii8ggO6te47YYUYou+1Bi+hhQ==
X-Received: by 2002:a17:907:9619:b0:730:8ebb:9e45 with SMTP id
 gb25-20020a170907961900b007308ebb9e45mr5637138ejc.628.1660397157719; 
 Sat, 13 Aug 2022 06:25:57 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-43-51-44.web.vodafone.de. [109.43.51.44])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056402032800b00435651c4a01sm3008908edw.56.2022.08.13.06.25.56
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Aug 2022 06:25:57 -0700 (PDT)
Date: Sat, 13 Aug 2022 13:25:56 +0000 (UTC)
From: Thomas Butz <btom1990@googlemail.com>
To: wireguard@lists.zx2c4.com
Message-ID: <61e00589-c80d-43cd-8bd4-27cde6cd936d@googlemail.com>
Subject: Android app icon isn't displayed in F-Droid clients
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <61e00589-c80d-43cd-8bd4-27cde6cd936d@googlemail.com>
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:35:50 +0000
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

https://github.com/NeoApplications/Neo-Store/issues/273#issuecomment-1214153179

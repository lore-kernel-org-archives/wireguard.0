Return-Path: <SRS0=dzZU=BW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFFDC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Aug 2020 18:35:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407A82078B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Aug 2020 18:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo7kNgqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407A82078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baddcce3;
	Wed, 12 Aug 2020 18:09:52 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 455b1997
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Aug 2020 11:20:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id f24so4711333ejx.6
 for <wireguard@lists.zx2c4.com>; Sat, 08 Aug 2020 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Z+EwkJWTAIVIVLCfLBWCgojjLlkJmkilgcSiBP01C7Q=;
 b=Fo7kNgqPgWr6LB4CEvrzohbVI+cAeBrbhzlhXNR2YMt7DCZoeaL9xbUr/GB/kEn9Yb
 j2PNPkiYe5swrKxQ9rVT9pLl0Hr+mNdpaPi04I4TIsUz6UXxoQ4E4HHz0vJ6e3aLhFcw
 DqVaNqSmxejr9b7U12xm5LZTSk4mfIG/q1msswKki9pTu1QCR3DcENHYaHzN3lHTY+Ed
 BkVzvbxpE6KbpXXl94Qf1R8V8yWvPTohjUkW0CODOwPLAa0/GY+SMNLDIxyCl1RAJAiU
 05NJGiXYQQ6DxRjaB33v/uXECf1n24YLB09fTxVrvfDV9W/+lZDZo1dCdDSx9Z/BR6Sk
 afAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Z+EwkJWTAIVIVLCfLBWCgojjLlkJmkilgcSiBP01C7Q=;
 b=CZ8nCYykEMjhAQU9G5YjCGOEy9UTu5TuLeRnpoootK01zoRLC3BNVsdG8mWWWQhKU9
 djCtNS1T63nhGSMkBMxM2RFxCgtg3rRZ6F219+Oyl9vCr+hOF2AYtjeKSfMRW31vFmfQ
 CyqJxPUzIQCun/K1WTga/GEiUq7v5CylQ81BhkpIYHr9l7gNXk4x/hqYONijeTzegLA1
 BcYJBD2eQC3tqQ4WRyzM4gn7hJwxSYyrNM1UBLrQAPxemZ39pGqWxjvjoEe28WAE4d1W
 1NzLdSbB+pahxW5snYHytH2Jq3V5Dg4VxTjCAFj6WhtNozUucZXn2kW+NynikatNnO6M
 jqaA==
X-Gm-Message-State: AOAM530HWVA9Oa6egNTqDwC0mVAWUbbr0U3IheSWlqCBA/ariZ+vj5ca
 Lf5orgHf9ePHgz/F492HJ0wKr3ChcPsARjlQQYjF4VOe3xI=
X-Google-Smtp-Source: ABdhPJx1pfxOpHV8qLTSNi/C2h0iDqpejWtiCriw5mk2ifeZAoXM1b9BvcBTk9t3knuIWWASurRKXsViJ5fKj2SdlYQ=
X-Received: by 2002:a17:907:40bf:: with SMTP id
 nu23mr7190863ejb.243.1596887097872; 
 Sat, 08 Aug 2020 04:44:57 -0700 (PDT)
MIME-Version: 1.0
From: Ferad Zyulkyarov <feradz@gmail.com>
Date: Sat, 8 Aug 2020 13:44:45 +0200
Message-ID: <CAARAvpL1PDSm5T_5pE5qUP9b+bMeUi9Td57op9t+OoSLvo9L2A@mail.gmail.com>
Subject: WireGuard on Windows: Unable to create Wintun interface: Error
 registering rings: Error listing NDIS interfaces: no interfaces found
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 12 Aug 2020 20:09:50 +0200
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

I have installed WireGuard on Windows server 2017. When I manually
activate the tunnel through the client application (manager) all works
fine. After I restart the computer, WireGuard fails to start
automatically. The log contains the following error:

[tun] [wg0] Unable to create Wintun interface: Error registering
rings: Error listing NDIS interfaces: no interfaces found

I can explicitly/manually activate the tunnel through the client
application but I need the tunnel to start automatically if the
machine restarts.

I have it installed in other Windows Server 2017 machines and on those
machines WireGuard starts automatically when the system boots.

I would appreciate your help in addressing the problem of WireGuard
auto start when the machine boots.

Thanks in advance

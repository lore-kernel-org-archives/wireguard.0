Return-Path: <SRS0=w0hv=KV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4B8C2B9F7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 11:40:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F7461260
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 11:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F7461260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70609c22;
	Wed, 26 May 2021 11:37:55 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 486e1225
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 May 2021 10:34:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id t206so16466270wmf.0
 for <wireguard@lists.zx2c4.com>; Tue, 25 May 2021 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=S/lDRqmGp2eZu9DGnISqU9x8IVgzOKoBKGcvh9OgIkw=;
 b=fzm75nyHYpecp8Il1hbxTiCcCnnBJkR/f5XRzAIQrC2XhK6F5a3xVv4jT00PRTi8cl
 D4JGASY2FtlQIpV3gxIsSvDxIK+R6rJrcr7WqFIOiV1KLujTbJmjwrfXJmVORloetlvO
 HWCRPsID74uwQKd5I/AAeLCDoro6UhsZvLcfGoD+xZ9r+FopGwT8oN5fARnYHOTjMWct
 vB5UCGAE6iB15ueesrcqgDGoijBDNVPUrVhabuJ+dG1ihIZIzqkCQnNLWRgqfpLNVDR+
 eJz9tysAYGw7T6BF/w3Z0o0pFpj4/C7gVsELcNbOkdqWvj1tSHa1Z80bHJfOY4TFnwUH
 cQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=S/lDRqmGp2eZu9DGnISqU9x8IVgzOKoBKGcvh9OgIkw=;
 b=W2PV6qHNmqkyI0sjTPdKOvm1bsekraF6y5leM3PMcIwyE3cRTjyyDcTa9CUWqn2zKu
 HN7fGien+YgDUn/dJ0riBoQCy8EAU69Ayz73jIJNi+F6U0VA4FDSp4CguC6wivzXJQhE
 RZQI1aWk7b1579jyYTjQZZOlxtaTMDf9Z86Z1JyIgJGCTx4mE5oYqyB4YKGsn2I/QBwu
 byqv4GJXrbTknDAAFKEQ85ZdUZUol1mkJTbXquV03aINmq2faGixYMVw0jxZlWZPV9eg
 lORNdhvNBemFYXhtbhkUByIRl42HFsXvhKdO5SgoChkWko4oUzX5nmzE3SR2cI8t15XP
 1I0Q==
X-Gm-Message-State: AOAM533f439FCg/hyr6gDus6q0rnYoEx2YkpfQk0n23nA6J379rMTbZI
 Dk7c1VIEj/ZDtEJHV7R/6zV3FHuda7w=
X-Google-Smtp-Source: ABdhPJwpcoNLGjhlieHn0q33EVnfI12Bu1bmceMAHHZSsLzi8Ug33EocR4s3704genErBXmr39VOSw==
X-Received: by 2002:a1c:9d43:: with SMTP id g64mr9339545wme.160.1621938876695; 
 Tue, 25 May 2021 03:34:36 -0700 (PDT)
Received: from ?IPv6:2a02:810d:d40:2317:2ef0:5dff:fe0a:a2d5?
 ([2a02:810d:d40:2317:2ef0:5dff:fe0a:a2d5])
 by smtp.gmail.com with ESMTPSA id s199sm2226035wme.43.2021.05.25.03.34.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 03:34:36 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Andre Naujoks <nautsch2@gmail.com>
Subject: wireguard windows socket binds to device
Message-ID: <bd20cfa0-9cc4-83fb-ec53-e2e84923c485@gmail.com>
Date: Tue, 25 May 2021 12:34:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 26 May 2021 11:37:53 +0000
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

Hi all.

I am currently trying to create a wireguard tunnel over another VPN 
under windows.

The setup would be a wirguard tunnel through an openvpn connection.

However the wireguard implementation on windows forcibly binds itself to 
the network device with the default route (which is fortunately visible 
in the wireguard log).
The wireguard peer however resides inside the other VPN and is thus not 
reached by the windows client.

Is there a reason why the routing of the host machine is forcibly 
bypassed by binding to a specific network device or is this simply a bug 
in the windows implementation?

Best regards and thanks in advance
   Andre

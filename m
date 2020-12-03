Return-Path: <SRS0=1z1Z=FH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E12C4361A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Dec 2020 21:13:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1740022224
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Dec 2020 21:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1740022224
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=gnumeria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d04b8139;
	Thu, 3 Dec 2020 21:05:51 +0000 (UTC)
Received: from network.gnumeria.fr (network.gnumeria.fr [185.44.81.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a4b40684
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Dec 2020 16:18:32 +0000 (UTC)
Received: from [192.168.97.21] (lfbn-rou-1-593-122.w90-70.abo.wanadoo.fr
 [90.70.56.122])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-384))
 (No client certificate requested)
 by network.gnumeria.fr (Postfix) with ESMTPSA id E876A280EA
 for <wireguard@lists.zx2c4.com>; Thu,  3 Dec 2020 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gnumeria.fr; s=mail;
 t=1607012714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bD17Y4RgknyCEptyLvaZUEF3o7vDV2RGZQfOA5bVAuA=;
 b=oNCCLGluwcblUE1f846pL0BkyX7vss98eEWr8ai38IE6DFdWd3T7hmeV0FSSGRYvPcpFcc
 kBvplGVjqhUq1pR4sXTlkrBfL17MQP+dJD4r98mQqC/WRZY0NPTDacUWOrLa0n4THTHbFv
 QKPlnl7B66C+w3e68ib6Pp6OuXMxrClTMQq1BlxNC+uKW4MJ0VxppuohglWeYF7KWmHKz0
 d7HR/pc0vfR9TLaW2EX/gTsEmBZ85u2ermce280SqATsNiQ9+yTTPW5uxnjznklFBgkbDo
 /+laCWm0kZOVR8pyEcTXhWchjJxJMQ3oMtfhg4zJDViSRwNwl+WC+ShFnQ6s+NzkulZnUo
 qmlxShAbAY8rgOrDybjpi0lT/N/T/bpnH7i1MhQrOc9QvHIMmJGROm+DC8k9z/HkKNhGfz
 Xsugi0BgcWD/21B5NQR8ueLevRXQuy06+6tysD/eAk+lmMaSAtpBhwuvdUFSAVKEX2MSOY
 zf9BvXbIwm887aTSnLtnA7BEw3BS05wbFe71DArtB110k7PMaKepzBOa53gm6p1Xo/J+uy
 pjrSEkz32kd2G9ysp382XY1lPBy9SB7Xq3mLe0GXGW5OPihLlWtD4KF9tQd/4vxpMYPyZE
 /Wi+wrGyc6bBCcMItZDm+BdnLs7hqXhehvIwv7HhwLRBTZII2miLM=
To: wireguard@lists.zx2c4.com
From: Esteban <esteban@gnumeria.fr>
Subject: dns wireguard
Message-ID: <38259275-2f96-feb5-d3e8-70aafb862f41@gnumeria.fr>
Date: Thu, 3 Dec 2020 17:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=gnumeria.fr;
 s=mail; t=1607012714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bD17Y4RgknyCEptyLvaZUEF3o7vDV2RGZQfOA5bVAuA=;
 b=t+7sHsvKp9t2+Bbjgdoa5tcaWYiFafcG047MVkDY1qysegG3e/NBbuTuEM1z2dDAkeXmAz
 bsnW3rofmhxT+4g9vBxtkYoFL0z8Z6933wYRWyYtLRyGo/2Xf4K4ZjeWt1ZHvuhp9dG1uh
 6mJwxx8/PHQeTwZXNS7ZssCvfzay5w+3ShszlHtGKTxeeejSCx1v0qrhD6jltaZK3WCj/X
 B80F7iepDHTkxDJlAcDLxyW7GYsgkxGivSUJ4Fd3MjiGHP/JdWVmQQgAz8ak8+QFnu3vNY
 dJFBc7YIOQPg32ZmOtjYg5tAinvaiF/dkXblMS2pkM2/Q62+057NfplssQEtYgl6D+Ko8s
 8BL57bAvG+lJUcDTwjymWRSRykC2DMQs9g56UKOZls7exx0Qh9tWPZyCY7on3NVO+eChYJ
 4M/w7FcHt61JCwCEYjEZqITmLLrL+oLZs7Qba5dL9iKjA2eqRfIcDWv/d/kMwWN8j2oES9
 +qSVR8rKskhmF5/vjKdSm6i+A4JzeJNd47VA9HkExOTsOx0gSt2Qzfr6noDH5SFpLDbEsb
 xvEs42B/jUhBr7Zo8QPU3lfZ3YFrYM8ttoE3+Jg8Ggowpwu7vmWWbUum8soQ7xghJ9LbGj
 3j6U1nULaemGKQRoT2csUtjtqavE/Qf9DsZojTPVw5VXH0DLy4wsQ=
ARC-Seal: i=1; s=mail; d=gnumeria.fr; t=1607012714; a=rsa-sha256; cv=none;
 b=hKRaT0yGmChslGduDFDdHkf4Q2PwcpelPdzZizeZl5SGxLfNyjpqXgED/NXKjE5fEhvTHT
 S4P7gwMgepceEpOuexeRGD2irE0Pszgn6TZFqfGSltt0a4Y2EIa3W9oXwi8wG31svDl9o1
 q9sLZQcLvnrrUTMt34i98tV81uiWPSIr8ylMS+5zDZPeSWfUnd3mAHvwgIPkwuwRnUUrWb
 +Gm+o8oQtNnDoLlCek+K2FQX/id0Grwi7smx605+08COTyoh5rYFDaX0gSuGakAS4ghPwX
 ljT8npgD6V7+XTLNxcJnxg9WrnwOFBXIdaqv5cSvRGnp+YT5/ahdFlOUPyQAo7Y0cLRw3w
 hBWWK72giQZCgIY6Zx0niGSndVAcz/kH3LFByVe1CVhMogUxSfDepUy515wdslyhh/YGej
 F5Fp8BpY8Kx6lhNi1Sd/HBSMxtzB5rAxp88Jc2z9gsnY/IOMVkvnCBGzOKFS1XjCJMKAIb
 wrPIVZU+AWG2afZvSCjhiV9EncuvslAk07shb+30c8UI/J/mx7J8Sp344BkJQzTI0MLzJ5
 D2ZTygoYDVzsQ6G44d2nSbXAf0hJAYP6SzTybuUQZhHbQQ4ga3g34I+XecRZYhWebSGnxl
 qTNGGqC/7pXKAOCS47xBIZ3sDIH36pGOsfT8KG+lmilMssiwcgi5A=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=esteban@gnumeria.fr smtp.mailfrom=esteban@gnumeria.fr
X-Mailman-Approved-At: Thu, 03 Dec 2020 22:05:49 +0100
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

Hello, I take the liberty to contact you, I have a huge bug, and it's 
not me who is at fault, I prefer to specify it, some friends have 
exactly the same bug as me.
I like wireguard because it's very easy to connect on several tunnels 
simultaneously but when, (I'll schematize)
I have two wireguard customers
In the configuration of the wireguard A server I will have in DNS
172.16.150.1

And in the configuration of the wireguard server B I will have in DNS
172.16.155.1

I start by connecting to the first client, the wireguard A server.
I manage to ping the DNS of this server A.

I keep the connection from server A and connect to server B.
I can ping the DNS of server A but not the DNS of server B.


And if I reverse the connection priorities, so I start by connecting to 
the client of the wireguard server B, I can ping the dns server of this 
server B.
And I keep this connection and when I connect to the client of wireguard 
server A, I can continue to ping the DNS of server B, but I cannot ping 
the DNS of server A.


  To conclude, simultaneous wireguard connections work at the ip level.
But when two wireguard configurations are up, I can ping the dns of the 
first wireguard I connected but not the second.


When I talk about dns, it's the DNS =
In the wireguard customer files. Two wireguard up configuration with DNS
Only one DNS is taken into account, the first wireguard I connected to. 
And the dns of the second wireguard I connect to does not ping.

(Problem on gnu/linux, I don't know about windows)


Best regards.

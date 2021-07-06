Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31655C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5636360F35
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5636360F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fd90e9a;
	Sun, 8 Aug 2021 23:01:06 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 586025ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 13:25:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t6so16144092wrm.9
 for <wireguard@lists.zx2c4.com>; Tue, 06 Jul 2021 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=9nwqEiWossVotLTobKT4ZhzyJTOdgosQU/RWUPLXG1M=;
 b=F4zaaW5KxEyj8DhhSncBikGE/F9aac3PnxRguToA4LthXd1gNjUA5gPRhLsEwX3NPR
 rAHkVusvyuqJHfhE0a0c5a9b2Auy+3EGKC68xlgB71Jh7XhJs6EptNKNkdYpLa1DkjOE
 +P8n9ZXP11mVeO+xgX4P4TM32esOFUF994Rp8DKjm7gno4SoR5JFP5e9h0P3d8wlK+5Z
 GPrNe2UvRx5LvQvJf0StdR7yDdAHUPphMSc6LfazFLJuX4W6G0iJU1TrYRPtT6hAMK76
 R3ViBTjQEAeBcJwp3iUnrUE73QV7iJqlk6gAu+/RsZy5PyFrT8zpI360QgvQVGzHpXil
 K6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=9nwqEiWossVotLTobKT4ZhzyJTOdgosQU/RWUPLXG1M=;
 b=GtbsGfOEfoPTDdyVTfgQIBbjBYd1453CQvPSSmlPqBGkSIsHP4qjpZhQS7CFeUMrNI
 3o4FjtptAtRa7Fn1owUqPKayL1ymN3dpa5+pYkotlb3YjD3ZKRVJYkgkCpwhZMAwZbVP
 +gIm6BnUks7bY8CqFi5BdketaZ9MdwZqfCRN0kSSQ+N19LXoFzTT7mRob3JgTbZzA4au
 FqVg8LZ2pPVzGWdUyr4EXrHaKUxTxZg5G4PkJGc+IDKYk7VamGdP+cpF9L2kw02wwEjO
 2850z0BrydEoOYTfhN3/WhSgJLHwtt0xJxW8n6BOexvclT7K7RCgK8n0udlofflQTX3t
 RUyg==
X-Gm-Message-State: AOAM531mJtWulekujEOVKAWAQFgN1EXlE7Ey3T1v+0XD16dW0kmlxh1Z
 5BjasAEmonCdl6ihJhVL4SlnSIQ+3ceI4vuG
X-Google-Smtp-Source: ABdhPJwPvMHuBJKR/4qB9NjsnVFrtoBEbN0wAOnC/wodlCNdCLjw++gcy/IJT/cWv1RICANfdcAUbQ==
X-Received: by 2002:adf:dd82:: with SMTP id x2mr21412128wrl.303.1625577954827; 
 Tue, 06 Jul 2021 06:25:54 -0700 (PDT)
Received: from [192.168.100.102]
 (cpc160253-nrth4-2-0-cust867.8-4.cable.virginm.net. [82.7.3.100])
 by smtp.gmail.com with ESMTPSA id r4sm17765974wre.84.2021.07.06.06.25.53
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:25:54 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Simon McNair <simonmcnair@gmail.com>
Subject: ERX wireguard assistance please
Message-ID: <7388816e-1f87-fa5e-f509-7276a6d3b80d@gmail.com>
Date: Tue, 6 Jul 2021 14:25:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:01:05 +0000
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
I've searched to try and find the solution to my issue but I'm no expert 
and I'm not entirely sure what to search for.  I would appreciate your 
help please.

In summary, If I connect to my LAN via local WiFi I successfully connect 
to wireguard:
interface: wg0
   public key: <removed>
   private key: (hidden)
   listening port: 12345

peer: <removed>
   endpoint: 192.168.100.102:50084
   allowed ips: 10.250.250.5/32
   latest handshake: Now
   transfer: 157.33 KiB received, 536.33 KiB sent
   persistent keepalive: every 25 seconds

However if I try and connect via a remote network it fails.  My DDNS is 
resolving correctly to the correct IP so I can only think that firewall 
rules or NAT is somehow causing the issue.  Has anyone come across this 
before please ?
I don't know how to monitor my WAN port 12345 for activity, I tried 
tcpdump -n -v -i wg0 to no real benefit.


The ERX is running v2.0.9-hotfix.2 and 
e50-v2-v1.0.20210606-v1.0.20210424.deb


High level the infrastructure is:

LAN: 192.168.100.0/24
wg ip : 10.250.250.1/24
listen port:12345
route-allowed-ips:true
peer allowed ip is : 10.250.250.5/32
Firewall policy WAN_LOCAL default action drop, rule 2 wireguard 
destination port 12345, protocol udp, action accept


I would appreciate any help you can provide. The aim is to be able to 
access resources in the 192.168.100.0/24 subnet using routed ip from the 
10.250.250.0/24 transit network.

My apologies if my syntax or understanding is flawed.

Regards

Simon



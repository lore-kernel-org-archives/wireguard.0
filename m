Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93C0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Jan 2022 10:00:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 97495599;
	Mon, 24 Jan 2022 09:59:58 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d33fd706
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jan 2022 09:59:56 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jx6so19856806ejb.0
 for <wireguard@lists.zx2c4.com>; Mon, 24 Jan 2022 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=e3LoQCOuhzGkP8qRhpDTf1cwzIyd3jmZr0l3ke2GBE8=;
 b=PvGh96LLiEGrMlMZgyuA8OACou2jBc6S/+wS+9DGFPt6jFrfrGGnEXlSxHQ62fB06G
 y5DHI+42P6Y6tDi6HYxNRLwG+Dx8vZacrH/VgOsXLHHmtgcml/PuVVB0TIOxo2z3H1B8
 f74uSazLxf5/1acnCIqwZItCl3nFvkJiw/MUfFNq3BqDOJFNY/nbh2pcOuiHl960czS/
 nKOnC/Xnk0jzMbp9i1x4iAOwh+66HGvLiU6OU5NcmP6R6hTrlLVSgqQSVc1Rwc/bxabB
 AxCgRUhgNIq8SrQH7aCyr/DA/qqyrxOooBvI/plWpJyR0VxCPZdz7YlIt7OnATSfuoFw
 ut2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=e3LoQCOuhzGkP8qRhpDTf1cwzIyd3jmZr0l3ke2GBE8=;
 b=JGGsNzRADG5l9XGSIh0Aor1O0YMSk8vmKUBv9JFc7n9IGAT5PQoHUoijr2gvLemjKz
 ql8gFm9SLKKvbNFalkFmtw7HP6VpXkB4tLp6w6tv1tZtMVTBK/3gYfUysPrPpxy2Uvh4
 66pR6Sf8xQIMTVvoxNaL7b/7akkoqcoCSJcBwZYTN2m5ngSVS9HZ05gMkap+lXh/dU/l
 YgqVjm54fVrACsi/ivSDKYXQaCTkcSnzBsuFlYJtc8vtS0GN7LnqBopwbuIe3qFabRKR
 C2ADwO7L8d5GQbBGRN0xfsxk4Y8o9nZ2gPDwfrZE5YmmcjpJtKb1Uvk+Gvi5RsUBgfPq
 fGWQ==
X-Gm-Message-State: AOAM533CdtWbUoDIIXpudwtEMMyIglSYIGeiu5OgDtS/Q9rBuudZRLaQ
 Ahn0aOzfaL8elb+5Di6mwHa7z+zxTeT83IbH
X-Google-Smtp-Source: ABdhPJwOSREjWn70VSkEV0hXYSwKfD47eFsBMOXu6CcERuSLof1Kgk2D+qOyJI7WXZoxm0/GqQKrwQ==
X-Received: by 2002:a17:906:4a4d:: with SMTP id
 a13mr11620955ejv.744.1643018396263; 
 Mon, 24 Jan 2022 01:59:56 -0800 (PST)
Received: from [192.168.100.171] ([84.69.122.33])
 by smtp.googlemail.com with ESMTPSA id x12sm5162909edv.57.2022.01.24.01.59.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 01:59:55 -0800 (PST)
Message-ID: <c0520a00-cd2b-db1d-b678-4134593e7206@gmail.com>
Date: Mon, 24 Jan 2022 09:59:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
From: Simon McNair <simonmcnair@gmail.com>
Subject: apologies if this DNS conditional forwarding query is a daft question
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Again apologies if this is networking newb question
I have just spent the weekend laboriously learning about wireguard 
windows and finally powershell & internet connection sharing. My usage 
case is supporting a parents network and/or sharing resources in a small 
site(s) to site(s) network.
My question is this.  Without buying any extra commodity hardware, or 
installing any more software is it possible to set up conditional DNS 
forwarding per peer for DNS ?  I would like each subnets DNS server (in 
this case isp router) to handle DNS for that subnet.

i.e. if the dns request is for a subnet on peer A use DNS server 
192.168.100.254 defined in peer A config
        if the dns request is made a subnet on peer B use DNS server 
192.168.110.254 defined in peer B config

Similar to this:
[Interface]
PrivateKey = pkhere
ListenPort = 12345
Address = 10.250.250.4/24

[PeerA]
PublicKey = peerpkhere
AllowedIPs = 192.168.100.0/24, 10.250.250.0/24
Endpoint = my.ddnsalias.net:5678
DNS = 192.168.100.254

[PeerB]
PublicKey = peerpkhere
AllowedIPs = 192.168.110.0/24, 10.250.250.0/24
Endpoint = my.ddnsalias.net:5678
DNS = 192.168.110.254

I know we already have the Interface level DNS option but that would 
fail for peers unless conditional forwarding was configured which isn't 
possible on most home routers.  I know I can fix this with dnsmasq or a 
pihole but that requires another machine on all the time.  I was just 
wondering if anything clever could easily be done within wireguard.  I 
know it's a big ask but it would be appreciated as an enhancement request.

Likewise, for the windows version of wireguard it would be cool if there 
was an option to enable internet connection sharing on the client.  I 
have done this successfully (I am happy to share the steps if required) 
although it was a huge pita and required dangerousscripts enabling which 
I'm not keen on.
Thanks again for all the hard work Jason, I love the app, and it is 
running happily on my ER-X and making my life better.

Regards
Simon


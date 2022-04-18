Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEB1C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:45:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b4c591f6;
	Thu, 21 Apr 2022 23:49:58 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 16857e9c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Apr 2022 02:12:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so16120609pjb.2
 for <wireguard@lists.zx2c4.com>; Sun, 17 Apr 2022 19:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:from:subject
 :content-transfer-encoding;
 bh=5fZNWM+NzmFfJvskwsP1Glt8KeZGLRutw3B6JYenU8c=;
 b=pYen+T7Rjcco9kIJyo7ttUsC5zlPLj+lIQA5IkNJ6+6utYvKS34MVf/i1NCOwDt6vt
 aVjJMAdfhj2O3GP91I1qtAGXQjW1hqxzeiSgSpqNi0zblv9lg8JqsluayT66BI8ymknq
 RJ7vYaFdHm52lviFap2zw65eHl15630YHUK4iGdx6lQpr2fOQ/4mR6jzA24CXu2WpM6l
 Mh2cW9+7sqJ6mFr52eDzbrvJ6cW7iFDm7WRnG7fmXswiYy03LwMvQ2Sf0XDqp70vg3zr
 L//BJqiJMsnSOw2tjn3x/auIA5E1cSB3dDPqkCMrTnSvk4OFt+9dahe3A46NrE+WiibS
 QsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:from
 :subject:content-transfer-encoding;
 bh=5fZNWM+NzmFfJvskwsP1Glt8KeZGLRutw3B6JYenU8c=;
 b=s1d9Nf/Qf47x0C2yHg4J2tCR59xvpDUsMcqNKudI1FZ59DQ3v2DtTUwD+vbLAicA9d
 1sSmciyNv1vFEvveYQAXLGNYC1xxXpMltSsNfeOXKuoHScNw8TgUgnSp3OGXVpglWxx4
 BrSeF0mclzA6A9m/sMRfvn4IiIsXth/YYxiyzVkl/udHWt4sAJNeqJdvJp+aHikAWnX4
 In7e5HbuEFS8isy8+b/9nUocsLhEnx7RdkYMjGY5Wmk70bIyNtVSxznSsVaRwGunoV1a
 Jqgr56ncgCVZsbgbks8g2OwOwZ5vgi9JlN9EA8NfbHjsSLMxBRNxJymoxPXRYoPVCSrQ
 g+tA==
X-Gm-Message-State: AOAM531fvpTvIVN9DxvWkLPO/jHErA2iAugO3vP6i6c+y3kKw/61mlfF
 TRSj4mHq/31v3FJqUKnwX8q8dCH0Bpo=
X-Google-Smtp-Source: ABdhPJzEzj5e3ZZ0cG6FxMKdkkWuZX+QbHmyFug8Ybr7fsLFsDm5CT9qpRgbJgdyPVa2bdOiWBMEpw==
X-Received: by 2002:a17:903:32ce:b0:158:f3cb:8900 with SMTP id
 i14-20020a17090332ce00b00158f3cb8900mr6316637plr.66.1650247945979; 
 Sun, 17 Apr 2022 19:12:25 -0700 (PDT)
Received: from localhost (59-115-140-93.dynamic-ip.hinet.net. [59.115.140.93])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a63b70f000000b00381510608e9sm10841350pgf.14.2022.04.17.19.12.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 19:12:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) 
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by upg.tw (Postfix) with ESMTPSA id 71115140161
 for <wireguard@lists.zx2c4.com>; Mon, 18 Apr 2022 10:12:24 +0800 (CST)
Message-ID: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
Date: Mon, 18 Apr 2022 10:12:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: wireguard@lists.zx2c4.com
From: Nohk Two <nohktwo@gmail.com>
Subject: Is it possible to disable wireguard on specific Wi-Fi ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:49:50 +0000
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

Hello,

I setup a wireguard server at home and has a public IP address. This 
server allows the clients to access my LAN (e.g. 192.168.87.0/24) and 
configuring the DNS servers as my DNS servers in my LAN (e.g. 
192.168.87.1 and 192.168.87.2).

My family members use their phones (iPhone and Android) to connect to my 
LAN via the Wireguard for iOS/Android App. And this worked perfectly 
while the phones are using the 4G/5G network.

But when the phones connect to the Wi-Fi of my home's router, the DHCP 
assigns the IP addresses as 192.168.87.0/24, it's my LAN, to the phones. 
In this situation, phones' owners should manually turn off their 
Wireguard connection to have the internet accessing. I guess there are 
something conflict because the vanilla IP network and the allowed IP 
network are the same.

So, I have this idea that if it is possible to configure the Wireguard 
app to turn off or disable automatically when the network is established 
on specific Wi-Fi SSIDs ?

Or do you have better ideas ?

Thanks.

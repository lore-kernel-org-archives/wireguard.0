Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07D9C636D4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:33:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5095d81c;
	Tue, 7 Feb 2023 04:29:42 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0f9f4e5c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Jan 2023 09:28:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id mg12so45929233ejc.5
 for <wireguard@lists.zx2c4.com>; Wed, 25 Jan 2023 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vcw7yO7blJOgy8OSXYi46oJi3qabDRPz4k/+Dgmjn8=;
 b=Q4yjqg18jeAoTY+sRRJoIkbrZZyF51y/QFGuTG+O9h+u0LSoy1LOGnKoF9E1rzQX+/
 vtLBmOjc3hQj1aVZqilWYAeJpnjTsotKiOQt4LKyTaKhT11/bVVftbIVE5t1hw85dO9g
 5reVGB5mhVgr+68+glxW8fjIXgbEOCUp2D4JhwYZtuAKR/VogkfkJKNsIkX1oC9ZlKIr
 Su7chg5ZcsnAyKTZJq57IMMjHvOpcKhk163vmqHzBlVerJMql913zGhcj42kVVR0guIG
 ALoLIa7owbmPQP73z2dFkJMkotssojSdnyX/5XpHA5vF7WgdVkhNA8QOwWfBab+vc4eJ
 t5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4vcw7yO7blJOgy8OSXYi46oJi3qabDRPz4k/+Dgmjn8=;
 b=C5YMN1RmS7bCYpP7WnlsdxLbDL3ooeBCF4Po24v0bpCR6E88lfe4Yq5p8BM5Api2WY
 dvqy4yboa/mzoBcFPZJjK4i6NScEiewylDsqLMrTmFa9Nd8NU7iBBrPGENd8scVYDTFi
 GqZ9QSpSL1y+CedCrVcVsMdAKotvm/tEpTS7Re25ZnVugAiz8wYTa6bEfq/WI+7SLj5c
 g7eus34pzpRlWDHErH4Cmae6gTkjZcATBwZ+sYf2095H1QzqNMxUTtdeVLfqWl9SZmDU
 dpW4Ohqf7GbJxQpNzNjbpaMAQ6R8vXbJyK7eYOLY67A26KpekGwtnC9HhA6Om2Zzoxj4
 ZKcg==
X-Gm-Message-State: AFqh2kqRb+6CAXyV3iNUr6dPNyvO7y4Jv8YpN96DRxesAhvCf7VdIsFv
 HaMRgqqvDz3baLN9O6aMbGqWBnOG9xc=
X-Google-Smtp-Source: AMrXdXuoriZVaVulJQlIMQgLg01Odaq0bajcir4kkWzMbDhQ68F5whUhfWaqes76+ueepRM8p3mEGA==
X-Received: by 2002:a17:906:70c7:b0:84c:a863:ebe6 with SMTP id
 g7-20020a17090670c700b0084ca863ebe6mr26025673ejk.43.1674638918992; 
 Wed, 25 Jan 2023 01:28:38 -0800 (PST)
Received: from [192.168.0.40] (a89-182-222-194.net-htp.de. [89.182.222.194])
 by smtp.gmail.com with ESMTPSA id
 fx35-20020a1709069ea300b0085d6bfc6201sm2092110ejc.86.2023.01.25.01.28.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:28:38 -0800 (PST)
Message-ID: <d9bf06e6-ded9-e857-5713-566bdcbd4e8c@gmail.com>
Date: Wed, 25 Jan 2023 10:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: wireguard@lists.zx2c4.com
Content-Language: de-DE, en-US
From: Andre Heider <a.heider@gmail.com>
Subject: android and endpoint dyndns
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi all,

I'm using wireguard on android, and it works just fine.

The wg endpoint also has it's own dns server, which I too configured on 
the wg droid app, so I can reach my network boxes with their internal 
domain names.

I also enabled "Always-on VPN" and "Block connections without VPN" on 
the phone's system settings, so everything goes through the wg 
interface. When it's not up nothing gets in or out - just as desired.

Unfortunately I have to live with a changing ip on the server/endpoint. 
Which is why I use a dyndns hostname as wg endpoint.

Now, if I set "Private DNS" on the droid's system settings to a specific 
*public* server ("Private DNS provider hostname"), it even works if the 
ip of my wg server changes! Meaning the wg vpn setup automagically picks 
up the new ip. (How, btw? Is that an android feature or implemented on 
the wg app?).

But using a public server there obviously breaks reaching my internal 
boxes using their domain names, since those are only provided by my own 
dns server. And for that, I have to set "Private DNS" to "Automatic". 
But that in return breaks the wg setup if my endpoint's ip changes, I 
have to manually dis/reenable the wg interface then. The workflow/around 
then becomes:
- set "Private DNS" to "Automatic"
- disable wg interface
- enable wg interface
- set "Private DNS" to "Private DNS provider hostname"

Which gets really annoying as you can imagine.

Is there a solution to this? I guess if the wg app would use a specific 
dns server to just resolve the endpoint's hostname it should work? Is 
that possible?

Thanks,
Andre

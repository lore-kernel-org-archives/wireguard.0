Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F9EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 12:08:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id af630fce;
	Fri, 22 Apr 2022 12:08:42 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0a384131
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 12:08:40 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id bg9so7169347pgb.9
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=QLEmlagu7W17Wik/51hKaXiYj3HTx4zvczknCeqwsqE=;
 b=E67iVFi0hgD61JmJyybVyxHGz4pvB2uV8VopOUTQz2i8fJOuAAO2KE3+N16btCpv/B
 G149wFTeHN9iwTbw7M4PWOlSDs9cgr9WjQSRq9HFlNstyEgiYkWqdI+CDB08KpXj6nBC
 quo/c95YWlPIZqVNEhzgaCk4dY75jrCAKoh81pufkxPWsnkuFnMUtPGaBW6ySG+VRRl1
 G2n2JphU7A5kNvTyJkCslNsdY7Tbk41JCRhbPosGlj5PVIXZuTOO6IWilDejAwhTqxk+
 jU1CqS04BoVpXA8R6Fz7rjkj69qGtGBUU7FM2DmiygW90oh2+YkcUxurfm7NAzU1i5T4
 WTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=QLEmlagu7W17Wik/51hKaXiYj3HTx4zvczknCeqwsqE=;
 b=uJbWnotrx6tqdiSXFeKZTpitmsHyH8w8vpvmiBx0ofQy/GeIJTveZc+zZ09i6rpi1X
 Jy79jYyFdeRPinnMoigF5X/oprbUtKifAgRs6yGWMtuoLXGiH0J3gNm9Q52q6oOCcK0t
 oXmepxaAHAJdpN5/n5ncwXz6hsMLqlcO5yOKJ46ob1/p/8m/+QKClskk47mGONG83pIT
 UulDvWpCO/blVn9vYnXXnrsOuKcq5hXGPJRgzlDo5uaj0Aq3BceFpcRvrVzyL/AslpV+
 fYiSG/daIJNgke/X706QCcPyzi506ByJl5PyBOzNlqcAg5AD1G3sOUfBeqvS7HiBw0ck
 U2Ww==
X-Gm-Message-State: AOAM53267Ijoz3hN5v524YvquMI60sCsYJ+pXr+oPG0wilUGSqLxk6ID
 mVpiNWqZQ8yDBebJiOlpX1RrBLZ3+0o=
X-Google-Smtp-Source: ABdhPJyDOjtBL0sLBMEuqVLpSWvAOcfqfbqKQ0l0cWPzOsHje6gMJaSv5krGYCzw8fAP3VNf6S5YWQ==
X-Received: by 2002:a05:6a00:1907:b0:4f7:945:14cf with SMTP id
 y7-20020a056a00190700b004f7094514cfmr4775073pfi.47.1650629318518; 
 Fri, 22 Apr 2022 05:08:38 -0700 (PDT)
Received: from localhost (59-115-140-93.dynamic-ip.hinet.net. [59.115.140.93])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a17090ab28100b001cd4989fecfsm6080015pjr.27.2022.04.22.05.08.37
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 05:08:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) 
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by upg.tw (Postfix) with ESMTPSA id 2CB3C1401D6
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 20:08:37 +0800 (CST)
Message-ID: <c6a413d7-266c-57d9-56bf-5b8f1c73346e@gmail.com>
Date: Fri, 22 Apr 2022 20:08:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
To: wireguard@lists.zx2c4.com
References: <77422@imapsync> <34a3aa4f-76b6-9fbe-93ec-01cee228b382@qupfer.de>
From: Nohk Two <nohktwo@gmail.com>
In-Reply-To: <34a3aa4f-76b6-9fbe-93ec-01cee228b382@qupfer.de>
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

On 2022/4/22 17:29, wireguard@qupfer.de wrote:
> 
> On 18.04.22 04:12, Nohk Two wrote:
>>  I guess there are something conflict because the vanilla IP network 
>> and the allowed IP network are the same.
> 
> Thats right, but you can simply use other IPs for your WG clients 
> (192.168.187.0/24 or 172.16.0.0/24)
> 
Hello,

I'm not sure if I understand your idea correctly.

It's not easy to configure my router's DHCP server to assign specific IP 
addresses (192.168.187.0/24 or 172.16.0.0/24) to the specific phones 
which connect to my LAN.

Even I did it eventually, the phones can't access to my LAN when the 
wireguard is turned off because "192.168.187.0/24 or 172.16.0.0/24" 
can't reach to my LAN (i.e. 192.168.87.0/24).

By the way, the WG tunnel interface's IP address (e.g. 192.168.19.0/24) 
is already different from my LAN's (i.e. 192.168.87.0/24).

Regards :)

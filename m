Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 13:00:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7074fb63;
	Fri, 22 Apr 2022 13:00:41 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1b53b11e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 13:00:39 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id bo5so7949496pfb.4
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=kMsONbTIOrrLp3HKex5cO+LVlckzUvCJP7uBLzevk1Q=;
 b=i1V3OcoG6xAMBdnu2vBa++uz2zW38z2RiwaDOzK/X56zqe74e2wXTfYInr/edBDcAF
 5dhJxjyTnYomn/sPauia/iC388OAKZlBvW3VY6W2B6bXiby5xKvzgrJl93Kg9Wu5Sfeq
 mvj86U5f8g+mU3YE+zcghLhzCfacAga4pzl0dukJXyeC8aIZensgtZNcgGfTXL2NVS4U
 Z0YjoMzq5tsp3PEywPr7dSiT0gIhxyppqKTPPCEH+yTdQgFz6S+CgiwF/vgX4DG9PC4x
 A7I9ZIJcgh8+guWVR95cAYVsJrktlAqUh383N+ThxLJR4aPByplQaOMXAkWr9l8vH6uT
 Ekrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=kMsONbTIOrrLp3HKex5cO+LVlckzUvCJP7uBLzevk1Q=;
 b=WEz2CBEZ84tQLtJ5e5S/EIQpL23npKZVXtjhjNnRcoU+0SO7CvrFsv5qa/WncdGqL5
 MRpM8vT9UcnPWRAFPmM/SaqVAWwVb7bdS7ScZQaphmlj67By3S37RyvqJ+k3uLnAWoCo
 JMrFgW1J1ItgVB97ZpZGkaQDw3HQMqdmd/O1HWHUTRat2XyyipzCubzPHlL9jzHkV8sD
 4EbLQ4PLmxTctdyYZdOkCTQEoMa0TjHp4EphgwnwGGYz0pvYhTzPpVWGEO2vTLmJf33b
 nzZrmWBgVFjZ/wwPyFTaZBitTzzjhcwFEK/pNzpZpZDHgUrsE44SWbaF9YSGZ8ZAKJAF
 IlVg==
X-Gm-Message-State: AOAM530nZ6DaJXzk7EUuyRybF0QRzOaFZPmy2MR5QnAJDEeh+tArXYFD
 /JHy26/E6OVeJN5rKbogxudLBOJ89L0=
X-Google-Smtp-Source: ABdhPJyNHPBvRcB9x84LCFGIre3uSP3P8Jzk1/fFECzGm3zf04qCvIVde4vYaEvWWqwZl1gdg+tIZQ==
X-Received: by 2002:a62:7943:0:b0:50a:cd7a:8336 with SMTP id
 u64-20020a627943000000b0050acd7a8336mr4688513pfc.59.1650632435404; 
 Fri, 22 Apr 2022 06:00:35 -0700 (PDT)
Received: from localhost (59-115-140-93.dynamic-ip.hinet.net. [59.115.140.93])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056a00168b00b004f7e1555538sm2764703pfc.190.2022.04.22.06.00.34
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:00:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) 
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by upg.tw (Postfix) with ESMTPSA id EF791140574
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 21:00:33 +0800 (CST)
Message-ID: <ac6dfc98-f72c-5bb9-50c5-f8963a497656@gmail.com>
Date: Fri, 22 Apr 2022 21:00:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
To: wireguard@lists.zx2c4.com
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
 <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
 <94ddb2e7-9181-1a38-1b35-3e1a9766846e@oern.de>
From: Nohk Two <nohktwo@gmail.com>
In-Reply-To: <94ddb2e7-9181-1a38-1b35-3e1a9766846e@oern.de>
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

On 2022/4/22 17:51, Björn Fries wrote:
> Am 22.04.22 um 08:16 schrieb Björn Fries:
>> the way I solve this is that I use a slightly larger /23-subnet in the
>> AllowedIPs=192.168.87.0/23
>>
>> and when I get a local IP inside 192.168.87.0/24 at home, the kernel 
>> automatically uses the more specific route.
> 
> an example:
> my laptop e.g. has
> 
> Address = 172.22.247.58/32
> PrivateKey = xxx
> 
> [Peer]
> PublicKey = xxx
> AllowedIPs = 172.22.144.1/32, 192.168.0.0/23
> Endpoint =  myhomeIP:51820
> PersistentKeepalive = 25
> 
> 172.22.144.1/32 is the wireguard-IP of my wireguard-server at home.
> 
> This way I can reach for example my printer at 192.168.0.10 even if I am 
> on the move, because my wireguard server is installed on my router at 
> home (Unifi USG-3P).
> The printer sends it packets for 172.22.247.58 simply to its default 
> gateway, which is my router/wg-server, that forwards it over wireguard.
> 
> When I'm in my network at home, my laptop gets the IP 192.168.1.72/24 
> and automatically talks to the other devices in the LAN without taking 
> the wireguard route, because the subnet is more specific.
I referred to your example and the Android phone is now:

[Interface]
Address = 192.168.19.30/32
DNS = 192.168.87.1, 192.168.87.2
PrivateKey = xxx

[Peer]
PublicKey = xxx
AllowedIPs = 192.168.19.1/32, 192.168.86.0/23
Endpoint = myhomeIP:4999
PresharedKey = xxx

192.168.19.1/32 is my wireguard-IP address of my wireguard-server at home.

It work nicely if the Android phone is on 4G network. But it still 
failed when I connect to my LAN's Wi-Fi (no internet accessing and no 
LAN accessing). The phone got the LAN IP address 192.168.87.11/24 from 
the DHCP server.

Maybe the routing implementation in Android doesn't fit this solution.

Anyway, thank you very much. :)

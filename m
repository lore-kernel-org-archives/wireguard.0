Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12B1C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 21:56:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD0923435
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 21:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BD0923435
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dsander.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62087bef;
	Thu, 7 Jan 2021 21:55:16 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72a92594
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 21:33:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d26so6988080wrb.12
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 13:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dsander-de.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GSZziYpN/fqe0HTL9JEmBZa5WNYUdofjpRtC/YQ13OA=;
 b=L6oApV8dpwUKKeFQkWrRH8DeNyNiNwsLG/8Dhz45SIxB6DdOmTmHxftjpLGHiX/Rcd
 KqtH0YozFAS2VAH/MbLPqB06LUDIZq0Cs0fuyMmlsmhT3Oe/wr1Jfug5gUAq0DXckIWR
 ttNq9Nl/M3RipaWTv/P1zKEVRMNzxbFLcE+bwsEiorVOvzB6EcqlfTLicII7HFyRT952
 +N/eaMgrnNVf1YMVKx5sEF7jVsf2jni2jVZDEEzEl5qjy1Xj7GwaYeL9tjGjyRbQdC9x
 x3k9bKzbLoO/kBuloTkfklSkFJN2Z91+1tBEA6Ni0RTFvEQq3k5ms/qz9RCDnVheFJ72
 3NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GSZziYpN/fqe0HTL9JEmBZa5WNYUdofjpRtC/YQ13OA=;
 b=FZ5j9QJS+7O0GRy6dg6LGc1IJq/vD+PmJetvS1Dkz8ZJHgIkK4+K3QRWXrPZw2mnsr
 u2XfEUKp10ZFasLe76IqQsNfGrSCdN20NuV9VXMxkVjIKrc5ev9k54UVT3HUmI4PlEAR
 wEFMIzQ1sHB348S2cwof8XK+eYz2Ze3+9jjIgVxWMHNXGpYg1qznqbFQMZcN/zGc+b5u
 XAKvlP8t7paJ9y+6YZ+jPhsJ55F+Xi1RaBitZKUHkWAF83GE0o9dmbhD1xqbscNpZyit
 UVPmbs+9mT7RXn3DLRDU7SGfaEFnX+OS50LVUv2tPcST/YcpUmeszdmZnNBmXoDUru56
 5q1A==
X-Gm-Message-State: AOAM532xaPLF2j2uhODneDEaQd5vsOKUYMywc5obRocAdNEonMSdwPfP
 7ygPDwR2lZkXXq36986p6sdprrZpmCGyUwjI
X-Google-Smtp-Source: ABdhPJyLtwLNJWoPGUbWAhFDi1VVioE8sgxFznxa49AsheDdxf435lrxXrwCEHKa33gSouGOZf1oUQ==
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr555692wrw.36.1610055224728;
 Thu, 07 Jan 2021 13:33:44 -0800 (PST)
Received: from Dominiks-MBP.lan ([185.251.102.202])
 by smtp.googlemail.com with ESMTPSA id h16sm9337307wmb.41.2021.01.07.13.33.43
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 13:33:44 -0800 (PST)
Subject: Re: Responses send by wireguard always use the default route
To: wireguard@lists.zx2c4.com
References: <201bd244-743e-ab52-55bb-798a1d75309e@dsander.de>
 <CAJJxGdHrrpr+NPXztZz+QBy=g+E=oOEQsW6Qh9eKGuFiVXN+Mg@mail.gmail.com>
From: Dominik Sander <mail@dsander.de>
Message-ID: <09551513-c315-20ab-9f2c-93a6d8814920@dsander.de>
Date: Thu, 7 Jan 2021 22:33:43 +0100
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.1b3pre)
 Gecko/20081204 Thunderbird/3.0b1 Mnenhy/0.7.6.0
MIME-Version: 1.0
In-Reply-To: <CAJJxGdHrrpr+NPXztZz+QBy=g+E=oOEQsW6Qh9eKGuFiVXN+Mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 07 Jan 2021 21:55:11 +0000
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

Thank you for confirming that this is working as intended.

regards,

Dominik

On 02/01/2021 20:54, David Kerr wrote:
> This is expected behavior... outbound packets follow routing table
> rules to select the "best" interface to send from.  You can use
> iptables to mark packets coming in from one interface and then set up
> an ip routing table to make sure that replies to traffic on an
> incoming interface go back out on the same interface.  Search for that
> on google for suggested solutions.  By way of an example, here is what
> I have on my router to make sure that any traffic coming in on wg0 to
> my local network(s) is sent back out over wg0.
> 
> # iptables -t mangle -S | grep restore-mark
> -A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
> -A OUTPUT -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
> # iptables -t mangle -S | grep WG0
> -N PREROUTING_WG0
> -A PREROUTING -i wg0 -j PREROUTING_WG0
> -A PREROUTING_WG0 -m state --state NEW -j MARK --set-xmark 0x4/0x4
> -A PREROUTING_WG0 -m state --state NEW -j CONNMARK --save-mark
> --nfmask 0xffffffff --ctmask 0xffffffff
> # ip rule
> 0: from all lookup local
> 1000: from 192.168.1.1/24 fwmark 0x4/0x4 lookup 300
> 1001: from all to <redacted> lookup 51820
> 32766: from all lookup main
> 32767: from all lookup default
> # ip route show table 300
> default dev wg0 scope link
> 
> David.
> 
> 
> On Sat, Jan 2, 2021 at 10:34 AM Dominik Sander <mail@dsander.de> wrote:
>>
>> Hi!
>>
>> I would like to confirm if the behavior I am seeing is intended or if my
>> use case should be supported without additional configuration.
>>
>> When wireguard is configured on a server that has multiple network
>> interfaces the response is always send through the route with the lowest
>> metric, even when the connection was initiated via a different interface.
>>
>> The Wireguard server is exposed via my router, port 13377 is forwarded
>> to 192.168.1.246, the peer is connecting via an external IP:
>>
>> # ip route
>> default via 10.0.0.1 dev eth1 proto dhcp src 10.0.0.171 metric 50
>> default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.246 metric 100
>> 10.0.0.0/24 dev eth1 proto kernel scope link src 10.0.0.171 metric 50
>> 10.0.0.1 dev eth1 proto dhcp scope link src 10.0.0.171 metric 50
>> 192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.246 metric 100
>> 192.168.1.1 dev eth0 proto dhcp scope link src 192.168.1.246 metric 100
>>
>> # tcpdump -i any -vn "(host 80.xxx.xxx.xxx or src port 13377 or dst port 13377)"
>> tcpdump: listening on any, link-type LINUX_SLL (Linux cooked v1), capture size 262144 bytes
>> 14:13:08.767409 IP (tos 0x0, ttl 50, id 12125, offset 0, flags [none], proto UDP (17), length 176)
>>      80.xxx.xxx.xxx.17819 > 192.168.1.246.13377: UDP, length 148
>> 14:13:08.768076 IP (tos 0x88, ttl 64, id 180, offset 0, flags [none], proto UDP (17), length 120)
>>      10.0.0.171.13377 > .xxx.xxx.xxx.17819: UDP, length 92
>>
>> Because the response is send from the "wrong" IP address the router does not know
>> how to forward it and the client never is properly connected.
>>
>> I was wondering if the IP/interface of the request could also be used for the response,
>> to remove the need for policy based routing or iptable rules.
>>
>> The actual use case is wireguard on a OpenWRT router which has multiple WAN interfaces.
>> The WAN with the lowest metric is not the interface that should be used for wireguard
>> because it has better download speed, the wireguard WAN has better upload speed.
>>
>> Fore reference a thread discussing the problem on GitHub [1] and on the OpenWRT Forum [2].
>>
>> Thanks for creating/working on wireguard!
>>
>> Kind regards,
>>
>> Dominik
>>
>> [1] https://github.com/openwrt/packages/issues/9538
>> [2] https://forum.openwrt.org/t/wireguard-server-can-only-successfully-be-used-via-one-wan-interface/83374


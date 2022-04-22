Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2174C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 09:51:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 68968760;
	Fri, 22 Apr 2022 09:51:22 +0000 (UTC)
Received: from m32-12.eu.mailgun.net (m32-12.eu.mailgun.net [141.193.32.12])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f4f1398f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 09:51:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=oern.de; q=dns/txt;
 s=mta; 
 t=1650621081; h=Content-Transfer-Encoding: Content-Type: In-Reply-To:
 From: From: References: To: To: Subject: Subject: MIME-Version: Date:
 Message-ID: Sender: Sender;
 bh=Ojsdw1p4W+xFq9GLk3L7dOXlpuBuDaMSBMwSXW1Iwm8=;
 b=QNVap4cdrqYLBofn33UeYIzpEcLU9w6kJiNNypcys8crjRywA+Fv2seAQoRfn57JBq3+nIcL
 iwrt7+bE5zrS6hQB+4VZLNHbLj3uXEPf3CldnsDFKbSAAKuFeiUoVeCpIUiOBzFWPymwzDpJ
 6i2tJq5PZdNJiwykutpBApjbQm87E4MVDZUJjHaYSQORpXJqKQOSGTKVpi9syd+Ay2a76Two
 msddTlyA2YlOINISl9Z/W2g2+mi39DK0yuGtlfXPcGX8c4ox5tQALVdsExFjM1UJYhyZoefb
 scF05525jH0M488KLoGp5J1PLxJUxky6K0Z+vHbS8zQcSBg+Tg3NcQ==
X-Mailgun-Sending-Ip: 141.193.32.12
X-Mailgun-Sid: WyI5YWZmYiIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImUwNzRkIl0=
Received: from mail.7lb.de (mail.7lb.de [2.56.212.54]) by
 smtp-out-n03.prod.eu-central-1.postgun.com with SMTP id
 62627a997e6ccf7943f41612 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 22 Apr 2022 09:51:21 GMT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED9BE80FA7
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 11:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oern.de; s=laniv9ai;
 t=1650621079; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ojsdw1p4W+xFq9GLk3L7dOXlpuBuDaMSBMwSXW1Iwm8=;
 b=p0PRNQ7iY84YsoL+EPGlRujPb3S464KuBAkyOYVdwzhbWgdKC2w1a0FS3WvRHPoXi/Bzwv
 epk0IXSVP/DSXDHhGngb/S6erILkoRajpdX054pUeuX0SqzGoTiyWHW9kkHlX4lzNf7D6s
 4Oo4v214ekAIE7bL8PBVO6aAT5q6Aac=
Message-ID: <94ddb2e7-9181-1a38-1b35-3e1a9766846e@oern.de>
Date: Fri, 22 Apr 2022 11:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
 <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
From: =?UTF-8?Q?Bj=c3=b6rn_Fries?= <ml-wireguard@oern.de>
In-Reply-To: <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Am 22.04.22 um 08:16 schrieb Björn Fries:
> the way I solve this is that I use a slightly larger /23-subnet in the
> AllowedIPs=192.168.87.0/23
> 
> and when I get a local IP inside 192.168.87.0/24 at home, the kernel 
> automatically uses the more specific route.

an example:
my laptop e.g. has

Address = 172.22.247.58/32
PrivateKey = xxx

[Peer]
PublicKey = xxx
AllowedIPs = 172.22.144.1/32, 192.168.0.0/23
Endpoint =  myhomeIP:51820
PersistentKeepalive = 25

172.22.144.1/32 is the wireguard-IP of my wireguard-server at home.

This way I can reach for example my printer at 192.168.0.10 even if I am 
on the move, because my wireguard server is installed on my router at 
home (Unifi USG-3P).
The printer sends it packets for 172.22.247.58 simply to its default 
gateway, which is my router/wg-server, that forwards it over wireguard.

When I'm in my network at home, my laptop gets the IP 192.168.1.72/24 
and automatically talks to the other devices in the LAN without taking 
the wireguard route, because the subnet is more specific.

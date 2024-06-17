Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824DFC27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 11:41:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dea8cbba;
	Mon, 17 Jun 2024 11:41:12 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bee74b79
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 11:41:11 +0000 (UTC)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
 by wilbur.contactoffice.com (Postfix) with ESMTP id E86442A7;
 Mon, 17 Jun 2024 13:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718624470; 
 s=20220809-q8oc; d=unstable.cc; i=a@unstable.cc;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=Fxq7vN1ouNoPoRHUJ2GYByPyCid6JrgwmgzKTi/cGis=;
 b=Nwur2eima6ukyLqiospRNHUel6ICx5sU54ZZtYZP3p6Cer9v6+UNZsrIhp3Sa/Eh
 js1ZkvjaU5YJkdZodSPs9dJ6ly+KcFJDjOIrLno3dygspkIzghqZy70QhcUW1FoFmvT
 m9ErS5KNXHK30lwmfpvKDuue/BQufkkWDspfJQRA3/Ohn+cqcllbiGniVi0bv8dC01k
 QsSWfiGMincT3hfCoKxXQyUL2D8/982b1HsTKQtEXaFpMp5IkH8d5GctA8MZ6wCjL0M
 WIqpAoXajLQe0qDjx2u7Xn2vN3kzaDefaoiiIiF/p+AlYS+vFB+MxC+7W8X9ZcXc3ih
 xpxOw2A6fw==
Received: by smtp.mailfence.com with ESMTPSA ;
 Mon, 17 Jun 2024 13:41:08 +0200 (CEST)
Message-ID: <8f366adc-89a5-4b81-9a4f-8bcb1d08aad3@unstable.cc>
Date: Mon, 17 Jun 2024 13:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Germano Massullo <germano.massullo@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
 <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
 <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
 <ef44089b-1060-458f-906b-45fe682c6a10@gmail.com>
Content-Language: en-US
From: Antonio Quartulli <a@unstable.cc>
In-Reply-To: <ef44089b-1060-458f-906b-45fe682c6a10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:375058688
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

On 17/06/2024 13:08, Germano Massullo wrote:
> Il 17/06/24 11:45, Antonio Quartulli ha scritto:
>> Have you tried running the test between a client, behind the omnia 
>> turris and the wg server?
> 
> Do you mean a configuration where the Turris Omnia is not acting as 
> Wireguard peer/gateway? I could do it but I prefer not

No no. Sorry I might have used the wrong words.

Basically you should keep the wg setup as it is, but instead of running 
the iperf client on the turris, you run it on another host that uses the 
turris as gateway (as if the turris was the gateway of a LAN).

This way the tunnel is still established between the turris and the 
server (which is what you want to test), but you move the traffic 
generation to a different host (which is most likely what you will have 
in a real scenario).

I hope I clarified your doubt.

Regards,


-- 
Antonio Quartulli

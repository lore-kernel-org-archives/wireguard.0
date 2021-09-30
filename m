Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67CBC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 11:04:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A7D615E5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 11:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A7D615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coppint.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6eeb25c6;
	Thu, 30 Sep 2021 11:01:49 +0000 (UTC)
Received: from mail01.coppint.com (mail01.coppint.com [212.129.15.236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2d98d19c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Sep 2021 11:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.coppint.com (Mail server) with ESMTP id 256161C710F;
 Thu, 30 Sep 2021 13:01:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail01.coppint.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coppint.com; s=dkim;
 t=1632999699; bh=ryX67rseG7dgvdefETd3fXKanSaJo6twZ3T2knANEwE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:
 Content-Transfer-Encoding;
 b=JGzmBwm33JjUn5BKNzhXMXejlQKro3wf3LNCn4c0wU2rY9Wvw6Asj2uBkh1IDXSi1
 liAWqOwY3wrlcL31pJmqf53J/AYHuUCNkaBl/gixCjCQAYnG67NrO6257fg/sZJ6ir
 bYSEWQ2sLkTfUNgbX24EfCZTTW961pmL4p2Ld+c9wwOmc5tVokztJW3PAzN+2JfkD+
 /4OR3f7ARSy6iDDqfPmsvDvAV2kWwksGNZ28pGh9XeZQVZxzB/SdblZovJ0bLhE5EV
 2myvu4r+YaGi2XD6TitspFLFiErfqvZMwfdo16EmijfcPtjnZAkT1QBAYPnXhrTZUN
 ca0ShfX7WXsrw==
Subject: Re: Enable Wireguard only for specific user
To: Nils Andreas Svee <me@lochnair.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <0fd0ed22-732c-0ea5-5067-538dc0842869@coppint.com>
 <ac93f873-83fd-43b1-a247-f7df94cf0c36@www.fastmail.com>
From: "Florent B." <florent@coppint.com>
Message-ID: <906dc97b-d6e9-63a1-3a6a-65bd36d5671b@coppint.com>
Date: Thu, 30 Sep 2021 13:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ac93f873-83fd-43b1-a247-f7df94cf0c36@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

Thank you it works very well matching my excluded user and using "lookup 
main" ;)

 > ip rule add pref 20 uidrange 1001-1001 lookup main

I though it was more difficult and didn't know that "uid matching" in 
"ip rule".

Thanks

Le 30/09/2021 à 12:53, Nils Andreas Svee a écrit :
> Hi,
>
> What I've had success with is using policy-based routing, selecting the routing table to use based on UID's.
> You create a new routing table for the WireGuard VPN and add a rule directing that users traffic to that table.
>
> Using commands you can do this to route traffic from the user with UID 1000 to table 500.
>> ip rule add pref 20 uidrange 1000-1000 lookup 500
> You can also do this in systemd-networkd if you're using that. Not sure about other network managers.
>
> Best Regards
> Nils
>
> On Thu, Sep 30, 2021, at 12:40, Florent B. wrote:
>> Hi list,
>>
>> On a Linux system (Ubuntu), I would like to enable Wireguard VPN only
>> for a single user on my system.
>>
>> Currently by default, every packet of every user is getting though
>> Wireguard.
>>
>> How can I do to route packets only for 1 user ?
>>
>> I think I have to play with packets marking (wg show wg0 fwmark /
>> iptables owner/mark module), I tried some commands but was unable to
>> success.
>>
>> Can someone help please ?
>>
>> Thank you.
>>
>> Florent

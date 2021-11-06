Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54B6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 17:23:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46F360E90
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 17:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D46F360E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chil.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f65ffd27;
	Sat, 6 Nov 2021 17:21:12 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ea0d879a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=8Wchyx1ixbMAxRsoV5De5iGXRLdqbRq0nYlnLP8Dsqk=; 
 b=jeRsdgSp4ibfVFIpYcZjmFBZNY+75ppdZQ9x3xcYFxmchRQ6mrMvemhFjAGlLMMhnlr9/Yb8aD1Iu+ZIvZBlO11SFsIe73zb5g7GW9FjN5fmhqI6V4HeP753cNggF4XHWJAXI7sYAeEzR80fYj2iD9IfqQezONAdCSbSStCV+Ng=;
Received: from [10.5.44.225] (port=24502 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1mjPNG-0005PK-0G; Sat, 06 Nov 2021 18:21:02 +0100
Received: from [172.22.0.123] (193.238.156.229) by mail.onetrix.net
 (10.5.44.225) with Microsoft SMTP Server (TLS) id 14.1.438.0; Sat, 6 Nov 2021
 18:21:01 +0100
X-CTCH-RefID: str=0001.0A682F21.6186B97E.001F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <04d29715-a3d5-59b4-11bc-5b2b932937a9@chil.at>
Date: Sat, 6 Nov 2021 18:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Android app: length of name
Content-Language: de-AT
To: Aaron Jones <me@aaronmdjones.net>, <wireguard@lists.zx2c4.com>
References: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>
 <1c7c517e-f0ee-8d02-75e1-5db2d92268f0@aaronmdjones.net>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <1c7c517e-f0ee-8d02-75e1-5db2d92268f0@aaronmdjones.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [193.238.156.229]
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


Am 06.11.2021 um 17:54 schrieb Aaron Jones:
> On 06/11/2021 13:22, Christoph Loesch wrote:
>> Hi,
>>
>> in the android app the name is limited to 15 characters.
>>
>> Does that have a specific reason?
>> Is it possible to allow a longer name like e.g. 32 characters?
>>
>> On importing a file the error "Invalid name" could be more specific
>> to that. Because I had to struggle with the file name until I found
>> out it is just a limitation of the length.
>>
>> Kind regards,
>> Christoph
> The network name determines the interface name, and on Linux, the
> length of an interface name (e.g. "eth0") is limited to 15 characters.
>
> Regards,
> Aaron Jones
>
Oh, I didn't know that, thanks, that explains the limitation.

Then I would suggest to note the limitation of 15 characters in the error message on config import, if possible.

Kind regards,
Christoph


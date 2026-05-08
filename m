Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C6CD3447
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 May 2026 13:42:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3f00d33f;
	Fri, 8 May 2026 13:42:07 +0000 (UTC)
Received: from smtp71.iad3a.emailsrvr.com (smtp71.iad3a.emailsrvr.com
 [173.203.187.71])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 66b76148
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 May 2026 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uekermann.me;
 s=20230325-gcqqzkht; t=1778247725;
 bh=ZkNryFDodHevJNGZI0HcTku8KHdkdObNfJkIVv+KsJI=;
 h=Date:Subject:To:From:From;
 b=QQw+12tkCfwXL5DaBaPAAupcKMe3An4+cfq/gmT4vAn6GQbcQvINJKiWOB0meI9vO
 wgHC7ualtGL37+npR7xixYskOfSKiacvDhv5B1TMiLRlNwxLE595clMYtlx3XPKYnc
 WZVtIYBCKRfnHw6V5suqlCaR7HmN/MvjuH+6TbRg=
X-Auth-ID: florian@uekermann.email
Received: by smtp9.relay.iad3a.emailsrvr.com (Authenticated sender:
 florian-AT-uekermann.email) with ESMTPSA id 5F9A5139A; 
 Fri,  8 May 2026 09:42:04 -0400 (EDT)
Message-ID: <7792e4d4-c66f-4981-8f2b-f59731b50bd0@uekermann.me>
Date: Fri, 8 May 2026 15:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wg-quick: fix darwin MTU detection
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, A Jonas <jonas@chaincode.com>,
 Carl Dong <carl@obscura.net>
References: <20251020142254.16546-2-florian@uekermann.me>
 <afiJFxeMxJw-n9-G@zx2c4.com>
 <8358be3e-d696-454e-a970-2305f23fce2f@uekermann.me>
 <CAHmME9pFJyEtgrYLv2h-SFKLuRCwsv=SoMjhteFZPh4B6CfHBw@mail.gmail.com>
Content-Language: en-US
From: Florian Uekermann <florian@uekermann.me>
In-Reply-To: <CAHmME9pFJyEtgrYLv2h-SFKLuRCwsv=SoMjhteFZPh4B6CfHBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: e1c25645-7b00-4fa0-8dec-c59767dd034a-1-1
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

Hi Jason,

On 06/05/2026 23:28, Jason A. Donenfeld wrote:
> Could you test this?
> https://git.zx2c4.com/wireguard-tools/commit/?id=a998407747005ea7e4e0258d96f105c97241e1d3

Yes, it seems to work. I tested this commit and the previous one after 
connecting to another VPN (to lower MTU of the default interface to 
1280) and got a MTUs of 1420 and 1200 respectively. Thanks!

Best regards,
Florian

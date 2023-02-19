Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3861C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 20:23:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad00cccd;
	Sun, 19 Feb 2023 20:18:49 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bb124258
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 20:18:48 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C195E400BA;
 Sun, 19 Feb 2023 23:18:48 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3683DF;
 Sun, 19 Feb 2023 23:18:47 +0300 (MSK)
Message-ID: <24c6fa52-a512-a01e-5351-90cb33a32a3f@msgid.tls.msk.ru>
Date: Sun, 19 Feb 2023 23:18:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RESEND PATCH v3] wg: Support restricting address family of DNS
 resolved Endpoint
To: Roman Mamedov <rm@romanrm.net>, =?UTF-8?Q?Daniel_Gr=c3=b6ber?=
 <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com, "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20230219180428.438453-1-dxld@darkboxed.org>
 <20230219233118.2d9654f9@nvm>
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230219233118.2d9654f9@nvm>
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

19.02.2023 21:31, Roman Mamedov пишет:
> On Sun, 19 Feb 2023 19:04:28 +0100
> Daniel Gröber <dxld@darkboxed.org> wrote:
> 
>> +static inline bool parse_address_family(int *family, const char *value)
>> +{
>> +	if (strcmp(value, "inet") == 0)
>> +		*family = AF_INET;
>> +	else if (strcmp(value, "inet6") == 0)
>> +		*family = AF_INET6;
> 
> Wouldn't the first condition match "inet6" as well, not ever checking the
> second condition?

No.  It is not memcmp.

/mjt

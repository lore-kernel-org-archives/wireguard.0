Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EBFC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Nov 2022 06:31:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15d33a74;
	Mon, 21 Nov 2022 06:31:45 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4122cefe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2022 06:31:43 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 621834033F;
 Mon, 21 Nov 2022 09:31:42 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 00ED46B;
 Mon, 21 Nov 2022 09:31:41 +0300 (MSK)
Message-ID: <bd851ce5-c45b-b6ed-986e-4d9f3cf54494@msgid.tls.msk.ru>
Date: Mon, 21 Nov 2022 09:31:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] wg: Allow config to read private key from file
Content-Language: en-US
To: =?UTF-8?Q?Daniel_Gr=c3=b6ber?= <dxld@darkboxed.org>,
 wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20221120224601.77300-1-dxld@darkboxed.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20221120224601.77300-1-dxld@darkboxed.org>
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

21.11.2022 01:46, Daniel Gröber wrote:
> This adds a new config key PrivateKeyFile= that simply hooks up the
> existing code for the `wg set ... private-key /file` codepath.
> 
> Using this new option the interface configs can be much easier to deploy in
> an automated fashion as they don't contain secrets anymore. The private key
> can easily be provisioned out of band or using a one-time provisioning step
> instead.

This is definitely a very welcome option in my PoV.

Add my
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

for this.

> Before this patch we were using a neat hack: it's possible to simply omit
> PrivateKey= and set it using PostUp= wg set %i private-key /some/file.

Well, this isn't really neat, it is a hackish workaround for the missing
functionality ;)

On a side, note, almost a year ago I sent a patch for wg utility to recognize
and discard some keywords which are processed by wg-quick script - like,
Address=. This way, there's no need to pre-process the config file anymore,
and in order to recognize more peers, one doesn't have to restart the
tunnel interface, instead, a regular wg syncconf wgif.conf is sufficient,
and many things can be simplified too (removing the preprocessing).
I've never got any reply for these patches.

/mjt

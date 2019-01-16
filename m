Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB0EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 18:45:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B419420840
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 18:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mib-infotech-co-nz.20150623.gappssmtp.com header.i=@mib-infotech-co-nz.20150623.gappssmtp.com header.b="Zs343d/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B419420840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mib-infotech.co.nz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6793157f;
	Wed, 16 Jan 2019 18:40:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a156ff9
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 18:40:27 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24c52af3
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 18:40:27 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id e11so3409681plt.11
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 10:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mib-infotech-co-nz.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VQHM32y93enWEBN2Y7aRrcaXmf50OdB5ACAgjCtOZRk=;
 b=Zs343d/dQYV1W2GliE/hqtUC9uThbA6nGBT/9zvpfBeQY3h5D1VH3/afwI7YpqbLcB
 EvdTLfNnWx5iQcjF+c43Swf28cnUaZcTv0sv1LJSX8TzEhVexFbz/pbi5B3Rs+tssw/w
 tZkF5zfDAoMPcvrdnvV4gJVKE6hGfD61cmhn00pV9TrPFTSWNj+s6VL5Qgtzku0biz1R
 hrW2eLRLEgqxUG7TotnOl6DzYKEoSXH6l13V5xq8bBjLVmYltBS1CuP3X6v8ZZRarXzi
 qX1PbVU00MeqOctWIMt8YxllR23zJH/+tdpQyCu0DSqQhzvrvwP/9AEKLti8/NZMQxI4
 gYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VQHM32y93enWEBN2Y7aRrcaXmf50OdB5ACAgjCtOZRk=;
 b=JCn5ZN4OhAxsD4GUgwdwg54cL3MXDothbMNaEZwKqsQ98JBTze0Qtvb8naoGyUMPM/
 reKujT9Moo1DEaXbHZKP6ddbW5y3kSVznEJFBLEFRWSw4mcWVT1MnckbEpAyIPe9t+d2
 2qOo0EQUj91A4VssHig6Ul3dakzIwcZSEiBHoFBLSAvREHJ4sTd3ZO531g4xDdQvgBs1
 FEgBzQiOF+kVLhQew2lpYUxYK4PfWAzNDj6H8mnEsCsxm4MVhZ8DZkqelXnQpCjyifXM
 mXymo8ut4xiqmXJv5tO/6MaI6QDV3mh2yU2jQ/9BBxwdcXQuYXqlpUgYz2boKXTNA1Jm
 7k4w==
X-Gm-Message-State: AJcUukcF4Z9FnBsM6faSDN56p6l9lQ3N525hm8D6EA0iUAS4pLK8ayVH
 S/sj5UnSDPvVNUA8ZzrRti1IWgxMbiw=
X-Google-Smtp-Source: ALg8bN4rl9oSpQDPARQZhnI9Wb/plJ/dKUNtWdkZLyt4yz6hTH+/d1aCfM+JlPG8olA1j9GdSAYnYQ==
X-Received: by 2002:a17:902:9a8b:: with SMTP id
 w11mr11128738plp.121.1547664277078; 
 Wed, 16 Jan 2019 10:44:37 -0800 (PST)
Received: from [192.168.95.203] ([210.54.33.48])
 by smtp.googlemail.com with ESMTPSA id d68sm9535971pfa.64.2019.01.16.10.44.35
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jan 2019 10:44:36 -0800 (PST)
Subject: Re: WireGuard roaming behind a load balancer
To: wireguard@lists.zx2c4.com
References: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Openpgp: preference=signencrypt
Autocrypt: addr=john@mib-infotech.co.nz; prefer-encrypt=mutual; keydata=
 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
 RIzTdUXOFJroFiGQ
Message-ID: <a6036478-50de-4b7e-01f8-a21c6f302876@mib-infotech.co.nz>
Date: Thu, 17 Jan 2019 07:44:32 +1300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

If you are using an F5 LTM load balancer,

Set a keepalive timeout  on  wireguard.
Assign a UDP profile with a timeout greater than the wireguard keepalive
Assign the Profile to the UDP VIP
--John



On 16/01/2019 4:45 AM, pdub wrote:
> Greetings,
> 
> WireGuard is a really cool project! Thanks!
> 
> With WireGuard's native roaming support, I have a question about just
> how stateful/stateless the roaming is. Here's a hypothetical situation:
> 
> Let's say WireGuard is being used to tunnel into a location and is
> served behind a load balancer for high availability. If both nodes have
> identical WireGuard config files at the start of WireGuard (and, for
> simplicity, let's assume the configurations don't change). If one node
> dies, the load balancer will automatically start sending packets to the
> standby node running WireGuard (perhaps existing on the same subnet as
> the other node, but with a different IP).
> 
> In a sense, the server-side "peer" has just roamed from machine to
> another, but the public/Internet IP address didn't change (because that
> is assigned to the load balancer itself). Will this work with WireGuard
> today?
> 
> TIA
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

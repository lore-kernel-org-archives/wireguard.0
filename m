Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF970C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD7121A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD7121A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ironai.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11fe95e3;
	Sun, 17 Feb 2019 01:11:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15481fd4
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 08:15:06 +0000 (UTC)
Received: from achernar.uberspace.de (achernar.uberspace.de [95.143.172.237])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d06f085
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 08:15:05 +0000 (UTC)
Received: (qmail 704 invoked from network); 16 Jan 2019 08:19:12 -0000
Received: from localhost (HELO ?192.168.1.133?) (127.0.0.1)
 by achernar.uberspace.de with SMTP; 16 Jan 2019 08:19:12 -0000
Subject: Re: problems setting up wireguard: no traffic but kepalives reach the
 server
To: wireguard@lists.zx2c4.com
References: <CAPRYYOZEj55phSnyqHyrGcOt5w0vyfx_VV3y4kYc_CUVM-vPiA@mail.gmail.com>
From: Vincent Wiemann <vincent.wiemann@ironai.com>
Message-ID: <eb41a083-9e05-2222-60ab-e9f22b3b14c1@ironai.com>
Date: Wed, 16 Jan 2019 09:19:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAPRYYOZEj55phSnyqHyrGcOt5w0vyfx_VV3y4kYc_CUVM-vPiA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:11:47 +0100
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

Hi Wojtek,

your public keys don't match:
> Server perspective:
>   public key: A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
> Client perspective (X.X.X.X is my Internet-facing IP):
> peer: YUd1mFAOyn01G2/n942hk9LZ0mfhUm4nHb/3xMVSETc=

Regards,

Vincent Wiemann
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

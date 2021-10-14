Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56C5C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 15:34:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8FE60ED4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A8FE60ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=qupfer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8433b37;
	Thu, 14 Oct 2021 15:34:36 +0000 (UTC)
Received: from mail.07q.de (mail.07q.de [194.163.141.229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80f902ca
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 07:12:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 568F3460008
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 09:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qupfer.de; s=dkim;
 t=1634195550; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SO0q3KM/X5AH/nRLy1Jt0/eqBpLvK6HH5NrkAv/YW30=;
 b=bxbIq43pRDqXjIwHEihZJY2t2NACsFiZxp+Hi8QZ29UcDYvFqfmlck7vHG9mYaRedRd6wT
 4jBS76D65NlH4NjWfMUISNKlTf5DMPh6W1RdfqbN5ksXCpVBXY2g6lqMqtOFvRNZ3ubNeP
 6vT1m7cwJY3IxK3cs0aGWvsHDan/J8wbkEnBlbYhOkTwECUaqBRg/N3+Gwx7I6WlnDKjoX
 aQNIvLUJvjR3ibHiLosXhqqHF3tCkR5Z3OGnETkkonPfEGRl7O9smKoy1nCwfS1jqClyXQ
 h+n1xwhHb+ejOG9ed7CBAoSgmxX+SaTpzNCw9fW5JhumQMCc50RyX5U49X9Ong==
Message-ID: <84cf0d10-471a-5e25-a160-79dd7cdfc367@qupfer.de>
Date: Thu, 14 Oct 2021 09:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux: bridging/bonding not possible
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <76173@imapsync>
From: wireguard@qupfer.de
In-Reply-To: <76173@imapsync>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:34:33 +0000
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

 >> is it possible (or even planned) to add hw-addresses to the
 >> wireguard-netdevs or does this interfere with the concept of wireguard?

I hope I say nothing wrong, but its not (directly) possible and probably 
not plant.

Wireguard is a so called Layer-3 VPN, bridging is a Layer-2 thing. So it 
will no work together.
But you could use an (un)secure Layer-2-VPN (like L2TP) and transport it 
through wireguard. (similar to the often used L2TP over IPsec).
You could also take a look to softether vpn 
(https://www.softether.org/), which also includes a Layer-2 VPN. But I 
have no clue about the security quality.


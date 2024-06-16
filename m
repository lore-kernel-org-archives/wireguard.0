Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A66C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jun 2024 13:47:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37893aa6;
	Sun, 16 Jun 2024 13:47:42 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b71ee90e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Jun 2024 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
 s=s42582890; t=1718545658; x=1719150458; i=max.schulze@online.de;
 bh=Oq5+6GzBXNIs7lKsbawGMgp3IBQt8ddVjiqM1XPfTM4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kla3XsASLmLjXrVN69/UTB6HmGrkyvx1B5wW1/EWTwk7lFJwingPKUxvJ5I+D3Qi
 O9PouaS1TKhpjRu2RZPB08snEw84ud9FKuk7eQbedxh6mhwHrc9sFXXRnRn6sDRHw
 XTiJTZzqp8q2m5Kb0Mu1HKLpg2QsmkG1Qxm/l9gMgK8CnMWlDVyf7x+NiDQBtSJIL
 NbDLuf4DMD2GJ/8o+QT1SxnYzQNj50y6S8yGpZx9vEOsvYuosFX+kIPqjfrTI2pSN
 p8F5Mt5IQjYbrlP43RlTGBbMl9Y/YMa8s9e/EnEojRJBUHjhPYER0IuC9x41FE8Z8
 8/uCBoI7mFL99oHxpw==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from [192.168.151.46] ([84.160.50.175]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MN5S1-1s0LTb1jEr-00TMJH; Sun, 16 Jun 2024 15:47:38 +0200
Message-ID: <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
Date: Sun, 16 Jun 2024 15:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Germano Massullo <germano.massullo@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
Content-Language: en-US
From: Max Schulze <max.schulze@online.de>
In-Reply-To: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/iUe6hHtyK87oCnkKp/3mMgXyRDcbN+aoS7K94zwyPyem+2Vb3f
 Mo+5YZIUrbr20guoRpG9qPaE6obiS6dPmyDR2FjAAsos+KKo1WYyZjSJXSMRH+fhQ8JwCqm
 XNVzXS16JRHJn5cPKGAUubS+8x30yTjzi1zRW01rjuJ3dH/2C9SGqMAMKX2oxhftISXbrmh
 UPEYV0VFJ+aF9ayNuGD7Q==
UI-OutboundReport: notjunk:1;M01:P0:MdBETrh/QYM=;i0ghAPCg56Tr1qxoXPsDC1FLhZC
 gJB6xoOjXnzskvXUohaT4UFvAlCstFIZ54l56XcRvLvfArI5/V/8KSZgqaJlNN3GZkb1mzqgu
 huZHSibw829HkRJPq6oCF0/B9mBEtSEZDNZLHblXMF6j7S542bQu5DatvB58ye9eQQDEYkOa2
 /UuejmCNIcQ10RPKgdelBJO06rV9iK/EUYqbkooBZMKi6bRlm45To4SAuKKvhw9Q6ACHTfTJr
 4zAkup6vI2+L3e1wIHjR8cspjJMPJwJ9LB6codSY8ojmImYkSRr07YhkgrrdDqEyA0+PwlXdH
 BDfAr4n+B7rMxiB3dcKN05g7P7W8DXX8pHx7D0yLPqErrIlKaOCLUnz9uHW2cLqJBYCJObDoY
 EvL+BMTKoTPoJtnWE6N9TpAxziDEjn6hJdtAAnjdR5/JDN0DL4WK5EO9ojqHYXp15fMN/xIlx
 3fwkOHR4lVyN995gKEIyQnUNQTo/6treaRTRhGjRJ0Sm2P3fwm7yu4dW+k9XfrTnThdUvbSgF
 15IXQQPygvv0jJGSRfzZ0ypkY8AKxSUiC9aUYxH6L0ioPokWK6qcWRY5KmRi4OUh6WPebXm8b
 FczX+8Byxn3GojfKHadmd5nAH23OvsJHDKLrmuBhQHl+pFm708L4xbuahNCOtKbNk8LrMCnQ+
 r5e9Ttxaea5VmHwKnSvkBmT5fVOu5d5l2IHzo3tpocdyV1uiPsi2brsjHNz86iHUq1s5oNck6
 F8sNXAeJdJ57XNwI7PANfCwR32/0xNiojS5Nv6wEsKNse/w3VWJhsk=
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

On 12.06.24 16:11, Germano Massullo wrote:
> Hello, I would like to ask if you are aware of any mini PCI express
> card that provides hardware acceleration for ChaCha20 algorithm. I
> would need it to improve Turris Omnia Wireguard throughput


why do you think this is the bottleneck and at what speed are you hitting a limit?

Curious, as I always found wg performance to be excellent, even on ARM.

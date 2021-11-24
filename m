Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C754C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Nov 2021 15:07:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a03d8c1a;
	Wed, 24 Nov 2021 15:07:24 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4f1fef7b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Nov 2021 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637766442;
 bh=C69OqTRzcxMeo08DNzcHU6FmswhVBRxZhQBfHM20CLo=;
 h=X-UI-Sender-Class:Date:Subject:Cc:References:From:In-Reply-To;
 b=cqOe2FaydToW+jnNHBviSqWpeViAoMJj2+uWt9mJk1nG1XlHx4sfWTciS1zQ004TM
 HcE2IwPNppFYi28ZguvQLeg4JYf190iu/EBCeO3PMO296tEbDIX1tvq2kQqnSGFYcZ
 WWQPibCaPGdkce1zwIZr+I3wN1qErqFoHOwqaM0A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.3] ([93.198.60.185]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIMfc-1mtDFW2ZJU-00EPIz for
 <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 16:07:22 +0100
Message-ID: <f9e5c379-f199-e362-9ad7-3df580e45f93@gmx.net>
Date: Wed, 24 Nov 2021 16:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Dynamic routes
Content-Language: de-DE
Cc: "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
References: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
 <CA+cYV6s2jMh4z5eUz-AAY5MO9CBpszWZtiUbkWY8XeFw7pLaFg@mail.gmail.com>
 <3171350c-543d-92c9-c897-3cb752a811cf@pineview.net>
From: Robert Dahlem <Robert.Dahlem@gmx.net>
In-Reply-To: <3171350c-543d-92c9-c897-3cb752a811cf@pineview.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Z/ImZ3Q1J2uV3R13VijvT9j/fcfM0DCRikBmHcDZXU5LaO5bMRE
 0o7jXq8MK5nZoFlZKIVK0/3bQv42+U2SDAhXBBuQrGfb5re7PcF3N+PeI1X/aw1wcIoXxie
 VWtmgP/ERSIq2kjZlDUpYz13QHvbr7JXlrZxpnDPhfLufYp/sKU74ds4HKAxhAjmT0PKuJc
 0vbe/tTEcKKduJp+RlNaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:khtm9xpIzUI=:SBrhSeyTlLFmnsKMOkh4WU
 nmU6FniXzgQOkIUmH/x+f2AddzdYetDwLjDrbFE+GJxQE2tkDfVs+VBx5SggHi7TLq1/5qZKz
 8h7nCjVmwUq/rt3wtyyvTXv14ngGtE7yWvwcbRVohssLk6TuYDhyi5F1eEok8wYT35hFW/VU4
 MFt26qNu+l5p9FBpawuyHNFZz4XlmPSMe0a81Qc3Yi5uHoIm2hGuvM+8Kp+OAanvSQzyCuhBg
 +FL+SvAYwbIPRcCnqJmtqCk+G7nOAXd+OhtEZr+oe7YUzcJ58cTpRwD3PoZg2/vDSWFTS4POQ
 muRLNb5aOvv2aC25wlp71C3EB2uuvUlEmnpid7CzGkPQDI7tp+Hf/dycBZKqoJmzcsH8t8fFO
 i+WZxSQPG5D9TxwBXgLlBF0F/n+l3rPMygCoCvUFFsnRmoyt03qTjKiYTGGs6S/GJL8zktHef
 05cLe+3OW6Ao+HqckApwpxPYMG47YOtmC0Zm0izAQE/BEGwmuewgJDspKFg3EOvg0jLQtcFkt
 vaik1yWUrZlN5msmfF4yAjFfJsT7I5rx+46vJaJ2E1dStASgMlkN1YFl1BABh0BF19i3QQ9YJ
 Wam6U0Nyr/gjkoGU73wV2+k6C0/5ECSNz2PcwKEfCOaWDbRbxhLHK01QWuglKmbt1LYvI9Ury
 HcbHeoZMLrRL0SVrMoTtXXcTsGYvBlHc2lbNCCMDhVsaZca3xsLDSGG1Me4sMd82SI4esCApN
 dHmAstJIAU1mcghiASNwkuX3RuCLmSjx1VUuoiRNH+hOiIRj/TFXw1eTbFrgI1is0NQ372NDQ
 EIB3hjT+NAcXBfUzzb0bbB/2DnWpYXD8/ThQzTs4FfN7fZYJIlp+XFSjIA5Gf9mNegACvo9NE
 lhw03QSGb2zHE434wpbm0wUOPL0HSxK+G6L1UtQ8E0r5z2I+AkLjPNrFpCHvfHG154teq3Qka
 sHP2K7jNxv79ikrpXLxYPNgqUx/KWGIhJF0UjaDxTAD7OcJClhy0amXQ7I7JIirRwE6M9TKoP
 mnxbD44l7rZT9Cnw9js3+B8Z6XkmkrtvjOPUPWGP11w/EwAeiL5HwdUHlMKBpul7BBXbSIh3T
 RGB8G9+83kAHHU=
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

On 24.11.2021 13:04, Mike O'Connor wrote:

> On 24/11/21 9:48 pm, Chriztoffer Hansen wrote:

>>> I could always install Quagga or Bird and use OSPF. But that might be a
>>> bit of an overkill for a simple active/passive failover.

>> RIP, OSPF, BGP, EIGRP. Either can work. And would IMO be sufficiently
>> simple to set up and maintain. Either way, you will need a daemon to
>> maintain monitoring of the packets being able to flow over the tunnel.
>> If you select a routing demon or another daemon. ... take a pick.

> Correct, not the job of Wireguard.

I can live with that. Thanks for clearing up.

Regards,
Robert


Return-Path: <SRS0=ChNg=ZA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27305C5DF60
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Nov 2019 10:11:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416AE214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Nov 2019 10:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=coppint.com header.i=@coppint.com header.b="bE2qnUtY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416AE214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coppint.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 578eb2ad;
	Fri, 8 Nov 2019 10:10:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d35df78
 for <wireguard@lists.zx2c4.com>; Fri, 8 Nov 2019 10:10:54 +0000 (UTC)
Received: from mail01.coppint.com (mail01.coppint.com [212.129.15.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 102c7727
 for <wireguard@lists.zx2c4.com>; Fri, 8 Nov 2019 10:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail01.coppint.com (Mail server) with ESMTP id 583FE1C5928
 for <wireguard@lists.zx2c4.com>; Fri,  8 Nov 2019 11:10:53 +0100 (CET)
X-Virus-Scanned: mail01.coppint.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coppint.com; s=dkim;
 t=1573207851; bh=QUDuHusYDpvFh7UmabtCN6jTQLHErlvKcjmaVOkQwAg=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:
 Content-Transfer-Encoding;
 b=bE2qnUtYK04LYKQlZT6yb6hIEYuX8VI5dK59sXzSjULirpPfflYWuNuphrCcMqnqu
 JOjBRi1EaH1KBjIoJVGINEv4WDpjxg0QT1EHzNlz5lK/4PU2k9zgqxS59MP9RxmCAn
 RZMWnH+A+X+CnpyXzlyyXO/QfgSJtvyN8nEBMGTMFf05ppJrpqjPFjAo4hNPx/S2wN
 Xb/pYhSwQ4qfFPxMQDrPBd72qAaLq3EPgUl0E1gaossWC/C3RvcXpCsPUwhmT/p+OX
 19DipEGVwX9NrQp2JU52BkjpszFxItkFDUgxfvp61ZwoIo4T0W5gpTUwIewaY80Ukj
 1xzgZWtNJeIpw==
To: wireguard@lists.zx2c4.com
From: Florent B <florent@coppint.com>
Subject: OnePlus 7T Android kernel module
Autocrypt: addr=florent@coppint.com; prefer-encrypt=mutual; keydata=
 mQENBE+eRuMBCADQrH5Fv3yOQMlrszKSd3PoukYaEn7pxHhLiGb5UPG8MqKvofu9nodX8m5W
 g/lx7A9De1rQP7F6B0tQdVMLebI+DwM4YhTVypB4B/B9VCoyTbPOcSE4DEf7Altmhu4y76UQ
 PJRTqzi5dLbQ13DeiogOvAH9r5P/ocYphJiWunMBMcToE5EL2ZlIPmc2wwrTZrFQL7Khjxh+
 7gwXwPbjhN0XiqNCALmMOe7ukg6/sJsdr8B8hqVRwXyd0NZnnbVLAkCx6uQ0FyfRG9+b/ZxH
 LBJuCV3Xppg7kn1BxmKVCDR7m5rijFLpN5JT7wAsRuwoEU4kwdW7DmHOByg0kjvm6xzBABEB
 AAG0JkZsb3JlbnQgQmF1dGlzdGEgPGZsb3JlbnRAY29wcGludC5jb20+iQFVBBMBAgA/Ahsj
 BgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBAVEImv+Vl8guwOEGv+6X0vegX1nBQJcwtMS
 BQkPBb+vAAoJEP+6X0vegX1nNdQH/3SNhpc7wqAPflrm0a2/O6YXk/JU+DNehD3hNaYWindT
 Sbgw464+EMAJQHZS3+dVYGu3YN/W1F26tf8YCzF9wnEl7OZkK55mQFo/DsgTFwKcFI4Y7wKX
 uvlo174GrKCFdSjRAMGXIzAKZbGNHgRKSBtM9mK2vM+V+UjJVdHq4HM4xIR4CeTI0L+0QkMw
 aOk8HXsCw5som5IeFL2y0akjH3L8TeiuwvvD5iNxUnHQbI8LtpqfPrCWGnd/QjooEOWhMaSm
 Jf8NqhOKTxIYzj8BDnTmzLbWWkpRHJmlVSPSv5HbKEJk+nfEq3Nf/SGRqetigtQCmIwxC4QD
 JQ7qjzz55qy5AQ0ET55G4wEIAKaUfSaCPpUQo01IzzqLIl5rmpvWNBMYXcu0UyvX5Sl7VIVI
 pYWK/K9yI4BELfMC3MkqQNiyp+BjnOupkRqRGChEPyDhJtbBVilWEjbUVnMLwfYDhjwos8Bh
 aIF69n1DQhi68XzPkN4WLglj9y9GFIPlUTvqfzRXwY86RIvWnGKwa5Lji/m2LF0ZWLMQNJoc
 Sm4JD+yMu32RXRzepcyKGHNYAwpz61BLTFfFvrR5fhRJkCJ0kb5PoZ6ZOR1A/7B4PXJOamdK
 qzG3oySleTb/Bb4kfBwyrX59uZ3PzuXotN1CqQpRwMcd9qwOPKNiDxQP6BSoRcvspbnjORfO
 aeE6rgUAEQEAAYkBPAQYAQIAJgIbDBYhBAVEImv+Vl8guwOEGv+6X0vegX1nBQJcwtMXBQkP
 Bb+0AAoJEP+6X0vegX1nfzUH/0W55wkTFJYVm1qvOFLS1ELfKxV5lAzwKZkVU5gTamcHElx7
 WFn3qGkWt0a+8dLT6sunMqm2/AnbrDfVdNb8YsjxehoZV4TXpkvOJCrjn9pKOuuoYER2NE3H
 0IXwT3wpcT7kkeqWtrd4sqCmGasRMmQZ8iTMUPQXkjFfVaEYoBYfO+BASQxpkLX1iyYbobNI
 Kbms3V5RTiHcRZeck1D2iRUBNng6T67jKqO8J5BqNn1+UQ3S2TNNhUlPTXY/iZMsxovhqGFI
 RWKBK20ERyDPD+CYGkSIseaWnfAQy5qRQ7cehr+F+kijnpyiSSMAmTQ5s1lZLR1QPUDNGqf3
 sUxiZpU=
X-Archive: expiry=0
Archive: no
X-No-Archive: yes
Message-ID: <4149a40f-af4d-4f94-c7fe-16fc53588544@coppint.com>
Date: Fri, 8 Nov 2019 11:10:40 +0100
MIME-Version: 1.0
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

Hi list,

I would like to know what is necessary to get a Wireguard kernel module
for a new phone.

I'm rooted with Magisk, and the Wireguard app tells me there's no module
for my phone (OnePlus 7T HD1903).

How can I help to get this phone supported ?

And by the way, does the kernel module installation make SafetyNet to fail ?

Thank you.

Florent

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

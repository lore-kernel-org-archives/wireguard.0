Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFC9C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 10:53:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E4C2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 10:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=rumpelsepp.org header.i=@rumpelsepp.org header.b="BWgunqZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E4C2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rumpelsepp.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7432d3d;
	Fri, 24 Jul 2020 10:29:31 +0000 (UTC)
Received: from coruscant.sevenbyte.org (coruscant.sevenbyte.org
 [45.32.152.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ccbaabf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 10:29:28 +0000 (UTC)
Received: from kronos (p200300cd3734b00044dca0ec8b6ca88d.dip0.t-ipconnect.de
 [IPv6:2003:cd:3734:b000:44dc:a0ec:8b6c:a88d])
 (Authenticated sender: stefan@rumpelsepp.org)
 by coruscant.sevenbyte.org (Postfix) with ESMTPSA id 39EA859882;
 Fri, 24 Jul 2020 12:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rumpelsepp.org;
 s=dkim; t=1595587941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jT2RcsH95Zr+brD6tcwl5qT3bY0N98BTwP09K/lXIWI=;
 b=BWgunqZb09GnbiQk9G78TXSoPVuuv68ZXUfOG6EPSy/qZl5OWRd39z4LQXHA05k2HssT73
 56dwl+vrZJK91N9BB8qe2BBVAB6qx+BpykzJPoxETQlMQh4sUW2fnZuFZZ9/pVo8X26wYm
 83gA+k8YwRMADVC1iws+lELoMZBdoQoqB6T0MkDAQfDDBuytb56uDPxG6f9zFHNBjniyy3
 nC9kFMGhapDXqdLiekrUVUdPPfS0ivEzAqi2NbjYLzWPeYgE/b4L7o3Tub0s/wYlUoun5o
 QvwXscKvcmvQHTN1ljqIp0v4PA8xe3GyKgU0Sow0MsPevImS+epLVSJkYo0F5lQXVNCDKo
 kENksZsqFOWuX6EvCrH/IrE1ImHQiMWa7aZZpA/wsLlmHijzHYoebWCCKhh3Thsc74ilTt
 a08/ufeSrXbb0lgQ2y5j0HbOwdRHPoyTMgeqM9aRLVlh8NqLQgf7K8bPKjOu+jrIq67jPV
 LNfHAXWkQEAc0R+iTVVYJaZtOjavAwMYsfnxn4PrlkCeCp4yqVZiK+7bTsllgVY74TZpz8
 qTNM/nueULNOzqllLVE2mXVDtKQ3eaC3HMOzscQMTuXSdaHmKQu22VlXZPZcTA7O2XABCp
 nFlDV1aX53wPhQA/GNFe50NfgtnT5n5JQ0QdtSzE1Ddg+4VlgGbWM=
Message-ID: <efd09537e3b1d98c9fade15e8d0725af634191d1.camel@rumpelsepp.org>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
From: Stefan Tatschner <stefan@rumpelsepp.org>
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
Date: Fri, 24 Jul 2020 12:52:20 +0200
In-Reply-To: <b12a74ba-c652-6b2d-1597-67a81a47b358@urlichs.de>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
 <b12a74ba-c652-6b2d-1597-67a81a47b358@urlichs.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=rumpelsepp.org; 
 s=dkim; t=1595587941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jT2RcsH95Zr+brD6tcwl5qT3bY0N98BTwP09K/lXIWI=;
 b=H2flQY6ivb6Ok7SkEmugQyjcrvEwj3wuIHkQrJPHFeSE/1AgLD9juLBD4as1DBJhflUYXX
 uZ0XHI9avdWNSYkHWBdE14trIPWjHQACfD/YLXkScGeIzRn6GfnT8jdCPSMyhFj1W9MKW1
 9cUWRmkQNxldUGnRhCgtQ1tbi5fVM84vkRAxbOw02ZeiZgkn8zYx8M0i0V1i9aW6L+flRA
 U/dgPCLC+Cqy7fbtUlx+pFEEv9+SAHU7GoPWUayJJI8XrEu0BILcEyavs9pUPU2y7AKJOh
 4/gbVVzpqoizSFag+xZe5u4PMePCkvk2A63KGs+2dZDZpiE3ni6EVp1Z4MImggV7y7BlkC
 2MXFcr/oogawZWumqQOmuQY7ZD3h6NloAeHZ2wgW05iB3UWiLjSi3WgEm8fpbsmSM69oUI
 EC2ERzkyy/o7Lvm+t4JTUn/A7JYNGbNHsLekMycnHdBfnWkAMZdt/Duu/7v4x6HOwwSJLt
 6kUN6u4NlreBV5YUIlkk2ibATa+0V1BqXgDZ+986PUdLj8QWCnYw+bqWwfnOP0UVxh3Qnv
 lQGiQhybi3AITFydt+jS6HzVgiyNznHJVJ4ddWfOa7NTsLtJd4mdRQRKb57Wu+aoNkjnO1
 fuPuOwGoJX7hfgRmL3kHNhuWvsRidkiowSuBxUf6WqXC3HCztFRSQ=
ARC-Seal: i=1; s=dkim; d=rumpelsepp.org; t=1595587941; a=rsa-sha256; cv=none;
 b=OMDZPZcLU3P4aZFwvJ0azl0OMWWJOk+eBleA2oKtrmajyqq+gtamKPTuPhbLRp/aSjutzn
 ycc+hKl5Yg8ijRZ+g+I5C6A1IX/fWhm8wVSQl3s5IeR5RJ/cixHT9AzyrENDatVduXXyDd
 cljDteP/78MBGaZnvQigLBY7b0bH0DLvT2/EzM6pbwPHi23B8WaJMYJjDF6fQTG0inSf2X
 lpiYL6D5mAOqYGcxhdDdzT3AsO0YGhlSHGQUaBTFNhE2+vcmdBnMjGg0MKNUR1itGl5n/i
 gskYmjQCF7w5LOLqlMBZG7BHugznTS/gIfLsfcE1+NyNHi7a0/iRqQcWIORXznCMNMWPfF
 5dTmhrJf7/WNMviluWcVnCkX6epYTPYuFm/k8jv79pJGsjNqPJJ66uXd4iDaCFf86da53d
 IlRC9I6cw72V5aRaXKIEb9N7Ljb1v3Egvz4BdjOHCxhzPdRHXmlHkETTE4NFjxLv21EDK1
 Yvafo1vSBp7Urc67eL+Q9KTK6lxH2+Ki/kqUDpXu4R8auft91MrVXVE/HFD5TdhFMcfVU6
 N4HevlxoPWUnU9G9oLoEY1xndogujDgs/uIEHVYURatg5ihateJWr8XvkKfIsvGuyVkb8c
 olORENRTF5U6xKbHaqshz7LJiZXlSFraAEVsXwdE/HKsA8+QCY310=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=stefan@rumpelsepp.org smtp.mailfrom=stefan@rumpelsepp.org
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

On Fri, 2020-07-24 at 11:54 +0200, Matthias Urlichs wrote:
> I recommend using a small helper script for this – one that limits
> itself to POSIX shell features.

wg-quick itself is in bash:
https://git.zx2c4.com/wireguard-tools/tree/src/wg-quick/linux.bash

So depending on bash should be ok, I guess.

S


Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5102C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:58:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5289D218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEiGWfYu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5289D218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14f634cf;
	Wed, 2 Jan 2019 17:56:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e75bcdbe
 for <wireguard@lists.zx2c4.com>; Sat, 8 Dec 2018 16:05:27 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b48611e
 for <wireguard@lists.zx2c4.com>; Sat, 8 Dec 2018 16:05:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x10so6482491wrs.8
 for <wireguard@lists.zx2c4.com>; Sat, 08 Dec 2018 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eapxERT730mme64d3sLMhQjxlSrDdGKZjITiE1NMyr4=;
 b=WEiGWfYuRDbA5YBNLwf7pcKZexfvnrbiyVx7TFGgsT5OX2eYoEdnGSXZWZYqCaxTfu
 W7XquQFZq/Ada+3PrWoo95seL3ZTDR47yP+ycc+bnaoOW/Wb2WW9kzsbEKzMjXB+2XNV
 dxiUu6Ke71531z6eN7bwniIzHmKHxC+8Xe8uAkPOkuHd3iwv1zt7AwXR+1um/LuK5Tba
 mEADL1dBzKZ7LtpgA2oZZn3RIioNPxVkX2fUIrr6q11lDXGurocnbNjcHYnvgjmN1HYW
 7CqmCFnfpWc6ZHoGQn3qLn3340kb8Hpg0hytPkucTx56+KlMSrFAx6KeMs9rL/I5mrDp
 XV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eapxERT730mme64d3sLMhQjxlSrDdGKZjITiE1NMyr4=;
 b=lSvgiRAZp/yWs3y7lfe+2LtqBNrCKhUOUoFAIBebguCEp0kJUBZBKEuhW1jOyzhZRG
 O2aLNHKPnJp1L+2VFLehSkp2kV2Xxp4FjLKCCvtb4yU3bI4yDhWaVOz9gtXDFaU3gDab
 9j+wbALiQDbTxgwDJsFNcMgAMwT+q115naZj62FbsksWbMibgw9Qn2a7QcSTTioL39Z8
 x2qlVoydr7Kc/C4UBaJ0vNzhZPVNZVyJMWyfUiiiX06XhgUtLq40oWN+D5k9DL2mc0Nv
 nDV8+wsq/yhS8ufLKnHq8Sc0ksEu1j3ukAtFQB1JJBWoy7eJhENqRilIFjnmac3qIVQL
 yqvw==
X-Gm-Message-State: AA+aEWb1wjcv9NrLOT+lriVvs2fNbITkVE2yhxu1uOPAAOTZv7zjDXe7
 c0m+Del1alMuqmXxkiZx04gDxV6caUKnOfFA99Xahw==
X-Google-Smtp-Source: AFSGD/Wabf9Q65+YaAISaTCiJP5aRg+YLLTnQWdMqEVU6j9N2tMPvZI32/vj+vNozVLjT+QY/kjr59J8JuEE98cwQkw=
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr4752778wrw.211.1544285631821; 
 Sat, 08 Dec 2018 08:13:51 -0800 (PST)
MIME-Version: 1.0
From: dan <dandenson@gmail.com>
Date: Sat, 8 Dec 2018 09:13:37 -0700
Message-ID: <CAA_JP8V_KLNg68jObQx=Vxb+Sd12-x6swsqt9PzWuoRi6eGpEA@mail.gmail.com>
Subject: wireguard + udpspeeder or tinyfecvpn or similar fec
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 18:56:20 +0100
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

Is there any consideration being given to adding fec to wireguard?
udpspeeder and tinyfecvpn are good examples here but they lack
essentially everything that makes wireguard great.

It's not ideal to run udpspeeder first and then wireguard over the top
because you lose wireguards roaming capabilities and more.

It's not ideal to run udpspeeder over a wireguard tunnel because it's
basically just hard to utilize.

it's *wierd* to establish a wireguard tunnel, then a udpspeeder
tunnel, and then another wireguard tunnel on top of that.  too many
layers, chopping down MTU too much to make it happen.

it would be fantastic to have wireguard integrate some fec
capabilities natively.

I know that simplicity is a big part of this, but it's not a very
reasonable option to stack this stuff up in layers as that's
substantially higher complexity.

tinyfecvpn is a layer3 tunnel on top of udp speeder.  you can do
wireguard then tinyfecvpn on top which is somewhat simple *BUT*
tinyfecvpn is kind of a loose utility without a decent suite of tools
to maintain things.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

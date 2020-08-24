Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBF2C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:28:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19FBC22B49
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pregonetwork.net header.i=@pregonetwork.net header.b="fz+F+pFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19FBC22B49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pregonetwork.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33c810d6;
	Thu, 27 Aug 2020 08:00:23 +0000 (UTC)
Received: from jeremyp3.stolon.network (jeremyp3.stolon.network
 [2a00:5880:1401:77:f4d5::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0d4077e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 01:16:55 +0000 (UTC)
Received: from jeremyp3.stolon.network (localhost [127.0.0.1])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTP id f5e9615b
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 03:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pregonetwork.net; h=from
 :subject:to:message-id:date:mime-version:content-type
 :content-transfer-encoding; s=postfix; bh=TlXuClXInYt4GXrLwqJUOS
 5Fefw=; b=fz+F+pFjukYpAJ2HsQ5G7iAIdMdXMi2aD7JbfYzcGpmBOMZ5kbA5HI
 fdF7rfi9F/WiF1mXtCTXdGFmQeGMlfykVQIH4NA7vh3u3qRz1MPsGoG+Xm6YOdYT
 j2E5AMhof0Q7ykIrXTulJas38l7HUAfe6EZyhSxTHWM+6732C3yTT4j4/7F7wMmC
 JRjvBiOsD++vs3j4W+7oE4w4Qeeh8Lpyi+fffnN2rV0lGnNfDmD8HrsY1HhBeICU
 177qkBkdb4sx6gG+2zfDZuv2PoFSc4KzcfCxMb/GaCtkcEcojnowG/UgIfpQ4OSc
 viwbMY674y2j0Pl5jlspIDoKZG/7q8jA==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pregonetwork.net; h=from
 :subject:to:message-id:date:mime-version:content-type
 :content-transfer-encoding; q=dns; s=postfix; b=XIFm9pjPEo2USp6S
 C4WAJk4vc5ZXlOKPO/YPBY/VcPo/6BRCX1yJeI6YHuctaCOaOeuzv007VC8n3UAu
 /zwNzXhbQfE8K9B6Mc5V+Ver7MEhzVqRpy/Mt9ogHgQ5xdPTZ3l0ISlK0hdKsqX8
 DsETyyZRKZcXZB1G2vYdeJyElIj9FbHdP07KkVHyy15zzp7e3hGuDV5fz0g0O1+v
 gSP3z7r5AIP42sjo4KhqZTvlmvLQakMEIPwUE70jikYXdXZwg7LDPMiO809X7KX2
 9oKV/YhxzAWnyqFtjVcMQdHlqGWkNkh7b4X+7/LF6W8hGCDBi3BvUpDkzgFNCmGH
 MvNl4Q==
Received: from [192.168.80.10] (backupmail.domain.tld [10.4.4.2])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTPSA id d371d851
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 03:43:47 +0200 (CEST)
From: =?UTF-8?B?SsOpcsOpbXkgUHJlZ28=?= <jeremy@pregonetwork.net>
Subject: wireguard and iptables redirect not work
To: wireguard@lists.zx2c4.com
Message-ID: <e88701ec-4616-6294-6852-b9591e25f10c@pregonetwork.net>
Date: Mon, 24 Aug 2020 03:43:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: fr
X-Mailman-Approved-At: Thu, 27 Aug 2020 10:00:21 +0200
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

hello all,

I am experiencing behavior that I do not want when I use wireguard as a
vpn client with the output at 0.0.0.0


I can no longer use iptables rules like thi:
iptables -t nat -A OUTPUT -p tcp -d 1.2.3.4 -j REDIRECT --to-ports 10001


I have a daemon which listens in localhost on port 10001 and when I
activate wireguard, it receives nothing when I do a curl on ip 1.2.3.4


I specify that I use wg-quick with a relatively simple configuration
~# cat /etc/wireguard/vpn0.conf
[Interface]
Address = 192.168.80.7/24
DNS = 192.168.80.1
PrivateKey = XXXXXXXXXXX

[Peer]
PublicKey = XXXXXXX
AllowedIPs = 0.0.0.0/0
Endpoint = xxxxxxx:51820


if you have a solution so that I can do my iptables redirect with
wireguard enabled, I'm interested :)

thanks,

Jerem

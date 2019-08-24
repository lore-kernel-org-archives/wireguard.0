Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F74C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACE652080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="GQZU/Lil"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACE652080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73447325;
	Sun, 25 Aug 2019 15:40:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e0ef2c6
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 17:40:36 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60298a58
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1566668435;
 bh=fAC+6hRL2dyxjyT2Wg4VIBoLGj6yAIgU16tya3ppJuY=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=GQZU/Lil2NxfZwb+JFTR4hGHsCIs6InL4alHsLWC6VqzuvnlcmpYppKY2Z69mTAwT
 LF9924fejsVKjubH0Q3YOiA2ELh3gPy3Z6dJgPNDpbph8UcGKDI6dMP0UIZVcIE/Qv
 gIBwZ+iYBOTRdOFAD/J3mUmPnkBVUxLXh4J3d1mY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.8.164] ([213.162.73.22]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M8Nik-1iOB4z2ABG-00vxga for
 <wireguard@lists.zx2c4.com>; Sat, 24 Aug 2019 19:40:35 +0200
To: wireguard@lists.zx2c4.com
From: Karl Kashofer <karl.kashofer@gmx.at>
Subject: Route dlna (Gerbera) to peers
Openpgp: preference=signencrypt
Autocrypt: addr=karl.kashofer@gmx.at; prefer-encrypt=mutual; keydata=
 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
 92ycJ4BPuDcd
Message-ID: <c3ce7784-3f21-8f4e-866c-f531dcb8a1c4@gmx.at>
Date: Sat, 24 Aug 2019 19:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: de-AT
X-Provags-ID: V03:K1:SpO2YiiraZycgp18Zo0PKdwTR0EQ/RdDPWK09+qgCwXTeulM9EO
 L1FqC2Aw0JXG1vGss/dMKjnQ8SKVknzfT3srf3r0JO0nWAQCKmL9VINBTmofGyD8KtMxQTA
 2odQ6pW/620VLBPbgL9XUtYDuWQx8yNDA3RhYP63mJZ4Z4yhBAzkBYg1+IxqKJbfRmFplTx
 A6ZE3a/1+ajgHI9o8KPAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V3z+MQNSABk=:PgLCq8dH4rYKRkvNWhFSsp
 QNaGXWTUZZKTDNKh1JCiO0gqsICGSfAgcAslNK/3FV5ivyMlBgeM7fUYhPYcLy7o3wpw6KiEb
 jXTFLI/ne5khAJdKj7Pp21HfLzXNrtopdyF/8WcqwDvBKNFq7zjW/tvej73roySqxESLYHmtl
 JXlnlvjaA3h0q6w3bOaQWxZBNwyjjtFVpYpZk6UcQZvaUynCAhKNpdlwewgP+zgHB4FSy/qDb
 piT4oe0qUBWNtgATuPNG9m/E97dBTtishNdX1O+9WFXj9xRbGecsbVDhxUtYGFuc/StXjq1Oh
 MWwkTDiwPmvVqJ2pbrGizq9GeksjHIiqDWA9Ntq9gqcB/CC5OZj/gbq5DLXQDM3KJLM0j8qR6
 eJ0InGbf3dmylseTB8LUB4wPz8Eh5Ib0E97U/TPuVSQzgQVXJENdqafPCyaU3mPi0lmc3X+U/
 DwzKVbQp8eHwxMq0cUp6Kvck504oTV0mYoOGeIm6YEGjoFrH3kmwh2nr3LZTa8A68qWks0jDC
 T+cAR2eKzu9M8hce9NuSQl1IeHYNzKc2be4OkrUKO8FF2fTuS5m4TwfNsLg5z9t+5Sqdvm02j
 +j3kTkTtc4S2Lc2Hwuq84YZ/4qvdY/AAObhn1vJIy4xAgibLBO/X/z0L+BuR6Phy4khCo2s77
 nfpFVpm9Q5Q189FF3Qx/Nfdm2/lu6v1EwqrpJF3AKdjRtkDVZ02SW6COpAxwMvWgPnC5oV0q7
 9uCOAnfNqAC/Iclle7D77BKl/zwcsIaWtB8J2Yv4XFZTwkZWNdNzhhiZYh0ilZmlN8rYbvjoH
 LVro3SwMCNfmETbJwuabQBlGyXHrVqmGj0MthSBqRSFYgYGe50/2TzY0ULBWi6xerazyKsS3j
 txk4m1JuuCxiIeL7icFJFz53UUqP2GvyzHkBV/urnsuVr5MGd/1HUHpi5+Lln4zDGhLBjMeFJ
 hUpHJBwWZx9+S/BGnfE2tcx3PLmpM0SvXt67KKHY1OtfUaQBcut5+NnTUFblFkoKMb6Fh8nJa
 ffmxQoSKu95YctuAoATrz3CxMJi3k97y4pNDSzEy6y1O59trP1AWO3kzk6A4yL7lVBw26wDQv
 hTQx8kkFwR0+y25kpKK9Vhzh/dJ6nAo0Xlmp0nJMkz0zzRmCBn5TooeU6Vwm9PzBJKY7VIOgh
 jH+mg=
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:40:17 +0200
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

Hi !

I have a mediaserver which publishes music and videos via the dlna/upnp
protocol (Gerbera/Mediatomb https://gerbera.io/ ).

Is there currently any method to see these services on a wireguard peer ?

Thanks,
KK

************************************
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

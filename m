Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7CFC2D0EE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CA220733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CA220733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=johnnyutahh.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17042e60;
	Mon, 30 Mar 2020 02:10:48 +0000 (UTC)
Received: from smtp-out-4.mxes.net (smtp-out-4.mxes.net [198.205.123.69])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8e9ee99
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 19:40:51 +0000 (UTC)
Received: from [IPv6:2605:a601:aa2e:ec00:c528:8b53:871b:d03] (unknown
 [IPv6:2605:a601:aa2e:ec00:c528:8b53:871b:d03])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.mxes.net (Postfix) with ESMTPSA id D02D47598C;
 Sat, 21 Mar 2020 15:47:36 -0400 (EDT)
From: Johnny Utahh <mailman-wireguard.com@johnnyutahh.com>
Subject: macOS app: upgrading problems and version confusion
To: wireguard@lists.zx2c4.com
Message-ID: <98792ecd-6a85-69c2-cedb-691e7226fb5c@johnnyutahh.com>
Date: Sat, 21 Mar 2020 14:47:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Sent-To: <d2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbQ==>
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:43 +0200
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

Can anyone clear up this confusion?

https://www.reddit.com/r/WireGuard/comments/fm8xfp/how_to_upgrade_wireguard_macos_app/

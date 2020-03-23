Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDC9C2BA1E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D403220659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D403220659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=powercraft.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06e194de;
	Sun, 5 Apr 2020 21:38:17 +0000 (UTC)
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 701c79df
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 19:01:09 +0000 (UTC)
Received: from yessica.powercraft.nl ([80.127.158.83])
 by smtp-cloud8.xs4all.net with ESMTP
 id GSQijR3OFBr2bGSQjj9bGS; Mon, 23 Mar 2020 20:08:10 +0100
Received: from [192.168.24.203] (ebony.powercraft.nl [80.127.158.83])
 by yessica.powercraft.nl (Postfix) with ESMTPSA id C2D952032F
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2020 20:08:08 +0100 (CET)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Jelle de Jong <jelledejong@powercraft.nl>
Subject: possibility for dual endpoint ipaddr and different ports for server
 fail over
Message-ID: <fd8fb45b-eadf-d5a3-6a24-ac817db5dbbe@powercraft.nl>
Date: Mon, 23 Mar 2020 20:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMX3dnQ9Bi2w0hbsE3ELEbVFAX6fgPpTndgqn+oFxkkAJJAHgEBZt+8lq8VAaBi/8l/LWR9CTD08Mgwpaa67o3WNyuHiox/MHb6GH1Nh+xUwOW6BexOI
 1NujKICn2ADZvm4ruXL5WLyPbFpf69sDKDPZFAVLSMZLdcFsWGkmttf8bIkyTsz3iUY7C3v7yxanfikJUvX6OqtYt3JlxgT9V4o=
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:13 +0200
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

Hello everybody,

reference rfc: 
https://lists.zx2c4.com/pipermail/wireguard/2017-January/000917.html

I would like to be able to list multiple IP addresses and different 
ports for the wireguard server side. How can I do this at the moment?

Kind regards,

Jelle de Jong

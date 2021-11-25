Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3046DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Nov 2021 15:40:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8211aa37;
	Mon, 29 Nov 2021 15:40:09 +0000 (UTC)
Received: from mail.ceidem.com (mail.ceidem.com [45.63.42.188])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id f3d213da
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 18:41:31 +0000 (UTC)
Received: from [10.0.7.24] (72-50-204-108.fttp.usinternet.com [72.50.204.108])
 by mail.ceidem.com (OpenSMTPD) with ESMTPSA id 9886420f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 19:41:28 +0100 (CET)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Chris Eidem <ceidem@ceidem.com>
Subject: Ubuntu client OpenBSD server
Message-ID: <d83162a4-05bf-22f1-f8de-7ec183ed9173@ceidem.com>
Date: Thu, 25 Nov 2021 12:41:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 29 Nov 2021 15:40:07 +0000
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

I have a Wireguard server set up on an OpenBSD 6.9 server with OpenBSD,
Android, iOS and Ubuntu clients. All clients are connecting, although
the Ubuntu clients only work when the PSK is not enabled in the wg0.conf
file. Has anyone else seen this behavior? Is there any information I
could provide to help figure out why the PSK isn't working on my Linux
clients?

I don't know if wg uses the system's TLS libraries, but if so, I suspect
that the fact gnutls and libressl don't play well together may have
something to do with it. But, that is a guess pulled from my fundament...

   - chris


Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD3D49223
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:49:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e395a8f2;
	Mon, 18 Nov 2024 12:44:58 +0000 (UTC)
Received: from mail.sandstorm.de (mail.sandstorm.de [178.63.128.130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4c78a9e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2024 09:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B060480C59
 for <wireguard@lists.zx2c4.com>; Wed, 10 Jan 2024 10:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandstorm.de;
 s=dkim; t=1704877291;
 h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=+mFosxKcrUUUgiFPDbUy31qP2/s3ZQDOePj95PEw6/A=;
 b=fVvaaJdheUFeZcSPLzSyhR23Ayg/J8LKdMrTsy/jg80mt+ViXlu8h2RkNj+rPyggy6xxnX
 jWCQ9L7GF46sKOJQAVrr78R9ys9ywlK8G8oe+4Gccugm1o+6RJCy4lOx1weIkGU2nXeLnu
 5c9xF/5u+L6KFJdNnOZE6Q4bGlIQ3Xjjyarn5D81NkmOssxLv/MKw2+6gwBRbdJ3uJvTba
 x9Qw08j75s3sozO5GJ9ZnM8Ur8GGZqH8r0foV/5Vp0I1Phd/k3fomgJndefmvaXxtD5R6N
 Lj1aWv2K2HNLKQtP2S+lBiSrldHylYOuhcaU6WsUGKWhRN2lJUR9zC/r6Z3l6A==
Message-ID: <70581f4d-66ee-4164-830f-df751ed039f9@sandstorm.de>
Date: Wed, 10 Jan 2024 10:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Sebastian_Kurf=C3=BCrst?= <sebastian.kurfuerst@sandstorm.de>
Subject: Mac OS: Can WireGuardKit expose UAPI Control Socket? (with code)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Hey everybody,


first off, thanks for your awesome work with Wireguard. It's an 
invaluable tool and I am really glad to use it.


I've tried to control the Mac OS Wireguard Client via the `wg` CLI - and 
then quickly found 
https://github.com/WireGuard/wgctrl-go/issues/96#issuecomment-1712514157 
where somebody implemented exposing this control socket for Mac OS.


Now, my question is - what is the process of getting such a contribution 
reviewed / merged / upstream? Apologies if I am using the wrong channel 
here.


All the best,
Sebastian

PS: I am not the original creator of the code; I simply stumbled upon it 
and thought it would be a valuable addition to the ecosystem :)


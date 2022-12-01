Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D2CC43217
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 12:24:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69e56a5d;
	Thu, 1 Dec 2022 12:24:10 +0000 (UTC)
Received: from tootai.net (mail1.tootai.net [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 120d9ee5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Dec 2022 12:24:08 +0000 (UTC)
Received: from tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id ADA12608251A
 for <wireguard@lists.zx2c4.com>; Thu,  1 Dec 2022 13:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1669897447; bh=sP2GhzBVtlLlSxYlcP7lxi5vF3DH1bhN2RizJsKnAvY=;
 h=Date:To:From:Subject:From;
 b=VsR/ElhrXI49CieR56a0zxP1f8qlu9vp5JoR8QZlL3Iar220Da0E46U6dMqyhqcy3
 FqZPpj+aPp37yTO1CdZcImOR7qJcBlenfWZLmziZcXi0sS22yHBBjlXOyxL6qPwQas
 4sDDddLU9rYVJ74ozAA3PBFCiDPd7VbEfS+2VN6Y=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown
 [IPv6:fd99:1234:beef:cafe::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 7FE746000086
 for <wireguard@lists.zx2c4.com>; Thu,  1 Dec 2022 13:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1669897447; bh=sP2GhzBVtlLlSxYlcP7lxi5vF3DH1bhN2RizJsKnAvY=;
 h=Date:To:From:Subject:From;
 b=VsR/ElhrXI49CieR56a0zxP1f8qlu9vp5JoR8QZlL3Iar220Da0E46U6dMqyhqcy3
 FqZPpj+aPp37yTO1CdZcImOR7qJcBlenfWZLmziZcXi0sS22yHBBjlXOyxL6qPwQas
 4sDDddLU9rYVJ74ozAA3PBFCiDPd7VbEfS+2VN6Y=
Message-ID: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
Date: Thu, 1 Dec 2022 13:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: fr-FR
To: wireguard <wireguard@lists.zx2c4.com>
From: Daniel <tech@tootai.net>
Subject: Wireguard on Asahi Debian
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hi All,

I installed Asahi/Debian Bookworm from

https://git.zerfleddert.de/cgi-bin/gitweb.cgi/m1-debian/

and face a problem: installing wireguard shipped the Debian arm kernel 
and I can't get wg to work.

Is there a solution for this ?
-- 
Daniel

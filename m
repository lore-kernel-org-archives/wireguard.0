Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F60C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B7F206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=anatoli.ws header.i=@anatoli.ws header.b="dFhHVCz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4B7F206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b22368c4;
	Wed, 6 May 2020 10:37:36 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86895c4e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 07:39:56 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id 73C401E001A7
 for <wireguard@lists.zx2c4.com>; Tue,  5 May 2020 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=vnptcm0lqn; t=1588665144;
 bh=9bOorV1bLT4w9ffUyoPrnpDgd8uc0D+PY8O30zRwFdc=;
 h=To:From:Subject:Date;
 b=dFhHVCz6krXA5EgHJ7241q+tURT26KYJ9HANKQetznY7cmR7ThO6O9M+D471s6mYp
 8Y8gpTXnBPX5C9KH8yf6cVej316sFhtCy7PoruLrZuXSq+jzN71dMkFkPUs43jmo7b
 qe3oV4WEVIaBJQ1+DJ4wBvle/sGneWv5i7fqJuVAzBS7LzjjR1ZDGjc6u+1iRtMMQR
 0BveZvrM+VbNvcJEYMEmxCoNpohWSPFxBawsnkBctZ9O2RYt0h2dnR6/4Ag5BVKj6a
 CNU67s50H5DEuuCEymyPR9/CyvaMspZ4j4ZrgI/XanrU8zyylFx4XyNb5JJpQgRV1H
 4JGFgAJEMtkXg==
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Anatoli <me@anatoli.ws>
Subject: Regenerate keypair option for desktop clients
Message-ID: <92c23171-a2e0-ba3f-e66c-f5a0a0abad59@anatoli.ws>
Date: Tue, 5 May 2020 04:52:22 -0300
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 06 May 2020 12:37:33 +0200
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

Hi,

Is it possible to add an option to the desktop clients to regenerate the
keypair (on the screen with the statistics about the tunnel, where the
Edit button is located) as in the iOS app?

The rationale is that to configure a client machine an admin usually
sends a config to the user via email or similar, but for obvious
security reasons the keypair in the config should be changed. On iOS we
can ask the user to click on "Regenerate keypair" and send back the new
public key. Quite simple.

On the desktop clients today one should instruct the user to create an
empty config first, copy from there the private key, delete the config,
import the real config and replace there the private key with the
regenerated one. Then send back the public key. Quite cumbersome,
especially for non-advanced users.

Thanks,
Anatoli

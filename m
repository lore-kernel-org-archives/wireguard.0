Return-Path: <SRS0=i3vs=XD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BEFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Sep 2019 20:16:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02182067D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Sep 2019 20:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gElAf02N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02182067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6131b462;
	Sun, 8 Sep 2019 20:16:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 549d9e9c
 for <wireguard@lists.zx2c4.com>; Sun, 8 Sep 2019 20:16:31 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21bd0ab9
 for <wireguard@lists.zx2c4.com>; Sun, 8 Sep 2019 20:16:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o9so11182067edq.0
 for <wireguard@lists.zx2c4.com>; Sun, 08 Sep 2019 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hVqW2JMecC8O3UAgTLNFuu2fEv8SMclDW37oUfF9am8=;
 b=gElAf02N4yMP1KGHiKyaktSYkM1YejCBDWcKP/SlhGHV7cDQljjt0qAVMjxv9ScHDN
 JiNhFtIVyDJcOussAvZw0f/DsO7R9L7LjaClfWMoY+X+q9vYyhE0UgipKBgieko4Gjxq
 reOlKybVT5uBvKI0MHC186K+ugnowpyZjC0stzwk6YQ5lUt81vYhP6BFwMISp/aXn9Wq
 wRqe0ImsIEGcp0aJN05fKtYjIA7y5t4+KgvKnQ3kjkU/dmfbHBhjJt0lAMH4XYJGoFDI
 OWEO8PLZIKeBRfXTbXCY3p2zN6lN4w/aprxV3IG/UsXyVXqjpYOJ0U/ZOCldDSWgVEfm
 ydBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hVqW2JMecC8O3UAgTLNFuu2fEv8SMclDW37oUfF9am8=;
 b=VHet5u85RvnBPCCgYoK762UqZAFwlZoVlajUOA4LeO0tiCRkVjZcaVnri69CyeKo/j
 hOVEEoz9t4Y9lXco+BjvdDaWfHgi0uLOGph6efv1hftuP6wz96UTqK9Mjpq0hL0tT0yC
 lyIkEjC+Zo3/Jc5JQbuP9c1Vxat18V3woARixiq8NnMYBqx2i04L0qlwS5wBZ6AqDXhe
 VwU964ep0Rj326tF7LEnqvKh8ZfwapD/lpygTX512Z2xyJyLBvuLrLSkLFBGEh9fb4fl
 kyePJnZ2v3lQOb+bMaGUX7hEDFT1CkyiUS6O9N5be+AOn9mXbn+k2807eBGufyOLEk3+
 sxCg==
X-Gm-Message-State: APjAAAU6jRHX6dBB1f/SHnKyDqaURryqG5e/3ItGH7+65A3b1g5pa0Jd
 DV7KDPmOfj0D5eida/ZgB/KsYicn8bD2nrhagA/AuM392aI=
X-Google-Smtp-Source: APXvYqw1U1Kwed5TEKVHkQjujFUd1RNyEjLrCw6HVViyDZduMPNIqgYqjpD8pjSG/pHQt/v+fKSglctOYmsXbzwx74w=
X-Received: by 2002:aa7:d694:: with SMTP id d20mr13511342edr.226.1567973790636; 
 Sun, 08 Sep 2019 13:16:30 -0700 (PDT)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Sun, 8 Sep 2019 22:16:19 +0200
Message-ID: <CADdae-jaGWC=HxVpU7Gc6QD=mCgq6O2jTXdmzeKXyKvLq6QVmw@mail.gmail.com>
Subject: Using openssl to generate private Key
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hello,
I'm trying to use openssl to generate curve key ,
as : openssl genpkey -algorithm X25519
however, result seems to be not understand by wg pubkey
 openssl genpkey -algorithm X25519
 echo -n 'MC4CAQAwBQYDK2VuBCIEIFBA+aTU9C5BrNPaJe0IVBZfZF39+8WqiYET0XEEM7Ba'
| wg pubkey
wg: Trailing characters found after key

How Can I do ?
We  need to create private key with an internal tool based on openssl
library , sorry.

Regards,
Nicolas
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

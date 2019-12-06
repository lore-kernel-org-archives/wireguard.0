Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE1DC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:35:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1600A2054F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 17:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OOPelGmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1600A2054F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56f7f8e2;
	Fri, 6 Dec 2019 17:35:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c574f521
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:35:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94d5a453
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 17:35:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a557eb2
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=QARJnAUf+Zo9Fvv0W+bqqQ/+HVc=; b=OOPelG
 mXewb6m8Devmn7fW0EtdFvJECPdz1fLeu2beOa74AcGfT76bd5P54ZAKvo9sLPfe
 uBDdbeUvWGq4WZsS2cjeZPH0nFWiK/55drPPKof2V/vycpbSIzFwuZ2bF8yUlbXt
 TiDCVDrSeEVJYpNNsz5z/Ka+0PhHr5/T7FTFd2O8IXHKaIiQg75lXXOU0t9ciFwU
 SclRVcz+xLZiuakKfTHWUQIVPf9vPrA2WevUSyCNggmVvScxtLbBU9mYgenTRGmT
 iaYu/kJIG4aZf+cpnH/GiZ1OIeVrHOGM7Hb0Ghxf7BspxfDUqVoTdeYkqJF01jIe
 N3TeNoxuQw8GVvDw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b847af9b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:40:25 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id o9so6493145ote.2
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 09:35:28 -0800 (PST)
X-Gm-Message-State: APjAAAXA4P/JVEBuXZ43JYM5plgGFbwfGBTu8sCzKFsr1FtND1yOHhOR
 N796B2SFqYNWcAJUeRArw5SErtQG1Zqj4WAR+F4=
X-Google-Smtp-Source: APXvYqzdSaQF5cpJWhEvYlfl0R0PDXSugn9AtbLdz7jrlIs5y9TlDH01NHcjoRbyHsD6qC2E8Z4NYL7PJOiopEpZSf0=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr12249108ote.52.1575653727518; 
 Fri, 06 Dec 2019 09:35:27 -0800 (PST)
MIME-Version: 1.0
References: <fa4b08be3b6fee08@frisell.zx2c4.com>
 <NHVyo9ngt5xOvRvbPjQgDNH8pGe-_qN2sVDvP7jv2a6ZZRWd_0Ia9q6w2ZUTEdIQ_n-U-TRDxz-92_hnUpJTx_e-XlC180z5q1wWwF9q5rs=@protonmail.ch>
 <CAHmME9qFER60XD1aVqP3cgpEHOnikMWfhC-mrxYXojWEjWcu8w@mail.gmail.com>
 <qgogeFsyHmrD5A5oDJC_2s3UznPWIP0ncQl5Co1jS5Khgl_48mDer0UJFV3r6DUKs9bJyCS2j7f8dYz9WT_3WLQEYx8v8iP9cVFXXqvojwY=@protonmail.ch>
 <CAHmME9pmhntbNxw9ABjA-krzFARDaV+ZWZhgmWuL9hwfMJUCEA@mail.gmail.com>
 <sUhAy9FQoNuL5pe4TIlO25pMeAUxCEvrvj9LPjQ9WauOtxLWfE3Ug9juP6RORXxjLpl6AfV7x5k9i-mkfs-OK1IYx2FcusfU7Ko3uLlcfHM=@protonmail.ch>
In-Reply-To: <sUhAy9FQoNuL5pe4TIlO25pMeAUxCEvrvj9LPjQ9WauOtxLWfE3Ug9juP6RORXxjLpl6AfV7x5k9i-mkfs-OK1IYx2FcusfU7Ko3uLlcfHM=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Dec 2019 18:35:16 +0100
X-Gmail-Original-Message-ID: <CAHmME9pUfWvtnOwaFtD-+ZZjG0maS+pBUOqp_fmMD2OkyWNRXQ@mail.gmail.com>
Message-ID: <CAHmME9pUfWvtnOwaFtD-+ZZjG0maS+pBUOqp_fmMD2OkyWNRXQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Looks like an arch problem or a libnftnl problem. I've made a minimal
reproducer:

printf '*filter\nCOMMIT\n*raw\nCOMMIT\n*mangle\nCOMMIT\n' | sudo
iptables-nft-restore -n

I filed a bug report on Arch: https://bugs.archlinux.org/task/64755
You can follow up with them.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

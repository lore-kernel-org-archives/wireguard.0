Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBBBC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 04:52:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E173864EC8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 04:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E173864EC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 042956c8;
	Thu, 25 Feb 2021 04:52:18 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dbe2230f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 04:52:15 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id r5so2778893pfh.13
 for <wireguard@lists.zx2c4.com>; Wed, 24 Feb 2021 20:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eTa/4/xahzmM65RDSIYWXwFGdLJuXkBIwwhPzQ8dTvQ=;
 b=S5QIu8eo+jquRtMY64wAuEV0gFKOLSns4z5UQDi32BqlVygWdkRIvLkpDS3za6uGtO
 HbRuKVwaMGtQPp9nI+a803Ddws/ycW8LBDO+FJpAeZUW4VU6muZY9T1cgdGt53sZmzaL
 d5tGm53jSpia7/drBcUhEVPz6YDOLP4ZgMUASp+UQBM8Vq8FRn9q5CLRUTMou/ip2MYg
 y5ThQiWBiotcatFts2cBqtjOf4mWERbc0BzATDId3J/4CBst6ClIA7q+9ZqxalCPguxT
 I9sX487tX4Zp0EeM+CkeGEb6EYa7c6JpfLoK7Fx/9zQsuQimjt8ZvlY/M12eN7REErHC
 VV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eTa/4/xahzmM65RDSIYWXwFGdLJuXkBIwwhPzQ8dTvQ=;
 b=LD8IhZc5yFz5xhtqpPfsaiIVP2SbVJUPBIVbRf9OAfWDbD+hxj8MPvVW5qXaaWWv0n
 wy31rWidKxqQWaNNPTsQu09m2hrGlO6fIxb9pDM818gp/ogEeg0c+YS5KenBD5pSXIxv
 YZRr+XSTdPBsyLA5JxM2iMHFQ9ES/BLVdPMJUhoVkfQTeRf6VEXaaantFjbNAhwoDjnU
 HS5+brKrlse2RJsC9XAhFpaV/sHaMnQQelbOthL12r0PwQnWdYfZ3IdTq1VphkYMgH1k
 MyrusuYVASaDpc8jHDXC+sSZRAc/Gst3C111uBU7jvCnHrtWYJoXIBQahLYmMyNPUTMA
 5/QQ==
X-Gm-Message-State: AOAM5322kCcKIHEz8LablObL1KHhnDL5O0NWiiawZgq8JynHmHbcaefb
 UiO1UD7wS5PUjoOuXIPJp23H+6nNMa1geRhvT3PGiMlyGbBPzw==
X-Google-Smtp-Source: ABdhPJzt29GsnzVCiAOP1tRq9MNyb4yor/9H0UMJrwm73ME6SGMmnqy7CQYjqdw8oU3lPP6J/9HV94gtYfS4TXRYEDs=
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr1333585pgm.89.1614228733735; 
 Wed, 24 Feb 2021 20:52:13 -0800 (PST)
MIME-Version: 1.0
From: Feng Li <lifeng1519@gmail.com>
Date: Thu, 25 Feb 2021 12:51:48 +0800
Message-ID: <CAEK8JBCS9gUXFRFpBS5pns_BZ_fKWHPV3+VrxtqEpt4kA0m1Vw@mail.gmail.com>
Subject: Windows 10 has poor bandwidth when using wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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
The wireguard version 0.3.5.
In the LAN environment, the download speed is 40MB/s through WIFI to
access the peer.
When the wireguard starts, the speed is down to 8MB/s.

Two machines are in the same LAN.
Any suggestions?
Thanks.

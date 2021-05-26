Return-Path: <SRS0=w0hv=KV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8425CC47089
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 14:33:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4D461360
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 14:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4D461360
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d4bcb81;
	Wed, 26 May 2021 14:33:32 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 08955542
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622039607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NqExjLs4G1Rc8Om15sd59eOTOFwtGSCOV+/OB4iX0Zo=;
 b=VgULM7aVDj9GvNfZZQF804e3/WPwHsbaOCbdEXr0a0qJSzRUKTtHqHNoASD3KJbBGOgOAI
 qVuElgA1sHidMMsZVX/CvAzdW2IAi1aR6uMfXA9WX6Bm/6w4p1vc0TE0XXZOvEm79v7Snl
 FqFdPQDWHfrxfoD+ieA1VsgCpCrNbUM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ccc48b9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 14:33:27 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id y2so2295032ybq.13
 for <wireguard@lists.zx2c4.com>; Wed, 26 May 2021 07:33:26 -0700 (PDT)
X-Gm-Message-State: AOAM531jOjtpOWueRh5Z7N84QEdmGKkQJytHEC2zE5o59mQ3HEkQUP0D
 ijlUphP9nO3G1ho5GvYoGnTyiL497bpsmT22qx4=
X-Google-Smtp-Source: ABdhPJykJLRm/0Sf7Md2DknF9yxATwHegVmuw4wWHrgob5sSPrtFBVujsT/CTUb975NwfGjMNgJCuCJvmzYCS+2KE2g=
X-Received: by 2002:a25:c592:: with SMTP id v140mr3466646ybe.306.1622039606368; 
 Wed, 26 May 2021 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <Vi69GDdtlT6JOff7GBHQU7rUExHN6badu-eM7C611Xa91MM_S8tGkmt4OVpjDSLSH2Kag1jS8VUlCIXdXjiMI6uKHot-v2KGXTBi8oK-CC8=@postermail.com>
In-Reply-To: <Vi69GDdtlT6JOff7GBHQU7rUExHN6badu-eM7C611Xa91MM_S8tGkmt4OVpjDSLSH2Kag1jS8VUlCIXdXjiMI6uKHot-v2KGXTBi8oK-CC8=@postermail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 May 2021 16:33:15 +0200
X-Gmail-Original-Message-ID: <CAHmME9rT5HgrC5wP-V5sLkz_qwkRFPdEJKhPTEaXr-L6Qq697w@mail.gmail.com>
Message-ID: <CAHmME9rT5HgrC5wP-V5sLkz_qwkRFPdEJKhPTEaXr-L6Qq697w@mail.gmail.com>
Subject: Re: wireguard-android: tunnel not working after reboot
To: lists.zx2c4.com.486782@postermail.com
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Does your endpoint contain a DNS hostname rather than an IP, perchance?

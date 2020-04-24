Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDE5C54FCB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 21:01:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE5C214AF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 21:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YM8SoETg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE5C214AF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24448750;
	Fri, 24 Apr 2020 20:50:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48c74f1d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:50:20 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bf64785
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NEom1LxnTm61t6X3UCXWvM3M7SQ=; b=YM8SoE
 TgQCY6EfVcJQY+jZo54Sf8xxL/08RZpjjGGY8ephvsnWWz3MktrDjvuP9WeiZSCQ
 q1jhH2C4e3V1biOUUY2COkzidxp4f2/UPjRAFR9I8Hmc9eQN7NxC0W7qMGGqTUhQ
 8c0e026vVDKp9puhEIQdvQ95nfzjquaxddPzFYA2TjvCaYdS3JQB4UMuLrCLhT9M
 /PX7e9l1BLz58WClYQzbgYH0StrdAB3JCTWaawXsEEp4X4gLZB2eBxn2PdO4wiwW
 KrQmhdBk3XdO9I8JHvbnlNhSgzaVHRouuepP/Tn/U3jGf/39syj0GkQ/856y6XSN
 eWNkUdXb+8KIg04Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abd0da1a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:50:20 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id f19so11888442iog.5
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 14:01:29 -0700 (PDT)
X-Gm-Message-State: AGi0Pubzlm2hbiB5mbGspMibKQRRY+E0zEviGpUcVS/vfPg4L8JGp+6/
 HMNVa+PV7evQ4fP7s5Pl+6mTF9AcEwa9aOFVuCI=
X-Google-Smtp-Source: APiQypKFaELyUYE8zieHxyyl92oieeleDDyXqPJ4xtVoc7gfcfhU7CPScDHrR5rNMKYQYD9Es4pQT/cRVPKUlcydOEw=
X-Received: by 2002:a5e:9401:: with SMTP id q1mr10121355ioj.80.1587762089469; 
 Fri, 24 Apr 2020 14:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <M5WzVK5--3-2@tuta.io>
 <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
In-Reply-To: <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Apr 2020 15:01:18 -0600
X-Gmail-Original-Message-ID: <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
Message-ID: <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
Subject: Re: Attaching XDP program into wireguard interface
To: Adhipati Blambangan <adhipati@tuta.io>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Oh. Set XDP_FLAGS_SKB_MODE.

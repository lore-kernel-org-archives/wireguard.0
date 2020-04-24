Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFE5C55197
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4847D21556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="frGfi7WC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4847D21556
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c02546f;
	Fri, 24 Apr 2020 20:44:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fd131c2c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:44:19 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f497c6cd
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=UggGxqOxAgiuX0HKuhKHrb83Ago=; b=frGfi7
 WCRmnawyIGEtVS7UIyOnoDzv0kW+7e0ddaDz4Nsv9v8NNj0NvdHNgoTv9OyqljUV
 0AfwVgzt29H0x/wzZtqjwSRP6pwcs0NlPq4QBv9rFsnWV2YrqP7TIhtZbKialmMp
 G34MbUkuGnbLji/DCkli58CdWOiPto+1Rpt7JUz23sh6KVs794pBMwHaBzNI34Ww
 CV6KpHMSPjU/4MYCFjsT+Gr5gZO3DUA3Z4n8uSgfKc3gehUVEJfveGeTbP2hz7n5
 imJ46T1jHfpyMmg/XWTOt6a/lT8XIjpOEOdLAZ5F1OPrKjDFeBlhfeKRYcqw8voH
 6xGDG2SxFxQdYZmw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 07705476
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:44:18 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id m5so2362711ilj.10
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 13:55:28 -0700 (PDT)
X-Gm-Message-State: AGi0PuYgS2FxeKSSD7OypVPE0sJ1vHknQ3JWB2djZy0cGSt2wJFhFi7A
 VCn46aTHnaLd5skkJIKCGkWbhuCNn9Vd4vbk8to=
X-Google-Smtp-Source: APiQypLvbvpq4qQ9Xkx3D+spjfK7jaB22LBp7md+hitY+oSr7ENwJXcu09yy+ctUxXfter/+JExoZ8DsW3MP6PRATJA=
X-Received: by 2002:a92:d4c4:: with SMTP id o4mr10877477ilm.38.1587761728071; 
 Fri, 24 Apr 2020 13:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <M5WzVK5--3-2@tuta.io>
In-Reply-To: <M5WzVK5--3-2@tuta.io>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Apr 2020 14:55:17 -0600
X-Gmail-Original-Message-ID: <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
Message-ID: <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
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

Could you send some sample code for us to debug this with?

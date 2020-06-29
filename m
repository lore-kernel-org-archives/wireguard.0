Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287E7C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 23:05:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870B120776
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 23:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T1eNN/8j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870B120776
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de120d06;
	Mon, 29 Jun 2020 22:45:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6efe87c5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 22:45:02 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4c2678f
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 22:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=TgbMX8ujBvycrnGYldcOnrYLV3Q=; b=T1eNN/
 8j0JuxOSj4AxEkj4bJAcAiU9rR3I4HXlge78Nlpzu2ivXrwgyU3vXcXbV2mNs/j9
 ADKC6VvstC8TOU86i8eIaGkB1NbwkZjQ0RAGWBe39ZLVXMLkV+vV/AQNADW9z4lP
 ZDto1zPfIbytzUkFrNHUh5Dshjew5UPF9cXicDxpP+Lw+JuAysVn6dnfq1hKpof7
 4j7oR/Kjp3x6Usz1BDy5l/BGBI29cgdN0tkQHgP1fWCuCIyI0qksyluynOkpMWHy
 jJmYlQvAdTkgS9s2VOQguXvercLXrnVEt5I5qK6l+OQqpaFo77PE474qtH9568av
 oxjfXRn6M70nGkUA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b7e64c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 22:45:01 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id i25so19084711iog.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 16:04:44 -0700 (PDT)
X-Gm-Message-State: AOAM531HLAjhUTtIDE1xTr4SXKWFWBegfST3lHRIX91WYWqCkD2i2UQD
 WFM70wDrm8VRpqJ9A5GKsbC96ZSriCwKLhWPdho=
X-Google-Smtp-Source: ABdhPJzYLvQRTWTU+N/hDN0zIsZfVRurkrFeMmrV1mL0/taAHAkiAicIjHnD8uKQ4H4+P6tWsocGnvUo9cpZ8mBNEKg=
X-Received: by 2002:a6b:c80a:: with SMTP id y10mr19044459iof.67.1593471883961; 
 Mon, 29 Jun 2020 16:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALJizUM+ORyc5V-J5eqNqYbPEPDcruZOkvv3iv1KPJOi60YYyQ@mail.gmail.com>
In-Reply-To: <CALJizUM+ORyc5V-J5eqNqYbPEPDcruZOkvv3iv1KPJOi60YYyQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Jun 2020 17:04:32 -0600
X-Gmail-Original-Message-ID: <CAHmME9qV9iacebrz6MNjbYBmPGhLs7hs0MFaTKJs0C1sPZxe1g@mail.gmail.com>
Message-ID: <CAHmME9qV9iacebrz6MNjbYBmPGhLs7hs0MFaTKJs0C1sPZxe1g@mail.gmail.com>
Subject: Re: DKMS build failure 1.0.20200623 on Ubuntu 16.04 kernel
 4.4.0-159-generic x86_64
To: Felix Tang <felix.gofaster@gmail.com>
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

Works fine for me with 4.4.0-184. Try updating?

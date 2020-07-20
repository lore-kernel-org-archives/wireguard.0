Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70ADC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 14:49:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD9F22482
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 14:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="0rSVsxgs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD9F22482
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 115de89c;
	Mon, 20 Jul 2020 14:26:19 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 814f3692
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:26:17 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7eaa6180
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=1FciE3ypxfZ2Nvt73P5SAI0px68=; b=0rSVsx
 gs/ypxQuwIcEXLt4I/CpR2vzR9UQlMbA+Cc+LRXf0VIBQfANs+A2W+8svJE6ZPjx
 Q8tF8gRVpUR1dk9gZT/efDGeBk1YeIrp/P8tleIlp/g8oxMTqQX0doMm0sK+vCTT
 Enesxkk8X5Gxneyf7Qa11kHA9T+ythS81fPp6n/QqTbAX+vhqctVzH5zA2t28jlH
 1VsQ/aXNdTkVEuY81yfTEjFZYrKkfLC9ZvJlRcscXxPMZEa88XxQW8mr9FShauxa
 NnZrJUNqMx+buYb3pf4egVngHPzPcgvJuTMakO6awxKM3QzQKcndejAPRYvJkHli
 ayUl+7wXdbWkbydw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 904141a4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:26:17 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id h16so13493789ilj.11
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jul 2020 07:48:42 -0700 (PDT)
X-Gm-Message-State: AOAM5329EdRFKWOg75OWlaM4nFomLLE/i4m+ACwFUuvibKIo73yh7+W/
 BHpxfeX3lQpehDRTTZ+EFMs8txlS4ODQmxC5fXM=
X-Google-Smtp-Source: ABdhPJx5D41BB4Kq9FKsb0cMx2WRQN0MR26rmM6293ZjVpwAA5xWviszEYQcHVY0x/uwrO+OuamrTq8CKLTjuujbwqg=
X-Received: by 2002:a92:d24a:: with SMTP id v10mr24346096ilg.224.1595256521622; 
 Mon, 20 Jul 2020 07:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
In-Reply-To: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Jul 2020 16:48:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
Message-ID: <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
To: Joachim Lindenberg <wireguard@lindenberg.one>
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

Is your system fully up to date? `apt update && apt upgrade`?

Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A3BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:20:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2064F20739
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W+VTYhqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2064F20739
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f87c0be;
	Wed, 17 Jun 2020 08:01:52 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 21074b1e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:01:50 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 995b14f7
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BIYFuOkoAs5tne8Rfol5B9bn4fw=; b=W+VTYh
 qwzfVGbja9N1srveYIvn8Q1kpfNYZrKN3y8UZiNhlCcgInd9UM2SrFDy0xCq0wxR
 WsyX3crYTw4oWjhduGsT5SM7BFQfHsR2WwvhboKTBkgo6hutZ7gRA/ZnzpSlwxxa
 xRVH7PwsH/p0JBV2fZZiRIzmCn1FQFLnufroO+y9s7DQPLyiEDXHaAO6lPMv7nhv
 ChxA1C0gzzHbvKta3INS6Qd3jCPh263jTiSPwCZFTONold8DgbNukrosWplcQQLb
 37h6ArrySvfpLdCyeeB6J0UJFhAdtKuqnoPnS8gvDT+UZPrLwczydjGAfNfG/gxO
 TXWWFfU14Qv1yJsw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 563fc40d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:01:50 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id i1so1271056ils.11
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 01:19:54 -0700 (PDT)
X-Gm-Message-State: AOAM530hk8LgRWnMXFf7xeBtwczUc2ObwVdB3TYp09FsnYVikXBe82qz
 ypr7/u+CSsIM53APAGdqZ9Xq75xjTrXEjdz6psk=
X-Google-Smtp-Source: ABdhPJz5M6EF6AQh84O57UxqAQRwzpIO6p18ewD46SVYWPGH26LYH2k3aa7f5wwsiXU1NbaF7ievggTi/zShTT1APY4=
X-Received: by 2002:a92:cf4d:: with SMTP id c13mr7116802ilr.207.1592381993651; 
 Wed, 17 Jun 2020 01:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
 <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
In-Reply-To: <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 02:19:42 -0600
X-Gmail-Original-Message-ID: <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
Message-ID: <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: add restart command
To: Eric Light <eric@ericlight.com>
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

On Wed, Jun 17, 2020 at 2:17 AM Eric Light <eric@ericlight.com> wrote:
>
> As a purely Debian user, the 'service x restart' pattern is far more memorable than the syncconf method.  I know personal preference isn't a great reason to add a knob, but Garrit's method is probably going to be much more familiar to many users.

For users who want service management patterns like that, it'd
certainly be possible to map the wg-quick strip stuff to `systemctl
reload wg-quick@wg0.service`, for that purpose. Maybe that's something
we should consider?

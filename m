Return-Path: <SRS0=bSPH=AF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6401C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 17:08:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B6F20823
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 17:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ntrv.dk header.i=@ntrv.dk header.b="GcZBwnGs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B6F20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ntrv.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddae6ea1;
	Wed, 24 Jun 2020 16:49:46 +0000 (UTC)
Received: from DirectAdminCP.boxne.com (ns3.boxne.com [216.244.91.100])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ca4cfa7d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ntrv.dk;
 s=x; h=Content-Type:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:
 References:MIME-Version:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g81DmDcQvJG0BXxpmKvndOR7tZiZfAlwmVpKxo5tqz0=; b=GcZBwnGsbBrswMQtF5leCKdSZq
 8gppRPaH22loUdsYyo9XYNosLCy7ao0U/cRUK9h6pejnwgxfEohiCBnDycvRDrCE0kpR16+mdvS+w
 3Rch+zVGhDZIW0Cke0AMs+L6L+JReupL8rsjmpZuAFGYwyG3FO6kkPoTc3YV4dE+H4hdc/7jfJ5eP
 w9VfAPq212pvDOI2PpikU9TksXqEKN0INV9kCdknodYi6kNiuYamj/Z2RqYbDQ5UZAmZ0Pl+z9a/x
 tM93r8xU8iOOJWuTbjPWlv9QwmXR804O9AYkpRrF6wPAunXO50YmUBaHyyBcD0LVI8zXFrSaWEbTw
 uGWv0eUg==;
Received: from mail-vs1-f53.google.com ([209.85.217.53])
 by DirectAdminCP.boxne.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93.0.4)
 (envelope-from <ch@ntrv.dk>) id 1jo8t9-00D4N8-SF
 for wireguard@lists.zx2c4.com; Wed, 24 Jun 2020 13:08:44 -0400
Received: by mail-vs1-f53.google.com with SMTP id m25so1813248vsp.8
 for <wireguard@lists.zx2c4.com>; Wed, 24 Jun 2020 10:08:43 -0700 (PDT)
X-Gm-Message-State: AOAM531CD6WiQ+yCYVYqi3/TsmCiE26KXk3DKCNAXbr2AA47ESEh0Qra
 mnrrk7u42Wb68vG7ptEDDpLyTASPp8cgrvjsNH8=
X-Google-Smtp-Source: ABdhPJzA1y/vXdxX+bSQPCH8PFqb38ncxC2Nhs0Ek3TY0yaPUt7jiG4jYiP4xaG11eZOo/n611zpmBHVXOpA5kLEb+E=
X-Received: by 2002:a67:ee0d:: with SMTP id f13mr25271218vsp.147.1593018522932; 
 Wed, 24 Jun 2020 10:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
In-Reply-To: <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Wed, 24 Jun 2020 19:08:31 +0200
X-Gmail-Original-Message-ID: <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
Message-ID: <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Authenticated-Id: ch@ntrv.dk
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
Reply-To: ch@ntrv.dk
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, 24 Jun 2020 at 17:37, Florian Klink <flokli@flokli.de> wrote:
> Deriving an IPv6 link-local address from the pubkey and adding it to the
> interface should be a no-brainer and sane default, and already fix Babel
> Routing (and most other issues) for "point-to-point tunnels"
> (only one peer, both sides set AllowedIPs=::/0).

An idea to implement as an option for e.g. wg-quick, rather than the
base code-base itself?

-- 

Chriztoffer

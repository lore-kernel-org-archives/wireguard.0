Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0D4C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 18:07:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8dcf90fb;
	Sun, 19 Feb 2023 18:05:05 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2eb388fe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 18:05:03 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id j5so769990pgt.3
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 10:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZXvaLzFoh7l6/fk/sjoPtm0hW+BF0mt3qb9iUyVK0s=;
 b=MPa8qSITK1+SXW7ZkwS/KuSQew/8n2jaeuKH848j9649stOicptdes65BsFze9tpNo
 c0mBreOoExtb1p/xnHrL7jN3TWcIIVD/VLZUYJ8sVezohVM8EqBRAzjgWqYeXonda3C4
 45Vpn1IyAq4GFuDy+FY5DYK1eyeOAjxdtViEOQxtuLg+h6fZ1zNLB+l6XBotPL9Ch/DJ
 UFEFcDzTwcidfCVOxOzSmd1dbh/8bgI6IG3nmbgXaXlNFgJ9hDsX6BrfYeXF7Butc7VI
 YnYOMhTdrc3bvgcXU0WY9g4uGfco+n/VBksDYL8bZ3EwDR/exdauytvZgr3ncW5n6byC
 grPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZXvaLzFoh7l6/fk/sjoPtm0hW+BF0mt3qb9iUyVK0s=;
 b=VWLCldWeVOXlYsKQ9iEaGeRSQHQXdW3ikpmnCPBKCXNz45b1V+80mwp/srHZWZkjDC
 XrlheVCV5PNkgUBNAnlX68tjv6ZBunSZHZPF6bLjie8H+wC9z4I9JKlcR5HU04UBl0ZR
 LVxfMryjXr4VfgsZRgs9/rcnBx6qnm7WWmcyEgR8uPEVK0DbbxSxe2MxsiMokhKDgWCz
 nMl8tWniKzb3k9EsWZC9rvA3A2Oen2W+hRZ0b+XLUlbrVZTd3z4wnUPOD/JclCdexRUe
 1KbAZyD9tyCAKhO1fuuKBHiiCsWr3vbIWB/tKZEHiGlvTo3wCftNXmlV4k8OSjnej9os
 zNKg==
X-Gm-Message-State: AO0yUKXXOm6ABqwJQJqjuAQOV3fjjZyFnBuCFiIc2IgGbYvWZF20901l
 7k2pe2C8UZROok87ffCpCg6dUPEKmbao1P1HpN5EO49vQj8=
X-Google-Smtp-Source: AK7set+7y3vuVJQhIbe2AqdUaTZOtF/FQe6o6hzQtj0tIlqK0hM1XzGMywYOnE0hSBat18Y8v8PbJB6OXssOR2QvgrQ=
X-Received: by 2002:a05:6a02:20a:b0:4fb:323f:d661 with SMTP id
 bh10-20020a056a02020a00b004fb323fd661mr55993pgb.6.1676829900975; Sun, 19 Feb
 2023 10:05:00 -0800 (PST)
MIME-Version: 1.0
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <00b94fdf-22d5-00ad-e068-30ad4a453236@keff.org>
In-Reply-To: <00b94fdf-22d5-00ad-e068-30ad4a453236@keff.org>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Sun, 19 Feb 2023 19:04:49 +0100
Message-ID: <CAA6-MF9q68pdBZDojmA+DOsH-WOckyv+J4jD+T6zBZot2Grz6g@mail.gmail.com>
Subject: Re: Source IP incorrect on multi homed systems
To: Sebastian Hyrvall <sh@keff.org>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Den s=C3=B6n 19 feb. 2023 kl 18:06 skrev Sebastian Hyrvall <sh@keff.org>:
>
> You should get into that debate. Proposing firewall workarounds is not a
> correct solution so please don't do it. It needs to be fixed. It's an
> immature VPN solution that always just proposed a workaround instead of
> fixing the problem.

I would make sure that you are not mis-ascribing the problem* to "an
immature VPN" and not what the default UDP behaviour of the kernel is,
to pick a working interface to send packets from based on the routing
table, in which any/all udp based tunnel would suffer the same
problem. If you google it, you may find that other udp transports face
the same "problem".

*) https://en.wiktionary.org/wiki/Chesterton%27s_fence

--=20
May the most significant bit of your life be positive.

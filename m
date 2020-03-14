Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32A8C5ACC0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E17F205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCK9LVbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E17F205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31cca453;
	Mon, 16 Mar 2020 00:14:27 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ed780e43
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 14:47:45 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f13so13798082ljp.0
 for <wireguard@lists.zx2c4.com>; Sat, 14 Mar 2020 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to; bh=4zpafGrQCaBim2zfMfcjVlTfNffsiw104/ikdBLzGJY=;
 b=sCK9LVbDLB52kQ2f/hknZzIhd7CBya+MBPZBCMV953tzs+y1nmtrFKkvBPB74WHvlP
 w84HVrAiDcaqOvrlnqNU4yjNpFjSbry/0x0VY1tQojob42iZlaELm2ja4yyEPFGzyztv
 PfGbIMAd9iSc5i+7vN+AvKUvnz8bGjS1AZYg4W6svpXXURVDMnacpn9MfafPDn1rsvc+
 Qx3ATYoP6VjQEb4+hp3OIjZhUOf9Mz+Zneri5MGVsr5yLVx2LAXOyC45kSrUN6bKsypW
 Titcoiae8DxE+s42UJvBYi561YGREx5m3Paf+2poG3deTGDD4tJB41FWXOrX81Wa+XXs
 2DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=4zpafGrQCaBim2zfMfcjVlTfNffsiw104/ikdBLzGJY=;
 b=A4g5wFgSaAE/21ZNjauLy8GQj9pNmsyAOseP/rWWLnBVEp14nc8+JAIc59jhK8asO9
 OhHxkCQ7G7zJV7tuP1uIhKD4osDuCfPntAYLXVX/9YxpWQCwCdQ92L5VgtVJ5xJG897v
 steUUj0Vptn+1TKK/4U/wAGz1qh0ZPnNhU4tBEKZxHal326nR4kBePIvTId2KF6gjSsq
 4Mn3tkQBmYg8e3h47+89rT4TFp0YdClWkQg/h2pgTC1yAFQZLwi15UWuXKO2muS61GAR
 sgzwhjIFeH3EAFbplomOn5fvDaSjdBp2ATcjY+NX8Cbx/GF2WF25pRp9zELgzw8dqd3J
 HBIA==
X-Gm-Message-State: ANhLgQ3qCeC4wU8I7lGR5BCSQf+8/lcmadq1ONre9ayc9QcobxbRQf2T
 cc8LylYdqccCOGKpYdgIi9YXPG7sU8EoUobsxwliVA==
X-Google-Smtp-Source: ADFU+vvecZyiEy6uUzarY5qZN4imJPy+LVGIwU9ReBhKWj/uGXh5M2A0d2DfKNhO4A9V4zctDSASr4OqeHMap57Hg+c=
X-Received: by 2002:a2e:8e77:: with SMTP id t23mr11495232ljk.221.1584197614665; 
 Sat, 14 Mar 2020 07:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
 <7526f16bb72b9bb1fdb6384e2c5c01fd0d0e4af4.camel@rumpelsepp.org>
In-Reply-To: <7526f16bb72b9bb1fdb6384e2c5c01fd0d0e4af4.camel@rumpelsepp.org>
From: Torsten Krah <krah.tm@gmail.com>
Date: Sat, 14 Mar 2020 15:53:23 +0100
Message-ID: <CAN2Hv7Br0ijvYD7Kdqfkvio079Xiqjnf=6xhFrNZA3qFevH2vg@mail.gmail.com>
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Mar 2020 01:14:22 +0100
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
Reply-To: krah.tm@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I don't use NetworkManager - just the wireguard command line tool -
searching a way to configure the preference on v4/v6.

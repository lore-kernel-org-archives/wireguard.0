Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5E8C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 07:57:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1841864E67
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 07:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1841864E67
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a1f4e0a;
	Mon, 15 Mar 2021 07:57:46 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa7db6b1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 07:57:45 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id e26so6045172pfd.9
 for <wireguard@lists.zx2c4.com>; Mon, 15 Mar 2021 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pW/EFmDHGpJyQ+6rGL/LDLwR3Kx0GCBTdxb3XMGuK3Q=;
 b=LNLM/FpervIFx+kG2nP2t+WgN4rFxhjXoFNgvi371ZAHDUodeCEnD4GGei6M9f4i8g
 5bh7Jr+RNcNBAwQjFLdVZ0vEkMD+azDIK/tzS9YbMGEWv0oewcpdwH8b0h8l6fJrdPxi
 O+cEPv8WnsAm+KVRaMtMFJ5yLmpRoduw0p6VfpDSEJpDslYmil1WMgYxxpD8Tv3c6D1V
 P7Wo+JuyL8N1cwWbtq0NM8UQnAOeABBI9IDLYcTkAIHFhxl+sAy4OceBROPzuJoc7nKk
 ldDYAdRtWvuIfWxrbfrqDiV0+7HFIYnrOAxkatbQ9qHpZ1R2SZYsrJwBEahALD+yUweu
 m4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pW/EFmDHGpJyQ+6rGL/LDLwR3Kx0GCBTdxb3XMGuK3Q=;
 b=CJ1wNYNU5TxMHFeU23Zbx5tECn9X3d35T5P+KvlSczLQOapGytC3bnU6Hl1yqHg97O
 mTN4HbhHLB1GDi8E/uh28yB51Aup/Tdqs9L4jeHB5giiqeisJfnSyxajgvMoj/Nnz5T8
 +HcnMRhxu+9LsnrxuNWuTAjT8cdScXehJ0buqArdtM4bLDZAeyUyqw/KGXQtNCJ0XRYS
 6bhyWZuR3wV0Pfh/TkykgD9C2jGmObQE4XtMXwn9eqrRj3ba3Xcm1HRDnbgv3OskRxnk
 2sUSrVIMhLXFEY3n6YCaUt9lZjkPlO8IqybmQ0955tIvwtEKpceyutNY/DuMaLOWOhiT
 5WgQ==
X-Gm-Message-State: AOAM5331YJzcUwevUljv15CkTcm27dirp49U212RlsCDgnAlyNX9JsxM
 kA4o9npSEBRNjTqz/7sFtJ2WZx99W8dmWea3OZrqccfcBEnwabDr
X-Google-Smtp-Source: ABdhPJz9p/jlGy9DMgU65SJYlAbOc5henVsjtlGaet0EMKI8U6nYwUElGmDseX1mYPd4+WiPWwD/RA8ON7/P/ti90zc=
X-Received: by 2002:aa7:9145:0:b029:1ed:d58b:e276 with SMTP id
 5-20020aa791450000b02901edd58be276mr9041967pfi.25.1615795062916; Mon, 15 Mar
 2021 00:57:42 -0700 (PDT)
MIME-Version: 1.0
From: Feng Li <lifeng1519@gmail.com>
Date: Mon, 15 Mar 2021 15:57:17 +0800
Message-ID: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
Subject: Enhance the "AllowedIPs"
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi,

As we know, the AllowedIPs will set the route table. However, if we
want to set the CIDR, but except for some CIDR range, it's not so easy
and out of the box. For example, if I want to route my all traffic,
except the 192.168.0.0/16. I have to calculate the two CIDR
difference:

AllowedIPs =3D
0.0.0.0/1 + 128.0.0.0/1 - 192.168.0.0/16
=3D
0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2,=
128.0.0.0/2,192.0.0.0/9,192.128.0.0/11,192.160.0.0/13,192.169.0.0/16,192.17=
0.0.0/15,192.172.0.0/14,192.176.0.0/12,192.192.0.0/10,193.0.0.0/8,194.0.0.0=
/7,196.0.0.0/6,200.0.0.0/5,208.0.0.0/4,224.0.0.0/3,10.99.0.0/24

Is it possible to be built in Wireguard in the future? I think it's very us=
eful.

The discussion link is here:
https://www.reddit.com/r/WireGuard/comments/m44fi5/enhance_the_allowedips/

Thanks.

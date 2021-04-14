Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51290C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:20:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B2661158
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 20:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B2661158
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c6a51d7;
	Wed, 14 Apr 2021 20:19:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab35d17f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618431563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=637WI3mFqU4RlMkfKGhX+JRS/oRWLJ7r0ygSotVb7SE=;
 b=aH/7edmZnS+FZ1cHPxMOKSEZwkuh6cjDZEmWnnkdlDtwG48sldGvrOK4h3uGZuxF2//w8M
 z3U4/HxhsDGLN9RI5e3TaMxkaGRCyfs4E6BF63y88F3aWvh5r+3jizqpqUVyx3ENw9+qO9
 zXa7P1hUL0yWLd06fKVjwk7xvskYw3Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ac0cd97f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 20:19:23 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id z1so23560673ybf.6
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 13:19:23 -0700 (PDT)
X-Gm-Message-State: AOAM533nTgkiUyWUGgNUYZ2CUNXlyDK154IdjZq2WGw/bx1F3VX0Twxe
 IuUbHClEnQAnr25yMemgRBcvFqQlPZq1OGwNc5k=
X-Google-Smtp-Source: ABdhPJyRcT8No+LBbZNTe+13tKeS5adq/6qHA/XlZnqgtjC732kkDMhkYW9MRZArkXPBj3sxXksUE0jq0OY7sqMAxa8=
X-Received: by 2002:a25:be09:: with SMTP id h9mr27622902ybk.239.1618431562954; 
 Wed, 14 Apr 2021 13:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAN5wt5poiJbOAfe+_VQpu=+6V8dLDiFDVyhUFNbad5NEd9YFfA@mail.gmail.com>
 <CAN5wt5qce9+b8okeKyH4j_U2kUrL5i=_UJ2VupNSJLR2NN5oRQ@mail.gmail.com>
In-Reply-To: <CAN5wt5qce9+b8okeKyH4j_U2kUrL5i=_UJ2VupNSJLR2NN5oRQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Apr 2021 14:19:12 -0600
X-Gmail-Original-Message-ID: <CAHmME9oYEYZwShTCwmnNFU=iGUyONm4u8UW-FQa_pytJvyen2A@mail.gmail.com>
Message-ID: <CAHmME9oYEYZwShTCwmnNFU=iGUyONm4u8UW-FQa_pytJvyen2A@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Christopher Ng <facboy@gmail.com>
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

Sounds like you probably have an older version of wg.exe somewhere
with higher precedence in your PATH. Perhaps C:\windows\system32?

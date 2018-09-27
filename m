Return-Path: <SRS0=TKOU=MJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BBDC43382
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Sep 2018 15:49:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C28C216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Sep 2018 15:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="0nmWs1NF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C28C216C4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f749904d;
	Thu, 27 Sep 2018 15:45:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea5e29eb
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 15:45:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80d2fab8
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 15:45:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13b238a3
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=vj1WW76/9BW4FGxmeWOFjLdFhBg=; b=0nmWs1
 NFfTQtuDJINrL+2SgOW+aLmrIiDyqiRYps3sDIj45yXBTeBKFZ7iYSfOJMytM4nJ
 KC2whCUrdUJqIBctSpCcdm7VYIPeOL9oFKwMylIKtRWpUmG9Bp73spdR5anyQcUi
 GfV2Qb4TvudRLAXQo3WjstCfkQXFSxKf3bcugc1gz8OrveIrJUekyTBvMICfSqSL
 aYMOLCC/uZ5oyN1jF5B6IfX7IPEG/PVJrtKnnEBv5q4lebaXHPNJbGKN5jH+iqpT
 /hA3SvwnYklzUHxiJ3MZt4ccfDQmiQ9UcNaq/zLhY4O6P9BemH4WdalfN8AUmzFz
 uvA9gqt7DZq5p/Ng==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7390e875
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 15:30:02 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 13-v6so2612159ois.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Sep 2018 08:48:42 -0700 (PDT)
X-Gm-Message-State: ABuFfojqfz9YXnPFwx9clbppLJkAnVxLshUIlewlOXjUUKXftg7LZZcm
 UV2V7GEIYJeLcdWgaAJCyrA/P6CE3wTrVfbkyfE=
X-Google-Smtp-Source: ACcGV60om1ZvJa86+57EczTTDY5FvaVnZpvUeTrvKlTGMtbTp2EC6xRHxe93vnUFoGNN3pXtuHvTF9PcK9/pKiqkCzk=
X-Received: by 2002:aca:f512:: with SMTP id
 t18-v6mr3576117oih.244.1538063322305; 
 Thu, 27 Sep 2018 08:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
In-Reply-To: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Sep 2018 17:48:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
Message-ID: <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
Subject: Re: Connection issues with Google Fi
To: Lane Russell <lanerussell@protonmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Lane,

Are you using the kernel module or the userspace implementation? Can
you send a debug log?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C771C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 07:42:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20F8206DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 07:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ebDy//At"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20F8206DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51366706;
	Tue, 31 Mar 2020 07:34:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 76f82ef8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 07:34:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d65fb1a0
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NnUzwNT6Qxm/9Dp0sfsIrAtliqg=; b=ebDy//
 AtKUcuPxHqn0pcwrVyuNtI3zj9xgsnKyBu4LYNsyX6U3N9iyZ90ctD0LBhW1FweB
 bU2mHlsUvIgJLbivgdLzpObDdthrEraQcw8HNeANOtOokaubkAGhok2CzNSuGOxA
 iEaCuNBxXt/xD1L9ChM001NjaMswJ13qiZozwF6WS3OCNA+zdfGo9csOMJgCyKrq
 c3detTVhpB/wSNnMscea7PnPcpJOtrmXQgTeYU/N1L9XJ+IgtBbslpm7VKu5/7We
 ox6yhoQdJlYHCASPi5U1f0lINgCw1YKR6OKXD8VCpI7ydL8N0ZlB0q+wdnek2YLr
 90zuYDA8rBKpCNLw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76f21f61
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 07:34:03 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id q128so20631606iof.9
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2020 00:42:03 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0YtopJJnp9X55cb1M/sMtbf+4d1LBGwIyDhNWtLJ9P5Jk8N3UD
 62IGrwOj5VaURNHmvnQEXWMpurZblGB5EjbTN9c=
X-Google-Smtp-Source: ADFU+vsvepKK5kK38DiA5/1PuJyUSltvolZY9OLA6a/hHD4iRWJfBw6a8sBMZ9JXPzcczHXeG5A1p5FVeEgnRSRrFsQ=
X-Received: by 2002:a5e:a50f:: with SMTP id 15mr14195010iog.67.1585640522687; 
 Tue, 31 Mar 2020 00:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200331073901.40209-1-smart2128@baslug.org>
In-Reply-To: <20200331073901.40209-1-smart2128@baslug.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 31 Mar 2020 01:41:51 -0600
X-Gmail-Original-Message-ID: <CAHmME9pAnAQ8qFLBwZQquZUgrUyw3y5LedeumO=DuTMNhbuPew@mail.gmail.com>
Message-ID: <CAHmME9pAnAQ8qFLBwZQquZUgrUyw3y5LedeumO=DuTMNhbuPew@mail.gmail.com>
Subject: Re: [PATCH] Windows Italian translation
To: Vincenzo Reale <vinx.reale@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Vincenzo Reale <smart2128@baslug.org>
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

Thank you! Applied here:
https://git.zx2c4.com/wireguard-windows/commit/?id=4a5840770b4bb1c308f15fcb60f51df4d9d9ed33

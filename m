Return-Path: <SRS0=TPeR=EF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C00C00A89
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Oct 2020 16:06:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C18B2083B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Oct 2020 16:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NzvYw+HR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C18B2083B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2db2161a;
	Fri, 30 Oct 2020 16:03:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 910b55d4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 16:03:27 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c90176f1
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+4LilY8GO62zQcg5LuyFgp5xg9k=; b=NzvYw+
 HRd1UoX4ttyS9ROqAY5jO0TEXcNWR5DazKQ0LTkvS0jeULFZLzva3s6qlp3jrrC7
 hh0w9kSQ2RQMcxm/TKLgsW9YyAafqgoJvBkmvughQqp7dx82GjeBvLgjqq3SZd9A
 AsLI+fRIFCLWv9TfrEzC3+Q+dMaUqpQOuAjvXmITppXYRp4/JIzqmsCVVUznnm+s
 dt58GPkwrTAQ3on0OIHgPEf6gJmq02OHlEnsi9qSJa9WkTbKeWL0OIsAyb/7wXid
 upQGgUaP4frgewxEqTkpOHn+fKiHT4ZP6VjyiOLacpXfCY8lRaUGD4VaCZZoyPEv
 3CvqV49FLre8nRuA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a6b41c90
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 16:04:13 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id m188so5546610ybf.2
 for <wireguard@lists.zx2c4.com>; Fri, 30 Oct 2020 09:05:44 -0700 (PDT)
X-Gm-Message-State: AOAM532jym/JIq4kD0pA6PnLiyCodSqKNXz+GJ+1VpupneDo/2ttIunf
 P+h/V6M6xTYL0/nc9Y3cZ8uQXCd+zVD1Jy4QemM=
X-Google-Smtp-Source: ABdhPJybdrIC2bS3X/U0EbASC0DaIy9bhx5jyOiNK60GmPkFjPb/LnOSBj29E68cdCnEZVB4y8UlznX0V8c32YfvA/w=
X-Received: by 2002:a5b:c4a:: with SMTP id d10mr4628204ybr.123.1604073944000; 
 Fri, 30 Oct 2020 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200424234327.1814-1-godisgovernment@gmail.com>
 <20200424234327.1814-2-godisgovernment@gmail.com>
 <CAPqQDTDPUH17QUQG4xehfiM9zFGw7PVQu=u00v5x15ts=L7SVQ@mail.gmail.com>
In-Reply-To: <CAPqQDTDPUH17QUQG4xehfiM9zFGw7PVQu=u00v5x15ts=L7SVQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Oct 2020 17:05:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9oPv0+fxB=-pvKyqZ42uycEWEAXyWAfwdtWFGxiHYyV+Q@mail.gmail.com>
Message-ID: <CAHmME9oPv0+fxB=-pvKyqZ42uycEWEAXyWAfwdtWFGxiHYyV+Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] use ExEnterCriticalRegionAndAcquireResourceExclusive
 and ExReleaseResourceAndLeaveCriticalRegion
To: Shawn Hoffman <godisgovernment@gmail.com>
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

Do you have a replacement for this or was it a botched idea?

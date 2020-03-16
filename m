Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3627DC1975A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:24:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB8120663
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:24:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u2/mmBIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB8120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0aff8433;
	Tue, 17 Mar 2020 17:18:28 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acc87ac3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 08:24:17 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b21so10577879edy.9
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVr+EiuHrdTrgrxICgp5cEH3U5lsRGzcKS7cOQ3UCaQ=;
 b=u2/mmBIHNtXrvy8jAz9vi5v9llJ5KTr1ZlQLZihzKQ9mGPIZDgS0lsqGUxqyJyki1i
 bZRoQ6+TlHn5WGXTxxW3Nvfb/yDJ3x5k7Wznp2eRYcu8MA/+cqI0cRknymzeuZRF2sfc
 QabJFYShM7k51gCvxVf2JfxyaZOxxz6yFkOz+FdznkzDJoGYMLad9PdMPSE7XDKSRBx4
 NSDPtpeXroeLnudwBOOui7xY5NUJJo6i5WtLAuWtFfSJ3unkfdEqc71WtI92kVXaLjUm
 530lyRK4mL8Nn3/FRhXuKbyEp24+Z5s2Vf43W3/lFOIRE+OKYXMy30MyOqAWWpbIvbid
 1Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OVr+EiuHrdTrgrxICgp5cEH3U5lsRGzcKS7cOQ3UCaQ=;
 b=cLvtwMRx9v8dMv2PFHxwxBCXKoaunclj06VuSG6xO8E0z18meaGw9E62UEYL3oeGMo
 NV7X9S9sBbIGu6JUJpbkNB5pE1eVcChFpjguwqcvAzaahBnQxrmVlZzdpapJGCT7ysvD
 RvtXZy27kE+GyWkpFy/eDgrg/2uN3AQiBV8lkZaPe2qdvdm+CusJUvZYayWdJlIbCdX7
 F7xjhUXEk02vhKGxlEiFnDtY+U3T0LXBWrZs7LASHRQFlzrn6pil62Fh5Rix68Dyhv6S
 bXVtVEjPzgDy1SlG8k00rqapdnk+MoaKjU3+zGJTlGsAQqSHTe1cuM76VPSLOUHMu3vh
 CMlw==
X-Gm-Message-State: ANhLgQ1TQDlI+5gKCTz44MYagcWwDXWe+izQo/SeRtyXlgy/NLi8xj7n
 7M9jek+5OCxVVHBWbXTMl4uPuzwu
X-Google-Smtp-Source: ADFU+vvvwMYhTfhJrYIk34ZuRgjpx3Qx0504I1mdRwAKJd4/vKMrODUQ2pya0yggzXC67cYbfWwBBw==
X-Received: by 2002:a17:907:420b:: with SMTP id
 oh19mr12182340ejb.50.1584347419789; 
 Mon, 16 Mar 2020 01:30:19 -0700 (PDT)
Received: from torstenknbl ([2a02:810a:14bf:e8f0:65a2:322d:83b3:64ec])
 by smtp.googlemail.com with ESMTPSA id i11sm5569272eds.23.2020.03.16.01.30.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 01:30:18 -0700 (PDT)
Message-ID: <6c4dd50c142ca29d8f5b59a311863023a0b497e2.camel@gmail.com>
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
From: Torsten Krah <krah.tm@gmail.com>
To: wireguard@lists.zx2c4.com
Date: Mon, 16 Mar 2020 09:30:17 +0100
In-Reply-To: <20200316100546.6ba3fdf6@natsu>
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
 <CAADpXXY7ajNwRoF1sivACxUfFj-SpWf6o6+1Uq2N0XzEp3bvTw@mail.gmail.com>
 <CAN2Hv7DZgokROQeeacjhYAgBYrV57nk7Oh_japjuLT1=dOu5Xg@mail.gmail.com>
 <20200316100546.6ba3fdf6@natsu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 Mar 2020 18:18:28 +0100
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

Am Montag, den 16.03.2020, 10:05 +0500 schrieb Roman Mamedov:
> If it is so important to you to force one or the other, then make
> separate DNS
> records for IPv4 and IPv6, server4.example.com, server6.example.com.


Please read the first post again, that was not the question.

kind regards

Torsten


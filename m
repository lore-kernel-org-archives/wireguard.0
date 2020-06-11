Return-Path: <SRS0=aF/C=7Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB5BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 08:29:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2380D2072F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 08:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XBdGKaOZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2380D2072F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41cf9980;
	Thu, 11 Jun 2020 08:12:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8adee89e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 08:12:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbf4f00f
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=0RBIqfDFAY+ML4+PAKghg2XBS0k=; b=XBdGKa
 OZmW+MLsDIWV2us2z0HdJ907J0blp/cT0YbsFDefnBmQZ/pQ3SIp2jJEOZRvSvTj
 9SI4k1dkumQGJvnknhKjRDrSYtY+Hiem9EYk2JTpHVFZyQ/MHSxg3/tjbsCBCI7n
 +SxkcTzymGid3UoQN9q8vtjYLwadWSl3AzHXLZLzJi0Q0QltHllqDIIBuHrN/3gv
 HAnsVB/pVgLtm9E0rKCF2oMXB7VtUGDzQC/xUZIHZD/LFYcKcrakMh/FvE39xvn7
 2qh6aQuu2W3DC5PUsO+QXzTpWtyk7qsQ/Rliywk9LLWi610NTlHfFFHuegpEaWL0
 kB5nDuFCI06qnC+g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id efcdd85b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 08:12:10 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id r77so5391449ior.3
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jun 2020 01:29:27 -0700 (PDT)
X-Gm-Message-State: AOAM532dYVlkSgbTkxI6krJtiWOu2WFf1CUuPO+86g1LwGqTj93WmuTR
 s3frdWPGkIXl6lQckCxWqwmxOS7x6Nl4z7u15Wo=
X-Google-Smtp-Source: ABdhPJw8w9JHNcA+ussO0JZrOChzUK/JjXk2sMMY52uNZxzltsoeLQJ/un006BsX8/PKq76QCArciQ/Ld0f1ng0XbYI=
X-Received: by 2002:a6b:5a07:: with SMTP id o7mr7354370iob.67.1591864167306;
 Thu, 11 Jun 2020 01:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANvSZQ97BG02tHyTUBf46XUfJKXArx-gaKe-R2ao0UEUoh55LA@mail.gmail.com>
In-Reply-To: <CANvSZQ97BG02tHyTUBf46XUfJKXArx-gaKe-R2ao0UEUoh55LA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 Jun 2020 02:29:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9qUaMon2-e9tM=fko0zf=Z==HNNXiLrh8RxyURo+VW=Yw@mail.gmail.com>
Message-ID: <CAHmME9qUaMon2-e9tM=fko0zf=Z==HNNXiLrh8RxyURo+VW=Yw@mail.gmail.com>
Subject: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
To: Thilo-Alexander Ginkel <thilo@ginkel.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com
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

Fixed: https://lists.zx2c4.com/pipermail/wireguard/2020-June/005480.html
Unit193 needs to update the ppa. I've CC'd him.

Jason

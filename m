Return-Path: <SRS0=zGfa=LJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FF9C48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 10:55:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B93E61454
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 10:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B93E61454
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef382ad4;
	Tue, 15 Jun 2021 10:52:55 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8173c94
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623754368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/imrlzB2ePIgu+19h0H9ZMSKsVUbvb85AThkl1X9DkA=;
 b=ZVb0pxG+D2+/p5OWETgoytGgWFNrx9BN+y5eKmKzC8x2envHMHtncxpU7s7F5PW/Vj2MG7
 VBE3ZFof5L+nj8efbY8Co5Jrkp8r8zr/7e/AIJ0RmxdcbllwzexAT9cjKGj6HJ2HgKQB+k
 fJ3m1D4GqUMIts34ImabNRL8lcwcvWM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id df9b7366
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 10:52:48 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id g38so19835353ybi.12
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jun 2021 03:52:48 -0700 (PDT)
X-Gm-Message-State: AOAM532W0PgZEwibHG/Y3ylzvFia9h/NqdsC0DWGYorQQkp3ZXBaXPmJ
 FntL5C4VINhUOix+Z4skxRk6RoftiPo5a+9n6qI=
X-Google-Smtp-Source: ABdhPJwkCEtWgnveFTjsnesI+kTYv6iy1ix30i7fe5hUOeA3bZJkQIXSVTDSTYtqmWqw5s2QMg/YWbFf2idiiGUN6do=
X-Received: by 2002:a25:be09:: with SMTP id h9mr32427192ybk.239.1623754367606; 
 Tue, 15 Jun 2021 03:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0Kfxc3pQAM=KNstz-dZeHfYDWeqz360pPZLC1RvrW6+pw@mail.gmail.com>
In-Reply-To: <CADTMz0Kfxc3pQAM=KNstz-dZeHfYDWeqz360pPZLC1RvrW6+pw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 15 Jun 2021 12:52:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9qKqGkBp=JjQa0JdQGYa-YSZjdKADZ7k7KwZa1E4+FOOA@mail.gmail.com>
Message-ID: <CAHmME9qKqGkBp=JjQa0JdQGYa-YSZjdKADZ7k7KwZa1E4+FOOA@mail.gmail.com>
Subject: Re: wg syncconf (and setconf) error when one or more endpoints is
 unresolvable
To: Christian McDonald <rcmcdonald91@gmail.com>
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

This is intended behavior. DNS resolution happens at config parsing time.

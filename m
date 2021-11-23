Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8268C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 21:01:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2a6247e0;
	Tue, 23 Nov 2021 21:01:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 678ed3f5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 21:01:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8439960FC3
 for <wireguard@lists.zx2c4.com>; Tue, 23 Nov 2021 21:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BTI3MOjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637701301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71hGbIgf9jPmFCJrYpiBhfS6SQLhdhuV9iY6vEBE+FQ=;
 b=BTI3MOjzTXyB1l2Ac39p+JVf/X4qNt+Msr7Zn5qOCvY5xLuDGMMK7Bg/JzpNcl9Cj242ZA
 HGfKtm+a6rhAmIWzQE/YNe27E+WTaS3VDraNQs4RFrFKiFjUGwxwbTVOKbesyXE3yJ6qJV
 UvXK5NQqoaQ+xKeefXuiBBo8ujWGxbk=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 1aa8f6df
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 21:01:41 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 131so1009290ybc.7
 for <wireguard@lists.zx2c4.com>; Tue, 23 Nov 2021 13:01:41 -0800 (PST)
X-Gm-Message-State: AOAM530iJC84S1AdwKzhaxjX5BHmxPG7UN8XMhFhdnFjpqT0WEA6xhTM
 SWvVF65lXQO8eSdqZf6RP0kVBHnbB9x+Yds6ARM=
X-Google-Smtp-Source: ABdhPJwZALqbab31n4Ab8OyOPfqc5Eph3vLNvHs2VP2rlpMl/uffWaP/3EuBlwWr2ep7e/zP0AALp9L7QSoiHu/wTG4=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr9442312ybt.472.1637701300049; 
 Tue, 23 Nov 2021 13:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20211123190331.101346-1-minus@mnus.de>
In-Reply-To: <20211123190331.101346-1-minus@mnus.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 Nov 2021 22:01:29 +0100
X-Gmail-Original-Message-ID: <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
Message-ID: <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] conn: linux: fix incorrect endpoint address
To: Thomas Renoth <minus@mnus.de>
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

Thank you for catching this regression!

Jason

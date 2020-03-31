Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4855C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:52:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4689F2072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DDULd80l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4689F2072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ef21717;
	Tue, 31 Mar 2020 03:43:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 53502deb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 03:43:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b36abcc7
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hl/xIX5PFEfly4lv5Y6bOqeA98I=; b=DDULd8
 0lmfuA4mRtBZenj6HPJYmveM/V8KlJEemmyrQ0xCCnu8c+ZKhNIggPtVt9nckT6/
 3URA6gTwklZ9kBAmrc59WgvfufuZD4GpXqXm51rqcdAZHetbb6qxyEIE1xN1rzv6
 SuSVg8YAogCcrtM21hUOw/S3eC6USXCN9rfVv+ukPT7SU2T0eSRElWAUiv9+B9eX
 /4Go1rMhzAGzeE+EKgzaZ5KsG5Qqn5gZH2rHfLzDTcUSmhB7MgSn5Z/WNz8seiQ/
 YFe1bk2zAkmEFkXZXfYMeETtZ7Oi5CuDPG1l4YU3OzN50yakUzlpTDkY5cOF30os
 vrUuxaQB9UKFLbaQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 147c9c9c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 03:43:41 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id o127so20274932iof.0
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 20:51:40 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3DZPooPP570TynV1k6utGS8ca/yAPS7L8sYq3VmOaULmDoZ510
 Q3AxG+phvw0irUzojBA1r6ATQLxhcJKokM5cxzQ=
X-Google-Smtp-Source: ADFU+vvFU+1NKZe/53D5HQWef2hU476dvAiyvAKrQ1W3TXfoUUgUOnZWonivF0iTleTXVF4iIBFQ2og5hmP+j10RAjA=
X-Received: by 2002:a02:2a4a:: with SMTP id w71mr14238060jaw.75.1585626699262; 
 Mon, 30 Mar 2020 20:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200330081549.10736-1-smart2128@baslug.org>
In-Reply-To: <20200330081549.10736-1-smart2128@baslug.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Mar 2020 21:51:26 -0600
X-Gmail-Original-Message-ID: <CAHmME9rJd4b5PomHarvmMS90vBuL5rTbWr7UgRmMPyXVYQdsqg@mail.gmail.com>
Message-ID: <CAHmME9rJd4b5PomHarvmMS90vBuL5rTbWr7UgRmMPyXVYQdsqg@mail.gmail.com>
Subject: Re: [PATCH] Italian translation
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

Can you resubmit this with a proper signed-off-by line? Use `git commit -s`.

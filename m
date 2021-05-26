Return-Path: <SRS0=w0hv=KV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B5EC47082
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 14:41:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257A2610A2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 14:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257A2610A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ada32928;
	Wed, 26 May 2021 14:37:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50b6b260
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622039856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yoa4kR1+Xxx/MglpiYVMOgoFdqgDUM64PM7IqWGlT2E=;
 b=FQATNymy0h8NGFHCTnZWyIo+4vbW+N0Kr9uNcYnoa/3UJJZKn0RXlZE0VaQqaonJOe2B5a
 3sXZOhXAlSASdnGCgEvxSh9X9Yrqfke2zWHlV8GNERY8eekJN2QBJcSGqm3Te5zNf6Nsd7
 Kudw0WmwqmS1epG6GJN60/d8NPfd2Kc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3e957ab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 May 2021 14:37:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id f84so2396775ybg.0
 for <wireguard@lists.zx2c4.com>; Wed, 26 May 2021 07:37:36 -0700 (PDT)
X-Gm-Message-State: AOAM531E5Jmav6D+y0FKY8YI6a1nXhXboQsf2rRaXz0yMe2uxZmB88X1
 /q9A5fS1+LzWQ9GpTxoe7jkU9OMKp2ZvpvaWoVM=
X-Google-Smtp-Source: ABdhPJzmYD+apVzAEWpQ6Bl+Heo7VDY1+9sLn0IX/a7YmvYiEK50/2+UVYFndQ4p7a/hkT8t340e3tujIniYsp3NXeg=
X-Received: by 2002:a25:c592:: with SMTP id v140mr3495138ybe.306.1622039856032; 
 Wed, 26 May 2021 07:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <bd20cfa0-9cc4-83fb-ec53-e2e84923c485@gmail.com>
In-Reply-To: <bd20cfa0-9cc4-83fb-ec53-e2e84923c485@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 May 2021 16:37:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9qBwT1HAz389nvAHWUFa1rWEC3thA+vMcGjQ_=vg3AsTg@mail.gmail.com>
Message-ID: <CAHmME9qBwT1HAz389nvAHWUFa1rWEC3thA+vMcGjQ_=vg3AsTg@mail.gmail.com>
Subject: Re: wireguard windows socket binds to device
To: Andre Naujoks <nautsch2@gmail.com>
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

This might help:
https://lists.zx2c4.com/pipermail/wireguard/2021-March/006442.html

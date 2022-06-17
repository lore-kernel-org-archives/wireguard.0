Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC3C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 13:52:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4d71b54e;
	Fri, 17 Jun 2022 13:52:37 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0256e977
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jun 2022 13:52:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7E2E6B828D2
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jun 2022 13:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBE9C3411B
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jun 2022 13:52:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="RECqE2eU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655473953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwv28vIpI1fPvWqbGU6Ve9pdMi9CcsLJMCZiTdS/muc=;
 b=RECqE2eUQwnEqFssEKayQdlq8L8XMLXjcy+uJTMk+U8iEPBGNegcSC4aPFzoQ2BFRP0Ui6
 8smwlA4ARHLaDGFMX8hJmB4fngc7V49GHSsu5me5iCgkkCQm/volJfd60Ynp/s/eNKvIYD
 qiwkbzBjo23AJC0wCNFfcbwKvmpRdGk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7fdf3f12
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jun 2022 13:52:33 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id t1so7380190ybd.2
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jun 2022 06:52:32 -0700 (PDT)
X-Gm-Message-State: AJIora+pI2ID0Y8ZbJNpJKA5rxbMK5tjXLlIDPgthGvstRUCH6pj/Zi5
 X2KQOEgQl5VVxFW/OIB6T9XCh+ZxQXrqFZCT2k4=
X-Google-Smtp-Source: AGRyM1vkfBJeLlBizqyhtYaaTD3LzDdHhyZfLJ1fR+jekhsFk0CUUdi1GL+FXrLRoxw+/WFpjYNCYjQSooYi7AYigX8=
X-Received: by 2002:a25:8d92:0:b0:656:a73e:a7f with SMTP id
 o18-20020a258d92000000b00656a73e0a7fmr10273466ybl.382.1655473952424; Fri, 17
 Jun 2022 06:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220615160705.898-1-epicstyt@gmail.com>
In-Reply-To: <20220615160705.898-1-epicstyt@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Jun 2022 15:52:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9okL1s6+EqxrO-qA18ci6G0G3v72=ks13tZj5C=T5Qacw@mail.gmail.com>
Message-ID: <CAHmME9okL1s6+EqxrO-qA18ci6G0G3v72=ks13tZj5C=T5Qacw@mail.gmail.com>
Subject: Re: [PATCH] feat: add search to app list
To: Stepan Rabotkin <epicstyt@gmail.com>
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

Please resubmit this with a proper commit subject, commit message, and
signed-off-by line.

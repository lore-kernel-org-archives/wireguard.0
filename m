Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21D3C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 11:23:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8740E64F10
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 11:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8740E64F10
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c1d2d84;
	Thu, 25 Feb 2021 11:23:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f042f80
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614252219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IKTqnxsmKvPLR53RC3CUw5teiR5gu4GfoSby6teb/HE=;
 b=deMLbJYn4EwQar7v0CVWcOOMFwaJmWwpxBajPeBStlnT47QGcZNbVEXOi/kXPa2W3W7xSO
 JG2qruqwXA1vbRATbH1UNZ0UAQ8e0HA+0w1ZgntdSajib51BqBSN+T7NijmP4Vap2f4Ghe
 D9/f/majlLwT7lghxAh7Qv3Eff1yP6w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52174327
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 11:23:39 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id x19so5081755ybe.0
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 03:23:39 -0800 (PST)
X-Gm-Message-State: AOAM532ZUEKPw7b5J1fyGGPCXEGZeOi+z090AbhxLXwYV1ilrFqrjQmW
 YnwSkxaC55lq/oAPLxPLPp00n/QKK7iwlb2clxs=
X-Google-Smtp-Source: ABdhPJx3bYeLF2PdZ6Tdk7zOkF8DjIhz/gT9VwGu/nlLA9ZaUvT4S8doCen8V8M4gV7qLEMV2lTGZnN+6oy5QzvGTUI=
X-Received: by 2002:a25:8712:: with SMTP id a18mr3318198ybl.306.1614252218879; 
 Thu, 25 Feb 2021 03:23:38 -0800 (PST)
MIME-Version: 1.0
References: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
In-Reply-To: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 12:23:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9oOKvMqvSw_CrjhiWU+R60AEVxLYzoaC8W7F7D5vWgWvA@mail.gmail.com>
Message-ID: <CAHmME9oOKvMqvSw_CrjhiWU+R60AEVxLYzoaC8W7F7D5vWgWvA@mail.gmail.com>
Subject: Re: Handshake state collision between parralel RoutineHandshake
 threads
To: Laura Zelenku <laura.zelenku@wandera.com>
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

Hi Laura,

I'm not sure this is actually a problem. The latest handshake message
should probably win the race. I don't see state machine or data
corruption here, but just one handshake interrupting another, which is
par for the course with WireGuard.

Or have I overlooked something important in the state machine implementation?

Jason

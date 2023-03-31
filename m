Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A4C76196
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Mar 2023 16:06:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48856af8;
	Fri, 31 Mar 2023 16:06:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7361330d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Mar 2023 16:06:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5599DCE2F35
 for <wireguard@lists.zx2c4.com>; Fri, 31 Mar 2023 16:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E28C433EF
 for <wireguard@lists.zx2c4.com>; Fri, 31 Mar 2023 16:06:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YXDZaC4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1680278775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vFru677NoJNd865Z+5ujijWuho8zzt2AR8aF0bmQ1Ko=;
 b=YXDZaC4jQP/Zzg0Lk4TiBq7rdtytqepiEIBTOW8zck4PaUm4iZJuIJLkV0U3qr+4ipfdM7
 4uHBjg4RKzspBzeYtUFlkLn8stat0QsaLDb18t0ISVaV6FOg9OOWMnGccZVfVIf6LwpQNi
 sE9iz8qM+Wz520AkQ2YlTdbt5yq99ys=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75a97929
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Mar 2023 16:06:15 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id dc30so19052781vsb.3
 for <wireguard@lists.zx2c4.com>; Fri, 31 Mar 2023 09:06:15 -0700 (PDT)
X-Gm-Message-State: AAQBX9cM2M0KFJos1AfMN+ipkOa3w8lqnfKTgSXOZYmkkSrqgNuMSXWX
 yHrHIobBzvT5S1ACJPHU0soHNoKNg4orFBR6CQU=
X-Google-Smtp-Source: AKy350Y34tzzv6tO5+pO3EzdsaDpesjVYMy/sfv/t8cJxQyJ5pj8vMUZG8v85Qr4ek2Wq7/5Sd9Q7q3SPbJBCUPkcPo=
X-Received: by 2002:a67:c202:0:b0:425:d096:fd42 with SMTP id
 i2-20020a67c202000000b00425d096fd42mr15102615vsj.5.1680278775088; Fri, 31 Mar
 2023 09:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <CA+CGqoKvx-Yeh6zP1_9goVFaPMKaVPQUij2UrO9B9Ea8cRd7iQ@mail.gmail.com>
 <CAHmME9pXvghVW7RUD3gMRR4R9bAfS9YZ7kbt+27m2tnbGtjXFQ@mail.gmail.com>
 <CAHmME9rTgQKn54SDO+JDNYVYiSFuaV+wjN2yNNNOSw43P6KiKQ@mail.gmail.com>
In-Reply-To: <CAHmME9rTgQKn54SDO+JDNYVYiSFuaV+wjN2yNNNOSw43P6KiKQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 31 Mar 2023 18:06:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9ryKHp-YsWHF=v=CieavufWAQKuNNxgGmiP=Kiz2uTWXQ@mail.gmail.com>
Message-ID: <CAHmME9ryKHp-YsWHF=v=CieavufWAQKuNNxgGmiP=Kiz2uTWXQ@mail.gmail.com>
Subject: Re: Nw Android version crashes on Android TV / Google TV
To: Kai Haberzettl <khaberz@gmail.com>
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

The fix has now been released by Google, so just update and the crash
will go away.

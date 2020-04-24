Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDDDC54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 21:07:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFD720700
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 21:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IKUa6NMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAFD720700
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6913f506;
	Fri, 24 Apr 2020 20:55:56 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1841ed7b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:55:55 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a65d79ce
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ZVFxLx5VSal3gHXPSB2v/hT04Ew=; b=IKUa6N
 MdT3V5u8+PH+ZlA5V1VqBryFHqDMAXwwpPe5OsGSRx2HIyrZWZhIHGnPx9DIVV1e
 HSNkbqpnU+2VTVnBqeXiLhGkFmFUn3hguxOOmFFgSvMXgYOQtuu3I41qMEyqy6KK
 w8bBjVEkxRjMBx6SX0TOzFBtsqI6hK6t1BdJfABatlEFZ27I3+uQsJM0kK7kJMyC
 2iWJd1rtQ6XgQATvCio0v83WqUJLetN5OMSQXXY79uQS1UChJ+u0gug1xTMb3cWM
 xzzUUbgr8YJoE/+cbg5CMVG3rVNCWtaPbTDBvShWjaxB2D3f8bDsJW491SKDAvVo
 2FnhglhZgVC7Zf5Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 01cef6d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 20:55:55 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id s10so10604274iln.11
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 14:07:04 -0700 (PDT)
X-Gm-Message-State: AGi0PuacFAze9yXYzDB5181UHq3mgQp98yzYuoHQJ3S19Am7QZ2LPCCK
 7IFvplQrNlQjKdFgLIikxhO6PQPIrmNhE7rHE18=
X-Google-Smtp-Source: APiQypLOdzxi2VQzevxYLALLTr8YpjpIi1E5fs3ABAxXy48/4whvQ/fsCDtACjIVNvog/Av50T2YdohLU+xkBwiS8fU=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr10885722iln.224.1587762424373; 
 Fri, 24 Apr 2020 14:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <M5WzVK5--3-2@tuta.io>
 <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
 <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
In-Reply-To: <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Apr 2020 15:06:51 -0600
X-Gmail-Original-Message-ID: <CAHmME9r0Yd=vhF9mb0Yx5Yuyd=-hSC04zuuC-djumd6htgRj4g@mail.gmail.com>
Message-ID: <CAHmME9r0Yd=vhF9mb0Yx5Yuyd=-hSC04zuuC-djumd6htgRj4g@mail.gmail.com>
Subject: Re: Attaching XDP program into wireguard interface
To: Adhipati Blambangan <adhipati@tuta.io>
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

Actually, try clearing XDP_FLAGS_DRV_MODE and XDP_FLAGS_HW_MODE.

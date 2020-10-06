Return-Path: <SRS0=oTJ6=DN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C25C4363D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 13:58:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1718320760
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 13:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="v9lF5dnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1718320760
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0269d589;
	Tue, 6 Oct 2020 13:26:09 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 87f7f6f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:26:07 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27ed00d8
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=j+Pei6wRUP7Zkhas7h1wCEsdcc8=; b=v9lF5d
 nktY9P55OvPu6lphFrQDfM11LM2I5rGWKldFN2VLtNgZ4rOWLlP3czBnZFjowYF8
 PdwOu1PCwI9iLRhBkG0DzG/kpKi2wLo5mpwwT5i3qp05OnPUezsC6WJNaOtREgkp
 cLk6THWqy43HCq1MQ4t6lRSPvSpruyBmXwubQSQWbx+5dv23vxYvM8dVWnvyobOi
 2ziKzzqY+l3jIULRxYjlEFJL5ktQXSgtsUu5ItXIvNecxnhpUUAsXFJE/0PkVvYX
 s9v603BRBuh3vcbH/WQmWiSagbAKOCLDPr0aj0HTdElkDknLqvhP1wjqsvJIyARF
 q3Nzz7RjqtymRiIQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bc4e4320
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 13:26:06 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id c5so10467257ilr.9
 for <wireguard@lists.zx2c4.com>; Tue, 06 Oct 2020 06:58:37 -0700 (PDT)
X-Gm-Message-State: AOAM530vRQe78W4hkOxSMn+U83ma3qIUyasu9sZLIVSiqxrXbboTkdj0
 IcLGMj3sk5j3z8Gn8gMhgAQE7awl32Xtnm53dVg=
X-Google-Smtp-Source: ABdhPJxrNql2uX76i4Swe1HKIA+IEiazElO43fiQxOSOCEiyyBsBdKOZHq6D5kIuftA3KJ46ojGFxz1MjUzvdyJk1B8=
X-Received: by 2002:a05:6e02:1250:: with SMTP id
 j16mr3811308ilq.224.1601992716476; 
 Tue, 06 Oct 2020 06:58:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a92:159b:0:0:0:0:0 with HTTP;
 Tue, 6 Oct 2020 06:58:36 -0700 (PDT)
In-Reply-To: <413570f5-1761-2864-65c8-706a9858d491@spam-free.eu>
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
 <CAHmME9qUWGbuSasA+xxoJO+ycog9+S6TPW9aPF8fFDkgaQDP3g@mail.gmail.com>
 <79a4e995-763c-9724-02b7-81da87c0f88a@spam-free.eu>
 <CAHmME9pYFjNC+g85BNaaYUsVp9h5mxrGtGZwvZ-WRrSxXEHNgA@mail.gmail.com>
 <413570f5-1761-2864-65c8-706a9858d491@spam-free.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2020 15:58:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9oXm6sfOW-OWO35-McDzO463iun5Ga4fKq+C2akSF1-Hw@mail.gmail.com>
Message-ID: <CAHmME9oXm6sfOW-OWO35-McDzO463iun5Ga4fKq+C2akSF1-Hw@mail.gmail.com>
Subject: Re: wg-quick up (on linux) fails in case of several default routes
To: Chris <wireguard@spam-free.eu>
Cc: wireguard@lists.zx2c4.com
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

Sounds like you put something silly into PostUp, then? Check your config file.

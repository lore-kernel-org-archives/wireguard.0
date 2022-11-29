Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB411C4708E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 13:15:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9a654cb;
	Thu, 1 Dec 2022 13:09:24 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e98a7b06
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2022 01:53:51 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id j12so11987711plj.5
 for <wireguard@lists.zx2c4.com>; Mon, 28 Nov 2022 17:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a9reBu0taGCxqZ043K7WK3aJv4Sy6fkO7qsFC4V8f/U=;
 b=ZMiayX89I0dnRAbq195UF0fk2ft0S4h2jBMhSe2oGWhSbNjSP6bKTo+u6fAVQgqAu+
 CQ9wSIrWk5R9FZMlIOrGBa8SMCcFNJp9itBS9apzq3Ki/SSdyMMvI6dTba3FoEIKjIit
 zlZpjvnFvMi2InrDQjlsI/TMrBdErkOaYT4zak31VL//JLvLhtzJWZLJ52x3VallLo9t
 9Y2vO0HCl0GyUFv4n02iuJg1G//CyAg1DFhVSSrQzOL9xjyeGqYlvYGig49wlAlaPGOO
 UB8SwhQ09aJA70A4j2hxO06xudHFF5W8RPT4fyZ5xBF9Kx8j+9qitf/aYSde+EKCWXU6
 Ammg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9reBu0taGCxqZ043K7WK3aJv4Sy6fkO7qsFC4V8f/U=;
 b=ZwB7A+2g57yogWtVD7+dPb/Rdliiy0goSK5EtdZOpmFsijtDqQWgylN+PM7jEP2Oeu
 lwOAQZ3vYYhTL5ce69VGrhGHjlzZdGnEv3RABiGvZih/nJRQWZ2ZmGhRJd+hop64uKgz
 rZnAoaNIg7akqPALN95Uik+Sj+BWKqfJc0ROtlmruZkQxr5jiCyIsZsZ6ySSx2exvBju
 j1G+C2Vjj3Fwev5oE5UDv3BrnlNTsjYpoG++d8IMNC3Xe1agxfNpNUwSe2y4c0fGxzdb
 3Rc7f4yMHl1jU5UVG6Op5jPWvTz0ErxO/nwA7K0hcphed7KwCiZcp+hdb3PAt53/SDR/
 qakw==
X-Gm-Message-State: ANoB5pnq5sBPkfwrHIzs5kriThSaxpIwKSyVUpdkkclelO2kwHnaMvTt
 AFSByzIge1ifqgpi6ZMqczifLHKt+B8fzkLE/jzyJ4jeQHo=
X-Google-Smtp-Source: AA0mqf50wZeFOqqGPf817jqRinDhbBuIduwOrDYTzOw2qTSBCr6/iWepo5Z4a24FjdHITT6jfJgfj7hMBMOAO9IAuIU=
X-Received: by 2002:a17:902:ba87:b0:189:1890:77c3 with SMTP id
 k7-20020a170902ba8700b00189189077c3mr42646416pls.138.1669686829998; Mon, 28
 Nov 2022 17:53:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
 <15709745-61e4-5aef-200d-4e3802718c7b@noc23.de>
In-Reply-To: <15709745-61e4-5aef-200d-4e3802718c7b@noc23.de>
From: Omkhar Arasaratnam <omkhar@gmail.com>
Date: Mon, 28 Nov 2022 20:53:38 -0500
Message-ID: <CAHx9msc_DKa5gcUFDPH4DTvuhF4L6cfRACK4x3wywd=Zu+nqHQ@mail.gmail.com>
Subject: Re: Wireguard - no logs iOS 16.1
To: Ulrich Kalloch <ulli@noc23.de>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 01 Dec 2022 13:09:15 +0000
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

Agreed, Save and Read do work.

--oa

On Mon, Nov 28, 2022 at 12:59 PM Ulrich Kalloch <ulli@noc23.de> wrote:
>
> Am 05.11.22 um 23:20 schrieb Omkhar Arasaratnam:
> > Wireguard 1.0.15 (26)
> > Wireguard Go backend 2ef39d47
> >
> > I am unable to view logs. Clicking on the view log button momentarily
> > renders text, then it goes blank. Tried this on two different phones
> > (iPhone 11 pro max, iPhone 13 Pro)
> >
> > --oa
>
> Same here.
>
> But Save and Read in Notes Works.
>
> Best

Return-Path: <SRS0=fXWi=PP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4577CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Oct 2021 23:45:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2752261073
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Oct 2021 23:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2752261073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e24a35f;
	Wed, 27 Oct 2021 23:45:46 +0000 (UTC)
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [2607:f8b0:4864:20::930])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bae31d3a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Oct 2021 23:45:45 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id u9so8141644uac.8
 for <wireguard@lists.zx2c4.com>; Wed, 27 Oct 2021 16:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KMG3iaaFaZmGFkEt2QBUdqpTxjGPeoaytDpkwL1zHkg=;
 b=o6W0Hcrj0HhO/aq/Ny6Tc6o3Py3QNlEzdOjc+gcng14nE6GIDp3iuMCmg03ZgMFOrd
 +8lI9pzWI1yJZsnPEJ2zgUGNkT8uKOYVOBJS4i3kUd9oEU86Y9zAFyfUadNijmYx2hE3
 B9lDk+6gHK8hQKXDtgTCYuhsgnNR8IwQakW/Zdn1rIS6kq7FW+zgPsYsOP7NPJ2Q6f17
 gYghNZ4OkCkvYWsHBNLZrBeusxvh5O+5DByAL9F143hTv+6oUQgtXbIaPJt+1D0XocW9
 Eh0k/xm78RNz3X9k+bjTXIAJTi3sEfBcUWhrmJwQywKNhEs8KZcxWelw2NqTe2LlIpN/
 v7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KMG3iaaFaZmGFkEt2QBUdqpTxjGPeoaytDpkwL1zHkg=;
 b=QB0PIoq8H2nxq5869uV2fTDSpZfQtYN4E1HR+JQ8sC78siE6oBelPERgBrRyFf1usK
 Rzc6qYNuYdKDB0BanaLh4p1YJCNtihIG0Atr/bmug2WTfBqZjvHv1JpxXDrdEqkL5zKK
 rQUqNhV/1a04e1MEIgVss+eP0TCaqh7szGhMksqXaBPBniZX5KMJc7saKHZA0zBbdRBp
 I3+4xXQaRaViDq418ckPMVE8+T2gNNmYejx7TSK9PsYo2zGxwlfW0n2flPoIjGHPteJc
 4AIoDpEe7y2WtQT/syEU19ylBUc270DzVu2zOPZRKXILD3hse4/ga3F6z6UDl82wCVaQ
 kstw==
X-Gm-Message-State: AOAM5312agADhp9w+TC6Veb59ipgGpdNi8ZVvRcmlQh6SgUpVKN9hdpH
 VQB9sMLl4mqjMLmxs8F323UFOMBrtCx6qTMp0HE=
X-Google-Smtp-Source: ABdhPJx13NwepQZA0i9Kcbh8+duV+9yal7hT2hE00eThnrVGo3obb16yx1qUy3NhMO47Fl0vNjTV0qmb6xdfgGRWlfc=
X-Received: by 2002:a05:6102:3a72:: with SMTP id
 bf18mr796774vsb.22.1635378343728; 
 Wed, 27 Oct 2021 16:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <CABOEyuLiu96_KxEH5sdGLaE5-s9e8F_c0a1PKHSnFcMKp5YHow@mail.gmail.com>
 <CAHmME9oPi=LvdcZC-FA+SvyxEmcRULtNB8hAQZoCAX=kQycTXA@mail.gmail.com>
In-Reply-To: <CAHmME9oPi=LvdcZC-FA+SvyxEmcRULtNB8hAQZoCAX=kQycTXA@mail.gmail.com>
From: Ryan Roosa <ryanroosa@gmail.com>
Date: Wed, 27 Oct 2021 19:45:33 -0400
Message-ID: <CABOEyuJidG_u8SFGnhV6aw5y7PHVhaW_diDrpdMMHfOE4fHRWA@mail.gmail.com>
Subject: Re: wireguard-freebsd handshaking issue upon underlying WAN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Kyle Evans <kevans@freebsd.org>
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

Hi Jason,
Thank you very much for this! I received word from the OPNSense team
that the referenced snapshot should be made available in OPNSense
21.7.5. I will test and provide feedback just as soon as I can get on
the aforementioned OPNSense release which includes the fix.

Cheers,
-Ryan

On Tue, Oct 26, 2021 at 5:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Ryan,
>
> Thanks for the report. Kyle saw your reddit post earlier and tracked
> this down, I think/hope, to a bug in the state machine cranking. I
> committed the fix here -- https://w-g.pw/l/yQTw -- which will be part
> of the next snapshot. Hopefully that will fix the issue, but if it
> doesn't, please do update this thread so we can keep searching.
>
> Regards,
> Jason

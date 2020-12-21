Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E90C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 01:55:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B032151B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 01:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B032151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e220f581;
	Mon, 21 Dec 2020 01:46:19 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4e9bec4f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 01:46:17 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id g20so11314354ejb.1
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 17:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=e5Q6Ooz15fJKRh5jUr4xtobC4f+VLZyB/yopSJqEE40=;
 b=l+SVM48Ph8M+n//Zxo9CWH7h8QhMEaGxcH+Hkc/RGm0V5wHAmIYH1INAPxbB1Cgkw8
 jMrV7sLNB1+oKOLhaO/TcSndT7JQ5Jgc07wfwPK9Ge8DooSA/VkGiJZjR2K2FK5xJ1L3
 Tf6u5rBfWrkR9hodBTWQAKLlYKGcsn1RWlf2KeUmdXTjPpgvSCBwM28nbiCINRW3S6kr
 9oJjZ9kCn194p9QlOSVOb92LBOl6pNz18r4KkmcOQu4CNJtx27d/NBeqV980p2PqZgsW
 Rk0CkKqndAk9ORMxvFWEUjuBW6SFlCWnkdjs92dgFQ01CQJW1Z41dqCu+u9VVaefEa0A
 At0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=e5Q6Ooz15fJKRh5jUr4xtobC4f+VLZyB/yopSJqEE40=;
 b=G/dOGt591g1Dx0EdU1XSVRYkAlidxvBj/doFPcbwxbinfkYhJ5HqfvlDea/f0pO9Hp
 TPSBGGIsqDqy7vDGOqlZYELVZlrji1gVpY2Qhtpm2YDyEWU0LUnHzIzpVr+jz6JZLEsb
 7whgOc19nv/APQb3XEoId50xJn5eMCiqjJkix1WjGxshBYqF7Jq+h3bkpWfwCfDLvduG
 QYHvRQyiowjzZVo+PmSrGSE96dEsixsPpywBEvuCN3+S3XX1pqer7J6gt28GwnXbZ3L2
 edmguK/bWvu0fbGbouoKgT4vjjpAAkmdLzxy9nEskdygRpa1FxkbNc4x2lJL3M0HTZkT
 Geqw==
X-Gm-Message-State: AOAM531aToErpwwF7RpgRP7KMJaVq7WGtHXNYDsm3a7dJHyuNob+iElf
 TGplP6bt2YQ/pYD58EFSb9aq9jGvCRcnyRKsgJ9cCWgs6mGXgg==
X-Google-Smtp-Source: ABdhPJxRlkKUFVrnbc8EfwnrOEbwRZ2yO+W4N9Tafu3QSaGJkqPuc1tkbfXh7W1IzdfaqObTvoAzX4ORxunmGmjEBoE=
X-Received: by 2002:a17:906:9388:: with SMTP id
 l8mr13420943ejx.22.1608515713881; 
 Sun, 20 Dec 2020 17:55:13 -0800 (PST)
MIME-Version: 1.0
References: <CAF-5T9FDVTqPGsS=FcMMyWy2W6O1w7ShdhEEsGUAaQ+fnTMnVg@mail.gmail.com>
 <9B2F58B7-92A3-425E-9B28-DF715B5B5503@tomcsanyi.net>
 <CAF-5T9GDLTTrcgmGcT=YaLbUmEHSmNyE6_X6Xcvof3bcc6HXEg@mail.gmail.com>
 <K12715-4.1608513012@spamhaus.org>
In-Reply-To: <K12715-4.1608513012@spamhaus.org>
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Mon, 21 Dec 2020 14:55:02 +1300
Message-ID: <CAF-5T9Gv-UXVniXGh4Vr9bX=uOOED2pQHqF7hJdP=bbOOvHU0Q@mail.gmail.com>
Subject: Re: Best practices for adding hosts
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Andrew,

> /usr/bin/wg syncconf wg0 <(wg-quick strip wg0)

worked smoothly
Thank you so much

Ronan

On Mon, Dec 21, 2020 at 2:10 PM Andrew Fried <afried@spamteq.com> wrote:
>
> Try running the command under bash, eg:
>
> #!/bin/bash
> /usr/bin/wg syncconf wg0 <(wg-quick strip wg0)
>
> Andrew
>
> On 12/20/20 7:51 PM, Ronan Lucio wrote:
>
> Hi Domi,
>
> Right, it's not on the latest version. Actually, I used to run the
> system version, so I can set it to automate unattended-updated.
> Anyway, no problem updating it... ;-)
>
> I tried executing it manually and got this:
>
>     $ sudo wg syncconf wg0 <(exec /usr/bin/wg-quick strip wg0)>
>     -bash: syntax error near unexpected token `newline'
>
> Any clue?
>
> Thank you,
> Ronan
>
> On Mon, Dec 21, 2020 at 1:01 PM Tomcsanyi, Domonkos <domi@tomcsanyi.net> =
wrote:
>
> Hi Ronan,
>
> There should be a reload option, check the changelog from August this yea=
r:
>
> https://lists.zx2c4.com/pipermail/wireguard/2020-August/005780.html
>
> Maybe you are not running the latest version? In that case just take the =
command from the patch and run it manually.
>
> Kind regards,
> Domi
>
>
> 21.12.2020 d=C3=A1tummal, 0:11 id=C5=91pontban Ronan Lucio <ronanlucio@gm=
ail.com> =C3=ADrta:
>
> =EF=BB=BFHi,
>
> I have a wireguard VPN server, and it's working gracefully, thanks for th=
at.
> I'd like to ask you how can I add more peers without having to restart wg=
.
>
> So far I use to add new peers to the "wg0.conf" file and execute a
> "systemctl restart wg-quick@wg0".
> The problem is all peers go down when I do it, and there's no
> "systemctl reload" option.
>
> If possible, I'd like to keep all configs on config files, so it's
> possible to automate configuration via ansible.
>
> Thanks,
> Ronan

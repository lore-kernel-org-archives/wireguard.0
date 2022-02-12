Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7D2C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Feb 2022 13:55:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8e059188;
	Mon, 14 Feb 2022 13:55:12 +0000 (UTC)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 720de459
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Feb 2022 02:20:50 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id a19so10084063qvm.4
 for <wireguard@lists.zx2c4.com>; Fri, 11 Feb 2022 18:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ef1bxLq/sP6HAy7kL3hEMzTZFW/WpVD6xlsBoG/IOig=;
 b=bmNrcE/H4PfUjmGJQDiXz9M463YB0IbW99/2VOz6OXbFUdqg1YlAxVxxMe9iEky6h8
 f35BLdTWO3wZD1W3ixeFWcZ57dpf0oQNzOVzue0I+HXz0rcs/u6zfGHaBr9MTnUJ+vTA
 WRbiKA9aHPYBDugshbr+1JQqlOalXe5vNKr0R18/R04mbhecU+cZmG6jpNyHBj6TCS2d
 RzbVAX6qSB4taKT17Dq802SvTdiu1afhGQ828O6FZreHk2wZ2Wyut3oS/b/4EmOcdcy5
 f00m+fnTN5FExlKQYIwqsF7P73dET+GUGwFSWdUEQ2CAceLsBPQT9c8RU2ZKkyifHhiV
 U8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ef1bxLq/sP6HAy7kL3hEMzTZFW/WpVD6xlsBoG/IOig=;
 b=Q9D51MZlI0z1Av10J4UjPTkRHuNl5G3x8SW0kSMO0xg1Lrq1T8OfgxRW0+xT7HkZqQ
 hMXPqjVna3TtnfneO3ch19uBVHTmLx99pYAlkjFKpKYYnSjOdUn9i07dpeB7pVG9cJhH
 Q4riww/ORRevQ2hkfkTsm7P1qRaZetPapwa4SPW9SSh+Vct3YGIp4c9iSPdVpzW4JU/D
 IXSbub0Ka22D/nONE3L8xO3e3YsTdMMzCFZ+eep9DHHyjaQf2IvMgQC6iNFj0IOrPtuc
 1YYrLq3UUL/s9PPoAtdnMtKTzaMoH1GxpQSwPgCpdMkycIsGiedpnJWNYL/DDrYgUPQb
 czoQ==
X-Gm-Message-State: AOAM531aDVSicLHbqhyJ3AkyD0O2OICSX1ISrcTZ7GehccQKIpca1j8m
 mC8/5JeNNSw9CICocSSGxEodK2DFdE1F4xURIeJ3iUUsjQQLIQ==
X-Google-Smtp-Source: ABdhPJyvFRYmdSuR2WAoeIauq1AQUmB3TtBZqmPBCguiyqyQlw2kph2MJngFCz/jJgJjp+2ZIriZit8g8ZOH467Qu4w=
X-Received: by 2002:a05:6214:19e9:: with SMTP id
 q9mr3154415qvc.73.1644632449473; 
 Fri, 11 Feb 2022 18:20:49 -0800 (PST)
MIME-Version: 1.0
From: Alexis gg <alexisgandroid@gmail.com>
Date: Sat, 12 Feb 2022 11:20:39 +0900
Message-ID: <CAFwG9-ZTkzZxp+ORVaGM0fHezZ51_ffVROz1Z0Ug+hz=thLzPQ@mail.gmail.com>
Subject: reresolve-dns: use $EPOCHSECONDS instead of $(date +%s)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Feb 2022 13:55:05 +0000
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

This commit breaks everything on older OSes (esp. Centos 7):
https://git.zx2c4.com/wireguard-tools/commit/?id=1fd95708391088742c139010cc6b821add941dec

There is no check on the bash's version, the built-in variable
$EPOCHSECONDS is available only from bash 5.
https://lists.gnu.org/archive/html/info-gnu/2019-01/msg00010.html

This isn't an improvement, $(date +%s) is stable from much older
versions and will stay stable in future bash versions.

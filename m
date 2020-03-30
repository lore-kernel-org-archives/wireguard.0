Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3412DC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:33:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBD020735
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBD020735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7153b7d6;
	Mon, 30 Mar 2020 02:23:30 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a62b82e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:23:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c14so13966433qtp.0
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 19:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Oam6VlqPT4yjgucc6JCVz7y13LwRq0aZuNaupVFXrmE=;
 b=rbt9Ou1+cY11FjEPeCRKzZ+QNvkC9cLpbFwQQ3jo2jitzHMZeOKHFhDtqnBzAhen/x
 HmA7eEd3Ux8br/RL5VJT4iLiDpZWem52lLfI8rabjO+aRDOGKucFgftb7aoNM2KQ/X3O
 x/OL2a2vzZRF7DSSkr9ib3RVrdowB7KEIOFjOpe4pPOFZkXprHjZwH9AGqU8Zo6D8fg1
 Rc6hocJPFhalk+G69O6karg3q7KoDI/lIGkNfE6PE1iF2rZvEL4mEteFIGX+DBmhrRnw
 fVsLZhcixPKd/OAu0rnyDwz39B+PqLqcJmGleD2uVoGzfks78W8DsOhwu5164PkhSUbV
 j3gQ==
X-Gm-Message-State: ANhLgQ150CHg/7/JkhPIewSXJk2NZq/wqFDDVQdn0LNdJWL2Fr4I2nL2
 kChujULCW82r5p1oogFY4aEPGqDwLuA=
X-Google-Smtp-Source: ADFU+vvEeQ321f+3+zJGoIvvyx/6YKFyjrH73XVlsGR/JaJI+pFEzFqtsXJTHiGQ9h3JaRwET85m2Q==
X-Received: by 2002:ac8:4a98:: with SMTP id l24mr9966180qtq.223.1585535477314; 
 Sun, 29 Mar 2020 19:31:17 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id x37sm10163011qtc.90.2020.03.29.19.31.17
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2020 19:31:17 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id l84so8225674ybb.1
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 19:31:17 -0700 (PDT)
X-Received: by 2002:a5b:ed2:: with SMTP id a18mr16236800ybs.520.1585535475975; 
 Sun, 29 Mar 2020 19:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <e478e85d-e62e-a064-287b-d876c2f84ac5@reldeif.de>
In-Reply-To: <e478e85d-e62e-a064-287b-d876c2f84ac5@reldeif.de>
From: Harsh Shandilya <me@msfjarvis.dev>
Date: Mon, 30 Mar 2020 08:01:04 +0530
X-Gmail-Original-Message-ID: <CALpmF+F1=tL9H-yk_PYpSAVq4rtFiST-vzWDL69_MEUpUb030Q@mail.gmail.com>
Message-ID: <CALpmF+F1=tL9H-yk_PYpSAVq4rtFiST-vzWDL69_MEUpUb030Q@mail.gmail.com>
Subject: Re: [PATCH] Add german translation
To: =?UTF-8?Q?Bj=C3=B6rn_Fiedler?= <bjoern@reldeif.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, 30 Mar 2020 at 07:52, Bj=C3=B6rn Fiedler <bjoern@reldeif.de> wrote:
>
> Suggestion for german translation.
> Created with the help of andentered into crowdin.
>
> Signed-off-by: Bj=C3=B6rn Fiedler <bjoern@reldeif.de>
> ---
>  ui/src/main/res/values-de/strings.xml | 188 ++++++++++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 ui/src/main/res/values-de/strings.xml

We're only using Crowdin for translations now, so please translate on
there and I'll be syncing strings periodically and before each release
to ensure all latest translations are in the app.

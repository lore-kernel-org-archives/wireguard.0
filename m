Return-Path: <SRS0=CBQl=5I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F23C10F26
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 05:55:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A0520714
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 05:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A0520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed7b0ebe;
	Mon, 23 Mar 2020 05:47:08 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc43bd77
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 05:47:05 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id k13so2394298qki.2
 for <wireguard@lists.zx2c4.com>; Sun, 22 Mar 2020 22:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s/e9O9YHdJsceeL/PkO4WORs24mxV6WY+tucN58+Ym4=;
 b=NIbm5RrtmNKslZRyYmHqUyKdoMnAowZSyAPislihqJ7gNrXCfrQJMYkLdqPR92c8Gb
 Ck/yA98aVU5rvCdo4RmSTyetmR7C8i8TTnlyDfI93JxeRrtDwb736eok5rdYg5JUBQ/X
 xFnWEN2y20MUlMf74tAu2T9kkln4vOQOX38/9xNBV/mb8TsTq6DSSWYfgAR/Wo1R2GwK
 JhPN4DHJXYcoV7xBtb6vTxBcVRQktPx5FGs6RP5j3oSjnXLP9CR7v3k4IRqNT+jdVhb8
 DydAcL945YbEdtB4z9hS63rx5kmwYwYJ8AX8w7z1w4Ud1vCnhpCxB9yCp2m2paUXukQx
 JEUw==
X-Gm-Message-State: ANhLgQ3wipjRxcaQSxBgEOP53Rn08zlJygdTgbnZYTnixSCAQF8F3Ke8
 h+j/m7c5F5fGh6ehc460LGEPhaBF0Q8=
X-Google-Smtp-Source: ADFU+vvGy0o5QyrxvqK7UiJL5NceKaCWZ/Gx8sOrT5qNlmeaRQwq/luXQkmPvW42BQHSxQSTu3h7WA==
X-Received: by 2002:a37:8b01:: with SMTP id n1mr17102949qkd.407.1584942842352; 
 Sun, 22 Mar 2020 22:54:02 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id r40sm11593720qtc.39.2020.03.22.22.54.01
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Mar 2020 22:54:02 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id d186so6434741ybh.1
 for <wireguard@lists.zx2c4.com>; Sun, 22 Mar 2020 22:54:01 -0700 (PDT)
X-Received: by 2002:a25:820e:: with SMTP id q14mr5637198ybk.268.1584942841704; 
 Sun, 22 Mar 2020 22:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <7273dde5-290a-7657-1c4e-3397db01038b@electromail.org>
 <CAHmME9qd6-Q+XNPeC0xNg+1Dgrc71dwimJ2m5ES5YP_qDRmG=Q@mail.gmail.com>
 <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
 <CAA2ss9GtgnqXYC9ew6_RtA-VtyvVa2Bi3UUb1nUPH8gd7J-F4A@mail.gmail.com>
 <CAHmME9qA_cjndBLzcENgboHdw6+pt5ac-jtY7YimT4622Suz6g@mail.gmail.com>
In-Reply-To: <CAHmME9qA_cjndBLzcENgboHdw6+pt5ac-jtY7YimT4622Suz6g@mail.gmail.com>
From: Harsh Shandilya <me@msfjarvis.dev>
Date: Mon, 23 Mar 2020 11:23:50 +0530
X-Gmail-Original-Message-ID: <CALpmF+GMqwu70_ZXui-6a8cs-erkhGFWSnqXjHGjaWk8JMRKbw@mail.gmail.com>
Message-ID: <CALpmF+GMqwu70_ZXui-6a8cs-erkhGFWSnqXjHGjaWk8JMRKbw@mail.gmail.com>
Subject: Re: using wireguard intents from tasker?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eiji Tanioka <tanioka404@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, 23 Mar 2020 at 10:49, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Sun, Mar 22, 2020 at 11:11 PM Eiji Tanioka <tanioka404@gmail.com> wrote:
> > Which is more appropriate to provide translation for this feature,
> > Crowdin or Patch?

Please prefer Crowdin where possible. I've made you a proofreader for
Japanese as well so that you can approve translations.

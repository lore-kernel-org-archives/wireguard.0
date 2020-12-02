Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB5C64E7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:40:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1002075A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E1002075A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77d8a63b;
	Wed, 2 Dec 2020 13:33:47 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5ebdc2a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:33:44 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ee2de89
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=rxo7aMKYqIguGELBQIpcg5wMvkI=; b=Wtx0kJ
 5SFKZzn5jbYB7AW6apaWRWtvpkOIQqOyLEGyEakkdLTI4BvwhmVImyBRA2SJlM26
 7Z8FSIpZ02mc7fTeqs2rcsACNYCit+zWKu0NFRMUBb+dbjIR1l4cNrwZuYzHB9Wy
 BcOc5V1oVoLACgOAF+ifHkih8Fu/lQiNElshLhlMl2FKUZuIWwJTNSmYW6KhKncy
 52bqrZCJsSTXE+EX2BgxlKH+XrxyG+Edmham0NIW9aF9QtttXE52g6mOd/5fd+tn
 S93TzzTH+DbdLNcU4We5actDwUW4JY5P9S9Mz/Sb2TgG9y/aw0pgxxUTus00G9zq
 RHGAbK+2L9ZSfNSg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4284675c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:34:30 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id t33so1654928ybd.0
 for <wireguard@lists.zx2c4.com>; Wed, 02 Dec 2020 05:40:18 -0800 (PST)
X-Gm-Message-State: AOAM533bXldMZtmUPq/zygFO82+EFROoENJ148u3oMZy2uE231D6ifRS
 xiPJAGpCbYN0Q5ulQhC2oBxHUJrId3+sjkJ4UJs=
X-Google-Smtp-Source: ABdhPJyidvXzdlVxoK4lX/27AQ3r4/8srzOo4UFCN7jvJTwB+wSaof0IwOnw8mekUo8MRCdnhF13Yb3XAiPyze+T6EM=
X-Received: by 2002:a25:d215:: with SMTP id j21mr2885023ybg.279.1606916418036; 
 Wed, 02 Dec 2020 05:40:18 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
 <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
 <CAHmME9ohy8Tfko=hO3jLDCJ92X6LQmYoCyTmCgH9N0R5EdPw5g@mail.gmail.com>
 <CABtXGiDREy3K00JLQfuCmu3hTrKnorBd0VrL5kKEL4_x3Lc1jA@mail.gmail.com>
 <CAHmME9o6MdOW=ODPH=Ksh5urUJaaE5Y8HPwkdL7F-_3XCa1KJQ@mail.gmail.com>
 <b80d2dd8-0423-20ea-eea4-6d7c45a7ff83@gmail.com>
In-Reply-To: <b80d2dd8-0423-20ea-eea4-6d7c45a7ff83@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Dec 2020 14:40:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9rb0qN3WauaTQAvWb1qezL=eF+WwGEmSAj4Nwxw6-bwiw@mail.gmail.com>
Message-ID: <CAHmME9rb0qN3WauaTQAvWb1qezL=eF+WwGEmSAj4Nwxw6-bwiw@mail.gmail.com>
Subject: Re: Probable Heresy ;-)
To: Peter Whisker <peter.whisker@gmail.com>
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

Seems like you already answered your own inquiry: compression before
encryption has a nasty habit of leaking bits.

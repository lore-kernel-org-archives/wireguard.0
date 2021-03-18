Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A6AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:04:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B614F64DE8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B614F64DE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=jacobs.co.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1936ed7;
	Fri, 19 Mar 2021 14:04:03 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c32bc4c2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Mar 2021 18:49:58 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id m7so4854737qtq.11
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jacobs.co.com; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=GS1EhIQAvVYNWioxWyAHu99MbNNmB1cXV+bFVM0SebQ=;
 b=dta/sdqSx7VWlOoVZmoLgWIVtnmyKhUgdF4wn45WFcZqqEWDTsnT3Mb6JtkMxXMIoc
 IKBNPf87ZmZg45LVDzjbW0BV+JJ0DCGDrLNYFf9CZcz3/wl+Glz/iPW4g/aQ+MOfnQgW
 juDKJsjyB2NBVeov1V5+qrEGu+OXqKhnZfSh5MPqCd6ssCRggGjYTJfBwOfDZTt1emHE
 y/ps3KHm41OchbC3tZibkk3+sVhIBFnzzIHnKIqsxY/P/5FXAsl1vBFvEajYIFWt141r
 s7H9Gwl0zWGBm6wDA3mfjAKGzP35yNoF/XJjiLdOp0Ml9NqV4y4qVhf7aPUMKiB6V03I
 kctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=GS1EhIQAvVYNWioxWyAHu99MbNNmB1cXV+bFVM0SebQ=;
 b=R0LzGP1z69GpsL0+nJaxA62uPRHL0FK4mbgEbNsgyv6PAQMj43Ww7EY8A6lVjrhtO2
 3epUxCdzJ6RjN8TayYLOBpkHdiTb4Y99AW7j55Et9oMLBE9w2KwO64Laeg0R0vTFXx87
 ZNBymyH414D2Cuqp1FbfOwfFMpUohbWY7cuOazBB5Sc7S5VS3vJUoYs9KiYbWfrauAJ3
 5mdjLwID1aR7QHrL/a7oBX7IUfJ0TaeZyVJutZ7IjgWmbAg8cEUzkLcIi4bLX26peAWh
 OAk34N5aqfBrjL4tH4XDSegoGGoLYBDsaOy69IliRhJBmNI2PGI9U0uGXqE0K3jgJCva
 1SMg==
X-Gm-Message-State: AOAM531kGxGdeN1xmeWBczYBDY34C9V00hMwf38C71p4lXXLJ9F/EDB2
 CRRx8KV+xeyJA27SJNeKKNG3wET1qSBQFnsN
X-Google-Smtp-Source: ABdhPJzVRTInc+yiZAm7b8drbPLNeczwlVU3qpQedoDXQMNHj6C4e4fJ1tY78dXuVwCmfKtuxF4L5Q==
X-Received: by 2002:a05:622a:1744:: with SMTP id
 l4mr5134290qtk.75.1616093397256; 
 Thu, 18 Mar 2021 11:49:57 -0700 (PDT)
Received: from macbookprowifijohn.home.arpa ([71.69.146.18])
 by smtp.gmail.com with ESMTPSA id x36sm2091508qte.1.2021.03.18.11.49.56
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:49:56 -0700 (PDT)
From: John Jacobs <john@jacobs.co.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Removing WireGuard Support From FreeBSD Base
Message-Id: <E3CBD3D4-F383-4921-8539-517A6AA25732@jacobs.co.com>
Date: Thu, 18 Mar 2021 14:49:53 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:04:01 +0000
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

Kyle, you (and others) have been put in a position you never should have =
been put in. You have earned respect from someone who could not be any =
more outside the community of core FreeBSD developers for behaving like =
an adult and publicly sharing your introspection. I=E2=80=99m sorry if =
this is seen as an inappropriate comment from an outsider, but I felt it =
important to say that the way you have conducted yourself over the past =
few days has been noticed, noted and appreciated. As a consumer of =
FreeBSD I move forward with my belief in the product stronger than ever.=

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36741C27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 11:11:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf1ac359;
	Mon, 17 Jun 2024 11:08:20 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c492a285
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 11:08:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-421d32fda86so44185755e9.0
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718622497; x=1719227297; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3PfPNHTUnFq8/Nyt8/Yl77ul4IRiQX/oqna3mGRK9ag=;
 b=EZDcP1+EE96fKwOQmR3XotCEiznRQ0yvbTKTXuqPskR5V79gHfQ7uVLufnRZfgyRUK
 fOAJqEH6oqGr7IVq4K0VXtPB94swEwQc9Df1vemzi5X3k9OKoggvKznbE5+5NwRZ6bcR
 FAEpxd6N6OfQB4RjLwwWBIBC/qnEvk+Qqq54ymkKWU+RxNUINLsOLsSnzkiyprQoS4d3
 hXoT5FOBASSgRPqdewEOFU/5RQkP6d8UM9z8k0XskQS1dbJDeZWDRjZE2a7sU528/rKX
 Ihhi/2eDhBxF0RZb4x/ZD6GUWHimYJX7wxPbbPbECtTCrNBcNn5J1CoOcTQhL2kRlFpF
 MxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718622497; x=1719227297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3PfPNHTUnFq8/Nyt8/Yl77ul4IRiQX/oqna3mGRK9ag=;
 b=NMTFIKz9mfXpMQPKeQZBgMsD4bSTC0rdbywWCsjKmoGby5XquoqLTKZCNIq3cGWuAy
 9A42D+P5L8z97Jz37eiBqyLVnGHk5lfWp4D7b9KiQ4IJH31ytzm25AWF93F2z39KIU4D
 L0t5JZ5xXJc5ubMEO23U9vo2zJEaXwgHh/fQhQJpge14zY9FrKN8vd4mWa6ipYx8xYbO
 EL+HLOe1qgHCFCcsQLydYHHTxZL4Mjj4OQnsbrd6yzvTC8zE6/DPVq2uBhayWDzX7z+W
 CtQnu9EA0dbNdvggnn6jVpm+lGZy2NrTweYXfqqPZWKaVlS47EtL3dDnPA14t9WqMfyq
 FlWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4epz9C/O+NAkSQ4n/2coOXzloK091nA1PWLSi2QjuTygoZ+H1v5UFVf/ToqHnBjAKj6p7e+Wt8SJcQBeT78VzUzIPfP2JbJFC
X-Gm-Message-State: AOJu0YxqKwx8YMX0HusCK0L0P1pSOW6rAPMNn6AxRbgvJP+Ipyf/zYdb
 PqSK2zDXDpN9ayK/7WKibynHnWM1YhU+QPu6UUUln+G1nA5+sRpJ
X-Google-Smtp-Source: AGHT+IHLfTzQt4RZUoq/IWOaamfCiVs+i7kybvQpTG0Fupnq8cZvlQXzAAseJQLUz2dVYY7YZfSTpQ==
X-Received: by 2002:a05:600c:19c6:b0:422:7c50:1922 with SMTP id
 5b1f17b1804b1-42304844b55mr80254785e9.29.1718622496947; 
 Mon, 17 Jun 2024 04:08:16 -0700 (PDT)
Received: from [192.168.1.99] (93-48-172-72.ip258.fastwebnet.it.
 [93.48.172.72]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-422f5f33bdasm158194605e9.8.2024.06.17.04.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:08:16 -0700 (PDT)
Message-ID: <ef44089b-1060-458f-906b-45fe682c6a10@gmail.com>
Date: Mon, 17 Jun 2024 13:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Antonio Quartulli <a@unstable.cc>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
 <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
 <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
Content-Language: en-GB
From: Germano Massullo <germano.massullo@gmail.com>
In-Reply-To: <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 17/06/24 11:45, Antonio Quartulli ha scritto:
> Have you tried running the test between a client, behind the omnia 
> turris and the wg server?

Do you mean a configuration where the Turris Omnia is not acting as 
Wireguard peer/gateway? I could do it but I prefer not

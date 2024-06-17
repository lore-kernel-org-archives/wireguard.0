Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598CCC27C77
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 09:21:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2148953;
	Mon, 17 Jun 2024 09:21:20 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ba5b9e59
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 09:21:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-35f1c209893so4420892f8f.2
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718616078; x=1719220878; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X0OCGUA0SSUS+tLo5R0xhtHdxgBO5TW50vvbyK4a5wk=;
 b=kuSGLfGWthpSjNw9VBzSQsZWe2UuydXNMQmiCBAtVW1RD9DOo27e68kvZ7MxNIM2To
 Avg5z2hB0bgkQXP//N2HyQ0FZkTNsg+wQ3QmU88lSFYH0jCDpyqnrYcKennIIcstE2GN
 iwHHrRrGj/KHM+DSwQoVx/fjfh95/aPBQlfVBeXZlByEmx8wqw+mRZiErktDHU5MrXt+
 lWm29fvgLUtPUojU7QHOWFbMpoHQJSPEh7iyrufmlYgCMpvldnLb9KC5+ZugHJmCHr7R
 fAb+snNfdS+g7Mq4SPdwhZgimppi1SQTx2x+/MjQFax4XkpOo4HS9ZpU41VivCjvoag7
 OfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718616078; x=1719220878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X0OCGUA0SSUS+tLo5R0xhtHdxgBO5TW50vvbyK4a5wk=;
 b=aZ4gFCo0bvIiy1SbRNR335P0DEwnmoKIHFEf3G6QoMXjxz2KrYymvCbtbtw/CP6ZmC
 QVGjgAOg4umN9Av5QLwV2whrGum1B09vM+xsZB/ko8/yyU8L0sjx/LTJZ5R0WmprgGul
 e7G8fKqGpxZwmToA0Eok+P27nXWqSN4P8CrtiiKatiWXnEx0XhwTbzv0a8zadqKPbaJs
 GX5QRhru6NSMjDnwClsPUxQkAzRSQWOwwD1DZwazuy3DSG8Lon8cP4SMPcES+ACz2xFl
 vHIx0MstFmfQr4c7KgMHDAYY808uuh8NmMnPJLFfFory5oF0du1czprdHvhxPupQlr/k
 R2Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsDkdP7iq1Ob529wt6Lr6+gKqh5/b5QIOjDYozMYY3u93/gMAHxmVG6tCuMiBaJz2BYYOmXn4I0Q6Wq9J6w0Gif9GAc208a+vG
X-Gm-Message-State: AOJu0YyJrw/46g6UAcTqxsiHMrAlqvHGIEsiW5/YPPWY0fIzXQQ2GX0F
 62iouo0koZD/xPZRZV9Ckwlf/uWC7pwhq6LMm3JSi1Dl2yg4NoCh0hp55Q==
X-Google-Smtp-Source: AGHT+IH8PCKo6xdqx+Otqb7n5hfATDMHRBrHkrT5GoRLF+czmdf7oj49LONVE/0tbFhs1A6VJiX3ag==
X-Received: by 2002:a05:6000:790:b0:360:9526:82a6 with SMTP id
 ffacd0b85a97d-36095268335mr3117214f8f.28.1718616077566; 
 Mon, 17 Jun 2024 02:21:17 -0700 (PDT)
Received: from [192.168.1.99] (93-48-172-72.ip258.fastwebnet.it.
 [93.48.172.72]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-360750f2407sm11572518f8f.72.2024.06.17.02.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:21:17 -0700 (PDT)
Message-ID: <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
Date: Mon, 17 Jun 2024 11:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Max Schulze <max.schulze@online.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
Content-Language: en-GB
From: Germano Massullo <germano.massullo@gmail.com>
In-Reply-To: <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
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

Il 16/06/24 21:00, Max Schulze ha scritto:
> Ok then I think you really max out the cpu. I have not heard of any acceleration card. Overall I think it's not too bad.

The problem is that is far under my internet connection capabilities (1 
Gbit/s upload)

> Are you running iperf3 with --bidir?

Such flag halves the throughput, I am getting ~280 Mbit/s compared to 
the previous value I got by using
iperf3 -c 10.0.50.1 -P 4 -Z bbr
(using the Ryzen as client)
> Keep in mind that iperf3 itself uses some cpu.
> You could test serving a static file and transfer via http.

The iperf3 CPU usage is not so high, it wouldn't change much to use the 
http transfer

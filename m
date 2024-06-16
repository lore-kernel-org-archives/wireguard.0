Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C053AC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jun 2024 14:59:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 494bee54;
	Sun, 16 Jun 2024 14:59:38 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7c94b8ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Jun 2024 14:59:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so32438395e9.2
 for <wireguard@lists.zx2c4.com>; Sun, 16 Jun 2024 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718549975; x=1719154775; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5nFVWAj1H55wq/1xwOoSs4z313Hm8Ezzq44AA0HFJME=;
 b=mcJjB+ZsWFW9HNX3Hnq2hiw4C5puLDFl66zLylHYvYfhyf3Bzu5j2hBF2XgovcVgSC
 tmv+1ZW1eAgDbay5Ocila51p5UsCQB+3g5O5ozOgwyNreOs0edpVx5c8lsCGCutlZmW6
 H2pN7/tPti/iTUI6LjlCRta9hqqDqZYv+6oBw81iGZ6F3fz58lDW3/otTtbfnFFhBtjs
 DH8okJiQVzmQFHqSi+lsDtb/k6GqnL6fWa9iLCZOZR+1Z/49UeFTXbs3+/lLw4b7zuMq
 0UZApOB+5A6922Y3Cv8G401mndqzeoPHGvRIq995iPOknbXRkUCw2tgCO8HrTCUhMnsh
 ov4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718549975; x=1719154775;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5nFVWAj1H55wq/1xwOoSs4z313Hm8Ezzq44AA0HFJME=;
 b=UejBpHrSI0u5vRjXzJzV0FXebbtLKcstMeS0Eym77uszaU5hEW5xS/NnEuM0qOPkt/
 o5Ss+S/PcZ+fBJsyF3tTSPkawf8R/85PrflmY/GTn8cx1n0H7JQHwNDF61WVW5QxHKXW
 tTujdlHaHAOyQzV7t0cxdeFsoY+7AdwUjkKodA+aW3uhgoFqLbsKFeP2klhijD7RTnkz
 Bu30eTzgI9MmUqAfLjRsCYvzQJlu+1AB+8yc6q4F6cNX3c1lRXTwH0XwaGTTqpOGV1sP
 7H9Dd3DjuHi/kikBtcT6BblZUp48/y3yXlXDAFasAwtPFW3oP9b/mt1XAyuZCGBMZEhd
 Rm4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeoHYL7LMEW3E6fcj2nyMEGj/mil13FRml5D5dyEAynMYL7NMpeu/hw+pHKcZX7DOWXClU3lh8AkThLC1H5/Z/P8qahARilU8c
X-Gm-Message-State: AOJu0YzD9INU5LBl8OYZBfsqyO3bFy3OoXZw1/yjJ0yG685MGhlvHfSx
 4X4uks13XGiJU6Qm8F6PKIfTiHxrFqy4J/S7m0vbrYZUIibkB3z6
X-Google-Smtp-Source: AGHT+IEqQ5S85SUn/5OmuW6k4yUM37CMmngxeKKeVLnCCe05e7uKXPPTuiMu2a2SDsl4bzzZ0cmn+A==
X-Received: by 2002:a05:600c:808:b0:423:b756:cdaf with SMTP id
 5b1f17b1804b1-423b756ce01mr21616865e9.23.1718549975271; 
 Sun, 16 Jun 2024 07:59:35 -0700 (PDT)
Received: from [192.168.1.99] (93-48-172-72.ip258.fastwebnet.it.
 [93.48.172.72]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4229207d1a7sm98764785e9.1.2024.06.16.07.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jun 2024 07:59:34 -0700 (PDT)
Message-ID: <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
Date: Sun, 16 Jun 2024 16:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Germano Massullo <germano.massullo@gmail.com>
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Max Schulze <max.schulze@online.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
Content-Language: en-GB
In-Reply-To: <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
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

Il 16/06/24 15:47, Max Schulze ha scritto:
> why do you think this is the bottleneck and at what speed are you hitting a limit?

I get ~550 Mbit/s throughput in LAN between a Ryzen 5 3600 and the 
Turris Omnia which CPU goes to 100% load during iperf3 test

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51996C27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 14:31:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ce644b1;
	Mon, 17 Jun 2024 14:31:53 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e3051469
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 14:31:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so4173407f8f.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718634711; x=1719239511; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3lGsCpp8pxkuT25J+Z17r4q/yaK/BU3TywRd+aJXRAw=;
 b=Z/dIt8BZPno6iD9fwl5T3xo23QvTHZZEK49FRGMaKYQqEnuKLskET2UP4Aj8Xp42EI
 2fwE80n7VUmnPvPDa4tYgQDBT8UyburTltoRueUWpFU3eT0hci6bz8hvE3Nl0uK7YqTX
 enEJTe9mYkMu8Qnsw+U3SpmAWEQDldB/BvKAInf2qF+aHRCcoGBF8xwPongHnxZBigJV
 4j2kwhyR2ESMq3qKsLdO1J+Rf89FyhD9VfiFbZdOWdssr6/eRo7ATHvBDDMGUD0ToPD0
 LU/ETEtbFkDFH1OFFDHOSNC/7rNtUbvEU+xjQS7z2dMuNPsgsQrIc/QBJG+okyHx+s/R
 yVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718634711; x=1719239511;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3lGsCpp8pxkuT25J+Z17r4q/yaK/BU3TywRd+aJXRAw=;
 b=nrz7kqlV3XIsl+KJQEUFTk74TDHm9NPqsB3X+pvfSKw9/QJm/Uu9+C2WJwC37lcHUF
 4P7foLknUFUI2a6Xsp6RUwzkrLz1/lTdigwox9Gq14TeMfrCaOdTAw3ICv1a5TzP9euw
 3JYrGBi44yra8z6coyFGAbWD/rNeNMTsSFr6xjH+EDLsZWlzWRI7Lr27KDcg9yQkOkZj
 mi+uc9YplptNb15I1mLmn1DIRro256iEbsSGPTAdXcGlsG3DIbhGkXDk0fWv9MC63dki
 CC0QOtp3vsRo78LZdC49+DXz6bmaUt6ARadAstAEcMIuxx2EFRm6iE8TV3WegDugMzqo
 4YYQ==
X-Gm-Message-State: AOJu0YyRmMSX6N8+FEDlSBidAsLVU97CdkUK9h0DKsNbyg2dNnZFPzt9
 9seC+OlTHw/pgvoJP3PqnZbwtj4A1XHjGEYDG/NxCYOjeSSUVNLs/clNIQ==
X-Google-Smtp-Source: AGHT+IFVJJ0DD1zEKFXG49wvdKoIKItzx5OZTmpJOk9YUAT/7l1kU//UiGsmewaOAEOUCRzxOWebHA==
X-Received: by 2002:a05:6000:1547:b0:35f:1d67:cdb4 with SMTP id
 ffacd0b85a97d-3607a75c645mr7406188f8f.37.1718634711291; 
 Mon, 17 Jun 2024 07:31:51 -0700 (PDT)
Received: from [192.168.1.99] (93-48-172-72.ip258.fastwebnet.it.
 [93.48.172.72]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3609515e16dsm3280176f8f.44.2024.06.17.07.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:31:50 -0700 (PDT)
Message-ID: <9e717774-c1cd-493f-abfd-fcf3d75eec8d@gmail.com>
Date: Mon, 17 Jun 2024 16:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roman Mamedov <rm@romanrm.net>
Cc: Antonio Quartulli <a@unstable.cc>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
 <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
 <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
 <ef44089b-1060-458f-906b-45fe682c6a10@gmail.com>
 <8f366adc-89a5-4b81-9a4f-8bcb1d08aad3@unstable.cc>
 <4940a8fd-6e87-49a4-83e0-8daa69e7a68f@gmail.com>
 <20240617174159.46b69d3b@nvm>
Content-Language: en-GB
From: Germano Massullo <germano.massullo@gmail.com>
In-Reply-To: <20240617174159.46b69d3b@nvm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

After having checked that iperf3 was indeed consuming a lot of a CPU 
core on the Turris Omnia, I modified the Wireguard topology in order to 
have the router to just be the Wireguard gateway among two LAN computers 
( [A] <--wireguard--> [C] <--wireguard--> [B] ), and I have run the 
iperf3 among such computers
iperf3 -c x.x.x.x -P 4 -Z bbr
and the throughput was ~320 Mbit/s. Considering that the router had to 
handle two Wireguard tunnels, one could guess (without any claim of 
accuracy due lack of more accurate tests), that the maximum Wireguard 
throughput that such router can handle is ~2x 320 Mbit/s = ~640 Mbit/s

[A]: Ryzen 5 3600 - kernel 5.14.0-427.18.1.el9_4.x86_64
[B]: Ryzen 7 PRO 6850U -  kernel 6.8.11-300.fc40.x86_64
[C]: Turris Omnia - TurrisOS 7.0.0, kernel 5.15.148

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18C4C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jun 2024 14:11:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5628d22;
	Wed, 12 Jun 2024 14:11:15 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c2ae9aa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2024 14:11:13 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-62f39fcb010so16522627b3.1
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jun 2024 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718201471; x=1718806271; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8uehACsPxP1YviqAxtnu/AQYY5YWZ8oSsPpfhXKhbjs=;
 b=Z1iN1E6GduLDQ52Q+OkHADryO+CE/MsLv8U9b+LLrQCxPN0d3EiPRF04XZHaHn5dAo
 vmPXxTR7koQhc0Ed9mLbUudJ2xqEavzuqjvzu86TeiX1B7v+32IMyngSnI4YcDXLTtUd
 TODGor9Ff9bCIox/qEF4+Xxj0L0fwtFxQZpcWYSuaIp9oshclfm8lrAS41O2ObP2TnG6
 TJUc/MqMbgCRyb8A8ARpUgsb+IhDijF4h3pZof5KI46NTBEnMDv7AdpTpxm8CQ0MoAd3
 G4Rf5Tk0L6SQfYPX1kA8KFLWG/j9h+7W2BtvrFGWUkXw+WxwOh8FtFPK5ERdSnD9KogR
 i2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718201471; x=1718806271;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8uehACsPxP1YviqAxtnu/AQYY5YWZ8oSsPpfhXKhbjs=;
 b=FMzgUQqaRhQGuUor1WJqY6D0lZad7JH/NVaBtOaznOrLmndYaRnzdsGvrzdMqIHv7c
 HL81zUtNj04+yZ+jkmL0Q8VwTpWKYn+fw3iuqmADhRBAUfiZW3Ib8ggs70jGETFVLyud
 sOdnrD8KNrU9gLf3g0hBZV63VyD3W/hvqUrEQrNJKLeOOoHH0LqaCoud9nScZa4hUndL
 67NZVjUf5guEDZTw9SZxm22fVE4ER332/0dm5sHMs1VjOqAfZMdrV+Hh6bNCZwhgK6q3
 IiC+Br2XshescqNy/OZ2tHSYH7LpAOHMo9rJJEABZ5xbkW1IAhZcokf4LNi6Pa7sIVrN
 AURw==
X-Gm-Message-State: AOJu0YzvTuNXfs/9I1L9kgMq0iTKA6WgCxBWpZ0pYqzb7En2Vj6bgLzo
 yH2SgZLeyGHehlkYgmayX9bj9UwEbqzXNl4kucSSeZtipWF5kUnZZguWWbgtdrF9ET6f4EfuKie
 WxKe65t9pjpU8Z4agKj0EBaDuZtZdey9p
X-Google-Smtp-Source: AGHT+IEQs/d+vs5TncAvqjrFDJZt0zuQZBplGPtGw+ENC6qYFGv+seQYLKpqDH2aEC+JOQWQ3hd8H1fFixIFGX9uuyM=
X-Received: by 2002:a81:7cd4:0:b0:61b:3454:8ff9 with SMTP id
 00721157ae682-62fbb7f66b4mr18810307b3.10.1718201471425; Wed, 12 Jun 2024
 07:11:11 -0700 (PDT)
MIME-Version: 1.0
From: Germano Massullo <germano.massullo@gmail.com>
Date: Wed, 12 Jun 2024 16:11:00 +0200
Message-ID: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
Subject: Mini PCIE HW accelerator for ChaCha20
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hello, I would like to ask if you are aware of any mini PCI express
card that provides hardware acceleration for ChaCha20 algorithm. I
would need it to improve Turris Omnia Wireguard throughput
Cheers!

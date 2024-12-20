Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58BC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 11:06:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c455ec57;
	Tue, 20 May 2025 19:49:47 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0bbe74b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Dec 2024 17:16:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-540254357c8so2047819e87.1
 for <wireguard@lists.zx2c4.com>; Fri, 20 Dec 2024 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734715006; x=1735319806; darn=lists.zx2c4.com;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nxpg8zHu/4f8sSLiNX0TDHZa1EdijbReKXVHoIPiso=;
 b=BGQLK16mXERM5R8Y/QdOqHyq3PFwFa4unp7+SlusKYKdqT10bZxG3fXyncJO8GfdG/
 rrnYcm6Xkb6sZp3xodshlelVwlAWhA9BRWkuEE40ADKYX4eEaiL7quQNqEG3RPbWai/R
 ugEBT2kV8qGlSOf1U9OKTijsHDGkysBCr6RO6jjJEAPfFGBx8Le1H0Fy4wjSppaklNMf
 QFMz6tdXeftFMffL730C16BFH9VRRA7fHEPOd1v1rfsUuH5fQgh/xb+5BIPQOcHGqQiw
 oapQ1kdMJhBdc2VNyK7j21sb0jXBbnpB41XfeV2wP4qnm5TWVLt08zADltQdxSds6mLT
 1M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734715006; x=1735319806;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2nxpg8zHu/4f8sSLiNX0TDHZa1EdijbReKXVHoIPiso=;
 b=qUuonJWtvgvXM9TxrWoMreKUD/WWYedsXOuEGabxZEA5/nfvomzL4C3N8DO/jQFlRc
 dXOMg3BGBI4LIQy/WW2R8jWP9y7SFDvAodr6d+MkgoURRpoJuEiXzWGvtAJdhG4by+Cc
 dJzjoXESYGx8Yez9MCab2vGWTsV+lekUftR/Jl3hThdkH8DXpsONtLyQukEY6AVEKtIf
 BufonqCCPrgz0kUBEEjTJT1ExAAYOrd8bJzKvreiC3dZYJGPpQTD10BqZy0KTwX9BX8/
 yS/u4bEdKykO4+cltIGRcL5gQuMeRX4a9K8RKQVL633440jUNlF8eAdPMIp1ow6YiHxd
 MTww==
X-Gm-Message-State: AOJu0YziwKf3uGGNCOVJjsW8uwZfw4w6BXe1f1GyDlC5KBzfn2eX5QBh
 CCT6jV1JoAbdstQKaR8GMhs0VZV+RIKi98M1Y3tWgv869CmtY3or61zm5Q==
X-Gm-Gg: ASbGncuUdvDPt+WLMk1BA+cmmXlLlJdrL3GbhmMQfsponGFQeVUf5Yd91b7U1+ikJSS
 +iOLpWCe2yFxKVDE2RPQUciAN+x6DiU5beKKILSAjlhmswvnAarbolcDE0ssDqY3krHwsi5V8Ys
 vzAHRs6yvyO6l3CRYFtr9vQ3AkA4mordJECH/FkNyRSlnSTVE74pH9cihAW4GledIv6VJoTISpQ
 RkOrGLWNrfj8YXnZ5k0WmE/iuNgF6N4dElsGeAfm/jHbPHnfZRSdch/zgJ0g5uL2Wzu7qIUVT7A
 CslJ1MEDmbXQY1A7nvhp1lwjzJsDlkA=
X-Google-Smtp-Source: AGHT+IFNlpeYyFALtvdyFaIVfLouBrhpF7FYnY9bQFTJ9UhZx4c8hG4FnbQMIglGwkLQHcKi9ER01g==
X-Received: by 2002:a05:6512:ba6:b0:540:2122:fae9 with SMTP id
 2adb3069b0e04-54229582051mr1297647e87.46.1734715005487; 
 Fri, 20 Dec 2024 09:16:45 -0800 (PST)
Received: from ?IPV6:2a00:1370:8180:3d9b:9f22:abb9:a0b3:fab4?
 ([2a00:1370:8180:3d9b:9f22:abb9:a0b3:fab4])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301d5sm534104e87.245.2024.12.20.09.16.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 09:16:45 -0800 (PST)
Message-ID: <f09b788b-d09d-4840-860c-a5bb8b5342c9@gmail.com>
Date: Fri, 20 Dec 2024 20:16:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: wireguard@lists.zx2c4.com
From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: wg-quick fails with systemd resolvconf compatibility shim
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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

systemd resolvectl supports resolvconf compatibility mode when invoked 
as resolvconf. Ubuntu 24.04 apparently no more provides the real recolvconf:

bor@bor-Latitude-E5450:~/tmp$ dpkg-query -S /usr/sbin/resolvconf
systemd-resolved: /usr/sbin/resolvconf

This version requires the real interface and fails with wg-quick hack:

bor@bor-Latitude-E5450:~/tmp$ sudo wg-quick up ./wg0.conf
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 192.168.6.160/32 dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] resolvconf -a tun.wg0 -m 0 -x
Failed to resolve interface "tun.wg0": No such device
[#] ip link delete dev wg0
bor@bor-Latitude-E5450:~/tmp$

So, wg-quick became unusable on Ubuntu. It worked fine in Ubuntu 22.04.


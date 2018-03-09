Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50ee9d00
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 21:25:24 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2791d06c
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 21:25:24 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1euPfK-000BCe-N2
 for wireguard@lists.zx2c4.com; Fri, 09 Mar 2018 22:35:02 +0100
Subject: Re: Policy-based routing
To: wireguard@lists.zx2c4.com
References: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <9181ac49-897b-8412-84e9-1505cc261913@urlichs.de>
Date: Fri, 9 Mar 2018 22:35:00 +0100
MIME-Version: 1.0
In-Reply-To: <a81edfe2-2a49-c49a-ea7c-65e60639ecfe@streamfeed.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
> Is it possible to achieve that with wireguard? 

You need to set up multiple wireguard interfaces (on different ports of
course).

Then you can use traditional Linux routing techniques.

-- 
-- Matthias Urlichs

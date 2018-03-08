Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c504f84
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 14:40:40 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 112b9a0e
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 14:40:40 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1etwrR-0002nS-GI
 for wireguard@lists.zx2c4.com; Thu, 08 Mar 2018 15:49:37 +0100
Subject: Re: Another roaming problem
To: wireguard@lists.zx2c4.com
References: <87efku1vza.fsf@toke.dk>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <e3d83ab0-89d8-2fa5-8494-059bf19a96ec@urlichs.de>
Date: Thu, 8 Mar 2018 15:49:33 +0100
MIME-Version: 1.0
In-Reply-To: <87efku1vza.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 08.03.2018 15:29, Toke Høiland-Jørgensen wrote:
> tell the server to always use a certain source
> address for outgoing packets

You can do that with a SNAT firewall rule.

-- 
-- Matthias Urlichs

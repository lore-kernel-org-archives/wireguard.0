Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CEEC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Jun 2022 08:43:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9f772a51;
	Tue, 7 Jun 2022 08:43:32 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3cc06794
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jun 2022 08:43:31 +0000 (UTC)
Received: from [192.168.178.23] ([84.160.56.2]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M7Jj2-1nqnhm1dAS-007hb4; Tue, 07 Jun 2022 10:43:30 +0200
Subject: Re: wireguard-windows: possibly wrong selection of outgoing IP
 Address?
To: Szymon Nowak <szymonn841@gmail.com>
Cc: wireguard@lists.zx2c4.com
References: <4bb8fade-487e-2301-65d0-dea41624682f@online.de>
 <CA+hy6duTcA38PMWRj6L2U_jwBDnNkFjojGBL-ot-9oJ-BwiHtw@mail.gmail.com>
From: Max Schulze <max.schulze@online.de>
Message-ID: <26d9f096-e8a0-2405-b28c-1b25a319e8d6@online.de>
Date: Tue, 7 Jun 2022 10:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CA+hy6duTcA38PMWRj6L2U_jwBDnNkFjojGBL-ot-9oJ-BwiHtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gA9soRnHKLzZIWMWKWYW4XvazwDHqnNqO6wRz78wGQsqjTZCPus
 vFtZF9/j/xrgHn0uPqXkAMQoWKoKSHJNnx6BIKE3DenVMio5E26cPj2OKVRFgln3MIha33b
 p3rIDR7dglpbo/9dsVXrDlfPzL4WqkfMuRKaWFRyFqF4kdmB9qfHVLJIg1X+SW69Ehp6ZFO
 PmiCHCpdzzuYBFqcZdjXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dilj5WOA01U=:qgiwIDabFxe40LgsdQdtdJ
 QFBYihTda9KrARoB+ZapXLtBrubxflaWEjZ92jm6CZYmBo3QIPEcKuwIXi2fo00rj1eZ7bo08
 KT27PWj0Lli8Srxe621KBwFhcVXsIn+FBNJfvnM26XkaVCYETTS3j5tQhCFtkzL1s+SqUmHgA
 M4TdSZ9z8NyO8VFB97h/EGRV1SSO0JVYSdS+9wuVIJylyb5P5QWF8XarVWxuyLyE1NQq2Fb/C
 NbXz7WkAhjsN1yTuWcfqR7KVBjMfSU6Un8LsDKGZHiTqFRfanQbPPxHQW2j1li01xa/eoLSkM
 klh9aD0bMpSDU93FlZE2PP62wWHh92ZCTUOs3intxDqdzFFfmnOmn420R4DxkjWay7s+3oazL
 VxHynnAhB7ih6VZvsH9U/zh0LeKkxKPSjZ68c/S1GKVcG57EgUX/fvOiulUV8rVneGxLosw3f
 9LOqq1uNfOfMVjtVc5PpO3CwjLsNe6nMvXsv4ca1vIw9xrA/DISPyMw1zrcGx1ofY32Sezjrp
 LGN0skN3YEUiuz347tP8zP9o60tqfVrXqy6y2BDRZPkB8wgaEnMAClqxyGaOBu8w7EjYjfd+N
 49/L6+csNzrwPTnKPGzBxLVbMU46Y0o9jHBWwPVKoYPPJD2jEWwZM6sfgb84NsciOf/ZqWF+H
 Nq1hoTOqOy/C6F+1JLQbxa44ig0JPcepBGQFK/L05eV88OZFslAp5EPh6mtgwX5/gLzHDLVV/
 PkCBzoHweOVzStHgzg/AsYua2QB2aWFO0w2f0WLT1fV72vQ0TqXhHtUO5BBVxxLidaTw/IAID
 FPYVASBqCKEtZr9QlnZaG9Iumf4aw==
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

Hallo Szymon,


On 07.06.22 09:08, Szymon Nowak wrote:
> Hi To do this on the windows server, you need to run NAT on the WG interface
> https://openvpn.net/cloud-docs/enabling-routing-nat-on-windows-server-2016/


why should I ? Which interfaces should I bridge? The WG Interface is "stand-alone" and does not to any routing to/from public internet for any clients.

Why are you suggesting NAT, when the log shows that the IP adresses for the *destination* are correct?

Besides, I do not need to do any of this on the linux box, where the connection is successful with the same config.
